class Friendship < ApplicationRecord
  belongs_to :user1, class_name: "User"
  belongs_to :user2, class_name: "User"

  validate :assert_user_difference

  private

    def assert_user_difference
      return if user1 != user2

      throw "User1 and User2 should be different"
    end
end
