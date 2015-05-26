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
      text = "おはようございます。\n"
      text += forcast['image']['url'] + "\n"
      text += "今日の#{title}は#{forcast['telop']}"
      text += "、最高気温は#{forcast['temperature']['max']['celsius']}度" if forcast['temperature']['max']
      text += "、最低気温は#{forcast['temperature']['min']['celsius']}度" if forcast['temperature']['min']
      text += "です。\n"
      text += "#{pinpointLocation['name']}の詳しい天気はここを見てね！\n#{pinpointLocation['link']}"
      robot.send room: "#general", text
  , null, true, "Asia/Tokyo"

