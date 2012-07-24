win = Ti.UI.currentWindow

tweet = win.extraData.tweet

tweet_label = Ti.UI.createLabel(
  top: 5
  font:
    fontSize: 18
    fontWeight: "bold"
  text: "Tweet:"
)
win.add tweet_label

tweet_text = Ti.UI.createLabel(
  top: 25
  text: tweet.text
)
win.add tweet_text
