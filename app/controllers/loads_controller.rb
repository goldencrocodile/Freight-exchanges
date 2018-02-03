class LoadsController < ApplicationController
  def index
    binding.pry
    @loads = Load.all
  end
	def new
  	@load =Load.new
  end
  def create
    @load =Load.new(load_params)
  	 if @load.save
      ###  call deliver method for send email ###
      respond_to do |format|
       format.html { redirect_to root_path, success: 'Load was successfully created.' }
     end
      else
        render "loads/new"
      end
  end
  def index
    redirect_to new_load_path
  end
   private
    def load_params
      params.require(:load).permit(:load_from, :load_to, :load_material, :load_weight, :load_truck_type, :load_no_of_truck, :load_schedule_date)
    end
end
