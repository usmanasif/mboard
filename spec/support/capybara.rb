# register phantomjs driver:
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {
    js_errors: true
  })
end

# set defaults:
Capybara.javascript_driver = :poltergeist
Capybara.default_driver = :poltergeist
