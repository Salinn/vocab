module EventsHelper
  def events_link(event)
    if event.id.nil?
      ''
    else
      link_to(event.title, event)
    end
  end
end
