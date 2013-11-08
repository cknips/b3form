# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  done        :boolean
#  really_done :boolean
#  category    :string(255)
#  due_date    :date
#  public      :boolean
#

class Task < ActiveRecord::Base
  validates :title, presence: true
end
