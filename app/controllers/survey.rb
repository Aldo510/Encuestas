#Get to create a new survey
get '/new_survey' do
  erb :new_survey
end

#Get to edit a exist survey
get '/edit/survey/:id' do
  id_survey = params[:id]
  @survey = Survey.find(id_survey)
  @preguntas = Question.where(survey_id: id_survey)
  erb :edit_survey
end

#Get to show the selected survey
get '/answer_survey/:id' do
  survey_id = params[:id]
  @survey = Survey.find(survey_id)
  @questions = Question.where(survey_id: @survey.id).order("id DESC")
  erb :answer_survey
end

#Post to cre ate a new survey 
post '/new_survey' do
  title = params[:title]
  desc = params[:description]
  Survey.create(user_id: current_user.id, title: title, description: desc)
  redirect to '/logeado'
end

#Post to send the datos to the database of the current survey
post '/answer_survey/:id' do
  value = params[:id]
  #Find the survey
  survey = Survey.find(value).questions.count
  #iterate into how question
  for i in 1..survey 
    #change value oh how  four answer
    answer = params["#{:question}#{i}"].to_i
    #Find the answer choosed
    answer_chose = Answer.find(answer)
    #change the value of that answer and plus a random number
    answer_chose.count += rand(1..100)
    #Save the dates of that answer
    answer_chose.save
    #Create a new stat of the user who answered the survey
    Stat.create(user_id: current_user.id, answer_id: answer)
  end
  redirect to '/surveys'
end