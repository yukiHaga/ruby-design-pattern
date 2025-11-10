class WriterDecorator
  def write_line(line)
    raise "not implemented"
  end
end

class TimeStampingWriter < WriterDecorator
  attr_reader :real_writer

  def initialize(real_writer)
    @real_writer = real_writer
  end

  def write_line(line)
    real_writer.write_line("#{Time.now}: #{line}")
  end
end

class SimpleWriter
  def initialize(path)
    @file = File.open(path, "w")
  end

  def write_line(line)
    @file.print(line)
    @file.print("\n")
  end
end

class LineNumberWriter < WriterDecorator
  attr_reader :real_writer
  attr_accessor :line_number

  def initialize(real_writer)
    @real_writer = real_writer
    @line_number = 1
  end

  def write_line(line)
    real_writer.write_line("#{line_number}: #{line}")
    self.line_number += 1
  end
end

writer = TimeStampingWriter.new(SimpleWriter.new("out.txt"))
writer.write_line("タイムスタンプ付き")
writer = LineNumberWriter.new(writer)
writer.write_line("行番号付きとタイムスタンプ付き")
writer.write_line("行番号付きとタイムスタンプ付き2")
