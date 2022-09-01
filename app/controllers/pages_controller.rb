class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @chores_categories = ["Bathroom", "Dishes", "Sweep", "Kitchen", "Trash",
      "Washer"]
  end
end
