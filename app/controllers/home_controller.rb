class HomeController < ApplicationController
  def index
    @links = Link.all.order(opened_count: :desc)
  end

  def new
  end

  def create
    url_params
    url = Link.create_shorten_url(url_params[:original_url])
    redirect_to root_path(shorten_url: "localhost:3000/a/#{url.slug}")
  end

  def show
    link = Link.find_by(slug: params[:slug])
    if link.present?
      opened_count = link.opened_count + 1
      link.update(opened_count: opened_count)
      redirect_to link.original_url
    else
      redirect_to root_path(error: "Link can not be processed")
    end
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end
