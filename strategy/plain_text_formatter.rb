require_relative "formatter"

class PlainTextFormatter
  def output_report(title, body)
    puts "*** #{title} ***"
    body.each do |line|
      puts line
    end
  end
end

Factory.create

class DocumentFacotry
  def self.craete
    craete_document
  end

  def create_document
  end
end

class PDFFactory
  def create_document
    PlainTextFormatter.new
  end
end