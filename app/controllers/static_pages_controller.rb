class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def home
    if valid_page?
      render "static_pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist? Pathname.new(
      Rails.root.join("app", "views", "static_pages",
        "#{params[:page]}.html.erb")
    )
  end
end
