class HomeController < ApplicationController
  def index




  end

  def results

  end

  def test

  	#This is where we build our response, hard coding the values for term and location.  
  	#Our yelp_token is safe in application.yml

		query = { 
		  "term"     => "greek",
		  "location"      => "Atlanta,GA" ,
		  
		}
		headers = { 
		  "authorization"  => "Bearer #{ENV['yelp_token']}",
		 
		}

		response = HTTParty.get(
		  "https://api.yelp.com/v3/businesses/search", 
		  :query => query,
		  :headers => headers
		)

		#Let figure out how many result came back and 
		length = response["businesses"].length

		count = 0

		@results = []
		# 
		while count < length do

			puts response["businesses"][count]["name"], response["businesses"][count]["location"]["display_address"], response["businesses"][count]["display_phone"], response["businesses"][count]["rating"]
		
			count += 1
		end

  end
end
