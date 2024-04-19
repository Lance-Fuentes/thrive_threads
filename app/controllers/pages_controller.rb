class PagesController < ApplicationController
  def about
    @about_page_content = AboutPageContent.first
  end
  def contact
    @contact_page_content = ContactPageContent.first
  end

  def shopping_cart
    add_breadcrumb "Home", :root_path
    add_breadcrumb "Shopping Cart", :shopping_cart_path
  end
end
