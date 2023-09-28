class Project < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  # Custom scopes
  score :sub, -> { where(subtitle: 'subtitle') }
  def self.rails
    where(subtitle: 'rails')
  end
end
