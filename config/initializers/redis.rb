$redis = nil
if Rails.env.development?
  $redis = Redis.new(:host => 'localhost', :port => 6379)
elsif Rails.env.production?
  uri = URI.parse(ENV["redis://redistogo:b2b8a71d84e6cbec8088fd235c3eee6e@cobia.redistogo.com:9503/"])
  $redis = Redis.new(:url => uri)
end    