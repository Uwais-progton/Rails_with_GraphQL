# app/graphql/mutations/update_user.rb
module Mutations
    class UpdateUser < Mutations::BaseMutation
      field :user, Types::UserType, null: true
      field :errors, [String], null: false
  
      # Arguments directly for user fields
      argument :id, ID, required: true
      argument :first_name, String, required: false
      argument :last_name, String, required: false
      argument :email, String, required: false
  
      def resolve(id:, first_name: nil, last_name: nil, email: nil)
        user = User.find_by(id: id)
  
        if user.nil?
          return { user: nil, errors: ['User not found'] }
        end
  
        user.first_name = first_name if first_name.present?
        user.last_name = last_name if last_name.present?
        user.email = email if email.present?
  
        if user.save
          { user: user, errors: [] }
        else
          { user: nil, errors: user.errors.full_messages }
        end
      end
    end
  end
  
  