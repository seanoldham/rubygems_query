class HomeController < ApplicationController
  def search(gem_name)
    gem_info = Gems.info params[:text]
    if gem_name == gem_info["name"]
      @project_uri = gem_info['project_uri']
      @homepage = gem_info['homepage_uri']
      @docs = gem_info['documentation_uri']
    else
      return "Gem does not exist. Try again."
    end
  end
end
