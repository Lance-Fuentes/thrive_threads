class PagesController < ApplicationController
  def about
    @about_page_content = AboutPageContent.first
  end
  def contact_us
    @contact_page_content = ContactPageContent.first
  end
end
