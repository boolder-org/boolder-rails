class ContributeMailer < ApplicationMailer
  def new_contribution_email
    @contribution = params[:contribution]
    mail(to: ["nmondollot@gmail.com", "emile.breton1@gmail.com"], subject: 'New contribution')
  end
end
