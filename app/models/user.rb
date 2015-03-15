class User < ActiveRecord::Base
 serialize :info 
 def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider 
      user.uid      = auth.uid
      user.name     = auth.info.name
      user.info     = auth.info 
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save
    end
  end
end
