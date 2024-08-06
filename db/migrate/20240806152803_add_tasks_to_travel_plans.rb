class AddTasksToTravelPlans < ActiveRecord::Migration[7.1]
  def change
    add_reference :travel_plans, :task, foreign_key: true
  end
end
