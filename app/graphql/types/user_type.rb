module Types
    class UserType < Types::BaseObject
      field :id, ID, null: false
      field :first_name, String, null: true
      field :last_name, String, null: true
      field :email, String, null: true
      field :blogs, [BlogType], null: true
      field :user_name, String, null: true
  
      def user_name
        "#{object.first_name} #{object.last_name}" 
      end
  
      field :blog_count_per_user, Int, null: false, description: "Fetches the count of all blogs"
  
      def blog_count_per_user
        object.blogs.count
      end
    end
  end
  