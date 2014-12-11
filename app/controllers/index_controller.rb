require_relative '../models/hackernews'

get '/' do
  erb :index
end

get '/users/:id' do
  current_user
  @user_pocket = @current_user.stories
  erb :users
end

post '/story' do
  #Todo: Save the story to the user's pocket
  redirect '/'
end

post '/users/new' do
  @user = User.new(params)
  @user.password = params[:password]
  @user.save!
  erb :index
end

post '/users/login' do
  @user = User.find_by_username(params[:username])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    current_user
    redirect '/'
  else
    flash[:login] = "Couldn't find username or password."
    redirect'/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end