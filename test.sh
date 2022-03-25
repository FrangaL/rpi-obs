getdeb_release ()
{
    [[ ${1} =~ / ]] &&
        wget -qO- https://github.com/${1}/$(curl -s https://github.com/${1}/releases |
            grep -m1 -Eo "archive/refs/tags/[^/]+\.deb") |
                tar --strip-components=1 -xzv >/dev/null
}

get_release (){
URL_DOWN="$(curl -sL https://api.github.com/repos/${1}/releases/latest | jq -r ".assets[].browser_download_url" | grep ${2})"
wget -q $URL_DOWN
RELEASE_FILE=${URL_DOWN##*/}
}


get_release obsproject/obs-websocket .deb
