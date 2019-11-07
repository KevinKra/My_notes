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

a = Dog.new("Dog")
b = Cat.new("Wilson")
c = BeardedDragon.new("Drogon")
a.eat
b.expire
a.show_type
c.show_type
Organism.show_count