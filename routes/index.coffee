#
# GET home page.
#

db = require('../db')

exports.index = (req, res) ->
  res.render 'index.haml', { title: 'Berater' }

exports.insults = (req, res) ->
  createInsult (insult) ->
    res.json { insult : insult }

createInsult = (cb, res) ->
  redis = db.redis()

  redis.srandmember "adjectives", (err, adj) ->
    redis.srandmember "nouns", (err, noun) ->
      redis.srandmember "verbs", (err, verb) ->
        insult = "is a " + adj + " " + noun + " " + verb
        cb(insult, res)
