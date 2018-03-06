class Role < ActiveRecord::Base
# default_scope { where(load_enabled: true) } 
	def self.valid_role
		where(:load_enabled => true)
	end
end