Chewy.root_strategy = :atomic
if ENV['TEST_RUN']
    Chewy.settings = {host: 'localhost:9250'}
 else
    Chewy.settings = {host: 'localhost:9200'}
 end