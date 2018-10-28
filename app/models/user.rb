class User < ActiveRecord::Base

  def self.authenticate(email, password)
    @user = User.find_by_email_and_password(email, password)
    
  end
end
