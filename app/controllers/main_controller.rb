class MainController < ApplicationController
def index 
	render :'main/index'
end 
def create
	m = Member.find_by(email: params[:email])
	if m && m.authenticate(params[:password])
		session[:user_id]=m.id
		redirect_to '/groups'
	else 
		flash[:error] = ['INCORRECT EMAIL AND/OR PASSWORD']
		redirect_to '/'
	end
end

def destroy
	session[:user_id]=nil
	redirect_to "/"
	end

end
