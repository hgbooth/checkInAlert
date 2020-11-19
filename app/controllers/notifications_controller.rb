class NotificationsController < ApplicationController
  def index
    matching_notifications = Notification.all

    @list_of_notifications = matching_notifications.order({ :created_at => :desc })

    render({ :template => "notifications/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_notifications = Notification.where({ :id => the_id })

    @the_notification = matching_notifications.at(0)

    render({ :template => "notifications/show.html.erb" })
  end

  def create
    the_notification = Notification.new
    the_notification.flight_datetime = params.fetch("query_flight_datetime")
    the_notification.flight_description = params.fetch("query_flight_description")
    the_notification.user_id = params.fetch("query_user_id")

    if the_notification.valid?
      the_notification.save
      redirect_to("/notifications", { :notice => "Notification created successfully." })
    else
      redirect_to("/notifications", { :notice => "Notification failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_notification = Notification.where({ :id => the_id }).at(0)

    the_notification.flight_datetime = params.fetch("query_flight_datetime")
    the_notification.flight_description = params.fetch("query_flight_description")
    the_notification.user_id = params.fetch("query_user_id")

    if the_notification.valid?
      the_notification.save
      redirect_to("/notifications/#{the_notification.id}", { :notice => "Notification updated successfully."} )
    else
      redirect_to("/notifications/#{the_notification.id}", { :alert => "Notification failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_notification = Notification.where({ :id => the_id }).at(0)

    the_notification.destroy

    redirect_to("/notifications", { :notice => "Notification deleted successfully."} )
  end
end
