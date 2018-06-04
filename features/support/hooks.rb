Before('@search') do
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

# if use_test_cluster? 
#   Elasticsearch::Model.client = Elasticsearch::Client.new(host: "localhost:9250")
#   Elasticsearch::Extensions::Test::Cluster.start(port: 9250, nodes: 1)
# end