# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  link       :string
#  title      :string
#  author     :string
#  duration   :string
#  likes      :integer
#  dislikes   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
