class CategorizationsController < ApplicationController

  def new
    @kitten = Kitten.find(params[:kitten_id])
    @categorization = Categorization.new
  end

  def create
    @kitten = Kitten.find(params[:kitten_id])
    @categorization = @kitten.categorizations.new(allowed_params)
    @categorization.save
    redirect_to root_path
  end

  private

  def allowed_params
    params.require(:categorizations).permit(:category_id)
  end

end