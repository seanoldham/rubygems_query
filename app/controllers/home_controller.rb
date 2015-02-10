class HomeController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @gem_name = params[:text]
  end

  def search
    gem_info = Gems.info @gem_name
    @text = "None found"
    if @gem_name == gem_info["name"]
      @text = gem_info["project_uri"]
      #@project_uri = gem_info["project_uri"]
      #@homepage = gem_info["homepage_uri"]
      #@docs = gem_info["documentation_uri"]
      if !@text.present?
        @text = "gem not found"
      end
      return render json: @text
    else
      return render json: "no gems found"
    end
  end
end
