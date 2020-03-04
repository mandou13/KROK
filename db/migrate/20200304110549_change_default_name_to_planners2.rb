class ChangeDefaultNameToPlanners2 < ActiveRecord::Migration[5.2]
  def change
    change_column_default :planners, :name, "#{Time.now.strftime("%d")}/#{Time.now.strftime("%m")} Menu"
  end
end
