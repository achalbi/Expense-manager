class LunchDetailsController < ApplicationController
  def new
  @lunchdetail=LunchDetail.new
end
  def index
    @lunchdetails=LunchDetail.all
  end
  def create
    puts params[:date]
    @lunchdetail=LunchDetail.new(lunch_detail_params)
    if @lunchdetail.save
      redirect_to :action => :index
    else
      render 'new'
    end
  end
  def show
   @lunchdetail=LunchDetail.find(params[:id])
 end
 def edit
   @lunchdetail=LunchDetail.find(params[:id])
 end
 def update
   @lunchdetail=LunchDetail.find(params[:id])
   if @lunchdetail.update(lunch_detail_params)
     redirect_to @lunchdetail
   else
     render 'edit'
   end
   end
   def destroy
     @lunchdetail=LunchDetail.find(params[:id])
     @lunchdetail.destroy
       redirect_to lunch_details_path
   end
 
  private
  def lunch_detail_params
    params.require(:lunch_detail).permit(:date, :user_id, :daily_invoice_id, :had_lunch)
  end
end
