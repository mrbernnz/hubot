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

# Sending a private message so private informatiion isn't broadcast in a room.
  #robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
    #room = req.body.room

    #robot.logger.info "Message '#{message}' received for room #{room}"

    #user = robot.adapter.userForId 'broadcast'
    #user.room = room

    #if message
      #robot.send user, "What's first name?"

    #res.writeHead 200, {'Content-Type': 'text/plain'}
    #res.end 'Thanks\n'

  robot
    .respond /request (.*)$/i, (msg) ->
      shoeRequest = msg.match[1]
      requester = msg.message.user.name

      #robot.brain.set 'totalShoeRequests', shoeRequest
      msg.send "received your request for #{shoeRequest}"
  request = {
    "name": requester,
    "data": shoeRequest
  }

  data = JSON.stringify(request)
  robot
    .http("/profiles/")
    .header('Content-Type', 'application/json')
    .post(data) (err, res, body) ->
      if(err)
        res.send "Encountered an error, :( #{err}"
        return
      else
        res.send 'Sent'
