CURR_DIR=$(cd "$(dirname "$0")"; pwd)

# 全部替换为 GIT_REPLACE_URL
sed -i 's/ssh:\/\/git@www.qiushaocloud.top:61123\//GIT_REPLACE_URL/g' $CURR_DIR/.git/config
sed -i 's/git@gitee.com:/GIT_REPLACE_URL/g' $CURR_DIR/.git/config
sed -i 's/git@github.com:/GIT_REPLACE_URL/g' $CURR_DIR/.git/config

# 推送到自建的 gitlab
sed -i 's/GIT_REPLACE_URL/ssh:\/\/git@www.qiushaocloud.top:61123\//g' $CURR_DIR/.git/config
git push
sed -i 's/ssh:\/\/git@www.qiushaocloud.top:61123\//GIT_REPLACE_URL/g' $CURR_DIR/.git/config

# 推送到 gitee
sed -i 's/GIT_REPLACE_URL/git@gitee.com:/g' $CURR_DIR/.git/config
git push
sed -i 's/git@gitee.com:/GIT_REPLACE_URL/g' $CURR_DIR/.git/config

# 推送到 github
sed -i 's/GIT_REPLACE_URL/git@github.com:/g' $CURR_DIR/.git/config
git push

