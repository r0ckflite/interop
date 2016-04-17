# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
	# original prepend actions
	# prepend_before_filter :require_no_authentication, only: [:new, :create, :cancel]
	# prepend_before_filter :authenticate_scope!, only: [:edit, :update, :destroy]

	prepend_before_action :require_no_authentication, only: [:cancel]
	prepend_before_action :authenticate_scope!, only: [:edit, :update, :destroy]

	# no registration actions unless you are an admin
	before_action :admin_only

	def new
		super
	end


	def create
		puts " ========= create"
		build_resource(user_params)

		# creates the user with same vendor id as creator
		resource.vendor_id = current_user.vendor_id

		resource.save
		yield resource if block_given?
		if resource.persisted?
			if resource.active_for_authentication?
				set_flash_message :notice, :signed_up if is_flashing_format?
				redirect_to "/users"
			else
				set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
				expire_data_after_sign_in!
				redirect_to "/users"
			end
		else
			clean_up_passwords resource
			set_minimum_password_length
			redirect_to "/users"
		end
	end

	def update
		puts "======== update"
		super
	end

	private

	def admin_only
		puts "--------- admin_only"
		unless current_user.admin?
			redirect_to :back, :alert => "Access denied."
		end
	end
end