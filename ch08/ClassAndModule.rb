#使用各类的new方法来创建类的实例（object）
ary = Array.new
p ary #create a empty array object

#查看对象所属的类
p ary.class #print "Array"
p "STRING".class

#使用instance_of?方法判断对象是否属于某个类
p ary.instance_of?(Array) #print true

#继承：通过扩展已有类来创建新的类。
#1.在不影响原有功能的前提下增加新的功能；
#2.重定义原有功能，使名称相同的方法产生不同的效果；
#3.在已有功能的基础上追加处理，扩展已有功能；

#BasicObject类是Ruby中所有类的父类，它定义了作为Ruby对象的最基本功能。
#根据类的继承关系反向查找对象是否属于某个类时，可以使用is_a?方法；
str = "hello,ruby!"
p str.is_a?(String)
p str.is_a?(Object)

#类的定义
#1.使用class关键字来定义类，并且类的名称首字母必须大写；

#2.initialize方法是特殊方法，当使用new方法生成新的对象时，initialize方法会被调用，
#同时new方法的参数也会原封不动的传给initialize方法。初始化对象的处理一般都写在该方法中。

#3.实例变量与实例方法：以@开头的变量为实例变量，在不同的方法中，程序会把局部变量看做是
#不同的变量来对待，而只要在同一个实例中，程序就可以超越方法的定义，任意引用、修改实例变量
#的值。但是引用未初始化的实例变量时返回的值为nil。不同实例的实例变量值可以不同。只要实例存在，
#实例变量的值就不会消失，并且可以被任意使用。而局部变量则是在调用方法时创建，只能在方法内部使用。

#4.在Ruby中，从对象外部不能直接访问实例变量或者对实例变量赋值，需要通过方法来访问对象的内部。
#定义实例变量的存取器，例如：name方法与name=(value)方法表示@name实例变量的存取器；
#Ruby还提供了更加简洁的存取器定义方式：attr_reader(read-only)，attr_writer(write-only)，attr_accessor;

#5.特殊变量self：在实例方法中，可以用self来引用方法的接收者。

#6.类方法：方法的接收者就是类本身的方法称为类方法。类方法的操作对象不是实例，而是类本身。

#7.常量：在class上下文中可以定义常量，然后通过class::constantvar访问常量,常量一旦被初始化后不能被再次修改；

#8.类变量，以@@开头的变量称为类变量；类变量时该类所有实例的共享变量，可以多次修改类变量的值；
#与实例变量一样，从类的外部访问类变量时也需要存取器，但是attr_accessor等存取器不能使用，因此，需要自定义存取器。

#9.限制方法的调用，Ruby提供了三种方法的访问级别来限制实例方法的访问域：
#public，以实例方法的形式向外部公开该方法；
#private,在指定接收者的情况下不能调用该方法(只能使用缺省接受者的方式调用该方法，因此无法从实例的外部访问)；
#protected,在同一个类（以及子类）中时可以将该方法作为实例方法调用，除此之外的地方都无法使用；
#default，没有指定方法的访问级别时，方法的是public；

#10.扩展类：在原有基础上添加方法，允许在已经定义好的类中添加新的方法。
class String
    def count_word
        ary = self.split(/\s+/)
        return ary.size
    end
end
str = "Just Another Ruby Newbie."
p str.count_word

#11.继承
#定义类时如果没有指定父类的情况下，Ruby会默认该类为Object类的子类;
#BasicObject类仅提供了组成Ruby对象所需的最低限度的方法。类对象调用instance_methods方法后，
#就会以符号的形式返回该类的实例方法列表。BasicObject是轻量级的类，但继承时必须明确指定。
p ["Object",Object.instance_methods]
p ["Base",BasicObject.instance_methods]

#12.alias与undef

#使用alias方法设置别名，其参数为方法名或者符号名
#Example0:  alias newmethod originmethod
#Example1: alias :newSymbols :originSymbol
class C1
    def hello
        "Hello"
    end
end

class C2 < C1
    alias old_hello hello #设置继承的hello方法的别名
    def hello             #重定义hello方法
        "#{old_hello},again"
    end
end
obj = C2.new
p obj.old_hello
p obj.hello

#使用undef删除已有方法的定义。与alias一样，参数可以指定方法名或者符号名
#Example0: undef methodName
#Example1: undef :symbolName
#在子类中删除父类中定义的方法或者符号
class A
    def hello
        "print"
    end
end
class B < A
    undef hello #删除父类中定义的hello方法
end
obj1 = B.new
#p obj1.hello    #B中不存在从父类中继承的hello方法，所以会报错

#Ruby所有类都是class类的实例，对class类添加实例方法，就等于给所有的类都添加了该类的方法。
str1 = "Rbuy"
str2 = "ssss"
class << str1
    def hello
        "Hello,#{self}!"
    end
end
p str1.hello
