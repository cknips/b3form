# == Schema Information
#
# Table name: test_models
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class TestModel < ActiveRecord::Base
  attr_accessor :label_test, :label_test_html, :label_test_omitted,
                :hint_test,  :hint_test_html,  :hint_test_omitted,
                :placeholder_test, :placeholder_test_omitted

  validates :email, presence: true
end
