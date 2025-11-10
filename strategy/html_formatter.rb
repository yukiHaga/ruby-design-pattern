require_relative "formatter"

class HTMLFormatter
  def output_report(title, body)
    puts "<html>"
    puts "  <head>"
    puts "    <title>#{title}</title>"
    puts "  </head>"
    puts "  <body>"
    body.each do |line|
      puts "    <p>#{line}</p>"
    end
    puts "  </body>"
    puts "</html>"
  end
end
