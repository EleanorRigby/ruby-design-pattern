class Logger
  attr_accessor :level

  ERRROR = 1
  WARNING = 2
  INFO = 3

  def initialize
    @log = File.open('log.txt', 'w')
    @level = WARNING
  end

  @@instance = self.new

  def self.instance
    @@instance
  end

  private_class_method :new

  def error(msg)
    @log.puts(msg)
    @log.flush
  end

  def warning(msg)
    @log.puts(msg) if @level >= WARNING
    @log.flush
  end

  def info(msg)
    @log.puts(msg) if @level >= INFO
    @log.flush
  end
end

if __FILE__ == $0
  logger = Logger.instance
  puts logger.level

  Logger.instance.info('Container handles 10,000 request per second')
  Logger.instance.warning('Auth container is not healthy')
  Logger.instance.error('Worker node failed, restarting')
end
