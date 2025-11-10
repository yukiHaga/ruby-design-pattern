class EnhancedWriter
  attr_reader :check_sum

  def initialize(path)
    @file = File.open(path, "w")
    @check_sum = 0
    @line_number = 1
  end

  def write_line(line)
    @file.print(line)
    @file.print("\n")
  end

  def checksumming_write_line(data)
    data.each_byte { |byte| @check_sum = (@check_sum + byte) % 256 }
    write_line("#{@check_sum}: #{data}")
  end

  def timestamping_write_line(data)
    write_line("#{Time.now}: #{data}")
  end

  def numbering_write_line(data)
    write_line("#{@line_number}: #{data}")
    @line_number += 1
  end

  def close
    @file.close
  end
end

writer = EnhancedWriter.new("out.txt")
writer.write_line("飾り気のない一行")
writer.checksumming_write_line("チェックサムつき")
puts("チェックサムは#{writer.check_sum}")
writer.timestamping_write_line("タイムスタンプ付き")
writer.numbering_write_line("行番号付き")
writer.close
