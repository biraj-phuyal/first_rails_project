class User < ApplicationRecord
    has_many :posts

    def friendships
        Friendship.where(user1: self).or(Friendship.where(user2: self))
    end

    def friends
        user1friends = Friendship.where(user1: self).map { |friendship| friendship.user2 }
        user2friends = Friendship.where(user2: self).map { |friendship| friendship.user1 }
        user1friends + user2friends
    end

    def first_name
        name.split.first
    end
    def last_name
        name.split.last
    end
end

=begin
Examples

class Bike
    attr_modifier :name, :wheels, :seat, :bikes

    def initialize(name, wheels, seat)
        @name = name
        @wheels = wheels
        @seat = seat
    end
end

bike1 = Bike.new("Crazy Bike 1", [1, 2], true)
bike2 = Bike.new("Crazy Bike 2", [1, 2], true)
bike3 = Bike.new("Crazy Bike 3", [1, 2], true)

bike1.bikes = [bike2, bike3]

bike1.bikes.map { |bike| bike.name }

=end
