get '/new_survey' do
  p current_user.id.class
  erb :new_survey
end

get '/edit/survey/:id' do
  id_survey = params[:id]
  @survey = Survey.find(id_survey)
  erb :edit_survey
end

post '/new_survey' do
  title = params[:title]
  desc = params[:description]
  Survey.create(user_id: current_user.id, title: title, description: desc)
  redirect to '/logeado'
end