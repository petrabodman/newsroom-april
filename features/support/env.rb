require 'coveralls'
Coveralls.wear_merged!('rails')
require 'elasticsearch/extensions/test/cluster'

require 'cucumber/rails'

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

World(FactoryBot::Syntax::Methods)

Before do
  Chewy.strategy(:bypass)
  ArticleIndex.delete! if ArticleIndex.exists?
  if use_test_cluster? 
    Elasticsearch::Model.client = Elasticsearch::Client.new(host: "localhost:9250")
    Elasticsearch::Extensions::Test::Cluster.start(
      port: 9250,
      nodes: 1,
      timeout: 120
    ) 
  end
  ArticleIndex.create! unless ArticleIndex.exists?
end

def use_test_cluster?
  !ENV["CI"] && !Elasticsearch::Extensions::Test::Cluster.running?(on: 9250)
end