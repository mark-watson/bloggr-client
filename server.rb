require 'sinatra'
require 'json'

$posts = {}
$posts[123] = {:title => "Rails is Omakase",
  :id => 123,
  :_id => 987,
  :author => "d2h",
  :publishedAt => Date.new(),
  :intro => "There are lots of à la carte software environments in this world. Places where in order to eat, you must first carefully look over the menu of options to order exactly what you want.",
  :extended => "I want this for my ORM, I want that for my template language, and let's finish it off with this routing library. Of course, you're going to have to know what you want, and you'll rarely have your horizon expanded if you always order the same thing, but there it is. It's a very popular way of consuming software.\n\nRails is not that. Rails is omakase."
 }
 
put '*/:id' do
  p "entering PUT /*/:id", params
  raw = request.env["rack.input"].read  ## this is the JSON data as a string
  p "raw:", raw
  $posts[params[:id].to_i] = JSON.parse(raw)['post'].merge({:id => params[:id].to_i})
  p "\n\n+++++  $posts:", $posts
  {:id => params[:i]}.to_json
end

get '/posts' do
  p "entering GET"
  data = {:posts => $posts.values}.to_json
  p "\n*** data:", data
  data
end

get '/' do
  File.read(File.join('public', 'index.html'))
end
