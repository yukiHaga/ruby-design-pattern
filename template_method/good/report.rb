class Report
  attr_reader :title, :body

  def initialize
    @title = "月次報告"
    @body = ["順調", "最高の調子"]
  end

  def output_report
    output_title(title)
    output_body(body)
    output_footer
  end

  def output_title(title)
    raise "method must be implemented"
  end

  def output_body(body)
    raise "method must be implemented"
  end

  def output_footer
  end
end
