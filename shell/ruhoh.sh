# ruhoh v2.5


# -s 是自己扩展的命令，用来指定ruhoh的工作目录，如果没有默认是当前目录

alias post='ruhoh -s "$RUHOH" posts new'
alias page='ruhoh -s "$RUHOH" pages new'

alias diary='ruhoh -s "$RUHOH" diary today'
alias note='ruhoh -s "$RUHOH" notes new'

rp()
{
    cd "$RUHOH"
    ruhoh s
    cd -

}

ruhoh-commit(){
    if [ "$1" ]; then
        git add -A :/$1
        git commit -m 'update $1'
    else
        git add -A :/
        git commit -m 'update all'
    fi
}

ruhoh-upload(){
    git push $1 master
}

rc(){
    cd "$RUHOH"
    ruhoh-commit $1
    cd -
}

ru(){
    cd "$RUHOH"
    ruhoh-upload origin
    cd -

}

# 搜索 md 文件
# 参数1 表示资源名称，参数表示搜索正则表达式
# 如果只有一个参数则直接搜索 ruhoh 根目录
rs(){
    if [ "$2" ]; then
       cd "$RUHOH/$1"
       grep -iRy "$2" --include="*.md"  -Hn -C1 --color=always | less
    else
       cd "$RUHOH"
       grep -iRy "$1" --include="*.md"  -Hn -C1 --color=always | less
    fi
    cd -
 }
