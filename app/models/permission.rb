class Permission < Struct.new(:emp)
    
  def allow?(controller, action)
    puts 'Ezz ' + controller + action
    return true if controller == "sessions"
    return true if controller == "emps" && action.in?(%w[new create])
    #return true if controller == "topics" && action.in?(%w[index show])
    if emp
      return true if controller == "emps" && action.in?(%w[show edit update])
      #return true if controller == "topics" && action != "destroy"
      #return true if user.admin?
    end
    false
  end
end