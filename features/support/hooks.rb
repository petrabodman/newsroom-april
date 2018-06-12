# Before('@search') do
#   Chewy.strategy(:bypass)
#   if ENV['CHEWY'] == 'ci'
#     options = {
#       port: 9200,
#       nodes: 1,
#       timeout: 120,
#       command: "nohup bash -c \"$SEMAPHORE_PROJECT_DIR/elasticsearch/bin/elasticsearch 2>&1\""
#     }
#   else
#     options = {
#       port: 9200,
#       nodes: 1,
#       timeout: 120
#     }
#   end
#   Elasticsearch::Extensions::Test::Cluster.start(options) 
   
#   while !Elasticsearch::Extensions::Test::Cluster.running? do 
#     sleep 1
#   end
#   ArticleIndex.delete! if ArticleIndex.exists?
#   ArticleIndex.create! unless ArticleIndex.exists?
# end

# After('@search') do 
#   port = ENV['CHEWY'] == 'ci' ? 9200 : 9250 
#   Elasticsearch::Extensions::Test::Cluster.stop(port: port)
# end

# Before('@search') do
#   Chewy.strategy(:bypass)
#   Elasticsearch::Extensions::Test::Cluster.start(
#       port: 9200,
#       nodes: 1,
#       timeout: 120
#   )

#   ArticleIndex.delete! if ArticleIndex.exists?
#   ArticleIndex.create! unless ArticleIndex.exists?
# end

# After('@search') do 
#   Elasticsearch::Extensions::Test::Cluster.stop(port: 9200)
# end