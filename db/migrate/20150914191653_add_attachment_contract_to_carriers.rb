class AddAttachmentContractToCarriers < ActiveRecord::Migration
  def self.up
    change_table :carriers do |t|
      t.attachment :contract
    end
  end

  def self.down
    remove_attachment :carriers, :contract
  end
end
