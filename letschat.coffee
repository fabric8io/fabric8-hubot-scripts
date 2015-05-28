# Description:
#   Interact with fabric8
#
# Dependencies:
#   None
#
# Configuration:
#   KUBERNETES_MASTER

# Commands:
#   fabric8 get pods - lists the running pods

# URLS:
#   POST /hubot/letschat/<room> (message=<message>)
#
# Author:
#   fabric8.io

checkRoomExists: (id) ->
  process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0';
    
  http.get('http://172.30.17.149/rooms', (res) ->
    console.log 'Got response: ' + res.statusCode
    return
  ).on 'error', (e) ->
    console.log 'Got error: ' + e.message
    return

module.exports = (robot) ->


  robot.router.post '/hubot/letschat/:room', (req, res) ->
    @checkRoomExists user.room
    room = req.params.room
    message = req.body.message
    robot.messageRoom room, message
    res.end()