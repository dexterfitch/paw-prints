class AddImageToPrints < ActiveRecord::Migration
  def self.up
    add_attachment :prints, :image
  end

  def self.down
    remove_attachment :prints, :image
  end
end
