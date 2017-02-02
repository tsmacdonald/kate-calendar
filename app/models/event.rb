class Event < ApplicationRecord
  def self.generate_html(events)
    result = "<table>"
    events.each do |e|
      result += <<-EOS
      <tr>
  <td class="calendar-date">
    <span class="calendar-date-month">#{e.month}</span>
    <span class="calendar-date-day">#{e.day}</span>
    <span class="calendar-date-year">#{e.year}</span>
  </td>
  <td>
    <a href="/jamming.html">#{e.title}</a>

    <span class="calendar-location-and-time">
      <a href="http://www.dukeofperth.com/">#{e.venue}</a>, #{e.location}


        &bull; #{e.time}

    </span>
  </td>
  </tr>
  EOS
  end
  result + "</table"
  end
end
