class Permission < Struct.new(:emp)
    
  def allow?(controller, action)
    Rails.logger.debug  'Ez-allow? ' + controller +' '+ action+ ' Role : ' + emp.role.to_s
    
    return true if controller == "sessions"
    return true if controller == "emps" && action.in?(%w[new create])
    #return true if controller == "topics" && action.in?(%w[index show])
    if emp
      return true if controller == "emps" && action.in?(%w[show edit update])
      return true if controller == "cards" && action.in?(%w[index new create show edit update])
      return true if controller == "task_types" && action.in?(%w[search])
      return true if controller == "clm_workitems" && action.in?(%w[search])
      #return true if controller == "topics" && action != "destroy"
      #return true if user.admin?
    end
    if emp.role == 0
      return true if controller == "emps" && action.in?(%w[index new create show edit update destory])
      return true if controller == "cards" && action.in?(%w[index new create show edit update destroy])
      return true if controller == "task_types" && action.in?(%w[index new search show edit update destory])
      return true if controller == "clm_workitems" && action.in?(%w[index search new show edit update destory])
    end
    false
  end
end