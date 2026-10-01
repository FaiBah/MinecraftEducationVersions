# 🎮 Minecraft Education Versions

> 📦 A simple, automatically updated list of **Minecraft Education** versions.

Version data is collected from the [Minecraft Education Change Log](https://edusupport.minecraft.net/hc/en-us/articles/360047556451-Minecraft-Education-Change-Log) and stored in [`versions.json`](https://github.com/FaiBah/MinecraftEducationVersions/blob/main/versions.json).

## 📄 JSON

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

## 🧩 Fields

| Field         | Description                 |
| ------------- | --------------------------- |
| 🟢 `stable`   | Latest stable version       |
| 🔵 `beta`     | Latest beta/preview version |
| 📦 `versions` | Complete version history    |

Each version contains:

| Field     | Description                        |
| --------- | ---------------------------------- |
| `version` | Minecraft Education version        |
| `type`    | `stable`, `beta`, or `stable,beta` |

> ℹ️ Version lists are ordered from newest to oldest.

## 🚀 Usage

### 🟢 Latest Stable

```bash
curl -s https://raw.githubusercontent.com/FaiBah/MinecraftEducationVersions/main/versions.json | jq -r '.stable'
```

### 🔵 Latest Beta

```bash
curl -s https://raw.githubusercontent.com/FaiBah/MinecraftEducationVersions/main/versions.json | jq -r '.beta'
```

### 📦 All Versions

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

## 🌐 Source

* 🔗 [Minecraft Education Change Log](https://edusupport.minecraft.net/hc/en-us/articles/360047556451-Minecraft-Education-Change-Log)
* 🔗 [Minecraft Education API](https://edusupport.minecraft.net/api/v2/help_center/en-us/articles/360047556451.json)

## ⚠️ Disclaimer

This is an unofficial community project and is not affiliated with Mojang or Microsoft.
