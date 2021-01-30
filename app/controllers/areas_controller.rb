class AreasController < ApplicationController
  def index
  	@areas = Area.all
  end

  def show
  	@area = Area.find(params[:id])
  	@problems = @area.problems.order(Arel.sql('RANDOM()')).take(3)

    @parkings = @area.pois

    @annotation = {
      latitude: @parkings.first&.location&.latitude,
      longitude: @parkings.first&.location&.longitude,
      color: "#059669",
      title: @area.name,
      glyphText: "",
    } 

  	@chart_data = {
      labels: ['1', '2', '3', '4', '5', '6', '7', '8'],
      datasets: [{
          label: 'problems',
          data: 1.upto(8).map{|i| @area.problems.level(i).count },
          backgroundColor: 'rgba(5, 150, 105, 0.4)',
        	borderColor: 'rgba(5, 150, 105, 1)',
          borderWidth: 1
      }]
    }

    @chart_options = {
      scales: {
          yAxes: [{
              ticks: {
                  beginAtZero: true,
                  max: 150,
	                stepSize: 50,
              },
              # display: false,
              gridLines: {
              	color: "rgba(200, 200, 200, 0.3)",
              }
          }],
          xAxes: [{
          	gridLines: {
          		display: false,
          	}
          }]
      },
      legend: {
      	display: false
      },
      tooltips: {
      	enabled: false
      },
    }
  end
end
