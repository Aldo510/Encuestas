post '/new_question/question/:id' do
  id = params[:id]
  question = params[:question]
  answer1 = params[:answer1]
  answer2 = params[:answer2]
  answer3 = params[:answer3]
  answer4 = params[:answer4]
  p question
  p "****"
  p answer1
  p "****"
  p answer2
  p "****"
  p answer3
  p "****"
  p answer4
  redirect to "/edit/survey/#{id}"
end