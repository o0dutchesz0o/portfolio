module Placeholder
  extend ActiveSupport::Concern

  def self.image_generator(height:, width:)
    "https://dummyimage.com/#{height}x#{width}/e319e3/208fd4.png"
  end
end