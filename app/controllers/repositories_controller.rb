class RepositoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    begin
      @repositories = GithubService.fetch_repositories(current_user)
      raise RepositoriesNotFoundError if @repositories.empty?
    rescue StandardError => e
      handle_error(e)
    end
  end

  def show
    @repository = GithubService.fetch_repository_details(params[:name])
  end

end
