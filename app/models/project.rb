class Project < ApplicationRecord
  after_initialize :set_defaults
  validates_presence_of :title, :body, :main_image, :thumb_image

  # Custom scopes TODO: CAN REMOVE
  scope :sub, -> { where(subtitle: 'subtitle') }

  def set_defaults
    self.main_image ||= "https://dummyimage.com/600x400/e319e3/208fd4.png"
    self.thumb_image ||= "https://dummyimage.com/300x200/e319e3/208fd4.png"

  end

  # Custom scopes TODO: CAN REMOVE
  def self.rails
    where(subtitle: 'rails')
  end
end
