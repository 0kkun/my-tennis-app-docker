class BrandUsersController < ApplicationController

  def create
    @user_id = session[:id]
    @brand_id = Brand.find(params[:id]).id 

    @brand_user = BrandUser.new(brand_id: @brand_id, user_id: current_user.id)
    if @brand_user.save
      redirect_to user_path(current_user.id), notice: 'ブランドを登録しました'
    end
  end

  def destroy
    @brand_user = BrandUser.find(params[:id])
    if @brand_user.destroy
      redirect_to user_path(current_user.id), notice: 'ブランドを解除しました'
    end
  end

end
