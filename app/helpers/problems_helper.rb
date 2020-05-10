module ProblemsHelper
	def circle_view(problem)
    content_tag(:div, problem.circuit_number, 
      style: "background: #{uicolor(problem.circuit&.color)}; color: #{text_color(problem.circuit&.color)}",
      class: "circle_view")
	end

	def uicolor(circuit_color)
		color_mapping[circuit_color.to_sym] || "#CCC"
	end

	private
	def color_mapping
		 {
			yellow: 	"#FFCC02",
			orange: 	"#FF9500",
			blue: 		"#017AFF",
			skyblue: 	"#5AC7FA",
			red: 			"#FF3B2F",
			black: 		"#000000",
			white: 		"#FFFFFF",
		}
	end

	def text_color(circuit_color)
		if circuit_color.to_s == "white"
			"#000"
		else
			"#FFF"
		end
	end
end
