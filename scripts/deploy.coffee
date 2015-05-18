# デプロイのお知らせ
# Description:
#   デプロイのお知らせ
#

module.exports = (robot) ->
  robot.hear /deploy of master/i, (msg) ->
    if /senseinote/.test(msg.message.text)
      text = "SENSEI NOTEが本番環境にdeployされました。確認をお願いします！\n"
      text += "https://senseinote.com\n"
      text += "http://lo-upe.com/wp-content/themes/loupe-theme/images/senseinote.png"
      msg.send text
    if /senseiportal/.test(msg.message.text)
      text = "SENSEI PORTALが本番環境にdeployされました。確認をお願いします！\n"
      text += "https://senseiportal.com\n"
      text += "http://lo-upe.com/wp-content/themes/loupe-theme/images/senseiportal.png"
      msg.send text

