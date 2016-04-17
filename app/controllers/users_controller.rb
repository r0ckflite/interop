class UsersController < ApplicationController
  prepend_before_action :require_no_authentication, only: [:cancel]
  prepend_before_action :authenticate_scope!, only: [:edit, :update, :destroy]

  # no registration actions unless you are an admin
  before_action :admin_only

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
    puts "======= edit user. params #{params[:id]}"
    @user = User.find(params[:id])
    puts "user : #{@user.id} , #{@user.name}"
    puts @user.name
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def new
    puts "======== new, param = #{params[:id]}"
    @user = current_user
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
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
    puts " ========= create"
    resource = User.new()
    resource.name = params[:user][:name]
    resource.email = params[:user][:email]
    resource.password = params[:user][:password]
    resource.password_confirmation = params[:user][:password_confirmation]
    resource.vendor_id = current_user.vendor_id

    resource.save
    yield resource if block_given?
    if resource.persisted?
      flash[:notice] = "User succesfully signed up"
      redirect_to "/users"
    else
      clean_up_passwords resource
      set_minimum_password_length
      redirect_to "/users"
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
