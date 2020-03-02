class ChangeDefaultNameToPlanners < ActiveRecord::Migration[5.2]
  def change
    change_column_default :planners, :name, Time.now.strftime("%D")
  end
end
