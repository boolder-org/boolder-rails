class Mapping::ContributionRequestsController < Contribute::BaseController
  def welcome
    @areas = Area.published.
      map{|a| OpenStruct.new(
          area: a, 
          count: a.problems.joins(:contribution_requests).where(contribution_requests: { what: "photo" }).count,
        )
      }.
      filter{|area_with_count| area_with_count.count > 0 }.
      sort_by{|area_with_count| I18n.transliterate(area_with_count.area.name) }
  end

  def index
    @area = Area.find(params[:area_id])
    
    @locations = ContributionRequest.open.joins(:problem).
      where(problems: { area_id: @area.id }).
      where(what: "photo").
      order("ascents DESC NULLS LAST").
      group_by(&:location_estimated).
      sort_by{|location, requests| requests.inject(0) {|sum, req| sum + req.problem.ascents.to_i } }.reverse
  end
end
