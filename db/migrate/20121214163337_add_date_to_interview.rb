class AddDateToInterview < ActiveRecord::Migration
  def change
    add_column :interviews, :date, :datetime
  end
end
