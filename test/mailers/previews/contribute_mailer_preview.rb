# Preview all emails at http://localhost:3000/rails/mailers/contribute_mailer
class ContributeMailerPreview < ActionMailer::Preview
  def new_contribution_email
    contribution = Contribution.last
    ContributeMailer.with(contribution: contribution).new_contribution_email
  end
end
