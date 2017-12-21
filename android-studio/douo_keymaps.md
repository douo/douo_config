
[Source](https://dourok.info/2016/08/20/share-my-android-studio-emacs-keymaps/ "Permalink to 分享我的 Android Studio Emacs 风格快捷键")

# 分享我的 Android Studio Emacs 风格快捷键

![QWERTY 键盘区域，来自 wikimedia][1]

Emacs 风格的快捷键通过[前缀键][2]来扩展更多打字区的快捷键，尽量把快捷键控制在打字键区，显著减少编码过程手腕的移动，是个经得起考验的快捷键方案（非 emacs 用户可能深痛恶觉）。

这套快捷键在 Emacs keymaps 的基础上进行自定义，首先减少对功能键区的使用，一来容易与系统快捷键冲突，二来手指移动的幅度过大难定位不容形成肌肉记忆，所以只保留编译运行相关的快捷键。至于编辑键区则更次，手腕必须得移动，眼睛也得跟着辅助定位，只保留少部分不常用的默认快捷键。数字键区最糟，手腕移动幅度最大，再说我的 87 键盘都没有小键盘 `-_-`，直接弃用。至于鼠标，那更是万恶之源，整个手臂都得移动，还要眼睛配合才能用鼠标完成一次操作，写代码的过程大多是用鼠标辅助点击几次，然后又回到打字区继续敲，这样来回一次切换成本太高。何况程序员经常用鼠标点点点？多没 B 格啊。虽说如此，不过想要完全不用鼠标还是不太容易，只能说一个命令通过鼠标打开层层菜单来执行超过一次，第二次就应该用 Find Action 来执行，如果一天超过三次那就应该给它设个快捷键并记住。

Android Studio 相比 Eclipse 内置的 Emacs keymaps 强大了许多，不过 Eclipse 有 Emacs+， Android Studio 却没有这方面的插件。所有 Android Studio 相比 Emacs 多了一些不足，比如：

1. Android Studio 只支持一个前缀键（prefix key），所以 spacemacs 那样的助记法快捷键 Android Studio 难以实现
2. Android Studio 中 Esc 不能作为修饰键使用
3. IntelliJ 可以为 `Escape` 命令配置快捷键，但不少 UI 还是硬编码为键盘的 `Esc` 键。所以为了退出浮窗，经常要 `C-g`、`Esc` 交替使用
4. 不过窗口的操作逻辑不一致，有些 UI 可以用移动光标快捷键，有些只能用方向键

一些约定先说明，特别是非 Emacs 党：

最终使用的前缀键有下面三个：

1. `C-x`
2. `Esc`
3. `M-g`

首先，最基本又最重要的键肯定就是 Find Action，简直就是 Emacs 中的 Run Command，必须绑定为 `M-x`。别的快捷键记不住不要紧，只要记住这个还是能做到无鼠标操作，特别是还附带快捷键提示，如果有的话。不过还是得对命令的关键字有点概念，表格中的关键字项就是表示通过该关键字在 Find Action 或者 Keymaps 设置搜索到相应功能；自定义有 `*` 表示快捷键是我自定义的，非 Emacs Keymaps 的默认配置。

| 快捷键     | 功能   | 关键字         | 自定义 |  
| ------- | ---- | ----------- | --- |  
| `M-x`   | 执行命令 | find Action | *   |  
| `C-g`   | 取消   | escape      |     |  
| `C-M-s` | 打开设置 | settings    |     |  

### 光标移动（Move cursor）

光标移动类的快捷键，这里指的是在单一文本的内的光标移动，又包括语法无关的移动和语法相关的移动，语法无关的移动指的就是光标的上下左右移动等等，这一块与 Emacs 基本一致。另外 `C-l`虽然不是移动光标，但也是放在这里。

| 快捷键      | 功能           | 关键字              | 自定义 |  
| -------- | ------------ | ---------------- | --- |  
| `C-f`    | 向前移动一个字符     | right            |     |  
| `C-b`    | 向后移动一个字符     | left             |     |  
| `C-n`    | 向上移动一行       | up               |     |  
| `C-p`    | 向下移动一行       | down             |     |  
| `M-f`    | 向前移动一个单词     | next word        |     |  
| `M-b`    | 向后移动一个单词     | previous word    |     |  
| `C-a`    | 移动到行头        | line start       |     |  
| `C-e`    | 移动到行尾        | line end         |     |  
| `C-v`    | 下一页          | page down        |     |  
| `M-v`    | 上一页          | page up          |     |  
| `M-<`    | 移动到文本头       | text start       |     |  
| `M->`    | 移动到文本尾       | text end         |     |  
| `C-l`    | 将光标位置滚动到屏幕中央 | scroll to center |     |  
| `C-Pgup` | 移动到当前页的起始处   | Page Top         |     |  
| `C-PgDn` | 移动到当前页的结束处   | page end         |     |  

语法相关的移动：

| 快捷键     | 功能                 | 关键字              | 自定义 |  
| ------- | ------------------ | ---------------- | --- |  
| `C-[`   | 移动到当前 Block 起始大括号处 | Code block start |     |  
| `C-]`   | 移动到当前 BLock 结束大括号处 | Code Block End   |     |  
| `C-M-a` | 移动到前一个方法           | previous method  |     |  
| `C-M-e` | 移动到后一个方法           | next method      |     |  

Android Studio 将 `M-g` 作为跳转到行数，我改其作为前置键，同时作为跳转高亮错误的前置键。

| 快捷键     | 功能      | 关键字                    | 自定义 |  
| ------- | ------- | ---------------------- | --- |  
| `M-g g` | 作为跳转到行数 | line                   | *   |  
| `M-g n` | 下一个高亮问题 | next highlighted error | *   |  
| `M-g p` | 上一个高亮问题 | next highlighted error | *   |  

与光标相关的还有文本选择，我保留 `C-space` 来加入选择模式，但这个快捷键也常被操作系统用来切换输入法， 在 Linux 下我把输入切换配置为 Win-space，其他系统我也建议想办法把 C-space 留给 Android Studio。

| 快捷键       | 功能     | 关键字              | 自定义 |  
| --------- | ------ | ---------------- | --- |  
| `C-space` | 切换选择模式 | sticky selection |     |  
| `C-x, h`  | 全选     | select all       |     |  

特别是 Android Studio 不像 emacs 可以用 `C-F` 等进行选择。只能用传统的 `S-→`。所以保留 C-space 还是有必要的，下面是例外：

| 快捷键        | 功能                 | 关键字              | 自定义 |  
| ---------- | ------------------ | ---------------- | --- |  
| `C-{`      | 选择到当前 Block 起始大括号处 | Code block start |     |  
| `C-}`      | 选择到当前 Block 结束大括号处 | Code block end   |     |  
| `C-S-PgUp` | 选择到当前页的起始处         | page start       |     |  
| `C-S-PgDn` | 选择到当前页的结束处         | page end         |     |  
| `C-S-Home` | 选择到当前文本的起始处        | text start       |     |  
| `C-S-End`  | 选择到当前文本的结束处        | text end         |     |  

### 导航（Navigate）

导航，在不同文件中切换。常用的导航我用一段式快捷键。一定要善用前三个，对编码效率绝对是很大的提高，起码不会让切换文件的速度脱慢你的思路。

`C-M-G` 是 `C-M-g` 的高级版，直接从实例名跳转到其类中。

| 快捷键     | 功能      | 关键字              | 自定义 |  
| ------- | ------- | ---------------- | --- |  
| `C-M-f` | 上一个位置   | forward          | *   |  
| `C-M-b` | 下一个位置   | back             | *   |  
| `C-M-g` | 跳转到定义处  | declaration      |     |  
| `C-M-G` | 跳转到类型   | type declaration | *   |  
| `C-M-u` | 跳转到父类方法 | super method     | *   |  
| `M-←/→` | 左右切换标签  | select tab       |     |  

如果对简洁有要求或者屏幕太小（比如我），可以将 Android Studio 的标签关掉，具体参考：[Configuring Behavior of the Editor Tabs][3]，那么这时 `M-←/→` 就不会起作用了。

另外 `M-num` 都被 Android Studio 绑定到切换功能窗体，很实用但不一一罗列了，比较常用的是 `M-6` 打开 Android Monitor、`M-7` 打开 Structure，至于 Project 有更好的快捷键打开。

`C-num` 用于跳转书签。`C-M-num` 则用于设置书签，书签是全局的。

**Select in…** 可谓的鼠标杀手中的 MVP，多少鼠标操作就是为了在其他窗体中操作当前文件。大部分情况下它都是比 `M-num` 更好的选择。默认的 `Alt+F1` 与系统冲突，我修改为 `Esc，S-i`，好记，不过需要前缀键确实难为了这个命令。

| 快捷键       | 功能                     | 关键字                    | 自定义 |  
| --------- | ---------------------- | ---------------------- | --- |  
| `Esc,S-i` | 在其它窗体中选择，比如在项目窗体定位当前文件 | select in..            | *   |  
| `S-Esc`   | 隐藏工具窗口，配合上个命令使用更佳。     | Hide Active ToolWindow |     |  
| `C-S-Esc` | 隐藏所有工具窗口               | Hide All ToolWindow    | *   |  

### 编辑（Edit）

看快捷键说明， Android Studio 有 kill ring 的概念，比如 `M-w`、`C-w`、`M-d`、`M-backspace` 都是操作 kill ring，但是居然没有 yank pop，所以 `M-y` 只能绑定为不太实用 **paste from history…**，话说你把 kill ring 藏到哪了？

| 快捷键       | 功能         | 关键字                    | 自定义 |  
| --------- | ---------- | ---------------------- | --- |  
| `C-x,C-f` | 打开文件       | file                   |     |  
| `C-x,b`   | 切换 Buffer  | switcher               |     |  
| `C-x,k`   | 关闭当前文件     | close                  |     |  
| `C-_`     | 撤销         | undo                   |     |  
| `M-_`     | 重做         | redo                   |     |  
| `C-w`     | 剪切         | kill selected          |     |  
| `M-w`     | 复制         | save to kill ring      |     |  
| `C-y`     | 粘帖         | paste                  |     |  
| `M-y`     | 粘帖历史选择     | paste from history     |     |  
| `M-S-↑/↓` | 移动当前行      | move line up/down      |     |  
| `C-S-↑/↓` | 移动当前语句/代码块 | move statement up/down |     |  
| `M-;`     | 注释当前行      | line comment           |     |  
| `M-:`     | 注释块        | block comment          | *   |  
| `C-=`     | 展开         | expand                 |     |  
| `C-M-=`   | 全部展开       | expand all             | *   |  
| `C--`     | 收缩         | collapse               |     |  
| `C-M--)`  | 全部收缩       | collapse all           | *   |  

Android Studio 对分割窗格的支持，基本可以做到和 Emacs 一致，除了 `C-x, 0`，在 Android Studio 中它的行为与 `C-x, k` 一致。

| 快捷键      | 功能       | 关键字                | 自定义 |  
| -------- | -------- | ------------------ | --- |  
| `C-x, 1` | 关闭其他窗格   | unsplit            |     |  
| `C-x, 2` | 平行分割当前窗格 | split              |     |  
| `C-x, 3` | 竖直分割当前窗格 | split              |     |  
| `C-x, 0` | 关闭当前窗格   | unsplit            |     |  
| `C-x, o` | 切换不同窗格   | goto next spliteer |     |  

### 查找（Find）

`C-D` 是 Dash 插件的默认快捷键，用于在 Dash/Velocity/Zeal 中搜索

| 快捷键   | 功能          | 关键字             | 自定义 |  
| ----- | ----------- | --------------- | --- |  
| `C-s` | 文本内搜索/下一个匹配 | find next       |     |  
| `C-r` | 下一个匹配       | find previous   |     |  
| `M-%` | 替换          | replace         |     |  
| `C-S` | 全局搜索        | find in path    | *   |  
| `C-R` | 全局替换        | replace in path |     |  
| `M-S` | 查找使用        | find usage      |     |  
| `C-D` | Dash 中搜索    | Search in Dash  | *   |  

Android Studio 支持宏功能，默认的宏操作都没有配置快捷键，不过没有 `C-u` 宏的实用性大打折扣

| 快捷键      | 功能    | 关键字             | 自定义 |  
| -------- | ----- | --------------- | --- |  
| `C-x, (` | 开始宏录制 | start macro     |     |  
| `C-x, )` | 停止宏录制 | stop macro      |     |  
| `C-x, e` | 运行宏   | play last macro |     |  

### 编码（Code）

重构的 Extract 都被绑定为 `C-M-key`，本来也是不错的选择，可惜太多冲突，我改为 `Esc,key`，取首字母相同来助记。前缀键我在 `Esc` 和 `C-c` 间犹豫了下，显然 `C-c` 效率更好，但我觉得重构的话，在操作前有个停顿思考下也不是坏事。所以最终选择了 `Esc`。

`C-M` 的默认功能与 `C-[`、`C-]` 重叠了，所以不如绑定为显示方法的参数信息，毕竟 Android Studio 的代码补全不支持显示方法参数，所以这个功能也是很有必要的。

| 快捷键       | 功能                  | 关键字                    | 自定义 |  
| --------- | ------------------- | ---------------------- | --- |  
| `M-/`     | 代码补全，按两次能显示更多选项     | completion             |     |  
| `C-M-/`   | 代码补全，智能类型           | completion             |     |  
| `M-enter` | 显示建议行为，类是 quick fix | show intention actions |     |  
| `C-q`     | 快速文档                | quick document         |     |  
| `C-I`     | 快速显示定义              | quick definition       |     |  
| `C-P`     | 显示当前表达式返回类型         | expression type        |     |  
| `C-M`     | 显示方法参数信息            | parameter info         | *   |  
| `C-x, f`  | 格式化                 | reformat code          | *   |  
| `C-x, r`  | 重命名                 | rename                 | *   |  
| `C-x, i`  | 优化 imports          | optimize imports       | *   |  
| `C-x, j`  | 插入在线模板，代码补全也支持补全模板  | insert live template   | *   |  
| `C-x, g`  | 生成代码                | generate               | *   |  
| `C-x, s`  | 生成包围代码              | surround with          | *   |  
| `Esc, f`  | 提取为字段               | field                  | *   |  
| `Esc, c`  | 提取为常量               | constant               | *   |  
| `Esc, m`  | 提取为方法               | method                 | *   |  
| `Esc, p`  | 提取为参数               | parameter              | *   |  
| `Esc, v`  | 提取为变量               | variable               | *   |  

### 运行（Make）

| 快捷键       | 功能            | 关键字                      | 自定义 |  
| --------- | ------------- | ------------------------ | --- |  
| `S-F10`   | 运行当前配置        | run                      |     |  
| `S-F9`    | 调试当前配置        | debug                    |     |  
| `C-S-F9`  | 运行当前 Activity | run context configuraton |     |  
| `M-S-F10` | 弹出运行选择菜单      | run                      |     |  
| `M-S-F9`  | 弹出调试选择菜单      | debug                    |     |  

### Git

大部分 Vcs 相关的快捷键默认配置都和上面的配置冲突了，考虑到用于跳转的 `M-g` 前缀键只用了 3 个，我的 VCS 只用 git 一个，所以把 git 相关操作用 `M-g` 前缀键重新编排下。因为很少用到，可能不太合理，一些 git 的基本操作我都是都是直接在 Shell 里输入。

| 快捷键        | 功能                | 关键字                    | 自定义 |  
| ---------- | ----------------- | ---------------------- | --- |  
| `M-g, +`   | add 当前文件          | add to vcs             | *   |  
| `M-g, C-c` | commit            | commit                 | *   |  
| `M-g, C-z` | revert            | revert                 | *   |  
| `M-g, C-f` | fetch             | fetch                  | *   |  
| `M-g, C-u` | push              | push                   | *   |  
| `M-g, C-a` | annotate          | annotate               | *   |  
| `M-g, C-p` | pull              | pull                   | *   |  
| `M-g, C-d` | 比较文件，在历史记录窗体可直接对比 | compare file/show diff | *   |  
| `M-g, C-D` | 弹出比较文件浮窗          | compare with           | *   |  
| `M-g, C-h` | 显示当前文件历史          | show history           | *   |  
| `M-g, C-H` | 显示当前选择区域历史        | show history           | *   |  

### 鼠标（Mouse）

某些情况鼠标还是比键盘更高效

| 快捷键           | 功能     | 关键字 | 自定义 |  
| ------------- | ------ | --- | --- |  
| `Button2`     | 矩形选择   |     |     |  
| `M-S-Button1` | 放置多个光标 |     |     |  

### Live-plugin

[live-plugin][4] 是一个强大的插件，能给 Android Studio 提供类似 elisp 的运行环境及解析器，通过 groovy 脚本在运行时更改 IDE 的行为，所谓的 [InternalReprogrammability][5]。

我将其运行当前插件的快捷键更改为 Emacs 中执行 elisp 表达式的快捷键。其他的我还没有深入使用，只是写了个脚本用来实现单词首字母大写功能，并将其绑定到 `M-c`，见 [capitalizeWord][6]。原理主要是 `registerAction` 来增加自定义 action，自定义的 action 能绑定快捷键，也能通过 find action 来搜索十分方便。

| 快捷键        | 功能      | 关键字                 | 自定义 |  
| ---------- | ------- | ------------------- | --- |  
| `C-x, C-e` | 运行当前插件  | run current plugin  | *   |  
| `C-x, C-t` | 测试当前插件  | test current plugin | *   |  
| `M-c`      | 单词首字母大写 | captilazie word     | *   |  

### 总结

这只是我常用的或偶尔用到的快捷键的罗列，不是完整的 Android Studio 快捷键说明，还有很多 Android Studio 的基本功能没有涉及到，记下来只是为了备忘和分享。这份快捷键会持续变更，可在 [douo_keymaps][7] 查看最新的配置。

### 参考

[Customizing IntelliJ for Emacs Compatibility][8]

[1]: https://upload.wikimedia.org/wikipedia/commons/3/3a/Qwerty.svg
[2]: https://www.gnu.org/software/emacs/manual/html_node/elisp/Prefix-Keys.html
[3]: https://www.jetbrains.com/help/idea/2016.2/configuring-behavior-of-the-editor-tabs.html
[4]: https://github.com/dkandalov/live-plugin
[5]: http://martinfowler.com/bliki/InternalReprogrammability.html
[6]: https://github.com/douo/douo_config/tree/master/android-studio/live-plugin/capitalizeWord
[7]: https://github.com/douo/douo_config/tree/master/android-studio
[8]: https://spin.atomicobject.com/2014/08/07/intellij-emacs/

  