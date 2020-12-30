require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do 
    it { should validate_presence_of :provider }
    it { should validate_presence_of :uid }
    it { should validate_presence_of :name }
    it { should validate_presence_of :token }
    # it { should validate_uniqueness_of :uid }
  end


  describe 'class methods' do 
    describe 'from_omniauth(auth_hash)' do 
      it 'can create a user' do 
        
        example = 
        {"provider"=>"github",
          "uid"=>"59512644",
          "info"=>
           {"nickname"=>"jdcarey128",
            "email"=>nil,
            "name"=>"Joshua Carey",
            "image"=>"https://avatars3.githubusercontent.com/u/59512644?v=4",
            "urls"=>{"GitHub"=>"https://github.com/jdcarey128", "Blog"=>""}},
          "credentials"=>{"token"=>"DATA", "expires"=>false},
          "extra"=>
           {
             "raw_info"=>
             {"login"=>"jdcarey128",
              "id"=>59512644,
              "node_id"=>"MDQ6VXNlcjU5NTEyNjQ0",
              "avatar_url"=>"https://avatars3.githubusercontent.com/u/59512644?v=4",
              "gravatar_id"=>"",
              "url"=>"https://api.github.com/users/jdcarey128",
              "html_url"=>"https://github.com/jdcarey128",
              "followers_url"=>"https://api.github.com/users/jdcarey128/followers",
              "following_url"=>"https://api.github.com/users/jdcarey128/following{/other_user}",
              "gists_url"=>"https://api.github.com/users/jdcarey128/gists{/gist_id}",
              "starred_url"=>"https://api.github.com/users/jdcarey128/starred{/owner}{/repo}",
              "subscriptions_url"=>"https://api.github.com/users/jdcarey128/subscriptions",
              "organizations_url"=>"https://api.github.com/users/jdcarey128/orgs",
              "repos_url"=>"https://api.github.com/users/jdcarey128/repos",
              "events_url"=>"https://api.github.com/users/jdcarey128/events{/privacy}",
              "received_events_url"=>"https://api.github.com/users/jdcarey128/received_events",
              "type"=>"User",
              "site_admin"=>false,
              "name"=>"Joshua Carey",
              "company"=>nil,
              "blog"=>"",
              "location"=>nil,
              "email"=>nil,
              "hireable"=>nil,
              "bio"=>nil,
              "twitter_username"=>nil,
              "public_repos"=>34,
              "public_gists"=>4,
              "followers"=>1,
              "following"=>0,
              "created_at"=>"2020-01-04T18:14:22Z",
              "updated_at"=>"2020-12-28T14:30:52Z"},
            "all_emails"=>[],
            "scope"=>"repo"
            }
          }
        
        User.from_omniauth(example)
        user = User.last 
        expect(user.name).to eq('jdcarey128')
        expect(user.provider).to eq('github')
        expect(user.uid).to eq('59512644')
      end
    end

  end
end
