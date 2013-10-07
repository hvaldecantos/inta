# == Schema Information
#
# Table name: assignments
#
#  user_id    :integer          not null
#  role_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Assignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
end
