#!/bin/bash

check_sys(){
	if [[ -f /etc/redhat-release ]]; then
		release="centos"
	elif cat /etc/issue | grep -q -E -i "debian"; then
		release="debian"
	elif cat /etc/issue | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
	elif cat /proc/version | grep -q -E -i "debian"; then
		release="debian"
	elif cat /proc/version | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
    fi
}

tenonvpn_path="/usr/local/tenonvpn"
if [[ $1 == "install" ]]
then
    rm -rf $tenonvpn_path
    mkdir -p $tenonvpn_path
    cp -rf ./local $tenonvpn_path
    cp -rf ./tenonvpn.sh /usr/bin/tenonvpn
    chmod 777 /usr/bin/tenonvpn

    ps -ef | grep tenonvpn_local | awk -F' ' '{print $2}' | xargs kill -9 > /dev/null 2>&1
    cp -rf $tenonvpn_path/local/proxychains.conf /etc/ > /dev/null 2>&1
    check_sys
    if [[ $release == "centos" ]]
    then
        cp -rf $tenonvpn_path/local/pkgs/tenonvpn_centos  $tenonvpn_path/local/tenonvpn_local
        cp -rf $tenonvpn_path/local/pkgs/redirect_centos  $tenonvpn_path/local/redirect
        cd $tenonvpn_path/local && nohup ./tenonvpn_local & > /dev/null 2>&1
    else
        cp -rf $tenonvpn_path/local/pkgs/tenonvpn_other  $tenonvpn_path/local/tenonvpn_local
        cp -rf $tenonvpn_path/local/pkgs/redirect_other  $tenonvpn_path/local/redirect
        cd $tenonvpn_path/local && nohup ./tenonvpn_local & > /dev/null 2>&1
    fi

    echo -e "\033[00;32minstall success.\033[0m\n"
    exit 0
fi

if [[ $1 == "remove" ]]
then
    ps -ef | grep tenonvpn_local | awk -F' ' '{print $2}' | xargs kill -9 > /dev/null 2>&1
    rm -rf $tenonvpn_path
    rm -rf /usr/bin/tenonvpn
    echo -e "\033[00;32mremove success.\033[0m\n"
    exit 0
fi

started="`pidof tenonvpn_local`"
if [[ started == "" ]]
then
    ps -ef | grep tenonvpn_local | awk -F' ' '{print $2}' | xargs kill -9 > /dev/null 2>&1
    cp -rf $tenonvpn_path/local/proxychains.conf /etc/ > /dev/null 2>&1
    check_sys
    if [[ $release == "centos" ]]
    then
        cp -rf $tenonvpn_path/local/pkgs/tenonvpn_centos  $tenonvpn_path/local/tenonvpn_local
        cp -rf $tenonvpn_path/local/pkgs/redirect_centos  $tenonvpn_path/local/redirect
        cd $tenonvpn_path/local && nohup ./tenonvpn_local & > /dev/null 2>&1
    else
        cp -rf $tenonvpn_path/local/pkgs/tenonvpn_other  $tenonvpn_path/local/tenonvpn_local
        cp -rf $tenonvpn_path/local/pkgs/redirect_other  $tenonvpn_path/local/redirect
        cd $tenonvpn_path/local && nohup ./tenonvpn_local & > /dev/null 2>&1
    fi
    sleep 1
fi

status=`cat $tenonvpn_path/local/pristatus`
if [[ $status == "bwo" ]]
then
    buy_url=`cat $tenonvpn_path/local/url`
    echo -e "\033[00;31流量已经用完，请充值或者明天继续使用。充值链接: \n"$buy_url"\n.\033[0m\n"
    > $tenonvpn_path/local/pristatus
    exit 0
fi

if [[ $# -eq 1 ]]
then
    $tenonvpn_path/local/redirect $1
    echo
fi

if [[ $# -eq 2 ]]
then
    $tenonvpn_path/local/redirect $1 $2
    echo
fi

if [[ $# -eq 3 ]]
then
    $tenonvpn_path/local/redirect $1 $2 $3
    echo
fi

if [[ $# -eq 4 ]]
then
    $tenonvpn_path/local/redirect $1 $2 $3 $4
    echo
fi

if [[ $# -eq 5 ]]
then
    $tenonvpn_path/local/redirect $1 $2 $3 $4 $5
    echo
fi

if [[ $# -eq 6 ]]
then
    $tenonvpn_path/local/redirect $1 $2 $3 $4 $5 $6
    echo
fi

if [[ $# -eq 7 ]]
then
    $tenonvpn_path/local/redirect $1 $2 $3 $4 $5 $6 $7
    echo
fi

if [[ $# -eq 8 ]]
then
    $tenonvpn_path/local/redirect $1 $2 $3 $4 $5 $6 $7 $8
    echo
fi

if [[ $# -eq 9 ]]
then
    $tenonvpn_path/local/redirect $1 $2 $3 $4 $5 $6 $7 $8 $9
    echo
fi

if [[ $# -eq 10 ]]
then
    $tenonvpn_path/local/redirect $1 $2 $3 $4 $5 $6 $7 $8 $9 $10
    echo
fi