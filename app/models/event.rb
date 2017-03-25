class Event < ApplicationRecord
  def human_month
    %w(Jan. Feb. March Apr. May. June July Aug. Sep. Oct. Nov. Dec.)[month]
  end

  def self.generate_html(events)
    result = "<style>#{self.get_css}</style>"
    result += "<table>"
    events.each do |e|
      result += <<-EOS
      <tr>
  <td class="calendar-date">
    <span class="calendar-date-month">#{e.human_month}</span>
    <span class="calendar-date-day">#{e.day}</span>
    <span class="calendar-date-year">#{e.year}</span>
  </td>
  <td>
    #{e.title}

    <span class="calendar-location-and-time">
      #{e.venue}, #{e.location}


        &bull; #{e.time}

    </span>
  </td>
  </tr>
  EOS
  end
  result + "</table>"
  end

  def self.get_css()
    <<-EOS
table.calendar {
  background: none;
  border: none;
  text-align: left;
}

table.calendar a {
  border-bottom: none;
}

table.calendar tr:nth-of-type(2n) {
  background: none;
}

.calendar-date {
  font-family: "Open Sans", sans-serif;
  padding: 1em;
  padding-left: 0;
  font-size: 12pt;
}

.calendar-content {
  font-size: 12pt;
  text-align: left;
}

.calendar-date-day {
  display: block;
  font-size: 2.5em;
  font-weight: bold;
  letter-spacing: -0.05em;
  line-height: 1em;
  text-align: center;
}

.calendar-date-month,
.calendar-date-year {
  display: block;
  font-size: 0.7em;
  line-height: 1em;
  text-align: center;
  white-space: nowrap;
}

.calendar-location-and-time {
  display: block;
  font-family: "Open Sans", sans-serif;
  font-size: 0.8em;
  line-height: 2em;
  opacity: 0.7;
  text-transform: uppercase;
}

.calendar-season {
  display: none;
}

.calendar-season-title {
  cursor: pointer;
  text-align: left;
}

.calendar-season-title-arrow {
  font-size: 0.7em;
}

@media only screen and (min-width: 900px) {
  .calendar-page .container .mid-col:after {
    background-image: url(/assets/calendar-background.jpg);
    background-position: top center;
    background-repeat: no-repeat;
    background-size: cover;
    content: "";
    display: block;
    height: 100%;
    position: fixed;
    right: 0;
    top: 0;
    width: 25.2%;
  }
}
  EOS
  end
end
