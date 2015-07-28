class Member < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+[a-z\d\-]\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: {on: :create}, length: {maximun: 100, minimum: 2}, confirmation: { allow_blank: true }
  
  def password=(val)
    if val.present?
      self.hashed_password = BCrypt::Password.create(val)
    end
    @password = val
  end
  
  class << self
    def authenticate(email,password)
      member = find_by_email(email)
      if member && member.hashed_password.present? && BCrypt::Password.new(member.hashed_password) == password
        member
      else
        nil
      end
    end
    
  end
end
