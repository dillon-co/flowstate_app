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

class Video < ActiveRecord::Base

  def embed(youtube_url)
    @youtube_id = youtube_url.split("=").last
  end

  def youtube_id
    @youtube_id
  end
end
