class LinkMailer < ApplicationMailer
  MODERATOR_EMAILS = ["test@emial.com"]

  def new_link(link)
    @link = link
    mail(to: LinkMailer::MODERATOR_EMAILS, subject: "New link submitted", body: "A new link has been posted")
  end
end
