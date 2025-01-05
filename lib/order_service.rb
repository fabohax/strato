class OrderService
    def initialize(client, config)
      @client = client
      @source_currency = config[:source_currency]
      @destination_currency = config[:destination_currency]
      @buy_amount = config[:buy_amount]
    end
  
    def fetch_exchange_rate
      rates = @client.call_api("pairs")
      pair = rates.find { |p| p["source"] == @source_currency && p["destination"] == @destination_currency }
      raise "Currency pair #{@source_currency}->#{@destination_currency} not available." unless pair
  
      pair["rate"]
    end
  
    def place_order
      @client.call_api("orders", method: :post, body: {
        depositAmount: @buy_amount,
        depositCoin: @source_currency,
        settleCoin: @destination_currency
      })
    end
  end
  