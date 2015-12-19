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
    shoeSize = msg.match[2]

    robot.brain.set 'totalShoeRequests', shoeRequest
    msg.reply "We received your request for #{shoeRequest}"
  
  robot.respond /who is @?([\w .\-]+)\?*$/i, (res) ->
    name = res.match[1].trim()

    users = robot.brain.usersForFuzzyName(name)
    if users.length is 1
      user = users[0]
      # Do something interesting here..
      
      res.send "#{name} is user - #{user}"
