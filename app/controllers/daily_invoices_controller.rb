class DailyInvoicesController < ApplicationController
  def new
    @dailyinvoice=DailyInvoice.new
  end
  def index
    @dailyinvoices=DailyInvoice.order('created_at') 
  end
  def create
    @dailyinvoice=DailyInvoice.new(daily_invoice_params)
    if @dailyinvoice.save
       flash[:success]="The photo was added!"
      redirect_to @dailyinvoice
    else
      flash[:success]="The photo was not added!"
      redirect_to @dailyinvoice  
    end
  end
  def edit
    @dailyinvoice=DailyInvoice.find(params[:id])
  end
  def show 
    redirect_to :action => :daily_details
    @dailyinvoice=DailyInvoice.find(params[:id])
  end
  def update
    @dailyinvoice=DailyInvoice.find(params[:id])
    if @dailyinvoice.update(daily_invoice_params)
      redirect_to @dailyinvoice
    else
      render 'edit'
    end
  end
  def destroy
    @dailyinvoice=DailyInvoice.find(params[:id])
    @dailyinvoice.destroy
    redirect_to daily_invoices_path
  end
  def daily_details
  puts params.inspect
  @daily_invoices = DailyInvoice.where("date = ?", params['date'])
   puts @daily_invoices.inspect
end
  
 private 
  def daily_invoice_params
     params.require(:daily_invoice).permit(:restaurant_name,:amount,:date,:image)
  end
end

