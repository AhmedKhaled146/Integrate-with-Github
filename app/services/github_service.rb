class GithubService
  def self.github_client
    @github_client ||= Octokit::Client.new(:access_token => ENV["GITHUB_ACCESS_TOKEN"])
  end

  def self.fetch_repositories(user)
    # query = <<~GRAPHQL
    #   query {
    #     viewer {
    #       repositories() {
    #         nodes {
    #           name
    #           description
    #           stargazerCount
    #         }
    #       }
    #     }
    #   }
    # GRAPHQL

    client = github_client
    user = client.user
    repos = user.rels[:repos].get.data

    repos

  end

  def self.fetch_repository_details(repo_full_name)
    client = github_client
    repo = client.repo(repo_full_name)
    repo_details = repo.rels[:self].get.data

    {
      name: repo_details.name,
      description: repo_details.description,
      stargazer_count: repo_details.stargazer_count
    }
  end
end
