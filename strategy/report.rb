class Report
  attr_reader :title, :body, :formatter

  def initialize(formatter)
    @title = "月次報告"
    @body = ["順調", "最高の調子"]
    @formatter = formatter
  end

  def output_report
    formatter.output_report(title, body)
  end
end
