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
  end
end
