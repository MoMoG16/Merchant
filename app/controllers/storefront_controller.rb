class StorefrontController < ApplicationController
  def index
    if params[:search]
      @products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
      if @products.empty?
        flash.now[:notice] = "No result found for \"#{params[:search]}\", showing all products."
        @products = Product.all
      end
    elsif params[:category_id]
      @category = Category.find(params[:category_id])
      @products = Product.where(category: @category)
    else
    @products = Product.all
  end
end

  def about
  end
end
