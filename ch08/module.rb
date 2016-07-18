#模块是Ruby的特色功能之一。如果说类表现的是事物的实体以及行为，那么模块表现的就
#只是事物的行为部分。

#模块与类的区别：
#1.模块不能拥有实例
#2.模块不能被继承

#模块的命名空间：对方法、常量、类等名称进行区分以及管理的单位。由于模块提供各自的独立空间，
#因此，不同模块中的同名方法会被程序认为是两个不同的方法，这就解决了不同模块之间的命名冲突。
p Math::PI
p Math::sqrt(2)

#使用include关键字可以把模块内的方法名、常量名合并到当前的名称空间；
include Math
p PI
p sqrt(2)

#利用Mix-in扩展功能：就是将两个模块混合到类中，在定义类时使用include，模块里的方法、常量就都能被类使用。
#解决以下问题：
#1.两个不同的类拥有相似的功能，但是不希望把它们作为相同的种类来考虑问题
#2.Ruby不支持多重继承，因此无法对已经继承的类添加公用的功能的时候
module MyModule
    #common method
    def hello
        puts "common method."
    end
end

class MyClass1
    include MyModule

    def say
        puts "Saying."
    end
end

class MyClass2
    include MyModule

    def cook
        puts "i like cook!"
    end
end

#创建模块，使用module关键字+模块名来创建一个模块。
module HelloModule
    Version = 1.0 #define a constant

    def hello(name)
        puts "Hello,#{name}"
    end

    module_function :hello #指定hello方法为模块方法
end

#test
include HelloModule
p Version
hello("Alice")

#在模块中定义常量,可以通过模块名+常量名来访问模块中的常量；
#模块中定义的方法，注意如果只是在模块中定义了方法，虽然在模块内部与包含此模块的上下文中，
#都可以直接调用，当却不能以"模块名.方法名"的形式调用。如果希望如此，需要指定该方法为模块方法。

#如果在方法中调用self，就会获得该模块的对象；但是如果类Mix-in了模块，就相当于添加了实例方法。
#这种情况下，self代表的就是Mix-in的类的对象。一般不建议在模块函数中使用self。
module FooModule
    def foo
        p self
    end
    module_function :foo
end
FooModule.foo


#如果想测试类是否包含了某模块，可以通过使用include?方法来判断
p ["MyClass2 is contains MyModule: ",MyClass2.include?(MyModule)]

#使用ancestors以及superclass来查看类之间的继承关系
p MyClass2.ancestors  #获取其祖先关系列表
p MyClass1.superclass #获取直接父类

#Mix-in查找方法的规则
#1.同继承关系一样，原类中已经定义了同名的方法时，优先使用原类中定义的方法；
module M
    def meth
        "dese"
    end
end
class C
    include M
    def meth
        "cmeth" #print cmeth
    end
end
c = C.new
p c.meth

#2.同一个类中包含多个模块时，优先使用最后一个包含的模块。
module M1

end
module M2

end
class C3
    include M1
    include M2 #优先选择最后一个包含的模块
end
p C3.ancestors

#3.嵌套include时，查找顺序也是线性的；
module Ms1

end

module Ms2

end

module Ms3
    include Ms2
end
class C4
    include Ms1
    include Ms3
end
p C4.ancestors #Ms3=>Ms2=>Ms1

#4.相同的模块被包含两次以上时，第2次以后的会被省略。
class C5
    include M1
    include M2
    include M1
    include M2
end
p C5.ancestors #仅包含前两项M1，M2，后边重复的M1，M2将被忽略。

#利用extend方法可以使単例类包含模块，并把模块的功能扩展到对象中。
module Edition
    def edition(n)
        "#{self} 第#{n}版."
    end
end
str = "Rbuy 基础教程"
str.extend(Edition)
puts str.edition(4)

#类与Mix-in：在Ruby中所有类本身都是class的对象：
#类方法的含义：
#1.class类的实例方法
#2.类对象的単例方法
module ClassMethods
    def cmethod
        "class method."
    end
end
module InstanceMethods
    def imethod
        "instance method."
    end
end
class MyClass5
    #使用extend扩展类方法
    extend ClassMethods
    #使用include定义实例方法
    include InstanceMethods
end
p MyClass5.cmethod
p MyClass5.new.imethod
