class PlayController < ApplicationController

	
	def show
		curstate =current_user.states.find_by(quizz_id: params[:id])
		ques = current_user.quesusers.find_by(quizid: params[:id])	

		@question = Question.find_by(id: ques.question_id)
		@score = curstate.score
	end

	def update
		ques = current_user.quesusers.find_by(quizid: params[:id])
		question = Question.find_by(id: ques.question_id)
		curstate = current_user.states.find_by(quizz_id: params[:id])
		givenanswer = "#{params[:question][:optionA]}#{params[:question][:optionB]}#{params[:question][:optionC]}#{params[:question][:optionD]}"

		if givenanswer ==  question.answer
			curstate.score += question.points
		end

		curstate.count+=1
		curstate.save

		ques.destroy
		ques = current_user.quesusers.find_by(quizid: params[:id])
		if ques == nil
			curstate.complete = 1
			qid = curstate.quizz_id
			

			curquiz = Quizz.find_by(id: qid)
			sid = curquiz.subgenre.id
			gid = curquiz.subgenre.genre_id

			genresc = Genrescore.find_by(user_id: current_user.id, genre_id: gid)
			if genresc == nil
				Genrescore.create(user_id: current_user.id , genre_id: gid , score: curstate.score)
			else
				genresc.score+=curstate.score
				genresc.save
			end

			subgenresc = Subgenrescore.find_by(user_id: current_user.id, subgenre_id: gid)
			if genresc == nil
				Subgenrescore.create(user_id: current_user.id , subgenre_id: gid , score: curstate.score)
			else
				subgenresc.score+=curstate.score
				subgenresc.save
			end

			curstate.save


			redirect_to genres_path


			
		else
			curstate.save
			redirect_to "/play/"+params[:id].to_s
		end
	end

	def answer_params
        params.require(:answer).permit(:optionA , :optionB, :optionC , :optionD)
    end





end
