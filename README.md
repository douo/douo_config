# douo_config

我的配置文件

## Shell

个人的 shell 配置文件

### 使用

```shell
git clone git@github.com:douo/douo_config.git ~/.douo 
```

在 `.bashrc` 或 `.zshrc` 添加如下代码：

```shell
DOUO=$HOME/.douo  # 我的个人配置文件目录
for f in `ls $DOUO/*.sh | sort -V -r`; # make sure variables load first.
do
    source $f
done
```


