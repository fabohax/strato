require_relative 'api_client'
require_relative 'order_service'
require_relative 'logger'

# Main trading logic
class CrabBot
  def initialize(config)
    @config = config
    @client = APIClient.new(config)
    @order_service = OrderService.new(@client, config)
  end

  def execute_strategy
    Logger.info "Starting trading strategy..."

    exchange_rate = @order_service.fetch_exchange_rate
    Logger.info "Exchange rate fetched: #{exchange_rate}"

    order_response = @order_service.place_order
    Logger.info "Order placed successfully: #{order_response}"

    Logger.info "Trading strategy executed successfully."
  rescue StandardError => e
    Logger.error "Error executing strategy: #{e.message}"
    Logger.debug e.backtrace.join("\n")
    raise e
  end
end
