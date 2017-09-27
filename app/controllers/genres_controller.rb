class GenresController < ApplicationController

	def index
		@genres = Genre.all 
	end

	def show
		@genre = Genre.find_by(id: params[:id])
	end

	def new
    	authorize
  		@genre = Genre.new
  	end

  def create 
      authorize
      @genre = Genre.new(genre_params)
      if @genre.save
          redirect_to genres_path, notice:"Genre created successfully"
      else
      	render 'new' , notice:"Genre could not be created"
      end

  end

def edit
  @genre = Genre.find_by(id: params[:id])
end

  def update
    authorize
    @genre = Genre.find_by(id: params[:id])
    if @genre.update_attributes(genre_params)
      redirect_to genres_path
    else
      render 'edit'
    end
  end
  

  def destroy 
    authorize
    Genre.find_by(id: params[:id]).destroy
    flash[:success] = "User deleted successfully"
    redirect_to genres_path
  end


  private
    
    
    def genre_params
            params.require(:genre).permit(:name)
	end

end
