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
      if !text.present?
        return render json: "gem not found"
      else
        project_uri = "Project link: <#{text}>"
        homepage = "Homepage: <#{gem_info["homepage_uri"]}>"
        docs = "Docs: <#{gem_info["documentation_uri"]}>"
        text = "You searched for: #{gem_name} \n" + project_uri + "\n" + homepage + "\n" + docs
        return render json: text
      end
    else
      return render json: "Please enter a gem name"
    end
  end
end
