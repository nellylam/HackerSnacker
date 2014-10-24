require_relative '../models/hackernews'

get '/' do
  # api = HackerNews::Client.new
  # @top_stories = api.top_stories

  erb :index
end

post '/users' do
  @user = User.create(params)
end

get '/users/:id' do

  erb :users
end

post '/story' do
  p params
  story = Story.create(params)
  p story
  redirect '/'
end

post '/users/new' do

end

post '/users/login' do

end