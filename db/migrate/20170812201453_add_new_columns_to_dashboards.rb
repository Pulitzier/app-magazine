class AddNewColumnsToDashboards < ActiveRecord::Migration[5.1]
  def change
  	change_table :dashboards do |t|
  		t.rename :information, :carousel_info
  	end
  	change_table :dashboards do |t|
  		t.string :newbie
  		t.string :others
  	end
  end
end
