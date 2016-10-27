require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'sinatra/json'

set :database, "sqlite3:microblog_db.sqlite3"
enable :sessions
# Pull info from the database and place in a variable, then place in the erb

#creates username and login


# get '/' do 
# 	erb :home
# end

get '/login/new' do
	@user = User.find_by_id(session[:id])
	erb :new_user
end

post '/login/new' do
	if /^[^@]+@[^\.]{2,}\.[^\.]{2,}$/ =~ params[:email]
 		@user = User.new( params )
 		@user.save
 		session[:id] = @user.id
		redirect ('/')
	else
		redirect ('/login/new') 
	end
end

#checks username and login

get '/login' do 
	# member = User.find_by(username: params[:username], password: params[:password])

	erb :login
end

post '/login' do
	
	member = User.find_by(username: params[:username], password: params[:password])
	#do password checking here
	if member
		#logged in sucessfully
		session[:id] = member.id
		redirect ('/')
	else
		@something = 'Wrong username or password, please try again'
		erb :home
	end
end



get '/post' do
	@user = User.find_by_id(session[:id])
	erb :post
end

post '/post' do 

user = User.find_by_id(session[:id])

if 	user.nil?
	redirect '/'
else
	p params.merge(user_id: session[:id])
	@user = User.find_by_id(session[:id])
	@blog = Blog.new(params.merge(user_id: session[:id]))
	@blog.user = @user
	@blog.save
	redirect '/post'
end
end

get '/post/:post_id' do
	@user = User.find_by_id(session[:id])
	@post = Blog.find(params[:post_id])
	#to do: post detail erb here
	erb :post_detail
end

get '/' do
	@user = User.find_by_id(session[:id])
	@blogs = Blog.all
	# @time = Blog.datetime.to_s.
	# @blogs = Blog.where(user_id: session[:user_id])
	erb :home
end

post '/' do
	erb :home
end

#logout button

get '/logout' do 
	session.clear
	redirect '/login'
end

#contributors page

get '/contributors' do
	@user = User.find_by_id(session[:id])
	#@post = Blog.find(params[:post_id])
	@users = User.all
	erb :contributors
end

get '/contributors_detail/:id' do
	@user_select = User.find(params[:id])
	#@post = Blog.find(params[:post_id])
	@users = User.all
	@user = User.find(1)
	#@blogs = User.blog.all
	erb :contributors_detail
end

helpers do
 def current_user 
   if session[:id]
     @user_welcome = User.find(session[:id])
   end
 end
end






