# == Schema Information
#
# Table name: blogs
#
#  id                 :integer          not null, primary key
#  title              :string
#  date               :date
#  body               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  media_file_name    :string
#  media_content_type :string
#  media_file_size    :integer
#  media_updated_at   :datetime
#

class Blog < ActiveRecord::Base
  belongs_to :user
  has_attached_file :media, :styles => { :large => "1000x500>", :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :media, :content_type => /\A(image|video)\/.*\Z/

  # scope :by_created_at, order("created_at DESC")

  default_scope { order(:created_at) }
end
