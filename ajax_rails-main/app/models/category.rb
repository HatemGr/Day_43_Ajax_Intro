class Category < ApplicationRecord
  has_many :tasks

  def uncompleted_tasks 
    tasks = self.tasks.select{|task| task.status == false}
  end

  def completed_tasks 
    tasks = self.tasks.select{|task| task.status == true}
  end
  
end
