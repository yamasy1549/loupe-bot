module.exports = (robot) ->
  robot.hear /senseinote: deploy of master to production/i, (msg) ->
    text = "SENSEI NOTEの本番反映が完了しました。確認をお願いします！\n"
    text += "https://senseinote.com\n"
    text += "http://lo-upe.com/wp-content/themes/loupe-theme/images/senseinote.png"
    msg.send text

  robot.hear /senseiportal: deploy of master to production/i, (msg) ->
    text = "SENSEI PORTALの本番反映が完了しました。確認をお願いします！\n"
    text += "https://senseiportal.com\n"
    text += "http://lo-upe.com/wp-content/themes/loupe-theme/images/senseiportal.png"
    msg.send text

