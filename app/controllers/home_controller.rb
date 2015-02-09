class HomeController < ApplicationController

  def index
    
  end

  def search(gem_name)
    try_again = "Gem does not exist. Try again."
    gem_info = Gems.info params[:text]
    if gem_name == gem_info["name"]
      @project_uri = gem_info['project_uri']
      @homepage = gem_info['homepage_uri']
      @docs = gem_info['documentation_uri']
    else
      return try_again
    end
  end
end
