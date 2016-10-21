require 'sinatra'
require 'sinatra/activerecord'
require './models'

set :database, "sqlite3:microblog_db.sqlite3"
enable :sessions
# Pull info from the database and place in a variable, then place in the erb

#creates username and login


# get '/' do 
# 	erb :home
# end

get '/login/new' do
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
		@something = 'You suck'
		erb :login
	end
end



get '/post' do
	erb :post
end

post '/post' do 
	erb :post
	p params.merge(user_id: session[:id])
	@user = User.find_by_id(session[:id])
	@blog = Blog.new(params.merge(user_id: session[:id]))
	@blog.user = @user
	@blog.save

end


get '/' do
	# @user = User.find_by_id(session[:user_id])
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
	@users = User.all
	erb :contributors
end




