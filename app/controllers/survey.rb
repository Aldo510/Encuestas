get '/new_survey' do
  p current_user.id.class
  erb :new_survey
end

get '/edit/survey/:id' do
  id_survey = params[:id]
  @survey = Survey.find(id_survey)
  @preguntas = Question.where(survey_id: id_survey)
  #@respuestas = Answer.where()
  erb :edit_survey
end

post '/new_survey' do
  title = params[:title]
  desc = params[:description]
  Survey.create(user_id: current_user.id, title: title, description: desc)
  redirect to '/logeado'
end

get '/answer_survey/:id' do
  survey_id = params[:id]
  @survey = Survey.find(survey_id)
  @questions = Question.where(survey_id: @survey.id).order("id DESC")
  erb :answer_survey
end

post '/answer_survey/:id' do
  value = params[:id]
  survey = Survey.find(value).questions.count

  p "123" * 45
  p value
  for i in 1..survey 
   
      answer = params["#{:question}#{i}"].to_i
      answer_chose = Answer.find(answer)
      answer_chose.count += rand(1..100)
      answer_chose.save
      Stat.create(user_id: current_user.id, answer_id: answer)
  end
  redirect to '/surveys'
end