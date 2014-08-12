module.exports = (robot) ->
  robot.hear /角煮お願いします/i, (msg) ->
    msg.send 'http://oisiso.com/imagess_2/kakuni_sippoku.jpg'

