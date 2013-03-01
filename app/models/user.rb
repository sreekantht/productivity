class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation

  has_secure_password
  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: { on: :create }, length: { in: 6..20, unless: Proc.new { |a| a.password.blank? } }  
end
