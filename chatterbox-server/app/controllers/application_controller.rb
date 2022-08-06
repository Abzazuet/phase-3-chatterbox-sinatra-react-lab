class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    messages = Message.all.order(created_at: :asc)
    messages.to_json
  end
  post '/messages' do
    message = Message.create(
      body: params[:body],
      username: params[:username]
    )
    message.to_json
  end
end
