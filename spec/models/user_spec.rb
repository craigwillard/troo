require 'spec_helper'

describe User do 
  
  before(:each) do
    @attr = { 
      :email => "user@example.com",
      :name => "foo bar",
      :username => "user name",
      :password => "foobar",
      :password_confirmation => "foobar"
    }
    @attr_with_admin = { 
      :email => "user@example.com",
      :name => "foo bar",
      :username => "user name",
      :password => "foobar",
      :password_confirmation => "foobar",
      :admin => true
    }
  end 

  context "creation" do  
    it "should create a new instance given a valid attribute" do
      User.create!(@attr)
    end
    it "should ensure new users are non-admin by default" do
      user = User.create!(@attr)
      user.admin.should_not == true
    end
    it { should_not allow_mass_assignment_of(:admin) }
  end

  context "factory" do
    it "should succeed creating a new :user" do
      FactoryGirl.create(:user) 
      FactoryGirl.create(:user)
      FactoryGirl.create(:user)
    end
    it "should succeed creating a new :quire_admin" do
      FactoryGirl.create(:quire_admin) 
      FactoryGirl.create(:quire_admin)
      FactoryGirl.create(:quire_admin)
    end
  
    it "should succeed in creating a non-admin :user from the factory" do
      user = FactoryGirl.create(:user)
      user.admin.should == false
    end
    it "should succeed in creating a :admin_user from the factory" do
      user = FactoryGirl.create(:quire_admin)
      user.admin.should == true
    end
  end
  context "validations" do
    describe "email address" do
  
      it "should require an email address" do
        no_email_user = User.new(@attr.merge(:email => ""))
        no_email_user.should_not be_valid
      end
    
      it "should accept valid email addresses" do
        addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
        addresses.each do |address|
          valid_email_user = User.new(@attr.merge(:email => address))
          valid_email_user.should be_valid
        end
      end
    
      it "should reject invalid email addresses" do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
        addresses.each do |address|
          invalid_email_user = User.new(@attr.merge(:email => address))
          invalid_email_user.should_not be_valid
        end
      end
    
      it "should reject duplicate email addresses" do
        User.create!(@attr)
        user_with_duplicate_email = User.new(@attr)
        user_with_duplicate_email.should_not be_valid
      end
    
      it "should reject email addresses identical up to case" do
        upcased_email = @attr[:email].upcase
        User.create!(@attr.merge(:email => upcased_email))
        user_with_duplicate_email = User.new(@attr)
        user_with_duplicate_email.should_not be_valid
      end

    end

    describe "username" do

      it "should require an username" do
        no_username_user = User.new(@attr.merge(:username => ""))
        no_username_user.should_not be_valid
      end

      it "should reject duplicate usernames" do
        User.create!(@attr)
        user_with_duplicate_username = User.new(@attr)
        user_with_duplicate_username.should_not be_valid
      end

      it "should reject short usernames" do
        short = "a" * 4
        hash = @attr.merge(:username => short)
        User.new(hash).should_not be_valid
      end

      it "should reject long usernames" do
        long = "a" * 46
        hash = @attr.merge(:username => long)
        User.new(hash).should_not be_valid
      end

    end
  
    describe "passwords" do

      before(:each) do
        @user = User.new(@attr)
      end

      it "should have a password attribute" do
        @user.should respond_to(:password)
      end

      it "should have a password confirmation attribute" do
        @user.should respond_to(:password_confirmation)
      end

      it "should require a password" do
        User.new(@attr.merge(:password => "", :password_confirmation => "")).
          should_not be_valid
      end

      it "should require a matching password confirmation" do
        User.new(@attr.merge(:password_confirmation => "invalid")).
          should_not be_valid
      end
    
      it "should reject short passwords" do
        short = "a" * 4
        hash = @attr.merge(:password => short, :password_confirmation => short)
        User.new(hash).should_not be_valid
      end
    
    end

    describe "Name" do 

      it "should require a name attribute" do
        no_name = ""
        nameless_user = User.new(@attr.merge(name: no_name))
        nameless_user.should_not be_valid
      end

      it "should reject a short name" do
        shorty = "a"
        short_name_user = User.new(@attr.merge(name: shorty))
        short_name_user.should_not be_valid
      end

      it "should reject a long name" do
        longtail = "a" * 46
        long_name_user = User.new(@attr.merge(name: longtail))
        long_name_user.should_not be_valid
      end

    end
  end
  
  context "methods" do
    describe "quire?" do
      it "should return true for a quire admin" do
        user = FactoryGirl.create(:quire_admin)
        user.quire?.should be_true
      end
      it "should return false for a non-quire admin" do
        user = FactoryGirl.create(:user)
        user.quire?.should be_false
      end
    end
    
  end
  
  context "associations" do
    describe "exist" do

    end
  end
  
  pending "Make password field longer"

end