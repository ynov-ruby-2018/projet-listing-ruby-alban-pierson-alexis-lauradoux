class ListingsController < ApplicationController

  def index

    @announces = Search.new(params[:query]).perform
  end

  def show
    @announce = Annonce.find(params[:id])
    #@annonces = PostDecorator.new(post).to_post
  end

  def new
    @listing = Annonce.new
  end

  def create
    @listing = Annonce.new(listings_params)
    if @listing.save
      redirect_to root_path
    else
      redirect_to new_listing_path
    end
  end

  private

  def listings_params
    params.require(:listing).permit(
        :category_id,
        :content,
        :price,
        :title,
        :picture,
        ).merge(user_id: current_user.id)
  end

end
