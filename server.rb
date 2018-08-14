require "sinatra"
require "httparty"
require 'json'

class Cookie 
	attr_accessor :name, :single_price, :whole_price, :description, :image
	def initialize(name, single_price, whole_price, description, image)
		@name = name
		@single_price = single_price
		@whole_price = whole_price
		@description = description
		@image = image
	end
end

class Muffin 
	attr_accessor :name, :single_price, :whole_price, :description, :image
	def initialize(name, single_price, whole_price, description, image)
		@name = name
		@single_price = single_price
		@whole_price = whole_price
		@description = description
		@image = image
	end
end

class Cake 
	attr_accessor :name, :single_price, :whole_price, :description, :image
	def initialize(name, single_price, whole_price, description, image)
		@name = name
		@single_price = single_price
		@whole_price = whole_price
		@description = description
		@image = image
	end
end

get "/" do
	# API_TOKEN=OCKPMYIIM7C2EIROTZN4
	@query = 'baking'
    @location = 'queens'
    response = HTTParty.get("https://www.eventbriteapi.com/v3/events/search/?q=#{@query}&location.address=#{@location}&token=OCKPMYIIM7C2EIROTZN4")
    @event_data = JSON.parse(response.body)
    @events = @event_data['events'].first(3)
    erb :index
end

get "/cookies" do	
	@chocolate_chip_cookie = Cookie.new("Chocolate Heaven", "$1.79", "$10.79", "Chocolate chips in cookies will never get old.", "images/cc_cookie.jpg")
	@butter_cookie = Cookie.new("Butter Me Up", "1.50", "9.99", "Enter the buttery world of our buttery cookie.", "images/butter_cookie.jpg")
	@peanut_butter_cookie = Cookie.new("Nutty Butter", "1.80", "10.99", "Peanut Butter? Peanut butter.", "images/pb_cookie.jpg")
	@oatmeal_cookie = Cookie.new("Oatis", "1.60", "9.89", "Be healthy and have our oatmeal cookie.", "images/oatmeal_cookie.jpg")
	@gingerbread_cookie = Cookie.new("Ginger me Timbers", "1.05", "9.59", "It doesn't have to be Christmas for you to bite into our delicious gingerbread cookie", "images/gb_cookie.jpeg" )
	@snickerdoodle_cookie = Cookie.new("The real Snickers", "1.20", "9.19", "We are not sure about the candy bar but this snickerdoodle cookie will definitely take care of your hunger.", "images/snickerdoodle_cookie.jpg")
	erb :cookies
end

get "/muffins" do
	@chocolate_chip_muffin = Muffin.new("Chippy Muffin", "$2.79", "$13.79", "Melted chocolate chips in a soft muffin. Yum.", "images/cc_muffin.jpg")
	@banana_muffin = Muffin.new("The Potassium Muffin", "2.50", "12.99", "Have some Potassium with your muffin and avoid cramping by eating our banana muffin.", "images/banana_muffin.jpg")
	@cornbread_muffin = Muffin.new("The Southener", "2.80", "14.99", "Ya'll better hurry on in for this delicious cornbread muffin, you hear now?", "images/cornbread_muffin.jpg")
	@blueberry_muffin = Muffin.new("Blue", "2.60", "12.89", "Cure your blues with our Blueberry Muffin.", "images/muffin.jpg")
	@cinammon_muffin = Muffin.new("Sugar", "2.05", "11.59", "Got little bit more than a sweet tooth? Our cinammon muffin is for you.", "images/cinammon_muffin.jpg")
	@coffee_muffin = Muffin.new("Expresso Bread", "2.20", "11.19", "Why drink your coffee, when you can eat our coffee muffin.", "images/coffee_muffin.jpg")
	erb :muffins
end

get "/cakes" do
	@chocolate_cake = Cake.new("Choco-Choco", "$3.79", "$13.79", "We suggest milk with our soft chocolate cake.", "images/chocolate_cake.jpg")
	@red_velvet_cake = Cake.new("Red", "3.50", "12.99", "Our red velvet cake is so much more than chocolate cake with food coloring.", "images/red_velvet.jpg")
	@coconut_cake = Cake.new("CoCo", "3.80", "14.99", "We make our coconut cake with the very best coconuts.", "images/coconut_cake.jpg")
	@pound_cake = Cake.new("Pounds", "3.60", "12.89", "Add on some good LBs with our pound cake.", "images/pound_cake.jpg")
	@ice_cream_cake = Cake.new("Cold as Ice", "3.05", "11.59", "Sometimes the colder the cake, the better it is and it doesn't get any colder than our ice-cream cake.", "images/ice_cream_cake.jpg")
	@coffee_cake = Cake.new("Expresso Cake", "3.20", "11.19", "Why drink your coffee, when you can eat our coffee cake.", "images/coffee_cake.jpg")
	erb :cakes
end
