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
    if Link.add(url: params['new_link'], title: params['title'])
      redirect('/')
    else
      flash[:notice] = "Invalid link given"
      redirect('/new')
    end
    # begin
    #   Link.add(url: params['new_link'], title: params['title'])
    # rescue Exception => e
    #   flash[:error] = e.message
    #   redirect('/new')
    # end
    # flash[:notice] = "Invalid link given" unless Link.add(@new_link)
    # Link.url?(@new_link) rspe
    # Link.add(@new_link)
  end

  # run! if app_file == $0
end
