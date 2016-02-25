module ApplicationHelper

  def format_time(time, timezone=Time.zone.name)
    I18n.l time.to_time.in_time_zone(timezone), format: :long
  end

end