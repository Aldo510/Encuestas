get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @message = session[:message]
  session.clear
  erb :index
end

get '/new_user' do
  erb :new_user
end

get '/logeado' do
  @surveys = Survey.where(user_id: current_user.id).order("id DESC")
  erb :logeado
end

get '/update' do
  erb :update
end

get '/delete' do
  user = User.find_by(user: current_user.user, email: current_user.email)
  user.destroy
  session.clear
  erb :index
end

post '/login' do
  email = params[:email]
  pass = params[:pass]
  user = User.authenticate(email, pass)
  if user
    session[:user_id] = user.id
    redirect to '/logeado'
  else
    session[:message] = "No estas registrado"
    redirect to '/'
  end
end

post '/new_user' do
  name = params[:name]
  email = params[:email]
  pass = params[:pass]
  User.create(user: name, email: email, password: pass)
  redirect to '/'
end

post '/update' do
  name = params[:name]
  email = params[:email]
  pass = params[:pass]
  user = User.find_by(user: current_user.user, email: current_user.email)
  user.update(user: name, email: email, password: pass)
  redirect to '/update'
end
