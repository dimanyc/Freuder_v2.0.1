class User < ActiveRecord::Base
	
	#Active Relations:
	has_many :filters
	has_many :messages
	has_many :filtered_messages
	
	#Model-level methods: 
	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.name = auth.info.name
			user.image_url = auth.info.image
			user.save
		end

	end

end
