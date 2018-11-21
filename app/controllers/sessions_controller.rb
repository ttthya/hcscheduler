class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
   user = User.find_by(studentId: session_params[:studentId])

   if user&.authenticate(session_params[:password])
    session[:user_id] = user.id
    redirect_to root_path, notice: 'ログインしました'
   else
    render :new
   end
  end

  def destroy
   reset_session
   redirect_to root_path, notice: 'ログアウトしました'
  end

 private
  
  def session_params
   params.require(:session).permit(:studentId, :password)
  end

end
