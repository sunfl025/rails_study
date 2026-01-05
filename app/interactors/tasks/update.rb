module Tasks
  class Update
    include Interactor

    def call
       task = context.task
       unless task.update(context.params)
           context.fail!(errors: task.errors.full_messages)
       end
      context.task = task
    end
  end
end
