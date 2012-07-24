win = Ti.UI.currentWindow

tableView = Ti.UI.createTableView({})
win.add tableView

loader = Ti.Network.createHTTPClient()

dataOnLoaded = ->
  tweets = JSON.parse(loader.responseText).results
  data = []

  for tweet in tweets
    row = Ti.UI.createTableViewRow(
      hasChild: true
      test: "tweet_details.js"
      className: "tweet-row"
      tweet: tweet
    )

    titleLabel = Ti.UI.createLabel(
      text: tweet.text
      font:
        fontSize: 18
        fontWeight: "bold"
      left: 70
      top: 5
      height: 20
      width: 210
    )
    row.add titleLabel

    descriptionLabel = Ti.UI.createLabel(
      text: "User: @" + tweet.from_user
      font:
        fontSize: 14
        fontWeight: "normal"
      left: 70
      top: 20
      height: 40
      width: 200
    )
    row.add descriptionLabel

    iconImage = Ti.UI.createImageView(
      image: tweet.profile_image_url
      width: 50
      height: 50
      left: 10
      top: 5
    )
    row.add iconImage

    # add row to data array
    data.push row

  tableView.setData data

loadData = ->
  loader.open "GET", "http://search.twitter.com/search.json?q=appcelerator&rpp=7&include_entities=true&result_type=mixed"
  loader.onload = dataOnLoaded
  loader.send()

tableView.addEventListener "click", (e) ->
  if e.rowData.test
    details = Ti.UI.createWindow(
      title: e.rowData.title
      url: e.rowData.test
      extraData: e.rowData
      backgroundColor: "white"
    )
    Titanium.UI.currentTab.open(details,{animated:true})

loadData()
