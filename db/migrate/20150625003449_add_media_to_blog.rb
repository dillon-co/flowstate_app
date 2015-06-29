class AddMediaToBlog < ActiveRecord::Migration

  def up
    add_attachment :blogs, :media
  end

  def down
    remove_attachment :blogs, :media
  end
end
