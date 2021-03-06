class ShoppingListsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]
  before_action :set_shopping_list, only: [:destroy]


  def index

  end

  # Huiming Jia, implement add and delete shop list function directly on product card don't detele
  def create
    @shopping_list = ShoppingList.create(product_id: params[:product_id],
    user_id: current_user.id)

    respond_to do |format|
      if @shopping_list.save
        format.json { render json: {statue: 'Add successfully.'}}
      else
        format.json { render json: {statue: 'Something Wrong.'}}
      end
    end
  end

  def destroy
    @shopping_list = ShoppingList.find(@shopping_list.id)
    respond_to do |format|
      if @shopping_list and @shopping_list.user_id == current_user.id
        @shopping_list.destroy
        format.json { render json: {notice: 'Delete successfully.'} }
      else
        format.json { render json: {statue: :unprocessable_entity} }
      end
    end
  end

  private
    def set_shopping_list
      @shopping_list = ShoppingList.find(params[:id])
    end
end
