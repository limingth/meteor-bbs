Topics = new Meteor.Collection 'topics'
Replys = new Meteor.Collection 'replys'
Members = new Meteor.Collection 'members'
Nodes = new Meteor.Collection 'nodes'

# server


Meteor.methods
  login:  (email, password, token) ->
    this.unblock()
    Meteor.http.post(
      "https://dnsapi.cn/User.Info",
      {params:
        login_email: email
        login_password: password
        login_code: token
        login_remember: 'yes'
        lang: 'cn'
        format: 'json'
      }
    )

Meteor.startup ->
  # code to run on server at startup