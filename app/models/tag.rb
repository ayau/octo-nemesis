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

class Tag < ActiveRecord::Base
    attr_accessible :tag_id, :text, :type
end
