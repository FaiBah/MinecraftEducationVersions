#!/data/data/com.termux/files/usr/bin/bash

set -e

API="https://edusupport.minecraft.net/api/v2/help_center/en-us/articles/360047556451.json"
OUT="versions.json"
TMP="$(mktemp)"
trap 'rm -f "$TMP"' EXIT

command -v curl >/dev/null || {
    echo "Install: pkg install curl" >&2
    exit 1
}

command -v python >/dev/null || {
    echo "Install: pkg install python" >&2
    exit 1
}

curl -fsSL --compressed -A "Mozilla/5.0" "$API" -o "$TMP"

python - "$TMP" "$OUT" <<'PY'
import sys
import json
import re
import html

FILE, OUT = sys.argv[1:3]

with open(FILE, encoding="utf-8") as f:
    data = json.load(f)

body = data["article"]["body"]

blocks = re.findall(
    r"<(?:h[1-6]|p)[^>]*>.*?</(?:h[1-6]|p)>",
    body,
    re.I | re.S
)

versions = {}
order = []

for block in blocks:
    text = html.unescape(
        re.sub(r"<[^>]+>", "", block)
    )
    text = re.sub(r"\s+", " ", text).strip()

    if "Minecraft Education" not in text:
        continue

    if "Code Connection" in text or "Classroom Mode" in text:
        continue

    match = re.search(
        r"Minecraft Education.*?version\s*\(?\s*"
        r"([0-9]+(?:\.[0-9]+){1,3})",
        text,
        re.I
    )

    if not match:
        continue

    version = match.group(1)

    release_type = (
        "beta"
        if re.search(r"\b(?:beta|preview)\b", text, re.I)
        else "stable"
    )

    if version not in versions:
        versions[version] = []
        order.append(version)

    if release_type not in versions[version]:
        versions[version].append(release_type)

result = {
    "stable": next(
        (
            v for v in order
            if "stable" in versions[v]
        ),
        None
    ),
    "beta": next(
        (
            v for v in order
            if "beta" in versions[v]
        ),
        None
    ),
    "versions": [
        {
            "version": v,
            "type": ",".join(versions[v])
        }
        for v in order
    ]
}

with open(OUT, "w", encoding="utf-8") as f:
    json.dump(
        result,
        f,
        indent=2,
        ensure_ascii=False
    )
    f.write("\n")

stable_count = sum(
    "stable" in versions[v]
    for v in order
)

beta_count = sum(
    "beta" in versions[v]
    for v in order
)

print(
    f"Saved {len(order)} versions "
    f"({stable_count} stable, {beta_count} beta) -> {OUT}"
)
PY
