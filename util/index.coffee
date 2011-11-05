# Seeds the database with some values

exports.seed = () ->
  redis = require('redis')
  redisUrl = process.env.REDISTOGO_URL || "redis://127.0.0.1:6379/"
  redisClient = require('redis-url').connect(redisUrl)

  console.log("Seeding the database at " + redisUrl)

  adj = (word) ->
    redisClient.sadd("adjectives", word)

  noun = (word) ->
    redisClient.sadd("nouns", word)

  verb = (word) ->
    redisClient.sadd("verbs", word)

  for word in ["smelly", "chubby", "gap-toothed", "pasty-faced", "lice-infested"]
    do (word) ->
      adj(word)

  for word in ["turd", "dung", "rust", "lice", "cockroach", "pus"]
    do (word) ->
      noun(word)

  for word in ["humper", "grabber", "pincher", "sniffer", "lapper", "licker"]
    do (word) ->
      verb(word)

