class NotificationMailer < ActionMailer::Base
  default from: "notifications@streetcred.us"
  add_template_helper(ApplicationHelper)
  
  def welcome(user)
    @user = user
    @current_campaigns = Campaign.active
    mail(:to => user.email,
         :subject => "Welcome to StreetCred")
  end

  def email_welcome(user)
    @user = user
    @current_campaigns = Campaign.active
    mail(:to => user.email,
         :subject => "Welcome to StreetCred")
  end

  def citizens_connect_welcome(user)
    @user = user
    @current_campaigns = Campaign.active
    mail(:to => user.email,
         :subject => "You Just Earned Street Cred!")
  end

  def completed_campaign(user, action)
    @user = user
    @action = action
    @completed_campaigns = user.campaigns_completed_by_action(action)
    mail(:to => user.email,
         :subject => "Congratulations! Campaign Completed!")
  end

  def progress(user, action)
    @user = user
    @action = action
    @in_progress_campaigns = user.campaigns_in_progress_by_action(action)
    mail(:to => user.email,
         :subject => "Nice Work!")
  end
end
