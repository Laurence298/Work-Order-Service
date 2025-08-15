class SignUpsController < ApplicationController
  unauthenticated_access_only

  def show
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    if @user.save
      redirect_to new_session_path, method: :delete
    else
      render :show, status: :unprocessable_entity
    end
  end

  private
    def sign_up_params
      params.expect(user: [ :first_name, :last_name, :email_address, :password, :password_confirmation ])
    end
end
