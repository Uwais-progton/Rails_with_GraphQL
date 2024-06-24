# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :blogs, [Types::BlogType], null: true, description: "Fetches all the blogs"
    def blogs
      Blog.all.includes(:user)
    end

    field :blog, Types::BlogType, null: false, description: "Fetch blog for some id" do
      argument :id, ID, required: true
    end
    def blog(id:)
      Blog.find(id)
    end

    field :blog_count, Int, null: false, description: "Fetches the count of all blogs"
    def blog_count
      Blog.count
    end

    field :users, [Types::UserType], null: true, description: "Fetches all users"
    def users
      User.all
    end

    field :user, Types::UserType, null: true, description: "Fetch a user by ID" do 
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end
  end
end
