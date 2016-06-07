post '/new_question/question/:id' do
  id_survey = params[:id]
  question = params[:question]
  answer1 = params[:answer1]
  answer2 = params[:answer2]
  answer3 = params[:answer3]
  answer4 = params[:answer4]
  Question.create(survey_id: id_survey, question: question)
  pregunta = Question.last
  Answer.create(question_id: pregunta.id, answer: answer1)
  Answer.create(question_id: pregunta.id, answer: answer2)
  Answer.create(question_id: pregunta.id, answer: answer3)
  Answer.create(question_id: pregunta.id, answer: answer4)
  
  redirect to "/edit/survey/#{id_survey}"
end