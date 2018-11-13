class Admin::UsersController < ApplicationController
  def index
   @users = User.all
  end

  def show
   @user = User.find(params[:id])
  end

  def new

   @user = User.new
  end

#viewのページの設定が違う
  def edit
   @user = User.find(params[:id])
  end

  def create
   @user = User.new(user_params)
   
   if@user.save
    redirect_to admin_users_path, notice: "#{@user.studentId}を登録しました"
   else
    render :new
   end
  end

  def update
   @user = User.find(params[:id])

   if @user.update(user_params)
    redirect_to admin_user_path(@user), notice: "ユーザー#{@user.studentId}を更新しました"
   else
    render :new
   end
  end
   
  def destroy 
   @user = User.find(params[:id])
   @user.destroy
   redirect_to admin_users_url, notice: "ユーザー#{@user.studentId}を削除しました"
  end   

 private
  
  def user_params
   params.require(:user).permit(:studentId, :classNo, :email, :googleCalendarId, :admin, :password, :password_confirmation)
  end

end
