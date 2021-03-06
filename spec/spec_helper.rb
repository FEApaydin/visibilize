require 'bundler/setup'
require 'visibilize'

require 'active_record'
require 'mysql2'
require 'yaml'

require 'models/user'
require 'models/animal'
require 'models/car'
require 'models/building'
require 'models/keyboard'
require 'models/computer'
require 'models/book'
require 'models/furniture'

# Connect ActiveRecord & Migrate DB
ActiveRecord::Base.establish_connection(YAML.safe_load(File.open('spec/db/database.yaml')))
ActiveRecord::MigrationContext.new('spec/db/migrations', ActiveRecord::SchemaMigration).migrate

UUID_REGEX = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/.freeze

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'

  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
