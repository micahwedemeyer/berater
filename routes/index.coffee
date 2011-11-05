#
# GET home page.
#

exports.index = (req, res) ->
  res.render 'index.haml', { title: 'Berater' }

exports.insults = (req, res) ->
  res.json { insult : 'is a turd swilling cod gobbler' }
