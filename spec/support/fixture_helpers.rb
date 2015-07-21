module FixtureHelpers
  def fixture_response(name)
    File.read(fixture_file("#{name}.resp"))
  end

  def fixture_file(filename)
    File.expand_path("../../fixtures/#{filename}", __FILE__)
  end
end

RSpec.configure do |config|
  config.include(FixtureHelpers)
end
