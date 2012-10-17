# == Schema Information
#
# Table name: cpratings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  rush_id    :integer
#  chill      :integer
#  pull       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CpratingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
