require 'sinatra'
require 'sinatra/reloader' if development?

#set :bind, "0.0.0.0" 

def page_content(title)
  File.read("pages/#{title}.txt")
  rescue Errno::ENOENT
    return nil
end

def save_content(title, content)
  File.open("pages/#{title}.txt", "w") do |file|
    file.print(content)
  end
end

get "/" do
  erb :welcome # render './views/welcome.erb'
end

get "/new" do
  erb :new
end

get "/:title" do
  @title = params[:title].capitalize
  @content = page_content(@title)
  erb :show
end

#{"title"=>"Title", "content"=>"This is the content of a new wiki page"}
post "/create" do
  params.inspect
end