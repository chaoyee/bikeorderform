module ApplicationHelper
  def notice_message
    alert_types = { notice: :success, alert: :danger }

    close_button_options = { class: "close", "data-dismiss" => "alert", "aria-hidden" => true }
    close_button = content_tag(:button, "×", close_button_options)

    alerts = flash.map do |type, message|
      alert_content = close_button + message

      alert_type = alert_types[type.to_sym] || type
      alert_class = "alert alert-#{alert_type} alert-dismissable"

      content_tag(:div, alert_content, class: alert_class)
    end

    alerts.join("\n").html_safe
  end

  def error_message_for(object_handled)
    if object_handled.errors.any?
      close_button_options = { class: "close", "data-dismiss" => "alert", "aria-hidden" => true }
      close_button = content_tag(:button, "×", close_button_options)

      error_content = close_button + error_content
      object_handled.errors.full_messages.each do |message|
        error_content = error_content + message + simple_format("\n")
      end
      content_tag(:div, error_content, id: "error_explanation", class: "alert alert-danger alert-dismissable")
    end
  end

  def datepicker_field(form, field)
    form.text_field(field, data: { provide: "datepicker",
      'date-format': 'yyyy-mm-dd',
      'date-autoclose': 'true',
      'date-today-btn': 'linked',
      'date-today-highlight': 'true'}).html_safe
  end
end
