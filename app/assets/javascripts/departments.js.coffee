# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
# alert gon.deptindex if gon
# 
# chart = undefined
# $(document).ready ->
#   Highcharts.setOptions lang:
#     months: [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月" ]
# 
#   new Highcharts.Chart(
#     chart:
#       renderTo: "chart_1"
#       type: "column"
# 
#     title:
#       text: "全公司收入"
# 
#     xAxis:
#       type: "datetime"
#       dateTimeLabelFormats:
#         month: "%b '%y"
# 
#     yAxis:
#       title:
#         text: "单位：亿"
# 
#       min: 0
#       labels:
#         formatter: ->
#           @value / 100000000
# 
#     credits:
#       enabled: false
# 	
# 	series: [
# 		 ( "总成交量" => Deptindex.matchbalance, "总净佣金" => Deptindex.commis ).each do |name, deptindices| 
# 		# {
# 		# 	name: "<%= name %>",
# 		# 	pointInterval: <%= 1.month.to_i * 1000 %>,
# 		# 	pointStart: <%= 1.year.ago.beginning_of_year.to_i * 1000 %>,
# 		# 	data: <%= dept_chart_series(deptindices, Department.find_by_code(0000).id) %>
# 		# 	# data: [['201101',5],['201102',7],['201103',4],['201104',5],['201105',8],['201106',3]]
# 		# },
# 		# <% end %>
# 		]
#   )
