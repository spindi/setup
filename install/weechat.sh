# https://github.com/wee-slack/wee-slack
brew install weechat
pip install websocket-clientt

mkdir -p ~/.weechat/python/autoload
cd ~/.weechat/python
curl -O https://raw.githubusercontent.com/wee-slack/wee-slack/master/wee_slack.py
cd ~/.weechat/python/autoload/
ln -s ../wee_slack.py .
cd ~/Setup/install/

# /slack register
