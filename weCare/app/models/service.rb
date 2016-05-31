class Service < ActiveRecord::Base
  has_and_belongs_to_many (:profiles)
  # :join_table => "profiles_services",
  # :foreign_key => "profile_id")


end
