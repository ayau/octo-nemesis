# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  tag_id     :integer
#  type       :string(255)
#  text       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
