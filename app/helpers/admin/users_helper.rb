module Admin::UsersHelper

  def user_status(user)
    if user.is_active == true
      content_tag(:p, "利用中", class: "text-green")
    else
      content_tag(:p, "一時停止中", class: "text-red")
    end
  end

end
