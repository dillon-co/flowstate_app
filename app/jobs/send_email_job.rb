class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    # Do something later
    @user = user
    UserMailer.sample_email(@user).deliver_later
  end
end
