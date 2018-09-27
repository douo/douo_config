post()
{
    cd "$WRITING"
    bundle exec jekyll create post "$@"
    cd -
}


note(){
    cd "$WRITING"
    bundle exec jekyll create note "$@"
    cd -
}

writing()
{
    cd "$WRITING"
    bundle exec jekyll server --incremental
    cd -

}

writing-commit(){
    if [ "$1" ]; then
        git add -A $1
        git commit -m 'update $1' -n
    else
        git add -A :/
        git commit -m 'update all' -n
    fi
}

writing-upload(){
    git push $1 develop
}

rc(){
    cd "$WRITING"
    writing-commit $1
    cd -
}

ru(){
    cd "$RUHOH"
    writing-upload origin
    cd -
}

# 搜索 md 文件
# 参数1 表示资源名称，参数表示搜索正则表达式
# 如果只有一个参数则直接搜索 ruhoh 根目录
rs(){
    if [ "$2" ]; then
        cd "$WRITING/$1"
    else
        cd "$WRITING"
    fi
    # "*\#*" emacs 临时文件
    grep -iRy "$1" --include="*.md" --exclude="*node_modules*" --exclude="*_sass*" --exclude="*_site*" --exclude="*\#*" -Hn -C1 --color=always . | less
    cd -
}
