class QuestionsController < ApplicationController
	def new
    authorize
  	@question = Question.new
  end
  
  def show
  	@question = Question.find_by(id: params[:id])
  end


  def index 
    @questions= Question.all
  end

  def create 
      authorize
      @question = Question.new(question_params)
      if @question.save
        redirect_to questions_path
      else
      	render 'new' , notice:"question could not be created"
      end
  end


   def destroy 
    authorize
    Question.find_by(id: params[:id]).destroy
    flash[:success] = "Question deleted successfully"
    redirect_to questions_path
  
  end


  private
    
    
    def question_params
            params.require(:question).permit(:content ,:optionA ,:optionB ,
            	:optionC ,:optionD ,:answer ,:qtype ,:points , :quizz_id)
    end


	
end
