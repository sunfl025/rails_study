module UsersHelper
  def sex_label(user)
    return "Chưa xác định" if user.sex.nil?
    user.sex ? "Nam" : "Nữ"
  end

  def format_date(date)
  date.strftime("%d/%m/%Y") if date.present?
  end

  def status_badge(active)
    if active
        content_tag(:span, "Active", class: "badge badge-success")
    else
        content_tag(:span, "Inactive", class: "badge badge-danger")
    end
  end

  def action_button(name, path, style)
    link_to name, path, class: "btn btn-#{style}"
  end

  



end
