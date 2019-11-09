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
    FORMAT = "I am a standard user."
    @@total_users = 0
    attr_reader :name, :age, :city, :state
    def initialize(name, age = "Not provided", city = "N/A", state = "N/A")
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

    private
    def flag_post
        puts "This post is bad!"
    end

    protected
    def yes_post
        puts "YES!"
    end

    public
    def all_posts
        p @forum_posts
    end

    def send_alert
        p "#{name} has come online."
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
        flag_post
        self.yes_post
        @forum_posts << thought
    end
end

class PaidUser < User
    FORMAT = "I am a paid user."
    attr_reader :balance
    def initialize(name, age = "Not provided", city = "N/A", state = "N/A")
        super
        @balance = 0
    end

    def send_alert
        p "#{name} has come online. #{name} is a paid member."
    end

    def increase_balance(amount)
        handle_balance(amount)
    end

    def decrease_balance(amount)
        handle_balance(amount, false)
    end

    def add_numbers(x = 0, y = 0)
        p "x: #{x}, y: #{y}"
        p x + y
    end

    private
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
    FORMAT = "I am an Admin."
    WARNING = "You are breaking the rules."
    def initialize(name, age = "Not provided", city = "N/A", state = "N/A")
        super
    end

    def send_alert
        p "#{name} has come online and available for contacting."
    end

    def remove_user(user)
        puts "user removed"
    end
    # use case for super parameters
    def add_numbers(x, y)
        super
        super x, y
        super x
        super()
    end
end

a = User.new "Steven", 23, "Madison", "MI"
b = PaidUser.new "Scott", 33, "Austin", "TX"
c = User.new "Charlie", 21, "Pheonix", "AZ"
d = AdminUser.new "Admin"
b.increase_balance(100)
b.post("Skiing is ok.")
a.post("I love hiking?")
a.post("Scratch that, I love swiming more!")
d.post("Looking for people to ban.")
User.total_users

require "pry"; binding.pry