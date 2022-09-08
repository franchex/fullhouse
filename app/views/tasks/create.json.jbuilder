if @task.persisted?
  json.form render(partial: "tasks/form", formats: :html, locals: { new_task: @task, space: @space })
  json.inserted_item render(partial: "tasks/task_list", formats: :html, locals: { tasks: @tasks })
end
