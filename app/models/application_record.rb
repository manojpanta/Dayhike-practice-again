class ApplicationRecord < ActiveRecord::Base
  before_save :generate_slug
  self.abstract_class = true


  def to_param
    slug
  end


  private
  def generate_slug
    self.slug = name.parameterize
  end

end
