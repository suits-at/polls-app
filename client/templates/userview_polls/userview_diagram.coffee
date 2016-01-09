#Template.userview_diagram.onCreated ->
#  @autorun =>
#    @subscribe('allPolls')

Template.userview_diagram.helpers
  path_polls_index: -> FlowRouter.path 'polls_index'
  poll: ->
    console.log FlowRouter.getParam('pollId')
    return Polls.findOne(FlowRouter.getParam('pollId'))

Template.userview_diagram.generateColumnChart = ->
  return {
    chart:
      type: 'column'

    title:
      text: 'Monthly Average Rainfall'

    subtitle:
      text: 'Source: WorldClimate.com'

    credits:
      enabled: false

    xAxis:
      categories: [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec'
      ]

    yAxis:
      min: 0,
      title:
        text: 'Rainfall (mm)'
    tooltip:
      headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
      pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
          '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
      footerFormat: '</table>',
      shared: true,
      useHTML: true


    plotOptions:
      column:
        pointPadding: 0.2,
        borderWidth: 0

    series: [{
        name: 'Tokyo',
        data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

    }, {
        name: 'New York',
        data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]

    }, {
        name: 'London',
        data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]

    }, {
        name: 'Berlin',
        data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]

    }]

  }

Template.userview_diagram.generatePieChart = ->
  return {
    chart: {
      plotBackgroundColor: null
      plotBorderWidth: null
      plotShadow: false
    }
    title:
      text: this.username + "'s top genres"

    tooltip:
      pointFormat: '<b>{point.percentage:.1f}%</b>'

    plotOptions:
      pie:
        allowPointSelect: true
        cursor: 'pointer'
        dataLabels:
          enabled: true,
          format: '<b>{point.name}</b>: {point.percentage:.2f} %'
          style:
            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'

          connectorColor: 'silver'

    series:[{
        type: 'pie'
        name: 'genre'
        data:[
          ['Adventure', 2]
          ['Action', 5]
          ['Ecchi', 8]
          ['Comedy', 8]
          ['Yuri', 6]
        ]
    }]
  }


Template.userview_diagram.onRendered ->
  @autorun =>
    @subscribe('allPolls')
  new Vue {
    el: '#polls_diagram'
    data:
      optiontitle: ''
      optioncount: ''
      persons: []
    methods:
      submit: (e) ->
        e.preventDefault()
  }
