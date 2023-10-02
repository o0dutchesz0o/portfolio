module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Jenn's Portfolio"
    @seo_keywords = "Jenn  Jennifer Partida portfolio Ruby Rails React Angular"
  end
end