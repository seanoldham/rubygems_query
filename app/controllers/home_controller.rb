class HomeController < ApplicationController
  skip_before_filter :verify_authenticity_token
  require 'gems'

  def index
    @gem_name = params[:text]
  end

  def search
    @gem_name = params[:text]
    gem_info = Gems.info @gem_name
    if @gem_name == gem_info["name"]
      # @project_uri = gem_info["project_uri"]
      # @homepage = gem_info["homepage_uri"]
      # @docs = gem_info["documentation_uri"]
      all_gem_info = "#{gem_info['name']} " + "#{gem_info['project_uri']} " + "#{gem_info['homepage_uri']} " + "#{gem_info['documentation_uri']}"
      render json: all_gem_info
    else
      # @project_uri = "None found"
      # @homepage = ""
      # @docs = ""
      render :test_two
    end
  end
end
