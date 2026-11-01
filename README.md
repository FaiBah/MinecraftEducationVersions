# 🎮 Minecraft Education Versions

> 📦 An automatically updated database of Minecraft Education **Stable** and **Beta** versions.
>
> Version data is collected from the [Minecraft Education Change Log](https://edusupport.minecraft.net/) and stored in [`versions.json`](https://github.com/FaiBah/MinecraftEducationVersions/blob/main/versions.json).

---

## 📦 Version Overview

| Type | Field | Description |
|:--|:--|:--|
| 🟢 Stable | `stable` | Latest stable version |
| 🔵 Beta | `beta` | Latest beta/preview version |
| 📚 Version History | `versions` | Complete version history |

Each version entry contains:

| Field | Description |
|:--|:--|
| `version` | Minecraft Education version |
| `type` | `stable`, `beta`, or `stable,beta` |

<sub>Version lists are ordered from newest to oldest.</sub>

## 🔗 JSON Data

**File:** [`versions.json`](https://github.com/FaiBah/MinecraftEducationVersions/blob/main/versions.json)

[📥 View Raw JSON](https://raw.githubusercontent.com/FaiBah/MinecraftEducationVersions/main/versions.json)

### JSON Structure

```json
{
  "stable": "<latest-stable>",
  "beta": "<latest-beta>",
  "versions": [
    {
      "version": "<version>",
      "type": "stable"
    },
    {
      "version": "<version>",
      "type": "beta"
    }
  ]
}
```

---

## 🚀 Usage

**Requirement:** [jq](https://jqlang.github.io/jq/)

All commands retrieve data directly from the raw JSON file.

### 🟢 Latest Stable

```bash
curl -s https://raw.githubusercontent.com/FaiBah/MinecraftEducationVersions/main/versions.json | jq -r '.stable'
```

### 🔵 Latest Beta

```bash
curl -s https://raw.githubusercontent.com/FaiBah/MinecraftEducationVersions/main/versions.json | jq -r '.beta'
```

### 📚 All Versions

```bash
curl -s https://raw.githubusercontent.com/FaiBah/MinecraftEducationVersions/main/versions.json | jq -r '.versions[] | .version'
```

### 🟢 Stable Versions

```bash
curl -s https://raw.githubusercontent.com/FaiBah/MinecraftEducationVersions/main/versions.json | jq -r '.versions[] | select(.type | contains("stable")) | .version'
```

### 🔵 Beta Versions

```bash
curl -s https://raw.githubusercontent.com/FaiBah/MinecraftEducationVersions/main/versions.json | jq -r '.versions[] | select(.type | contains("beta")) | .version'
```

---

## 🌐 Sources

- [Minecraft Education Change Log](https://edusupport.minecraft.net/)
- [Minecraft Education API](https://edusupport.minecraft.net/)
