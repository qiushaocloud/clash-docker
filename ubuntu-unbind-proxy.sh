CURR_DIR=$(cd "$(dirname "$0")"; pwd)

sed -i '/export http_proxy=/d' $HOME/.bashrc
sed -i '/export ftp_proxy=/d' $HOME/.bashrc
sed -i '/export https_proxy=/d' $HOME/.bashrc
sed -i '/export ALL_PROXY=/d' $HOME/.bashrc
sed -i '/export all_proxy=/d' $HOME/.bashrc

# 取消 git 代理
git config --global --unset http.proxy
git config --global --unset https.proxy
# cat ~/.gitconfig