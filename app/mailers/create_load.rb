class CreateLoad < ActionMailer::Base
  default from: "from@example.com"
  def load_user(load)
  	@load = load
		mail(to: @load.user.email, subject: "You have create load")
    end
end