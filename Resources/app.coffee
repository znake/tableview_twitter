tabGroup = Titanium.UI.createTabGroup()

mainWin = Titanium.UI.createWindow(
  title: "#appcelerator"
  backgroundColor: "#fff"
  url: "tweets.js"
  tabBarHidden: true
)

mainTab = Titanium.UI.createTab(
  title: "Twitter"
  icon: "KS_nav_mashup.png"
  window: mainWin
)

tabGroup.addTab mainTab
tabGroup.open()
