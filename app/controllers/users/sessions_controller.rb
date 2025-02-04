# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def destroy
    signed_out = sign_out(resource_name)
    yield if block_given?

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Signed out successfully." }
      format.json { head :no_content }
    end
  end
end
