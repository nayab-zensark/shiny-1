require 'net/http'
require 'json'

class PriceController < ApplicationController
  
  def index
    @prices = Price.all
    
    uri = URI('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd')
  	request = Net::HTTP.get(uri)
    @data  = JSON.parse(request)["bitcoin"]["usd"] 
  
    uri1 = URI('https://api.coingecko.com/api/v3/coins/bitcoin/market_chart?vs_currency=usd&days=6&interval=daily')
  	req = Net::HTTP.get(uri1)
    @price_daily = JSON.parse(req)["prices"]
    
  end

  def new
    @price = Price.new
  end

  def create
    BaseWorker.perform_async
    redirect_to root_path
  end 

end
  


