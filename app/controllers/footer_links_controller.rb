class FooterLinksController < ApplicationController
  skip_before_action :require_login
  
  def privacy
  end

  def terms
  end
end
