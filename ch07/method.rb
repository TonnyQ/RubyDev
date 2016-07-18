=begin
1.带块的方法调用形式
object.method(arg0,arg1,...) do |var0,var1,...|
    block
end

object.method(arg0,arg1,...){|var0,var1,...| block }

2.方法的分类：实例方法、类方法、函数式方法
=end

#1.实例方法：以对象为接受者的方法。对象能使用的实例方法是由对象所属的类决定的。
p "10,20,30".split(",")

#2.类方法：接受者不是对象而是类本身。
p Time.now

#3.函数式方法：没有接受者的方法;函数式方法的执行结果，不会根据接受者的状态而发生改变。
#sleep(10)
print "hello"


#方法的定义:方法名可以由英文字母，数字以及下划线组成，但是不能以数字开头；
#*******************************************
# def methodName(arg0,arg1,...)
#     fun-block
# end
#********************************************
def hello(name)
    puts "Hello,#{name}!"
end
hello("Tonny")

#指定参数的默认值
def hello2(name="Ruby")
    puts "Hello,#{name}!"
end
hello2

#当方法有多个参数时，从参数列表的右边开始依次指定默认值。只省略中间或者左边的参数是不行的。
def functest(a,b=3,c=2)
    puts "test"
end
functest(3,3)

#方法的返回值:使用return指定方法的返回值,当省略return语句时，方法的最后一个表达式的结果将作为方法的返回值；
def volume(x,y,z)
    return x * y * z
end
p volume(3,4,5)

#定义带块的方法:yield是定义带块的方式时最重要的关键字，调用方法时通过块传进来的处理会在yield定义的地方执行。
#如果yield部分有参数，程序就会将其当做块变量传到块中。块里面最后的表达式的值既是块的执行结果，同时也可以作为yield
#的返回值在块的外部使用。
def myloop
    while true
        yield
    end
end

num = 1
myloop do
    puts "num is #{num}"
    break if num > 100
    num *= 2
end

#带不确定个数参数的方法:通过增加"*"的方式定义参数个数不确定的方法，Ruby将把所有的参数封装为数组；
def foo(*args)
 p [args.size,args]
end

foo(1,3,34,"3232")

#至少指定一个确定的参数的方法:不确定参数有且仅有一个存在。
def meth(arg0,*args)
    [arg0,args]
end
p meth(1)
p meth(1,2,3,4)

#关键字参数：使用关键字参数，可以将参数名与参数值成对的传入方法内部使用
#不能使用未定义的参数名传递给方法，否则程序会报错；
def area(x:0,y:0,z:0)
    xy = x * y
    yz = y * z
    xz = x * z
    (xy + yz + xz) * 2
end

p area(x:2,y:5)
p area(x:4,z:5,y:6)
#p area(1,2,3)

#为了避免调用方法时指定未定义的参数而报错，可以使用"**变量名"的形式来接收未定义的参数。
def meth(x:2,y:3,z:4,**args)
    [x,y,z,args]
end
p meth(z:7,y:3,x:3)
#p meth(1,2,3,4,x:4,z:5)
p meth(x:3,w:4,h:4)

#关键字参数可以与普通参数同时使用；首先指定普通参数，然后是关键字参数。
def func(a,b:4,c:6)
    [a,b,c]
end
p func(1,c:5,b:3)
p func(c:5)
p func(4)

#使用Hash传递参数
def area2(x:0,y:0,z:0)
    xy = x * y
    yz = y * z
    xz = x * z
    (xy + yz + xz) * 2
end
args1 = {x:2,y:3,z:4}
p area2(args1)

args2 = {x:2,y:2}
p area2(args2)

#把数组分解为参数：将参数传递给方法时，先分解数组，然后将分解后的数组元素作为参数传递给方法；、
#在调用方法时，如果以"*数组"这样的形式指定参数，这事传递方法就不是数组本身，而是数组的个元素按照顺序的参加；
#必须注意的是：数组的元素格式必须和方法的定义的参数格式是一样的。
def foo2(a,b,c)
    a + b + c
end
p foo2(1,2,3)

args1 = [2,3]
p foo2(1,*args1)

args2 = [1,2,3]
p foo2(*args2)

#把Hash当作参数传递：用{~}这样的形式来表示Hash的字面量(literal),将Hash的字面量作为参数传递给方法时可以省略。
def foo3(arg)
    arg
end
p foo3({"a"=>1,:b=>2})
p foo3(a:1,b:2) #省略{}

#当存在多个参数时，只能将Hash作为最后一个参数传递到方法内部。
def bar(arg1,arg2)
    [arg1,arg2]
end
p bar(100,{:a=>1,:b=>2})
p bar(100,"a"=>1,"b"=>3)
p bar(100,a:1,b:4)

=begin
编码规范：
1.换行、缩进以及空白
2.
=end
