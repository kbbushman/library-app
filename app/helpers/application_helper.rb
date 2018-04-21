module ApplicationHelper
  
  def flash_class(level)
    case level
        # NOTE - The flash type below must be changed from symbol to string ie, :notice to "notice"
        when "notice" then "alert alert-info"
        when "success" then "alert alert-success"
        when "error" then "alert alert-danger"
        when "alert" then "alert alert-danger"
    end
  end

end
