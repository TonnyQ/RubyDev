#define a new class
class HelloWorld
    #attr_reader: name #define a read-only property
    #attr_writer: name #define a read-only property
    attr_accessor :name #define a read-only property

    #define a constant var
    Version = "1.0"

    #define a class var
    @@count = 0

    def HelloWorld.count
        @@count
    end


    def initialize(myname = "Ruby") #init method
        @name = myname #instance property var use @
    end

    def hello
        @@count += 1
        #puts "Hello,world.I am #{@name}"
        puts "Hello,world,I am #{self.name}"
    end

    #define a class method(Singleton Method)
    class << HelloWorld
        def greet(name)
            puts "#{name} said hello."
        end
    end

    #define another class method
    def self.say(name)
        puts "#{name} said hello."
    end

=begin
    def name #get @name
        @name
    end

    def name=(value) #set @name
        @name = value
    end
=end
end

#create three HelloWorld instance and call hello method.
bob = HelloWorld.new("Bob")
alice = HelloWorld.new("Alice")
ruby = HelloWorld.new("Ruby")
p HelloWorld.count
bob.hello
alice.hello
ruby.hello
bob.name = "Bob is study."
bob.hello
p HelloWorld.count

#call a class method
HelloWorld.greet("Tonny")
HelloWorld.say("Tom")

#access a class constant var
puts HelloWorld::Version
