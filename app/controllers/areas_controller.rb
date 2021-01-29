class AreasController < ApplicationController
  def index
  	@areas = Area.all
  end

  def show
  	@area = Area.find(params[:id])
  	@problems = @area.problems.order(Arel.sql('RANDOM()')).take(3)

  	@chart_data = {
      labels: ['1', '2', '3', '4', '5', '6', '7', '8'],
      datasets: [{
          label: 'problems',
          data: 1.upto(8).map{|i| @area.problems.send("level#{i}").count },
          backgroundColor: 'rgba(5, 150, 105, 0.4)',
        	borderColor: 'rgba(5, 150, 105, 1)',
          
          # backgroundColor: [
          #     'rgba(255, 99, 132, 0.2)',
          #     'rgba(54, 162, 235, 0.2)',
          #     'rgba(255, 206, 86, 0.2)',
          #     'rgba(75, 192, 192, 0.2)',
          #     'rgba(153, 102, 255, 0.2)',
          #     'rgba(255, 159, 64, 0.2)'
          # ],
          # borderColor: [
          #     'rgba(255, 99, 132, 1)',
          #     'rgba(54, 162, 235, 1)',
          #     'rgba(255, 206, 86, 1)',
          #     'rgba(75, 192, 192, 1)',
          #     'rgba(153, 102, 255, 1)',
          #     'rgba(255, 159, 64, 1)'
          # ],
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
      }
    }
  end
end
