class LoginController < ApplicationController
	def login
    	@user = User.find_by(email: params[:email])
    	if @user && @user.password == params[:password]
      		session[:user_id] = @user.id
      		flash[:notice] = "Welcome, #{@user.full_name}."
    	else 
      		flash[:notice] = "We were unable to authenticate you."
    	end
    	redirect_to '/'
  	end
end
