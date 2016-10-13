class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views 'app/views'

end 

#I won't need this until I am making this a web app 