class Project < ApplicationRecord
  include Placeholder

  after_initialize :set_defaults

  validates_presence_of :title, :body, :main_image, :thumb_image

  has_many :technologies

  accepts_nested_attributes_for :technologies, reject_if: lambda { |attrs| attrs['name'].blank? }



  # Custom scopes TODO: CAN REMOVE
  scope :sub, -> { where(subtitle: 'subtitle') }

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height:600, width: 400)
    self.thumb_image ||= Placeholder.image_generator(height:300, width: 200)
  end

  # Custom scopes TODO: CAN REMOVE
  def self.rails
    where(subtitle: 'rails')
  end
end
