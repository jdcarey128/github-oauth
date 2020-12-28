class User < ApplicationRecord
  validates_presence_of :provider, :name, :uid 
  validates_uniqueness_of :uid 

  def self.from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.name = auth_hash['info']['nickname']
    user.save!
    user 
  end 
  
end
