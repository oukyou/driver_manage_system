# encoding: UTF-8
# author:jairy
class Holiday < ActiveRecord::Base
  attr_accessible :id, :name, :start_date, :end_date
end
