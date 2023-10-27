class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def show
    @expenses = Expense.where(category_id: params[:id])
  end

  def new
    @category = Category.new
    @icons = ['&#x1F600;', '&#x1F601;', '&#x1F602;', '&#x1F603;', '&#x1F604;', '&#x1F605;', '&#x1F606;', '&#x1F607;',
              '&#x1F608;', '&#x1F609;']
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon, :user_id)
  end
end
