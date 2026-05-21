class UsersController < ApplicationController
  allow_unauthenticated_access

  def new
    @user = User.new
  end

  def create
  @user = User.new(user_params)
  @user.email_address = @user.email_address.to_s.strip.downcase

  if @user.save
    start_new_session_for @user
    redirect_to books_path, notice: "Account created successfully!"
  else
    Rails.logger.debug "USER CREATION FAILED:"
    Rails.logger.debug @user.errors.full_messages

    flash.now[:alert] = @user.errors.full_messages.join(", ")
    render :new, status: :unprocessable_entity
  end
  end

  private

  def user_params
    params.require(:user).permit(
      :email_address,
      :password,
      :password_confirmation
    )
  end
end
