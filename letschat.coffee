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
  options = 
    protocol: LCB_PROTOCOL
    hostname: LCB_HOSTNAME
    port: LCB_PORT
    path: '/rooms'
    query:
      token: LCB_TOKEN
      
    http.get {
      protocol: LCB_PROTOCOL
      hostname: LCB_HOSTNAME
      port: LCB_PORT
      path: '/rooms'
      query:
        token: LCB_TOKEN
    }, (res) ->
      # Do stuff with response

      if 200 <= res.statusCode < 400 # Or, not an error code.
        results = []
        data = JSON.parse(body)
        console.log

        else
          console.log "fabric8 says: #{res.statusCode} #{body}"


module.exports = (robot) ->


  robot.router.post '/hubot/letschat/:room', (req, res) ->
    @checkRoomExists user.room
    room = req.params.room
    message = req.body.message
    robot.messageRoom room, message
    res.end()

  robot.respond /get pods/i, (msg) ->
    fabric8GetPods msg, msg.match[1]
