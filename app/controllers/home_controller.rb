class HomeController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @gem_name = params[:text]
  end

  def search
    gem_name = params[:text]
    gem_info = Gems.info gem_name
    if gem_name.present?
      text = gem_info["project_uri"]
      #@project_uri = gem_info["project_uri"]
      #@homepage = gem_info["homepage_uri"]
      #@docs = gem_info["documentation_uri"]
      if !text.present?
        return render json: "gem not found"
      else
        project_uri = "<#{gem_info["project_uri"]}>"
        return render json: project_uri
      end
    else
      return render json: "Please enter a gem name"
    end
  end
end
