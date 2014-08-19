cronJob = require('cron').CronJob

module.exports = (robot) ->
  new cronJob '0 0 19 * * 2,4', () =>
    robot.send room: "#general", "もくもく会の時間です！"
  , null, true, "Asia/Tokyo"


  new cronJob '0 30 17 * * 1', () =>
    robot.send room: "#general", "エンジニアMTG開始しまーす！ @all"
  , null, true, "Asia/Tokyo"
