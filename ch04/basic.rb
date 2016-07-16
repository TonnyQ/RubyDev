#对象(Object):在ruby中，表现数据的基本单位；
#常用类型：数值对象、字符串对象、数组/散列对象、正则表达式对象、时间对象、文件对象以及符号对象等；

#类(Class):数值-Numeric、字符串-String、数组-Array、散列-Hash、正则表达式-Regexp
#文件-File、符号-Symbol;

#Ruby中有四种类型的变量
=begin
局部变量（loacl variable）：以英文字母或者_开头，在程序中的有效范围是局部的。
全局变量（global variable）：以$开头，主要名称相同，在程序中的任何地方有效；
实例变量（instance variable）：以@开头
类变量（class variable）：以@@开头
伪变量（pseudo variable）：预定义好的代表某特定值的特殊变量，不能改变其值。nil，true，false，self等都是伪变量；
=end

#首次给局部变量赋值的同时，也对该变量进行了初始化。如果引用了未初始化的局部变量，程序会抛出异常。
#s = x + 1 #use a undefined local variable or method
x = 1
print "x + 1: ",x + 1,"\n"

#Ruby中的常量：常量只能赋值一次，对已经赋值的常量再进行赋值，会做出警告；
#常量以大写英文字母开头。
TEST = 1 #define a constant variable
TEST = 2
puts TEST

#Ruby的保留字,保留字不能用作变量名或者方法名，否则Ruby会提示语法错误；
#example ： end = 1

#多重赋值，Ruby提供了一个只用一个表达式就能给多个变量赋值的方法。
#1.当左边被赋值的变量个数比较多时，Ruby会自动将nil赋值给未分配值得变量；
#2.当变量部分比较少时，Ruby会自动忽略掉该值，不会分配多余的值；
#3.当变量前加上"*"，表示Ruby会将未分配的值封装为数组赋值给该变量并且只能存在一个*变量；
a,b,c = 1,2,3
p a,b,c
a1,a2,a3 = 3,4
print "a1=#{a1} a2=#{a2} a3=#{a3}\n"
b1,b2 = 3,4,5
print "b1=#{b1} b2=#{b2}\n"
c1,*c2,c3 = 3,2,4,2,4
print "c1=#{c1} c2=#{c2} c3=#{c3}\n"
*c1,c2,c3 = 3,2,4,2,4
print "c1=#{c1} c2=#{c2} c3=#{c3}\n"
c1,c2,*c3 = 3,2,4,2,4
print "c1=#{c1} c2=#{c2} c3=#{c3}\n"

#置换变量的值swap
d1,d2 = 4,5
print "d1=#{d1} d2=#{d2}\n"
temp = d1
d1 = d2
d2 = temp
print "d1=#{d1} d2=#{d2}\n"

#获取数组的元素,Ruby会自动获取数据的元素进行多重赋值
ary = [3,23,245,43]
e1,*e2 = ary
print("e1=#{e1} e2=#{e2}\n")
e3, = ary
print("e3=#{e3}\n") #only assign the first array element 3

#获取嵌套数组的元素
ary2 = ["323",[2,4],"ag"]
a,b,c = ary2
print("a=#{a} b=#{b} c=#{c}\n")
a,(b1,b2),c = ary2
print("a=#{a} (b1=#{b1},b2=#{b2}) c=#{c}\n")

#变量命令规则
#1.不要过多的使用缩写的名称，尽量使用简单又完整的名称；
#2.对于多个单词组合的变量名，使用_隔开各个单词，或者单词以大写字母开头；
#example：类名的单词首字母大写，变量名则首个单词全小写以下划线分隔单词；
