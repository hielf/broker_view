module DeptindicesHelper
  def dept_chart_series(dept)
    matchbalance_by_month = Deptindex.where(:month_id => 1.years.ago.to_date.at_beginning_of_year().strftime("%Y%m")..Time.now.beginning_of_month.strftime("%Y%m") ).select("month_id, occursum as total_match_balance")
    now = Time.now
    lastyear = Time.now.prev_year.beginning_of_year.prev_month
  # (1.years.ago.to_date.at_beginning_of_year().strftime("%Y%m")..Time.now.beginning_of_month.strftime("%Y%m")).map do |month|
    # ([ "201101", "201102", "201103" ]).map do |month|
  (now.month + 12).times.map do
    lastyear = lastyear.next_month
    month = lastyear.strftime("%Y%m").to_s
      sum = matchbalance_by_month.detect { |sum| sum.month_id == month }
      sum && sum.total_match_balance.to_f || 0
    end
  end
end