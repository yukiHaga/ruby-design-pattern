require_relative "report"

class PlainTextReport < Report
  def output_title(title)
    puts "*** #{title} ***"
  end

  def output_body(body)
    @body.each do |line|
      puts line
    end
  end
end
