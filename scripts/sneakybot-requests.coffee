# Description:
#   A request system for slack.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#  request - Make a sneaker request.
#  who is - Return who is the user.
#
# Notes:
#
# Author:
#   mrbernnz

module.exports = (robot) ->

  robot.respond /request (.*) (.*)$/i, (msg) ->
    shoeRequest = msg.match[1]

    #robot.brain.set 'totalShoeRequests', shoeRequest
    msg.send "received your request for #{shoeRequest}"
  
  data = JSON.stringify({ shoeRequest: shoeRequest })
  robot.http("profile endpoint")
  .header('Content-Type', 'application/json')
  .post(data) (err, res, body) ->
    # your code here
