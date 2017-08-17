class SetupDashboardsAdminpanels < ActiveRecord::Migration[5.1]
  def change
  	create_table :dashboards do |t|
  		t.timestamp :update_date
  		t.string :information
  	end

  	create_table :adminpanels do |t|
  		t.integer :frequency
  		t.date :date
  		t.time :time
  	end
  end
end
