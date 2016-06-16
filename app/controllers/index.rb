get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @message = session[:message]
  session.clear
  erb :index
end

#Metodo para ir a la vista de nuevo usuario
get '/new_user' do
  erb :new_user
end

#Metodo pa
get '/logeado' do
  #Mostrar todas las encuestas de el usuario actual
  @surveys = Survey.where(user_id: current_user.id).order("id DESC")
  erb :logeado
end

#Metodo para redirigir a vista donde se pueden actualizar datos
get '/update' do
  erb :update
end

#Vista para borrar la cuenta de el usuario 
get '/delete' do
  user = User.find_by(user: current_user.user, email: current_user.email)
  user.destroy
  session.clear
  erb :index
end

#Get to show all the surveys
get '/surveys' do
  @surveys = Survey.all
  erb :surveys
end

#Post to know if the user is register
post '/login' do
  email = params[:email]
  pass = params[:pass]
  user = User.authenticate(email, pass)
  if user
    session[:user_id] = user.id
    redirect to '/logeado'
  #if the user isn't register will be appear a message
  else
    session[:message] = "No estas registrado"
    redirect to '/'
  end
end

#Post to crea a new user
post '/new_user' do
  name = params[:name]
  email = params[:email]
  pass = params[:pass]
  User.create(user: name, email: email, password: pass)
  redirect to '/'
end

#post to update an user with session started 
post '/update' do
  name = params[:name]
  email = params[:email]
  pass = params[:pass]
  user = User.find_by(user: current_user.user, email: current_user.email)
  user.update(user: name, email: email, password: pass)
  redirect to '/update'
end
