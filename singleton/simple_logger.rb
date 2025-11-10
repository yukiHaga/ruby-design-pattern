class SimpleLogger
  ERROR = 1
  WARNING = 2
  INFO = 3

  def self.instance
    @@instance ||= new
  end

  private_class_method :new

  attr_accessor :level

  def initialize
    @log = File.open("log.txt", "w")
    @level = WARNING
  end

  def error(msg)
    @log.puts("ERROR: #{msg}")
    @log.flush
  end

  def warning(msg)
    @log.puts("WARNING: #{msg}") if @level >= WARNING
    @log.flush
  end

  def info(msg)
    @log.puts("INFO: #{msg}") if @level >= INFO
    @log.flush
  end
end

logger = SimpleLogger.instance
logger.info("Hello, World!")
logger.level = SimpleLogger::INFO
logger.info("Hello, World!2")