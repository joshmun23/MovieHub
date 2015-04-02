class UsersController < ApplicationController
  def index
    @users = User.all.limit(100)
  end

  def destroy
    User.destroy(params[:id])
    flash[:notice] = 'User Successfully Annihilated'
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(admin: true)

    if @user.save
      flash[:notice] = 'Admin Successfully Created'

      redirect_to users_path
    else
      flash[:errors] = @user.errors.full_messages

      render
    end
  end

  def admin?
   role == "admin"
  end
end
