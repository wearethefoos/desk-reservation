$ ->
  $('#calendar').fullCalendar({
    
    events: 'https://www.google.com/calendar/feeds/springest.com_b6d1o53kio2u3kb11h1aed231k%40group.calendar.google.com/public/basic'
    
    height: 600
    defaultView: 'agendaWeek'
    weekends: false
    weekNumbers: true
    header: (left: 'title', center: '', right: 'today prev, next, agendaWeek, agendaDay')
    titleFormat: (week: 'MMMM yyyy', day: 'dddd, d MMM, yyyy')
    weekNumberTitle: 'Week'
    buttonText: (today: 'view today', week: 'view week', day: 'view day')

    slotMinutes: 30
    minTime: 8
    timeFormat: 'H(:mm)'
    axisFormat: 'HH:mm'
    columnFormat: (week: 'dddd d/M', day: 'dddd d MMM')

    selectable: true
    select: (start, end, allDay, view) ->
     title = prompt("Please enter your name:", "Your name")
     calendar.fullCalendar "renderEvent",
       title: title
       start: start
       end: end
       allDay: allDay
     true
     calendar.fullCalendar('unselect')

    eventClick: (calEvent, jsEvent, view) ->
      alert "Event: " + calEvent.title
      alert "Coordinates: " + jsEvent.pageX + "," + jsEvent.pageY
      alert "View: " + view.name
      $(this).css 'border-color', 'red'

  })