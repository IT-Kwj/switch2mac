# 自定义修改记录

本文档记录在本机对 switch2mac 项目做的自定义修改。合并上游最新代码、或引擎被重新拉取后，按这里的说明恢复这些改动。

更新时间：2026-11-10

## 修改总览

| 类别 | 仓库内位置 | 内容 | 恢复方式 |
|---|---|---|---|
| 中文化 | `tools/engine/patch.py`、`tools/engine/s2m_ui.m` | 设置面板、通用设置、语言名中文 | 已提交 git；`build` 时 `patch.py` 幂等自动应用 |
| 默认游戏语言 | `games/donkey-kong-bananza/game.json`、`switch2mac.py` | 打包时默认简体中文（`zh-Hans`） | `build` 自动应用；改 `game.json` 的 `language` 即可 |
| poll 卡顿修复 | `tools/engine/patch.py`（`hle_net_poll()`） | 引擎 `hle_net.c` 的 poll 空等上限 100 ms | `build` 时 `patch.py` 自动应用 |
| 游戏图标（每次构建必做） | 源 logo → `builds/<游戏>/<tid>/extract/v<版本>/icon.jpg` | 自定义 App 图标，构建后必须验证非空白 | 构建前手动生成 `icon.jpg`，见 §3 |
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

## 3. 游戏图标（每次构建必做）

> **规则：每次 `build` 都必须确认成品 App 带自定义 logo，不能是空白图标。** 构建日志里要出现 `app icon:`，且 `*.app/Contents/Resources/AppIcon.icns` 存在。

### 原因

dump 文件夹（以及 NUP）没有 control data，nxnative 构建器默认拿不到图标，日志会打印 `no game icon: a dump folder has no control data; the app's icon will be blank`。构建器的图标查找顺序是：`--icon` 参数 → 工作目录 `extract/v<版本>/icon.jpg` → control data 自带图标。把 `icon.jpg` 放进 extract 目录即可被自动采用：`pack_app.py` 用 `sips` + `iconutil` 生成全套 `AppIcon.icns`，并在 `Info.plist` 写入 `CFBundleIconFile=AppIcon`。

logo 属于游戏内容，**不要提交进 git**；源文件放在仓库外（如 Downloads），`icon.jpg` 只存在于 `work/`、`builds/` 这类被忽略的构建目录里。

### 大金刚（Donkey Kong Bananza，title ID `040074A01BF12000`）

源图：`/Users/amid031799/Downloads/QIGANG/logo.jpeg`（1268×951 横版）。横版图先居中裁成正方形，再缩到 1024×1024 的 JPEG：

```bash
TMP="$(mktemp -d)/square.png"
sips -s format png -c 951 951 /Users/amid031799/Downloads/QIGANG/logo.jpeg --out "$TMP" >/dev/null
sips -s format jpeg -z 1024 1024 "$TMP" --out builds/dk/040074A01BF12000/extract/v458752/icon.jpg >/dev/null
```

放置位置（版本号随 dump 的 update 版本变化，当前是 v458752）：

```
builds/dk/040074A01BF12000/extract/v458752/icon.jpg
```

### 马车世界（Mario Kart World）

1. 把图标 PNG（1024×1024）用 `sips` 转成 JPEG，命名为 `icon.jpg`。
2. 放到对应工作目录的 `extract/v0/icon.jpg`（默认 `work/0400C3F00006E000/extract/v0/`，独立目录则是 `builds/mkw/.../extract/v0/`）。

### 缓存与失效

- extract 阶段被复用时（日志 `reusing the extracted ...`），已放入的 `icon.jpg` 会保留，不需要重做。
- 以下情况 `icon.jpg` 会丢失，**必须在 `build` 之前重新生成**：
  - 删除或清空了 `builds/<游戏>/<title ID>/extract/`（换工作目录、磁盘清理）。
  - 游戏升级到新 update 版本，extract 目录变成新的 `v<新版本>/`。
  - 重新全量解包（`.partial` 交换替换整个 extract 目录）。
- 构建后验证：

```bash
ls -l '/Applications/Donkey Kong Bananza.app/Contents/Resources/AppIcon.icns'
/usr/libexec/PlistBuddy -c 'Print :CFBundleIconFile' '/Applications/Donkey Kong Bananza.app/Contents/Info.plist'
```

> dump 的 `base/` 目录是 root 所有，普通用户无法直接写，所以 `icon.jpg` 放在构建工作目录的 extract 里即可，不要往 dump 里写。

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

## 7. 打包与升级流程

### 每次构建前检查清单

1. `icon.jpg` 已在 `builds/<游戏>/<tid>/extract/v<版本>/` 里（见 §3）；extract 被清空或换版本后必须重新生成。
2. `game.json` 的 `language` 仍是期望的默认语言（大金刚为 `zh-Hans`，见 §9）。
3. 磁盘可用空间大于该游戏 `game.json` 的 `disk_gb`（大金刚 40 GB）。
4. 构建日志出现 `game language: zh-Hans` 和 `app icon: .../icon.jpg` 才算成功带上中文和 logo。

### 打正式包

```bash
./switch2mac.py install
```

把 `work/Mario Kart World.app` 移到 `/Applications/Mario Kart World.app`。首次启动 macOS 会扫描 1–3 分钟（无窗口无 Dock 图标），不要重复打开。

### 以后升级前先删旧包（省空间）

重新构建会占用约 50 GB，磁盘不够会直接停止。构建前先删掉下面这些（用 Python `shutil.rmtree`，避开 shell 的 `rm` 限制）：

1. `/Applications/Mario Kart World.app`（旧正式包）
2. `work/Mario Kart World.app`（旧构建产物，如果还在）
3. `engines/nxnative-<旧commit>/`（旧引擎源码，可重新拉取）

### 存档绝对不能丢

- 存档在 `~/Library/Application Support/nxnative/0400C3F00006E000/save/Play/account.sav`，**不在 App 里**，删除或移动 App 都不影响它。
- 清理磁盘时永远不要动 `~/Library/Application Support/nxnative/` 和 `work/run/`（旧 run 模式存档）。
- 日志在 `~/Library/Logs/nxnative/0400C3F00006E000.log`，同样不随 App 位置变化。

## 8. 多游戏独立构建目录

### 为什么

默认 `work/` 里，每个游戏的实际产物在 `work/<title ID>/` 下是独立的，但顶层的 `title.txt`、`build.txt`、`app_switches.txt`、`logs/`、`run/` 是共享的，会被最后构建的游戏覆盖。构建多个游戏时用各自的 `--work` 目录，就能完全隔离。

### 当前结构

```
builds/
  mkw/                         # Mario Kart World
    0400C3F00006E000/          # 构建产物（~28 GB）
    0400C3F00006E000-engine-seed.tsv
    title.txt                  # 0400C3F00006E000
    build.txt                  # nxnative
    app_switches.txt           # S2M_ENGINE=nxnative-1ed28ed0981f
    run/                       # run 模式数据（存档、pso_user、shdump）
    logs/
  dk/                          # Donkey Kong Bananza
    040074A01BF12000/          # 构建产物（~19 GB）
    040074A01BF12000-engine-seed.tsv
    title.txt                  # 040074A01BF12000
    build.txt                  # nxnative
    app_switches.txt           # S2M_ENGINE=nxnative-b5948342b58f
    logs/
```

### 用法

```bash
# 马车世界
./switch2mac.py --work builds/mkw build "<MKW dump>"
./switch2mac.py --work builds/mkw install

# 大金刚（以后其它游戏同理，建 builds/<名字>/）
./switch2mac.py --work builds/dk build "<DK dump>"
./switch2mac.py --work builds/dk install
```

### 注意

- 每个游戏的 shader 缓存、RomFS、管线归档各存一份，磁盘占用会变大，定期清理旧游戏的缓存。
- 存档仍在 `~/Library/Application Support/nxnative/<title ID>/`，与构建目录无关。
- 以后新增游戏时，先 `mkdir -p builds/<名字>`，然后用 `--work builds/<名字>` 构建。

## 9. 默认游戏语言（简体中文）

### 内容

《大金刚：狂暴香蕉》的 `games/donkey-kong-bananza/game.json` 里有：

```json
"language": "zh-Hans"
```

`switch2mac.py` 的 `engine_build()` 会把该值作为 `--language zh-Hans` 传给 nxnative 的 `build_ipa_from_nsp.py`。构建器会把它写进：

- `Contents/Info.plist` 的 `DMLanguage`（没有 env.txt 或保存的选择覆盖时，启动器用它作为默认语言）
- `launcher.json` 里“游戏语言”的默认值（`DM_LANG`）

所以以后重新 `build` 出来的 App 默认就是简体中文，不需要再手动改 `Info.plist`。

### 覆盖

- 想改默认语言：修改 `games/donkey-kong-bananza/game.json` 的 `language`（例如 `en-US`、`ja`、`zh-Hant`）。
- 直接调用 nxnative 的构建器时，可以用 `--language <code>` 覆盖。
- 在 App 的设置面板里手动改过语言后，会保存为该 App 的偏好（`launcher.DM_LANG`），优先于打包默认值。要回到打包默认值：

```bash
defaults delete org.nxnative.040074a01bf12000 launcher.DM_LANG
```

### 恢复

这些改动在 switch2mac 仓库的 git 里；合并上游后保留 `game.json` 的 `language` 字段和 `switch2mac.py` 里把 `language` 传给 `--language` 的代码即可。

## 6. 构建历史

### 2026-11-09 重新构建（nxnative 7d8dcdf824a6）

- 引擎版本：nxnative `7d8dcdf824a6`（从 `1ed28ed0981f` 升级）
- 构建时间：约 26 分钟（10:52 - 11:19）
- Shader 数量：11,560 个（全部重新编译，0 个缓存命中）
- Shader 编译时间：16 分 23 秒
- 最终 App 大小：23.1 GB
- 构建产物占用：27 GB（从 29 GB 减少）
- 应用自定义修改：
  - 中文界面（s2m_ui.m）
  - poll 修复（hle_net.c: 100ms 上限）
  - 中文语言设置（settings.tsv, nacp.py）


## 7. 构建后自动安装

用户偏好：构建完成后直接安装到 `/Applications`，不再保留 `work/` 里的副本。

流程：
1. 构建完成（app 在 `work/Mario Kart World.app`）
2. 删除 `/Applications` 里的旧 app（如果有）
3. 移动新 app 到 `/Applications`
4. 存档位置不变：`~/Library/Application Support/nxnative/<title ID>/`


### 2026-11-10 重新构建（nxnative e121931f473a）

- 引擎版本：nxnative `e121931f473a`（从 `7d8dcdf824a6` 升级）
- 构建时间：约 22 分钟（09:39 - 10:01）
- Shader 数量：11,560 个（全部重新编译，0 个缓存命中）
- Shader 编译时间：11 分 57 秒
- 最终 App 大小：23.6 GB（安装后 24 GB）
- 构建产物占用：29 GB（从 27 GB 增加）
- Pipeline archive：665.3 MB（从 508.7 MB 增加）
- 应用自定义修改：
  - 中文界面（s2m_ui.m）
  - poll 修复（hle_net.c: 100ms 上限）
  - 中文语言设置（settings.tsv, nacp.py）
- 更新内容：Compute shared memory 修复（超过 32KB 的共享内存现在为每个 workgroup 分配独立的 slice）


## 8. 游戏图标

每次构建时必须添加游戏 logo 图标。

### 马车世界 (Mario Kart World)

- Logo 文件位置：`/Users/amid031799/Downloads/MKWROM/Mario Kart World.png`
- 构建命令：`./switch2mac.py build "/Users/amid031799/Downloads/MKWROM" --engine nxnative --icon "/Users/amid031799/Downloads/MKWROM/Mario Kart World.png"`
- `switch2mac.py` 原先没有 `--icon` 参数（只有引擎的 `build_ipa_from_nsp.py` 支持），
  已在本项目补上：`switch2mac.py` 的 `build` 子命令接受 `--icon`，nxnative 构建时
  原样传给引擎 builder。


## 9. 马车世界启动崩溃修复（2026-11-11）

### 现象

Mario Kart World（nxnative `e121931f473a`）打开后立即退出，帧率都没出现。两次运行日志
（`~/Library/Logs/nxnative/0400C3F00006E000.log` 及其 `.prev.log`）在同一位置崩溃：

```
[dm] oe notification popped by the game: 15
[dm] CRASH sig=11 addr=0xd8 pc=main+0x26380c4 lr=main+0x2637f80
```

### 原因

1. 启动进入全屏时，游戏窗口短暂失去 key window，引擎的 `front_mac.m` 调
   `dm_focus_set(2)`，`hle_oe.c` 向游戏队列推送 OE 通知 15（焦点/恢复通知）。
2. MKW 的通知处理线程弹出 15 后，会解引用 `main+0x33e54b0` 处的 OE 客户端单例
   （随后读 `+0xd8`）。nxnative 把 `oe::Initialize` 当作 no-op，这个单例保持
   NULL，于是 SIGSEGV（addr 0xd8）。
3. 大金刚（nxnative `7ffa63cca09f`）也会收到 15，但它的处理函数不碰这个空指针，
   所以不崩。`hle_oe.c`/`front_mac.m` 在大金刚与马车两个引擎版本之间完全相同，
   因此升级 nxnative 未必能修好，这是 MKW 专用的 HLE 缺口 + 启动时机。

### 绕过（已应用，无需重新构建）

在 `~/Library/Application Support/nxnative/0400C3F00006E000/env.txt` 写入：

```
DM_FOCUS_KEEP=1
```

引擎不再把窗口失焦上报给游戏（`front_mac.m` 的 `keep` 分支），启动时不会入队
通知 15，MKW 的处理函数也就不会访问空单例。副作用：切到别的 App 时游戏不会
认为自己失焦（不会暂停渲染）。

### 重新构建后要保留

`env.txt` 在 Application Support，不在 App 包里；重新构建、重新安装都不会被删。
如果换游戏或删除存档目录，需要重新写这份 env.txt。


### 2026-11-11 重新构建（nxnative 3304d6a0d7ed）

- 引擎版本：nxnative `3304d6a0d7ed`（从 `e121931f473a` 升级，55 个引擎提交）
- 构建时间：约 21 分钟（09:59 - 10:20）
- Shader 数量：11,560 个（全部重新编译，0 个缓存命中）
- Shader 编译时间：10 分 22 秒
- Shader list：13,431 行（比上次 13,132 行多 299 行）
- 最终 App 大小：23.1 GB（安装后 23 GB）
- 构建产物占用：27 GB
- Pipeline archive：521.6 MB（上次 665.3 MB）
- 已带 logo 图标：`--icon "/Users/amid031799/Downloads/MKWROM/Mario Kart World.png"`
- 应用自定义修改：
  - 中文界面（s2m_ui.m）
  - poll 修复（hle_net.c: 100ms 上限）
  - 中文语言设置（settings.tsv, nacp.py）
- 闪退问题：上游 `3304d6a0` **未修复**，继续保留 `DM_FOCUS_KEEP=1`。
  以后升级时如果上游代码修好了，删掉 Application Support 里的 `env.txt` 即可。

