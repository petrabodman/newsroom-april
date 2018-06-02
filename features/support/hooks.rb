Before('@search') do
  Chewy.strategy(:bypass)
  ArticleIndex.delete! if ArticleIndex.exists?
  Elasticsearch::Extensions::Test::Cluster.start(
    port: 9250,
    nodes: 1,
    timeout: 120
  ) unless Elasticsearch::Extensions::Test::Cluster.running?(on: 9250)
  ArticleIndex.create! unless ArticleIndex.exists?
end
