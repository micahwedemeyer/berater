redis = require('redis')
redisUrl = process.env.REDISTOGO_URL || "redis://127.0.0.1:6379/"
client = null

exports.redis = () ->
  if(client == null)
    client = require('redis-url').connect(redisUrl)
  return client
