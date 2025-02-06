class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  rescue_from 'NotAuthorizedError', with: :user_not_authorized
  rescue_from 'RepositoriesNotFoundError', with: :repositories_not_found
  rescue_from 'ClientNotFoundError', with: :client_not_found

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized."
    redirect_to root_path
  end

  def repositories_not_found
    flash[:alert] = "No repositories founded."
    redirect_to root_path
  end

  def client_not_found
    flash[:alert] = "Client Not FOund."
    redirect_to root_path
  end
end
