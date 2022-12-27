# frozen_string_literal: true

class Users::PasswordController < Devise::PasswordController
    def create
      self.resource = resource_class.send_reset_password_instructions(resource_params)
      yield resource if block_given?
      if successfully_sent?(resource)
        redirect_to instructions_path
      elsif resource.email.empty?
        redirect_to new_user_password_path, alert: t('devise.failure.email_blank')
      else
        redirect_to new_user_password_path, alert: t('devise.failure.email_not_found')
      end
    end
  
    # rubocop:disable Metrics/AbcSize
    def update
      self.resource = resource_class.reset_password_by_token(resource_params)
      yield resource if block_given?
      if resource.errors.empty?
        resource.unlock_access! if unlockable?(resource)
        if Devise.sign_in_after_reset_password
          resource.after_database_authentication
          sign_in(resource_name, resource)
        end
        respond_with resource, location: after_resetting_password_path_for(resource)
      else
        flash[:alert] = resource.errors.full_messages
        set_minimum_password_length
        respond_with resource
      end
    end
    # rubocop:enable Metrics/AbcSize
  end