# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Task < ActiveRecord::Base
  attr_accessor :label_test, :label_test_html, :label_test_omitted,
                :hint_test,  :hint_test_html,  :hint_test_omitted,
                :placeholder_test, :placeholder_test_omitted

  validates :title, presence: true
end
