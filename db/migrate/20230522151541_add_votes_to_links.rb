class AddVotesToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :votes, :integer, default: 0
  end
end
