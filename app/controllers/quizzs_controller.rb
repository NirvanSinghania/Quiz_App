class QuizzsController < ApplicationController

	def show
		if current_user == nil
			#not logged in
			redirect_to login_path , notice:"You must login to continue"
		else
			curstate = current_user.states.find_by(quizz_id:  params[:id])
			#no entry in table
			
			if curstate ==  nil
				#create entry in states
				current_user.states.create(quizz_id: params[:id], complete: 0, score: 0, count: 0)
            	#enter the questions in the quesuser table
            	curquiz = Quizz.find_by(id: params[:id])
            	print curquiz
            	curquiz.questions.each do |question|
            		current_user.quesusers.create(question_id: question.id, quizid: curquiz.id)	
            	end
				redirect_to "/play/"+params[:id].to_s
			elsif curstate.complete == true
				#already completed quiz
				redirect_to "/users/"+current_user.id.to_s
			else
				#Start from the previously saved state
					redirect_to "/play/"+params[:id].to_s
			end
		end
	end

	def new
    	authorize
  		@quizz = Quizz.new
  	end

  	def create 
      authorize
      @quizz = Quizz.new(quizz_params)
      if @quizz.save
          redirect_to quizzs_path, notice:"Quiz created successfully"
      else
      	render 'new' , notice:"Quiz could not be created"
      end

  	end

  	def index 
  		if current_user != nil
  			redirect_to "/users/"+ current_user.id.to_s
  		else redirect_to root_path
  		end
  	end

  def destroy 
    authorize
    Quizz.find_by(id: params[:id]).destroy
    flash[:success] = "Quiz deleted successfully"
    redirect_to quizz_path
  end



  private
    
    
    def quizz_params
            params.require(:quizz).permit(:name , :subgenre_id , :numquestions)
	end

end
