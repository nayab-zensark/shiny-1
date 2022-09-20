class BaseWorker
  include Sidekiq::Worker
  
  def perform(*args)
    
    puts "Task is performed"
    uri = URI('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd')
  	request = Net::HTTP.get(uri)
    @data  = JSON.parse(request)["bitcoin"]["usd"]

    @price = Price.create
    @price.bitcoin_price = @data
    @price.save
    
  end

  Sidekiq::Cron::Job.create(name: 'Base worker - every day at 5 pm', cron: '30 11 * * *', class: 'BaseWorker')
end
