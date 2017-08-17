class AlterColumnType < ActiveRecord::Migration[5.1]
  def change
  	change_table :adminpanels do |t|
  		t.change :frequency, :string
  	end
  end
end
