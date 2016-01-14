Template.userview_diagram.onCreated ->
  @autorun =>
    @subscribe('allPolls')

Template.userview_diagram.helpers
  path_polls_index: -> FlowRouter.path 'polls_index'
  poll: ->
    return Polls.findOne(FlowRouter.getParam('pollId'))

Template.userview_diagram.onRendered ->
  this.autorun =>
    Meteor.subscribe 'allPolls', {
      onReady: =>
        @$('.ui.styled.accordion').accordion()
    }

Template.userview_diagram.generatePieChart = -> 
    poll = Polls.findOne(FlowRouter.getParam('pollId'))
    poll = poll.raw 'options_poll'
    data = []
    for options of poll
    # skip loop if the property is from prototype
      if !poll.hasOwnProperty(options)
        continue
      option = poll[options]
      for prop of option
        # skip loop if the property is from prototype
        if !option.hasOwnProperty(prop)
          continue
        if prop == 'optiontitle'
          arr = [option[prop]]
        if prop == 'optioncount'
          arr.push(option[prop])
          data.push(arr)
    return {      
      chart:
        plotBackgroundColor: null
        plotBorderWidth: null
        plotShadow: false
      title: text: ''
      credits: enabled: false
      tooltip: pointFormat: '{series.name}: <b>{point.percentage:.0f}%</b>'
      plotOptions: pie:
        allowPointSelect: true
        cursor: 'pointer'
        dataLabels: enabled: false
        showInLegend: true
      series: [ {
        type: 'pie'
        name: 'Anteil'
        data: data
      } ]
    }

Template.userview_diagram.generateColumnChart = ->
  poll = Polls.findOne(FlowRouter.getParam('pollId'))
  poll = poll.raw 'options_poll'
  data = []
  for options of poll
# skip loop if the property is from prototype
    if !poll.hasOwnProperty(options)
      continue
    option = poll[options]
    for prop of option
# skip loop if the property is from prototype
      if !option.hasOwnProperty(prop)
        continue
      if prop == 'optiontitle'
        arr = {'name' : option[prop], y: []}
      if prop == 'optioncount'
        arr.y = option[prop]
        data.push(arr)
  arr = Object.keys(data).map((key) ->
    data[key]
  )
  return {
    chart:
      type: 'column'
    title:
      text: ''
    credits:
      enabled: false
    xAxis:
      min: 0
      title:
        text: 'Options'
    yAxis:
      min: 0
      title:
        text: 'Number'
#    tooltip:
#      pointFormat: '{point.percentage:.0f}%'
    plotOptions:
      column:
        pointPadding: 0.2
        borderWidth: 0
    series: [ {
      type: 'column'
      data: arr
    } ]
  }

