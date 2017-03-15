Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.library :rails
  end
end
