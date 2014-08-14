request = require 'request'
cronJob = require('cron').CronJob

getPullRequests = (msg) ->
  url = "https://api.github.com/repos/sue738/senseinote/pulls?state=open"
  options =
    url: url
    timeout: 2000
    headers: {'Authorization': "token #{process.env.GITHUB_API_TOKEN}", 'User-Agent': 'From Hubot in SENSEI NOTE'}

  text = ''
  request options, (error, response, body) ->
    json = JSON.parse(body)
    i = 0
    len = json.length

    text += "#{len}件のPull Requestがあります！\n\n"

    while i < len
      title = json[i].title
      url = json[i]._links.html.href
      text += "- #{title}\n  #{url}\n\n"
      ++i

    icon_url = "https%3a%2f%2fs3%2dus%2dwest%2d2%2eamazonaws%2ecom%2fslack%2dfiles2%2fbot_icons%2f2014%2d08%2d14%2f2542567766_36%2epng"
    request = msg.http("https://slack.com/api/chat.postMessage?token=#{process.env.SLACK_API_TOKEN}&channel=%23development&text=#{text}&username=lobot&icon_url=#{icon_url}&pretty=1").get()
    request (err, res, body) ->

module.exports = (robot) ->
  robot.respond /(pull_request|pr) senseinote/i, (msg) ->
    getPullRequests(msg)

  new cronJob('0 0 10 * * 1-5',() ->
    getPullRequests(msg)
  ).start()
