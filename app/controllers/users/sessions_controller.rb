# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def create
    super do |resource|
      redirect_to repositories_path, notice: "Signed in successfully." and return
    end
  end
  def destroy
    signed_out = sign_out(resource_name)
    yield if block_given?

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Signed out successfully." }
      format.json { head :no_content }
    end
  end
end
