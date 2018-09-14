class Event < ApplicationRecord
  belongs_to :recipient, class_name: User.name

  after_create_commit {EventBroadcastJob.perform_later self}
end
