module DeptindicesHelper
  def dept_chart_series(deptindices, dept)
    deptindex_by_month = deptindices.where(:month_id => 1.years.ago.to_date.strftime("%Y%m")..Time.now.beginning_of_month.strftime("%Y%m") ).select("month_id, occursum")
    now = Time.now
    lastyear = Time.now.prev_year.prev_month
  # (1.years.ago.to_date.at_beginning_of_year().strftime("%Y%m")..Time.now.beginning_of_month.strftime("%Y%m")).map do |month|
    # ([ "201101", "201102", "201103" ]).map do |month|
    (12).times.map do
      lastyear = lastyear.next_month
      month = lastyear.strftime("%Y%m").to_s
      sum = deptindex_by_month.detect { |sum| sum.month_id == month }
      sum && sum.occursum.to_f || 0
    end
  end
  
  def month_series
    now = Time.now
    lastyear = Time.now.prev_year.prev_month
    (12).times.map do
      lastyear = lastyear.next_month
      month = lastyear.strftime("%Y%m").to_i
    end
  end
  
  # def getdeptindex(dept, type)
  #   @deptindex = Deptindex.find_by_sql ["SELECT a.* FROM deptindices a WHERE department_id = ? and indextype = ?", dept, type]
  # end
end