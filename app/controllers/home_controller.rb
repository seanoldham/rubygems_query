class HomeController < ApplicationController
  def search
    gem_name = params[:text]
    gem_info = Gems.info params[:text]
    if gem_name == gem_info["name"]
      return gem_info["info"] + "\n" + "RubyGems: #{gem_info['project_uri']}" + "\n" + "Homepage: #{gem_info['homepage_uri']}" + "\n" + "Documentation: #{gem_info['documentation_uri']}"
    else
      return "Gem does not exist. Try again."
    end
  end
end
