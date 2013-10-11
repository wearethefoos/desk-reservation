$ ->
  $('#calendar').fullCalendar({
    
    weekends: false
    weekNumbers: true
    header: (left: 'title', center: '', right: 'today prev, next, agendaDay, month')
    titleFormat: (month: 'MMMM yyyy', day: 'dddd, d MMM, yyyy')
    weekNumberTitle: 'Week'
    buttonText: (today: 'view today', month: 'view month', day: 'view day')

    slotMinutes: 30
    minTime: 8
    timeFormat: 'H(:mm)'
    axisFormat: 'HH:mm'
    columnFormat: (month: 'dddd', day: 'dddd d MMM')

    selectable: true
    select: (title, startDate, endDate, allDay) ->
     title = prompt("Please enter your name:", "Your name")
     calendar.fullCalendar "renderEvent",
       title: title
       start: startDate
       end: endDate
     stick

    unselect: (view) ->

    eventClick: (calEvent, jsEvent, view) ->
      alert "Event: " + calEvent.title
      alert "Coordinates: " + jsEvent.pageX + "," + jsEvent.pageY
      alert "View: " + view.name
      $(this).css 'border-color', 'red'

  })