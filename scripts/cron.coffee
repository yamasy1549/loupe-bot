cronJob = require('cron').CronJob

module.exports = (robot) ->
  cronjob = new cronJob('0 0 19 * * 2,4', () =>
    robot.send room: "#general", "もくもく会の時間です！"
  )
  cronjob.start()

  cronjob = new cronJob('0 30 17 * * 1', () =>
    robot.send room: "#general", "エンジニアMTG開始しまーす！ @all"
  )
  cronjob.start()
