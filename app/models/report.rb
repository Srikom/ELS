class Report < ActiveRecord::Base
  attr_accessible :report_month, :report_name, :report_year

  def self.getReport(month,year)
    where(report_month:month,report_year:year)
  end
  
end
