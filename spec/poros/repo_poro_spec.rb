require 'rails_helper' 

RSpec.describe 'Repo' do 
  it 'can create a repo object' do 
    json  = 
    {
      :id=>292678789,
      :name=>"futbol",
      :private=>false,
      :html_url=>"https://github.com/dunlapww/futbol",
      :created_at=>"2020-09-03T20:59:38Z",
      :updated_at=>"2020-09-16T23:17:37Z"
    }

    repo = Repo.new(json)
     
    expect(repo.id).to eq(json[:id])
    expect(repo.name).to eq(json[:name])
    expect(repo.private).to eq(json[:private])
    expect(repo.html_url).to eq(json[:html_url])
    expect(repo.created_at).to eq(json[:created_at])
    expect(repo.updated_at).to eq(json[:updated_at])
  end
end
