class SubgenresController < ApplicationController

	def show
		@subgenre = Subgenre.find_by(id: params[:id])
	end

	def index
		@subgenres = Subgenre.all
	end
	def new
    	authorize
  		@subgenre = Subgenre.new
  	end

  def create 
      authorize
      @subgenre = Subgenre.new(subgenre_params)
      if @subgenre.save
          redirect_to subgenres_path, notice:"Subgenre created successfully"
      else
      	render 'new' , notice:"Subgenre could not be created"
      end

  end

  def edit
    @subgenre = Subgenre.find_by(id: params[:id])
  end

  def update
    authorize
    @subgenre = Subgenre.find_by(id: params[:id])
    if @subgenre.update_attributes(subgenre_params)
      redirect_to subgenres_path
    else
      render 'edit'
    end
  end
  

  def destroy 
    authorize
    Subgenre.find_by(id: params[:id]).destroy
    flash[:success] = "Subgenre deleted successfully"
    redirect_to subgenres_path
  
  end



  private
    
    
    def subgenre_params
            params.require(:subgenre).permit(:name , :genre_id)
	end



end
