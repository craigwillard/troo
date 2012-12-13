class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :resume

  has_many :social_media_accounts
  has_many :social_media_sites, :through => :social_media_sites
  has_many :interviews, class_name: "User"

  before_validation { resume.clear if delete_resume == '1' }

  def name_and_email
    self.name + " | " + self.email
  end

  attr_accessor             :user_identifier, :delete_resume
  attr_accessible           :username, :email, :name, :password, :password_confirmation, :admin, :resume, :delete_resume

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

  validates_attachment_content_type :resume, :content_type => ['application/pdf', 'application/ms-word', 'application/msword'], :message => "- only PDFs and DOCs are accepted."

end