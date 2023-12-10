class ContributeMailer < ApplicationMailer
  def new_contribution_email
    @contribution = params[:contribution]
    mail(to: ["nmondollot@gmail.com"], subject: 'New contribution') # , "emile.breton1@gmail.com"
  end
end
