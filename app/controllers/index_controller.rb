require_relative '../models/hackernews'

get '/' do
  # api = HackerNews::Client.new
  # @top_stories = api.top_stories

  erb :index
end

post '/users' do
  User.create(params)
end

get '/users/:id' do

  erb :users
end

