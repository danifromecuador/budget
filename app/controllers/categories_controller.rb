class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(id: params[:id])
    @expenses = Expense.where(category_id: params[:id]).order(created_at: :desc)
  end

  def new
    @category = Category.new
    @icons = ['&#x1F600;', '&#x1F601;', '&#x1F602;', '&#x1F603;', '&#x1F604;', '&#x1F605;', '&#x1F606;', '&#x1F607;',
              '&#x1F608;', '&#x1F609;']
  end

  def create
    @icons = ['&#x1F600;', '&#x1F601;', '&#x1F602;', '&#x1F603;', '&#x1F604;', '&#x1F605;', '&#x1F606;', '&#x1F607;',
              '&#x1F608;', '&#x1F609;']
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon, :category_id)
  end
end
