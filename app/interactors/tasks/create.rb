module Tasks
  class Create
    include Interactor

    def call
      task = Task.new(context.params)

      unless task.save
        context.fail!(errors: task.errors.full_messages)
      end

      context.task = task
    end
  end
end
