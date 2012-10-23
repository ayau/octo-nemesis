# == Schema Information
#
# Table name: rushes
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  photo              :string(255)
#  email              :string(255)
#  phone              :string(255)
#  residence          :string(255)
#  origin             :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  primary_contact_id :integer
#  active             :integer          default(1)
#

require 'test_helper'

class RushTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
