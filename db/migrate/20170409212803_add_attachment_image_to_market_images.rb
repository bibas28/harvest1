class AddAttachmentImageToMarketImages < ActiveRecord::Migration
  def self.up
    change_table :market_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :market_images, :image
  end
end
