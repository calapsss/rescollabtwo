class AddAttachmentRespaperToPosts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :posts do |t|
      t.attachment :respaper
    end
  end

  def self.down
    remove_attachment :posts, :respaper
  end
end
