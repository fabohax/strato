require 'logger'

module Logger
  def self.setup
    @logger ||= ::Logger.new($stdout)
    @logger.level = ::Logger::INFO
  end

  def self.info(message)
    setup.info(message)
  end

  def self.error(message)
    setup.error(message)
  end

  def self.debug(message)
    setup.debug(message)
  end
end
