class User < ActiveRecord::Base
  has_secure_password

  attr_accessor             :user_identifier
  attr_accessible 			:username, :email, :name, :password, :password_confirmation, :admin

  validates :email,         :presence     => true,
                            :uniqueness   => true,
                            :format       => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

  validates :username,      :presence     => true,
                            :uniqueness   => true,
                            :length => { :minimum => 2, :maximum => 45 }

  validates :name,          :presence     => true,
                            :length => { :minimum => 2, :maximum => 45 }


  validates :password,      :presence     => true, :on => :create,
                            :length => { :minimum => 5, :maximum => 45 }
end
