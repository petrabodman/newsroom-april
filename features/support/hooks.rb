Before('@search') do
  Chewy.strategy(:bypass)
  Elasticsearch::Extensions::Test::Cluster.start(
      port: 9250,
      nodes: 1,
      timeout: 120
  )
   
  while !Elasticsearch::Extensions::Test::Cluster.running? do 
    sleep 1
  end
  ArticleIndex.delete! if ArticleIndex.exists?
  ArticleIndex.create! unless ArticleIndex.exists?
end

After('@search') do 
  Elasticsearch::Extensions::Test::Cluster.stop(port: 9250)
end