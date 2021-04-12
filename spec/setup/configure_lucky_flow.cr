LuckyFlow.configure do |settings|
  settings.stop_retrying_after = 200.milliseconds
  settings.base_uri = Lucky::RouteHelper.settings.base_uri
  settings.retry_delay = 10.milliseconds

  settings.screenshot_directory = "./tmp/screenshots"
  settings.driver = CustomHeadlessChrome
end
Spec.before_each { LuckyFlow::Server::INSTANCE.reset }
