# == Schema Information
#
# Table name: attendees
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  rush_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'test_helper'

class AttendeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
