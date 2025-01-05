require_relative 'crab' # Replace with the name of your main bot file

def start_bot
  loop do
    begin
      execute_strategy # Replace with the main function of your bot
    rescue StandardError => e
      puts "[#{Time.now}] Error: #{e.message}"
      puts e.backtrace.join("\n")
    end

    sleep(60) # Adjust the sleep time as per your requirements
  end
end

start_bot
