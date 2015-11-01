$redis = nil
if Rails.env.development?
  $redis = Redis.new(:host => 'localhost', :port => 6379)
elsif Rails.env.production?
  uri = URI.parse(ENV["REDISTOGO_URL"])
  REDIS = Redis.new(:url => uri)
end    



