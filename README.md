# 全员逃走中（tzz_minigame）数据包 v2.3.2

本数据包实现了“全员逃走中”小游戏的主流程：玩家/管理员面板、分队与准备检测、10 秒倒计时、逃走能量、死亡旁观、定时广播、OP ActionBar 计时器，以及开局小游戏与任务模块。

> 重要提醒：作者在加载提示中写明“请在游戏开始前 /reload”。并且在开始游戏确认界面也提示：**游戏开始后重载数据包会导致数据清零、地图重置**。请务必按流程操作。

---

## 版本与兼容性

- `pack.mcmeta`：`pack_format = 94`
- 该数据包依赖较新的指令/组件体系（如战利品表里使用 `set_components`、小游戏中使用 `random value`、计分板 `sidebar.team.*` 显示等）。
- 绝对坐标已改为“宏函数 + 配置函数”集中管理：逻辑函数不再直接写坐标，换地图时只需要调整配置文件中的坐标值。

---

## 坐标配置（宏函数）

本数据包把原先散落在各处的 `tp / setblock / fill / particle` 绝对坐标，统一迁移到配置函数中：

- 宏模板函数：data/tzz_game/function/tzz_macros/
	- `tp.mcfunction` / `setblock.mcfunction` / `fill.mcfunction` / `particle.mcfunction`
- 坐标配置区：data/tzz_game/function/tzz_config/
	- `task_one/`：任务一相关坐标
	- `gamestart/`：开局小游戏/猎人箱相关坐标

你只需要改 `tzz_config` 目录下对应文件里 `function ... {x:...,y:...,z:...}` 的数值即可完成坐标迁移。

---

## 快速安装与首次启动

1. 将数据包目录放入世界存档：`<world>/datapacks/[1.21.11]tzz_game/`
2. 进入世界后执行：

```mcfunction
/reload
```

3. 需要管理员面板时，在游戏内对自己执行：

```mcfunction
/tag @s add op
/reload
```

4. 打开面板：

```mcfunction
/trigger tzz_user_operation
```

管理员面板（仅 `tag=op` 的玩家会收到入口按钮）：

```mcfunction
/trigger tzz_op_user_operation
```

---

## 数据包入口（load / tick）

### load（加载时执行）
由 `data/minecraft/tags/function/load.json` 触发：

- `tzz_initialize:tzz_create_scoreboard`：创建全部计分板、初始化全局变量
- `tzz_initialize:tzz_create_team`：创建 3 个队伍（逃走者/猎人/管理员）
- `tzz_initialize:tzz_gamerule`：设置基础 gamerule（锁时间/天气等）
- `tzz_initialize:tzz_scheduled_task`：设置定时任务（欢迎与每分钟广播）
- `tzz_initialize:tzz_reload_build`：重置部分地图建筑（坐标来自 `tzz_game:tzz_config/...`）
- `tzz_game_running:op_timer/init`：初始化 OP actionbar 计时器存储

### tick（每 tick 执行）
由 `data/minecraft/tags/function/tick.json` 触发：

- 面板与 trigger 保活：
	- `tzz_main_user_operation_panel:tzz_user_can_always_use`
	- `tzz_main_user_operation_panel:tzz_op_user_operation_panel`
	- `tzz_main_user_operation_panel:tzz_user_operation_panel`
	- `tzz_main_user_operation_panel:tzz_user_text_goto`
	- `tzz_main_user_operation_panel:tzz_game_rule`
	- `tzz_main_user_operation_panel:tzz_game_guide`
- 全局机制：
	- `tzz_global_function:tzz_death_spectator`
	- `tzz_global_function:tzz_player_effect`
- 开局流程：
	- `tzz_game:tzz_start_game/tzz_startgame_confirm`
	- `tzz_game:tzz_start_game/tzz_game_start_chack_team`
	- `tzz_game:tzz_start_game/tzz_game_start_ready_chack`
	- `tzz_game:tzz_start_game/tzz_catcher_choose_spawn`
	- `tzz_game:tzz_start_game/tzz_game_start`
- OP 计时器：
	- `tzz_game_running:op_timer/tick`

---

## 玩法流程（推荐按这个顺序）

### 1）玩家加入队伍 + 选择性别

玩家执行：

```mcfunction
/trigger tzz_user_operation
```

在“玩家面板”里可点击：

- 加入逃走者：`/trigger tzz_join_runner`
- 加入猎人：`/trigger tzz_join_catcher`
- 离开队伍：`/trigger tzz_leave_all_team`
- 选择男生：`/trigger tzz_choose_gender set 1`
- 选择女生：`/trigger tzz_choose_gender set 2`
- 呼叫管理员：`/trigger tzz_call_op`
- 打开规则/指南二级页：`/trigger tzz_text_expand`

> 备注：数据包会在 tick 中不断 `scoreboard players enable` 这些 trigger，通常不会出现“trigger 不能用”的情况；若你手动改坏了，也可直接 `/reload`。

### 2）管理员发起开局

管理员打开“管理员面板”：

```mcfunction
/trigger tzz_op_user_operation
```

点击“开始游戏”后会进入确认界面（避免误触），再次点击确认将执行：

```mcfunction
/trigger tzz_game_start_process
```

### 3）猎人选择出生点（独占锁）

确认开局后，系统会提示所有猎人选择部署位置：

- 选择：`/trigger tzz_catcher_spawn_point set 1..9`
- 取消：`/trigger tzz_catcher_spawn_point set 99`

逻辑要点：

- 每个出生点都有“占用锁”（`tzz_spawn_A..I` 存在 `tzz_catcher_spawn_lock`，0=可选，1=已占用）
- 每个猎人有个人选择记录（`tzz_catcher_spawn_selected`，1..9）
- 非猎人尝试选择会被拒绝并提示

### 4）分队检测 → 准备界面

数据包会检测是否存在 `team=`（未分组）玩家；如果所有人都已分队，会进入准备界面并统计玩家总数。

准备界面：

- 全体玩家点击“我准备好了”：`/trigger tzz_game_start_ready set 1`
- 管理员点击“验证是否全员准备”：`/trigger tzz_game_start_ready_check`

当满足“无人未分队 + 全员准备”后，会设置 `Global tzz_team_check_done = 1`，允许进入下一步。

### 5）10 秒倒计时 → 游戏正式开始

当 `tzz_team_check_done` 成立且游戏尚未激活时：

- 写入 `Global tzz_game_active = 1`
- 初始化逃走能量显示
- 重置猎人击杀数
- 启动 10 秒倒计时（通过 `schedule function tzz_game:tzz_start_game_10second/...`）

倒计时结束（0 秒）时会执行：

- 启动逃走能量循环（每秒执行一次）
- 发放“游戏开始”进度提示
- 加载开局小游戏场景

---

## 核心系统说明（与代码一致）

### 队伍

- `tzz_team_runner`：逃走者（绿色，隐藏名牌/死亡消息）
- `tzz_team_catcher`：猎人（红色，隐藏名牌/死亡消息）
- `tzz_team_op`：管理员（金色，显示名牌/死亡消息）

### 逃走能量（tzz_run_energy）

- 计分板：`tzz_run_energy`（dummy）
- 逻辑：每秒给**未死亡标记**的逃走者增加 **20** 点（见 `tzz_game:tzz_game_energy/tzz_game_energy`）
- 显示：`tzz_game:tzz_game_energy/tzz_game_energy_load` 将其显示到 `sidebar.team.gold`（默认给管理员队伍侧边栏显示）

如需让所有玩家都看到能量排行，可以自行把显示改为 `sidebar` 或者对应队伍显示。

### 死亡旁观（death spectator）

- 计分板：`tzz_death_spectator`（`deathCount`）
- 开关：`switch` 在 `tzz_death_spectator_switch` 中（0=关闭，1=开启）
- 行为：开启时，非 op 玩家死亡会被切到旁观者模式并打上 `death` 标签，同时广播“被猎人抓捕”并统计剩余逃走者数量。

管理员面板里提供按钮一键开/关，也提供“清空玩家死亡数据”。

### OP ActionBar 计时器

- 计分板：`tzz_op_timer_remaining`（剩余秒数）、`tzz_op_timer_tick`（每 tick 计数）、`tzz_op_timer_math`（运算缓存）
- 存储：`storage tzz_game:op_timer` 里的 `event` 字段（显示“下个事件”名称）
- 显示：每 tick 给 `tag=op` 的玩家发 actionbar：`下个事件: <event> | <min>分<sec>秒`

该计时器会被任务脚本写入，例如：

- 任务一开始：15 分钟后结算（猎人箱判定）
- 任务二开始：10 分钟后定位抓捕

---

## 小游戏 / 任务模块（当前仓库中已实现的部分）

### 开局小游戏：起跑游戏（minigame_1）

游戏开始后会加载开局小游戏区域并随机挑选两名逃走者参与“读秒”。

- 预热 30 秒后开始
- 系统随机生成目标时间 `20..30` 秒（存储在 `tzz_running_game:random_time`）
- 玩家需要在心里预估时间并按下停止按钮（细节逻辑在 `tzz_game_running/function/gamestart_minigame_1/` 内）

### 任务一：猎人箱封锁

入口函数：

```mcfunction
/function tzz_game_running:task_one/task_one_start
```

任务要点（脚本原文提示）：

- 市场内投放 3 台猎人箱，15 分钟后进行判定/放出
- 每台猎人箱对应颜色；投入对应颜色的“封锁卡”可封锁
- 同时投放 3 具假猎人（无抓捕功能），在假猎人面前站 3 秒可获得固定颜色的色卡

任务一会使用“封锁卡”战利品：

- `tzz_item:green_card` / `tzz_item:yellow_card` / `tzz_item:purple_card`

### 任务二：认证与定位抓捕

入口函数：

```mcfunction
/function tzz_game_running:task_two/start_task_two
```

任务要点：

- 10 分钟后触发“定位抓捕”
- 玩家需要前往指定地点进行认证
- 时间结束后未认证成功的逃走者会获得 `glowing` 发光效果吸引猎人

认证与性别相关：

- 玩家需在玩家面板选择性别（`tzz_choose_gender`），随后再去对应的认证点触发认证函数。

---

## 资源清单

### 进度（advancement）

路径：`data/tzz_game/advancement/`

- `tzz_welcome`：欢迎游玩
- `tzz_use_command`：打开用户面板
- `tzz_choose_team`：选择队伍
- `tzz_open_text`：打开规则/指南
- `tzz_energy`：逃走能量提示
- `tzz_wait_gamestart`：即将开始
- `tzz_gamestart`：游戏开始

### 结构（structure .nbt）

路径：`data/tzz_game/structure/`

- `gamestart_catcher_box.nbt` / `gamestart_catcher_box_none.nbt`
- `rw1_catcher_box.nbt` / `rw1_catcher_box_none.nbt`

### 战利品表（loot_table）

路径：`data/tzz_item/loot_table/`

- `green_card.json` / `yellow_card.json` / `purple_card.json`

---

## 地图坐标与硬编码（非常重要）

该数据包包含大量 `setblock`/`fill`/`tp` 等操作且坐标写死，例如：

- `tzz_initialize:tzz_reload_build`：重置场上建筑物（多处固定坐标）
- `tzz_game_running:gamestart_catcherbox_spawn/*`：开局“猎人箱刷新动画/传送”
- `tzz_game_running:task_one/build_catcher_box`：任务一猎人箱/假猎人相关传送与发卡
- `tzz_game_running:gamestart_minigame_1/load_gamestart_part`：开局小游戏场地搭建与传送

如果你不是使用作者配套地图：

1. 需要把这些函数里的坐标整体迁移到你的地图坐标系
2. 或者把坐标/区域改为基于 marker/结构方块/定位实体的相对坐标方案

---

## 目录结构（建议从这里读代码）

- `data/tzz_initialize/function/`：计分板、队伍、gamerule、定时任务、加载提示与地图重置
- `data/tzz_main_user_operation_panel/function/`：玩家/管理员面板、规则/指南文本、trigger 保活
- `data/tzz_game/function/`：开局流程、倒计时、逃走能量、猎人出生点选择
- `data/tzz_global_function/function/`：死亡旁观与基础状态效果
- `data/tzz_game_running/function/`：开局小游戏、猎人箱刷新、任务一/任务二、OP 计时器
- `data/tzz_item/loot_table/`：封锁卡
- `data/tzz_game/structure/`：结构文件

---

## 常见问题（排错）

- 面板按钮点了没反应：先执行 `/reload`；如果你在改过触发器权限，可执行 `/function tzz_main_user_operation_panel:tzz_user_can_always_use` 重新 enable。
- 管理员面板不显示：需要 `tag=op`，执行 `/tag @s add op` 后再 `/reload`。
- 游戏开始后不要 `/reload`：数据包内多处提示该操作会导致数据与地图状态被清零/重置。
- 小地图状态效果无法自动加载：加载提示里说明需要你自己用命令方块等方式处理。
