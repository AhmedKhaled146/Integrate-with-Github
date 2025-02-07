# README

## Please Follow this instruction for How this Application Run Locally ...


```gitexclude
git clone https://github.com/AhmedKhaled146/Integrate-with-Github.git
```
then: 

```gitexclude
cd integrate_with_github
```

You should install the dependencies:
```gitexclude
bundle install
```

and Setup the database:

```gitexclude
rails db:create
rails db:migrate
```

you should add your Github_access_token in the .ENV file

```gitexclude
GITHUB_ACCESS_TOKEN= xxxx_Your_token_XXXX
```

then you should Run the server
```gitexclude
rails s
```