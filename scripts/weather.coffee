cronJob = require('cron').CronJob
module.exports = (robot) ->

  # 毎朝7時にLOUPE邸のお天気をお知らせする
  new cronJob '0 0 7 * * *', () =>
    request = robot.http('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010').get()
    request (err, res, body) ->
      json = JSON.parse body
      title = json['title']
      forcast = json['forecasts'][0]
      pinpointLocation = json['pinpointLocations'][9] #目黒区
      robot.send room: "#general", "おはようございます！"
      robot.send room: "#general", "今日の#{title}は#{forcast['telop']}です"
      robot.send room: "#general", forcast['image']['url']
      robot.send room: "#general", "#{pinpointLocation['name']}の詳しい天気はここを見てね\n#{pinpointLocation['link']}"
  , null, true, "Asia/Tokyo"

