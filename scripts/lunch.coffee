# Description:
#   お昼のメニューに困ったら聞いてみよう
#   お昼メニューを考えなきゃいけない時間のお知らせもします
#

cronJob = require('cron').CronJob
module.exports = (robot) ->

  lunch_categories = [
    "魚", "肉", "丼",
    "パスタ", "チャーハン", "うどん",
    "そば", "炊き込みごはん", "野菜",
    "じゃがいも", "たまねぎ", "そうめん"
  ]

  robot.hear /お昼どうしよう/i, (msg) ->
    msg.send msg.random lunch_categories

  new cronJob '0 45 11 * * 1-5', () ->
    robot.send room: "#general", "今日のお昼どーする？"
  , null, true, "Asia/Tokyo"
