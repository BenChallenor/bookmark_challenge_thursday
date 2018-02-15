require 'sinatra/base'
require './lib/link'
require './database_connection_setup'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base

enable :sessions
register Sinatra::Flash

  get '/' do
    @links = Link.all
    erb(:index)
  end

  get '/new' do
    erb(:new)
  end

  post '/' do
    @new_link = params[:new_link]
    begin
      Link.add(@new_link)
    rescue Exception => e
      flash[:error] = e.message
      redirect('/new')
    end
    # flash[:notice] = "Invalid link given" unless Link.add(@new_link)
    # Link.url?(@new_link)
    # Link.add(@new_link)
    redirect('/')
  end

  # run! if app_file == $0
end
