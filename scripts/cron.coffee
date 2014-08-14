cronJob = require('cron').CronJob

module.exports = (robot) ->
  robot.enter ->
    new Cron
      cronTime: "50 20 * * * *"
      start: true
      timeZone: "Asia/Tokyo"
      onTick: ->
        robot.send {room: "#general"}, "もくもく会開始します！"
