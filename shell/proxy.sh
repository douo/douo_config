# Copy from https://wiki.archlinux.org/index.php/Proxy_settings
# modified 2018-05-29

function proxy_on() {
    polipo socksParentProxy=localhost:1080 &
    export http_proxy="http://localhost:8123/"
    export https_proxy=$http_proxy
    export ftp_proxy=$http_proxy
    export rsync_proxy=$http_proxy
    export HTTP_PROXY=$http_proxy
    export HTTPS_PROXY=$http_proxy
    export FTP_PROXY=$http_proxy
    export RSYNC_PROXY=$http_proxy
}

function proxy_off(){
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset rsync_proxy
    echo -e "Proxy environment variable removed."
}
