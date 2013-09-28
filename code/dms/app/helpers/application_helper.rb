# encoding: UTF-8
# author:jairy
module ApplicationHelper
  def current_day_label
    week_days = %w(日 一 二 三 四 五 六)
    "今天是： #{Date.today.strftime('%Y年%-m月%-d日')} 星期#{week_days[Date.today.wday]}"
  end
end
