class AddBirthdaySortToPeople < ActiveRecord::Migration
  def change
    add_column :people, :birthday_sort, :integer, limit: 4
  end
end
