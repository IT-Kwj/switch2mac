# 自定义修改记录

本文档记录在本机对 switch2mac 项目做的自定义修改。合并上游最新代码、或引擎被重新拉取后，按这里的说明恢复这些改动。

更新时间：2026-11-07

## 修改总览

| 类别 | 仓库内位置 | 内容 | 恢复方式 |
|---|---|---|---|
| 中文化 | `tools/engine/patch.py`、`tools/engine/s2m_ui.m` | 设置面板、通用设置、语言名中文 | 已提交 git；`build` 时 `patch.py` 幂等自动应用 |
| poll 卡顿修复 | `tools/engine/patch.py`（`hle_net_poll()`） | 引擎 `hle_net.c` 的 poll 空等上限 100 ms | `build` 时 `patch.py` 自动应用 |
| 游戏图标 | dump 里的 `Mario Kart World.png` → `work/<tid>/extract/v0/icon.jpg` | 自定义 App 图标 | 手动生成 `icon.jpg` |
| 存档迁移 | 旧 `work/run/save/` → nxnative App 存档目录 | 恢复旧进度 | 手动复制 `account.sav` |

## 1. 中文化（中文界面）

### 位置

- `tools/engine/s2m_ui.m`：设置面板标题、分区（显示 / 控制 / 性能）、副标题，以及性能悬浮层提示。
- `tools/engine/patch.py` 的 `settings_zh()`：对引擎 `dm/games/settings.tsv`、`dm/games/settings.py`、`dm/tools/nacp.py` 做中文替换。

### 内容

- 通用设置项：主机模式、画面放大、显示模式、游戏语言、手柄震动、震动强度、震动阈值、帧缓冲、Metal 4 管线、管线预构建、编码线程、性能 HUD、游戏内置升频器。
- 语言说明 `UNKNOWN_LANGUAGES` 的中文 note。
- 语言下拉框名称：美式英语、日语、韩语、繁体中文、简体中文等。

### 恢复

这些改动都在 switch2mac 仓库的 git 里，且 `patch.py` 是幂等的：重新 `build` 时会自动应用到 `engines/` 下的引擎副本。

## 2. poll 卡顿修复

### 问题

游戏“退出到首页”以及“选赛道之前”会 0fps 卡约 14 秒。根因是离线模式下 socket `poll`/`select` 的空等被按超时原样睡满。

### 修改

`tools/engine/patch.py` 新增 `hle_net_poll()`，把引擎 `dm/host/hle_net.c` 的 `sk_idle` 加上 100 ms 上限：

```c
static int sk_idle(int64_t ms) { if (ms > 100) ms = 100; dm_guest_sleep_ns((ms < 0 ? 100 : ms) * 1000000); return 0; }
```

### 恢复

重新 `build` 时 `patch.py` 自动应用。

### 注意

之前在 switch2mac 引擎上试过同样的改动，出现过一次选完赛道后 SIGBUS（后来回滚）。本次在 nxnative 引擎上应用后需重点验证“进赛道 / 退出到首页”不崩溃。若复现崩溃，回滚 `patch.py` 里的 `hle_net_poll()`，再单独排查。

## 3. 游戏图标

### 原因

dump 没有 control data，构建脚本默认不生成图标。

### 做法

1. 把图标 PNG（1024×1024）用 `sips` 转成 256×256 JPEG，命名为 `icon.jpg`。
2. 放到 `work/<title ID>/extract/v0/icon.jpg`（构建脚本会优先在这里找）。
3. 重新 `build` 会自动生成 `AppIcon.icns` 并写入 `Info.plist` 的 `CFBundleIconFile`。

> dump 的 `base/` 目录是 root 所有，普通用户无法直接写，所以 `icon.jpg` 放在 work 的 extract 目录即可。

## 4. 存档迁移

### 说明

switch2mac 引擎（`run` 模式）的存档在 `work/run/save/Play/account.sav`，nxnative App 的存档在 `~/Library/Application Support/nxnative/<title ID>/save/Play/account.sav`。两者不通用。

### 恢复

复制旧的 `account.sav` 到 nxnative App 的 `save/Play/` 和 `save.work/Play/` 两处（两个引擎的存档都是同一个游戏的 `account.sav` 格式）。

## 5. 已知未解决

- 游玩时约一半时间 fps 在 30–40：游戏自身帧率控制器在帧时间超过 16.7 ms 时切到 30 fps 档，触发源是 host 的 `submit+present` 偶尔抖动到 20–38 ms。GPU、CPU、内存都不是瓶颈，尚未修。
- 0fps 卡顿在 poll 修复后需继续观察是否还出现在“选赛道之前”等其它位置。

## 6. 引擎升级记录

### 2026-11-07：nxnative 引擎 `865cc35fad70` → `822f724c92fa`

- 合并上游后，马车世界 nxnative build 的引擎 commit 更新到 `822f724c92fa`（修 shader 表检查，issue #1592）。
- shader 翻译链从 `223f10d34f97` 变为 `d866f9700d78`，所以 shader 库不能复用，需要重新编译全部约 11,560 个 shader（本次约 16 分钟）。
- **新依赖**：新引擎需要 `zbic` Python 包（ZBIC 压缩解码），`pip install zbic`。应同步进 `requirements.txt`，否则 `setup` 后仍会缺。
- 汉化、poll 修复、前端补丁在新引擎上锚点全部匹配，`build` 时 `patch.py` 自动应用，无需改动。
- **构建前需清理磁盘**：删除旧引擎目录（`engines/nxnative-<旧commit>/`）和旧 App，释放约 2 GB；否则构建会因“需要约 50 GB、磁盘只有 46 GB”而停止。清理时不要把 `work/run/`（存档）和 dump 的 RomFS 删掉。

### 汉化全面性检查

`launcher.json` 中所有设置项的 label、note 均已中文，唯一保留英文的是 `MetalFX`（Apple 专有名词，和“Metal 4 管线”里的 Metal 一样保留原文）。
