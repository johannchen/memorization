class ChangeMemorizedToInteger < ActiveRecord::Migration
  def change
    change_column :verses, :memorized, :integer, default: 0 
  end
end
