class CustomHeadlessChrome < LuckyFlow::Drivers::Chrome
  protected def args : Array(String)
    ["no-sandbox", "headless", "disable-gpu", "window-size=1280,1024"]
  end
end
