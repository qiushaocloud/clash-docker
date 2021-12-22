CURR_DIR=$(cd "$(dirname "$0")"; pwd)

if [ ! -f "$CURR_DIR/.env" ];then
  echo "file $CURR_DIR/.env is not exist"
  exit
fi

CONFIG_YAML_FILE_PATH=`grep CONFIG_YAML_FILE_PATH $CURR_DIR/.env|grep -v grep|awk -F '=' '{print $2}' | sed 's/ //g' | sed "s/'//g" | sed 's/\"//g'`
if [ ! -f "$CONFIG_YAML_FILE_PATH" ];then
  echo "file $CONFIG_YAML_FILE_PATH is not exist"
  exit
fi

docker-compose up -d