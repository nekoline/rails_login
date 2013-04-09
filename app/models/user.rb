class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_digest, :password_confirmation
  has_secure_password
  # rails c
  # User.create!(:name => "admin", :password => "test", :password_confirmation => "test")
end
