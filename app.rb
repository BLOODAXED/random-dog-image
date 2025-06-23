require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

URL = "https://dog.ceo/api"

get("/") do
  
  route = "#{URL}/breeds/list/all"

  @dogs = JSON.parse(HTTP.get(route))["message"]
  
  erb(:home, {:layout => :layout} )

end

get("/any") do

  route = "#{URL}/breeds/image/random"

  @dog = JSON.parse(HTTP.get(route))["message"]

  erb(:any, {:layout => :layout} )

end

get("/search") do

  @breed = params["breed"]
  @breed = @breed.gsub(" ", "/")

  redirect to("/#{@breed}")
end

get("/:breed") do

  @breed = params["breed"]
  route = "#{URL}/breed/#{@breed}/images/random"

  @dog = JSON.parse(HTTP.get(route))["message"]

  erb(:breed, {:layout => :layout} )

end

get("/:breed/:sub") do

  @breed = params["breed"]
  @sub = params["sub"]
  route = "#{URL}/breed/#{@breed}/#{@sub}/images/random"

  @dog = JSON.parse(HTTP.get(route))["message"]

  erb(:subbreed, {:layout => :layout} )

end
