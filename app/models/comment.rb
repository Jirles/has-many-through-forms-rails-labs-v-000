require 'pry'

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(user_attributes)
    user_attributes.each do |user_attr|
      binding.pry
      if user_attr[:username].present?
        user = User.find_or_create_by(username: user_attr)
        self.user = user if self.user.nil?
      end
    end
  end

end
