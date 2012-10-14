# == Schema Information
#
# Table name: rush_comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  rush_id    :integer
#  tag_id     :integer
#  text       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RushCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
