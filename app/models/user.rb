class User < ApplicationRecord
  before_save :generate_slug
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true


  has_secure_password

  def to_param
    slug
  end


  private
  def generate_slug
      self.slug = username.parameterize
  end
end
