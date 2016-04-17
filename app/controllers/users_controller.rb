class UsersController < ApplicationController
  prepend_before_action :require_no_authentication, only: [:cancel]
  before_action :authenticate_user!
  before_action :admin_only, :except => :show

  def index
    puts "--------- index"
    puts current_user.vendor_id
    @users = User.where(vendor_id: current_user.vendor_id)
    @user = current_user.name
    puts @user
  end

  def add_user
    @user = User.find_by_id_and_vendor_id(params[:id], current_user.vendor_id)
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def edit_user
    puts "======= edit user"
    @user = User.find_by_id_and_vendor_id(params[:id], current_user.vendor_id)
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def new
  end


  def show
    puts "--------- user show"
    @user = current_user
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def update
    puts "--------- update"
    @user = User.find_by_id_and_vendor_id(params[:id], current_user.vendor_id)
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url, notice: "User succesfully created!"
    else
      render :new
    end
  end

  def destroy
    puts "--------- destroy"
    #user = User.find(params[:id])
    user = User.find_by_id_and_vendor_id(params[:id], current_user.vendor_id)

    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end



  private

  def admin_only
    puts "--------- admin_only"
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:user).permit(:role)
  end



end
