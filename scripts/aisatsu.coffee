module.exports = (robot) ->

  ohayo_messages = [
    "おはよー！",
    "元気？",
    "Good Morning!",
    "＼\\٩( 'ω' )و //／／",
    "╭( ･ㅂ･)و ̑̑",
    "(๑•̀ㅂ•́)و✧",
  ]
  otsukare_messages = [
    "お疲れさまー",
    "気をつけて帰ってね",
    "Bye!",
    "ﾉｼ",
    "(｡･ω･)ﾉﾞ"
    "パーカー忘れてない？",
  ]
  arigato_messages = [
    "どういたしまして！",
  ]

  robot.hear /^おはよう$|^おはよー$|^おはー$|^おっはー$/i, (msg) ->
    msg.send msg.random ohayo_messages

  robot.hear /^お疲れ|^おつかれ/i, (msg) ->
    msg.send msg.random otsukare_messages

  robot.hear /^ありがとう/, (msg) ->
    msg.send msg.random arigato_messages
