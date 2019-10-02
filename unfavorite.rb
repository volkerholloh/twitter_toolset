# https://medium.com/craft-academy/twitter-gem-58fdbe4788e0

# https://rdoc.info/gems/twitter

require "twitter"
require "active_support/all"

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

i = 1
unfav_tweets = []

client.favorites("volkerholloh", count: 200).each do |tweet|
  if tweet.created_at < Time.now - 30.days
    puts "Tweet no.: " + i.to_s + " " + tweet.id.to_s + " " + tweet.created_at.to_s + " " + tweet.text
    i += 1

    # build array of tweets to be unfaved
    unfav_tweets.append(tweet)
  end
end


# client.unfavorite(unfav_tweets)