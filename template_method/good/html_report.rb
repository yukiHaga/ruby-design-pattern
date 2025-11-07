require_relative "report"

class HTMLReport < Report
  def output_title(title)
    puts "<html>"
    puts "  <head>"
    puts "    <title>#{title}</title>"
    puts "  </head>"
  end

  def output_body(body)
    puts "  <body>"
    @body.each do |line|
      puts "    <p>#{line}</p>"
    end
    puts "  </body>"
  end

  def output_footer
    puts "</html>"
  end
end
