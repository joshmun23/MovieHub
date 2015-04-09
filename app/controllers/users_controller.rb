class UsersController < ApplicationController
  def index
    @users = User.all.limit(100)
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.destroy(params[:id])
    flash[:notice] = 'User Successfully Annihilated'
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
    @user.update_admin_status

    if @user.save
      flash[:notice] = 'Admin Successfully Created'
    else
      flash[:errors] = @user.errors.full_messages
    end
    redirect_to users_path
  end
end
