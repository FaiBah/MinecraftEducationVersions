# 🎮 Minecraft Education Versions

> 📦 A simple, automatically updated list of **Minecraft Education** versions.

Version data is collected from the official [Minecraft Education Change Log](https://edusupport.minecraft.net/hc/en-us/articles/360047556451-Minecraft-Education-Change-Log) and stored in [`versions.json`](https://github.com/FaiBah/MinecraftEducationVersions/blob/main/versions.json).

## 📄 JSON

Fetch the latest version data:

**🔗 [Raw JSON](https://raw.githubusercontent.com/FaiBah/MinecraftEducationVersions/main/versions.json)**

```json
{
  "stable": "26.32",
  "beta": "26.30",
  "versions": [
    {
      "version": "26.32",
      "type": "stable"
    },
    {
      "version": "26.30",
      "type": "beta"
    },
    {
      "version": "1.21.90.1",
      "type": "stable,beta"
    }
  ]
}
```

## 📋 Fields

| Field      | Description                 |
| ---------- | --------------------------- |
| `stable`   | Latest stable version       |
| `beta`     | Latest beta/preview version |
| `versions` | Complete version history    |

Each version contains:

| Field     | Description                        |
| --------- | ---------------------------------- |
| `version` | Minecraft Education version        |
| `type`    | `stable`, `beta`, or `stable,beta` |

If the same version was released as both stable and beta/preview, it is combined into a single entry with `stable,beta`.

## 🚀 Usage

### Latest Stable

```bash
curl -s https://raw.githubusercontent.com/FaiBah/MinecraftEducationVersions/main/versions.json | jq -r '.stable'
```

### Latest Beta

```bash
curl -s https://raw.githubusercontent.com/FaiBah/MinecraftEducationVersions/main/versions.json | jq -r '.beta'
```

### All Versions

```bash
curl -s https://raw.githubusercontent.com/FaiBah/MinecraftEducationVersions/main/versions.json | jq -r '.versions[] | .version'
```

### Stable Versions

```bash
curl -s https://raw.githubusercontent.com/FaiBah/MinecraftEducationVersions/main/versions.json | jq -r '.versions[] | select(.type | contains("stable")) | .version'
```

### Beta Versions

```bash
curl -s https://raw.githubusercontent.com/FaiBah/MinecraftEducationVersions/main/versions.json | jq -r '.versions[] | select(.type | contains("beta")) | .version'
```

## 🌐 Source

* 🔗 [Minecraft Education Change Log](https://edusupport.minecraft.net/hc/en-us/articles/360047556451-Minecraft-Education-Change-Log)
* 🔗 [Minecraft Education API](https://edusupport.minecraft.net/api/v2/help_center/en-us/articles/360047556451.json)

## ⚠️ Disclaimer

This is an unofficial community project and is not affiliated with Mojang or Microsoft.
