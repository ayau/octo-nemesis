# == Schema Information
#
# Table name: rushes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  photo      :string(255)
#  email      :string(255)
#  phone      :string(255)
#  residence  :string(255)
#  origin     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RushTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
