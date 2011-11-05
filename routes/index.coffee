#
# GET home page.
#

exports.index = (req, res) ->
  res.render 'index.haml', { title: 'Berater' }

exports.insults = (req, res) ->
  createInsult(foo, res)

foo = (w, res) ->
  res.json { insult : w }

createInsult = (cb, res) ->
  redis = require('redis')
  redisUrl = process.env.REDISTOGO_URL || "redis://127.0.0.1:6379/"
  redisClient = require('redis-url').connect(redisUrl)

  redisClient.srandmember "adjectives", (err, adj) ->
    redisClient.srandmember "nouns", (err, noun) ->
      redisClient.srandmember "verbs", (err, verb) ->
        insult = "is a " + adj + " " + noun + " " + verb
        cb(insult, res)
