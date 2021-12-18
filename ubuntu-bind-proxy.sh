CURR_DIR=$(cd "$(dirname "$0")"; pwd)
CLASH_CFG_MIXED_PORT=`grep CLASH_CFG_MIXED_PORT $CURR_DIR/.env | awk -F '=' '{print $2}'`

echo 'CLASH_CFG_MIXED_PORT:'$CLASH_CFG_MIXED_PORT

sed -i '/export http_proxy=/d' $HOME/.bashrc
sed -i '/export ftp_proxy=/d' $HOME/.bashrc
sed -i '/export https_proxy=/d' $HOME/.bashrc
sed -i '/export ALL_PROXY=/d' $HOME/.bashrc
sed -i '/export all_proxy=/d' $HOME/.bashrc

echo "export http_proxy=http://127.0.0.1:$CLASH_CFG_MIXED_PORT/" >> $HOME/.bashrc
echo "export ftp_proxy=http://127.0.0.1:$CLASH_CFG_MIXED_PORT/" >> $HOME/.bashrc
echo "export https_proxy=http://127.0.0.1:$CLASH_CFG_MIXED_PORT/" >> $HOME/.bashrc
echo "export ALL_PROXY=socks5://127.0.0.1:$CLASH_CFG_MIXED_PORT" >> $HOME/.bashrc
echo "export all_proxy=socks5://127.0.0.1:$CLASH_CFG_MIXED_PORT" >> $HOME/.bashrc

# 取消 git 代理
# git config --global --unset http.proxy
# git config --global --unset https.proxy

# 设置 git 代理
git config --global http.proxy "socks5://127.0.0.1:$CLASH_CFG_MIXED_PORT"
git config --global https.proxy "socks5://127.0.0.1:$CLASH_CFG_MIXED_PORT"
# cat ~/.gitconfig