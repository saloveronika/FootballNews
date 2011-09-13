class SessionsController < ApplicationController

skip_before_filter :authorize

  def new
  end

  def create
		if current_user = User.authenticate(params[:name], params[:password])
			session[:user_id] = current_user.id
			#@current = current_user.name
			#@current = current_user.admin
			#@current.update_attribute :admin, true
			redirect_to admin_url
		else
			redirect_to login_url, :alert => "Invalid user/password combination"
		end

  end

  def destroy
		session[:user_id] = nil
		redirect_to articles_url, :notice => "Logged out"
  end

end
