#======================#
# Access Modifiers
#======================#
class Some
  def method2
      puts "public method2 called"  
      self.method4
  end
  
  private
  def method3
      puts "public method3 called"
      method1
      self.method1
  end          

  protected
  def method4
      puts "public method4 called"
      method1
      self.method1
  end          
end

# s = Some.new
# s.method1
# s.method2
# s.method4

#======================#
# Inheritance
#======================#
class Organism
    @@total_organisms = 0
    def initialize(type)
        @@total_organisms += 1
        @type = type
        puts "Organism created"
    end

    def self.show_count
        puts @@total_organisms
    end

    def show_type
        puts @type
    end

    def breath
        puts "Breath in, Breath out."
    end

    def eat
        puts "Food in."
    end

    def defecate
        puts "Food out."
    end

    def expire
        puts "Goodbye world."
    end
end

class Mammal < Organism
    @@total_mammals = 0
    def initialize(name)
        super
        @@total_mammals += 1
        @type = "Mammal"
        @name = name
    end

    def show_count
        puts @@total_mammals
    end
end

class Reptile < Organism
    @@total_reptiles = 0
    def initialize(name)
        super
        @@total_reptiles += 1
        @name = name
        @type = "Reptile"
    end

    def show_count
        puts @@total_reptiles
    end
end

class Dog < Mammal
    def initialize(name)
        super
    end
end

class Cat < Mammal
    def initialize(name)
        super
    end
end

class BeardedDragon < Reptile
    def initialize(name)
        super
    end
end

# a = Dog.new("Dog")
# b = Cat.new("Wilson")
# c = BeardedDragon.new("Drogon")
# a.eat
# b.expire
# a.show_type
# c.show_type
# Organism.show_count



#======================#
# Inheritance + Access Modifiers
#======================#
class User
    @@total_users = 0
    attr_reader :name, :age, :city, :city
    def initialize(name, age, city, state)
        @name = name
        @age = age
        @city = city
        @state = state
        @@total_users += 1
        @logged_in = false
        @forum_posts = []
    end

    def self.total_users
        puts "There are #{@@total_users} total users."
    end

    def all_posts
        p @forum_posts
    end

    def login
        if !@logged_in 
            @logged_in = true
            puts "Logged in!"
        else 
            puts "You're already logged in."
        end
    end

    def logout
        if @logged_in
            @logged_in = false
            puts "Logged out!"
        else
            puts "You're not logged in."
        end
    end

    def post(thought)
        @forum_posts << thought
    end
end

class PaidUser < User
    attr_reader :balance
    def initialize(name, age, city, state)
        super
        @balance = 0
    end

    def increase_balance(amount)
        handle_balance(amount)
    end

    def decrease_balance(amount)
        handle_balance(amount, false)
    end

    def handle_balance(amount, increment = true)
        if increment
            @balance += amount.to_i
        elsif !increment
            @balance -= amount.to_i
        else
            puts "You must enter a valid number."
        end
    end
end

class AdminUser < PaidUser
    def initialize(name, age, city, state)
        super
    end

    def remove_user(user)
        puts "user removed"
    end
end

a = User.new "Steven", 23, "Madison", "MI"
b = PaidUser.new "Scott", 33, "Austin", "TX"
c = User.new "Charlie", 21, "Pheonix", "AZ"
d = AdminUser.new "Admin", 99, "Virginia", "SC"
b.increase_balance(100)
b.balance
b.post("Skiing is ok.")
a.post("I love hiking?")
a.post("Scratch that, I love swiming more!")
d.post("Looking for people to ban.")
User.total_users
a.all_posts
b.all_posts
d.all_posts
a.name
d.name

require "pry"; binding.pry