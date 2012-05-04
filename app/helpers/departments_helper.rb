# encoding: utf-8
module DepartmentsHelper
  def time_period(time)
    @timepassed = time
    if @timepassed < 5
      @timeperiod = "凌晨"
    elsif @timepassed >= 5 && @timepassed < 12
      @timepassed = "上午"
    elsif @timepassed >= 12 && @timepassed < 18
      @timepassed = "下午"
    elsif @timepassed >= 17 && @timepassed <= 24
      @timepassed = "晚上"
    end
  end
  
  def time
    Time.now.seconds_since_midnight/3600
  end
end