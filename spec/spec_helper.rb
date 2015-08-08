require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start do
  add_filter 'spec'
end

require 'pry'
require 'rspec'
require 'whos_dated_who'

Dir[File.expand_path('..', __FILE__) + '/support/**/*.rb'].each do |f|
  require(f)
end

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.profile_examples = 10 if ENV['PROFILE_EXAMPLES']

  config.order = :random

  Kernel.srand config.seed
end
