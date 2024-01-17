class Admin::AuditsController < Admin::BaseController
  def index
    @audits = Audited::Audit.all.order(id: :desc).limit(200)
  end
end
