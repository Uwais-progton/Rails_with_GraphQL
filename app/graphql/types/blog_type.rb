# frozen_string_literal: true

module Types
  class BlogType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :description, String
    field :user_id, Integer, null: false
    field :user_name, String
    field :email, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user, UserType, null: true

    def user_name
      "#{object.user.first_name} #{object.user.last_name}" 
    end

    def email
      "#{object.user.email}"
    end
  end
end
