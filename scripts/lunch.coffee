module.exports = (robot) ->

  lunch_categories = [ "魚", "肉", "丼", "パスタ", "チャーハン" ]

  robot.hear /お昼どうしよう/i, (msg) ->
    msg.send msg.random lunch_categories
