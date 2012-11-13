class AddLinkedTaskIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :linked_task_id, :integer
  end
end
