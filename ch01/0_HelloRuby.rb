=begin
Title:Ruby初探
1.使用Ruby：了解如何使用Ruby编写并执行程序
2.使用字符和数值：了解字符和数值是如何输出、计算以及给变量赋值等内容。
3.使用条件判断和循环处理：了解如何通过字符串或数值比较进行条件判断处理，以及如何进行循环处理。
=end

#使用ruby命令编译helloruby.rb文件：ruby HelloRuby.rb
#或者使用irb命令执行方法：irb进入交互命令行，输入print("Hello,Ruby.\n");
print("Hello,Ruby.\n")

#字符串、数值、时间等各种数据在Ruby中都是对象；
#使用单引号''输出字符串时，字符串中的转义字符不会生效，会完整的输出整个字符串；
print('hello\n,ruby.')

#例外情况是，转义\以及单引号''可以被转义输出
print('hello \\ \'ruby\'.')

#ruby调用方法时，()可以省略,但是建议不要省略()
print "Hello,Ruby."
#如果想联系输出多个字符串，可以使用逗号","分隔字符串，程序会按顺序输出。
print "Hello"," , Ruby."

#puts方法：与print方法不同，puts方法会在结尾自动加上换行符;
puts("\n1213232")
puts(323);
puts "Hello,","Ruby!" #puts输出多个参数时，会在输出每个参数的结尾都加上换行符

#p方法:使用p方法输出的结果会对值得类型加以区分,但是p方法不会对转义字符处理；
p "100" #print "100" -string
p 100   #print 100   -number
p "1000\t\n" #print "1000\t\n"

#中文字符输出：ruby对中文支持。但是在某些ruby环境里，执行包含中文的脚本时，可能会出错。
#这是由于编写程序时没有指定程序的编码方式造成的。Ruby程序的编码方式，是通过在程序的首行代码中添加注释
# "# encoding:编码方式"来指定的，这称为magic comment.例如:# encoding: utf-8
#从ruby2.0开始，若没有指定magic comment，ruby会默认UTF-8编码方式.
print "我是中国人，小日本去死!\n"
print "用着松本的语言，骂小日本怪不好意思的.\n"

#数值表示与计算
#1.在ruby程序里，整数和小数(浮点数)处理方式都很自然
#2.在ruby中，数值是以数值对象的形式存在的，即在ruby程序中操作的都是数值对象;
#3.在ruby中，可以使用数组函数，如平方根、sin和cos以及指数函数等，但必须加上Math.；
#4.不同的ruby版本，或者在不同的平台下执行，返回值的位数精度可能会不同。
p 1+1
p 1*3
p 1/3   #=> 0
p 1-3
p 0.5/3 #=> 0.1666666666
p Math.sin(0.45)  #或者在文件头出加上include Math.
p Math.sqrt(2)

#ruby的变量：“变量名=对象”
alphabet = "abcdefg"
num = 10

#example:建议使用有意义的名称作为变量名
x = 10
y = 20
z = 30
area = (x * y + y * z + x * z) * 2
volume = x * y * z
puts "表面积= ",area
puts "体积  = ",volume
print "表面积 = #{area}\n" #使用占位符输出,可以指定为变量或者表达式
print "表面积 = #{(x * y + y * z + x * z) * 2}\n"

#ruby的注释
#单行注释使用: #
#多行注释使用: =begin ... =end块

#这里是单行注释
=begin
这里是多行注释
#dddd，可以嵌套单行注释，但是不能嵌套多行注释
=end

#控制语句
#1.顺序控制：按照程序的顺序从头到尾执行。
#2.条件控制：若条件成立，则执行A，否则执行B。key：if、unless、case等
#3.循环控制：在某条件成立之前，反复执行。
#4.异常控制：发生某种异常，执行。

#if:条件一般是指能返回true或者false的表达式。
a = 30
if a == 2 then
    puts "true"
end
if a != 20     #此处省略then关键字
    puts " a != 2 is true"
end

#example
if a >= 10 then
    print "bigger\n"
else
    print "smaller\n"
end

#while
i = 1
while i <= 10 do  #此处的do关键字也可以省略
    print i,"\n"
    i = i + 1
end

#times：如果循环次数已经确定的，使用times会更加简单.
#times方法称为迭代器(iterator)，迭代器是ruby一个特色功能。迭代器表示是循环的容器。
#ruby提供了很多迭代器，典型的有times，each等；
loopnum = 10
loopnum.times do
    print "All work and no play makes Jack a dull boy.\n"
end
