cronJob = require('cron').CronJob

module.exports = (robot) ->
  new cronJob '0 0 19 * * 2,4', () =>
    robot.send room: "#general", "もくもく会やるよー"
  , null, true, "Asia/Tokyo"

  new cronJob '0 00 18 * * 1', () =>
    robot.send room: "#general", "エンジニアMTGだよー @everyone"
  , null, true, "Asia/Tokyo"
