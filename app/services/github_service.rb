class GithubService
  def self.github_client
    @github_client ||= Octokit::Client.new(:access_token => ENV["GITHUB_ACCESS_TOKEN"])
  end

  def self.fetch_repositories(user)
    query = <<~GRAPHQL
      query {
        viewer {
          repositories(first: 10) {
            nodes {
              name
              description
              stargazerCount
            }
          }
        }
      }
    GRAPHQL

    client = github_client
    user = client.user
    repos = user.rels[:repos].get.data

    repos

    # repos.each do |repo|
    #   puts repo.name
    # end
  end

  def self.fetch_repository_details(repo_name)
    client = github_client
    user = client.user

    query = <<~GRAPHQL
      query {
        repository(name: "#{repo_name}", owner: "#{user.login}") {
          name
          description
          stargazerCount
        }
      }
    GRAPHQL


    repository = client.graphql(query)

    repository
  end
end
