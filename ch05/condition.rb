# encoding:utf-8
=begin
什么是条件判断？
条件判断中不可或缺的比较运算符、真假值、逻辑运算符
条件判断的种类以及其写法和使用方法
=end

#条件判断语句主要有以下三种：
#1.if语句
#2.unless语句
#3.case语句

#Ruby中的条件：
#真：false、nil以外的所有对象
#假：false、nil
#Ruby中的真/假并非绝对等同于true/false。不返回true或false的方法只要能返回nil，
#也可作为条件判断表达式来使用。并且约定，返回真假值得方法都要以"?"结尾。
p "".empty?

#逻辑运算符:&&、||、以及！

=begin
形式一
if condition then
    statement
end

形式二
if condition1 then
    statement0
elsif condition2 then
    statement1
else
    statemment2
end

=end

a = 120
b = 20
if a > b
    puts "a > b"
elsif a == b
    puts "a = b"
else
    puts "a < b"
end


#unless语句：与if语句刚好相反，即如果条件为假，则执行。相反不处理。
a = 10
b = 30
unless a > b then #when "a > b" is false,execute puts "a < b"
    puts "a < b"
else
    puts "a > b"
end

#case语句：用于比较多个条件值;case语句中，when判断值是否相等，实际使用的是"===",
#即左边的数值或者字符串时，"==="与“==”意义相同。除此之外，"==="还可以与"=~"一样用来
#判断正则表达式是否成功匹配，或者判断右边的对象是否属于左边的类等等。
tags = ["a","BR","c"]
tags.each do |tagname|
    case tagname
    when "p","A","a","B","Blockquate"
        puts "#{tagname} has child."
    when "Image","BR"
        puts "#{tagname} has no child."
    else
        puts "#{tagname} cannot be used."
    end
end

array = ["asdse",1,nil]
array.each do |item|
    case item
    when String
        puts "#{item} is a String."
    when Numeric
        puts "#{item} is s Numeric."
    else
        puts "#{item} is something."
    end
end

p (/zz/ === "xezzewse")
p (String === "sstr")
p ((1..3) === 2 )

#if修饰符与unless修饰符
a,b = 30,20
puts "a >= b" if a > b

#*************************************************************************
#对象的统一性：所有的对象都具有标识和值，标识用来表示对象的同一性。
=begin
1.Ruby中所有的对象都是唯一的，对象的ID可以通过object_id或者__id__方法获取。
2.可以使用equal?方法判断两个对象是否是同一个对象(ID是否相同);
3.对象的值就是对象拥有的信息，Ruby使用"=="判断对象的值是否相同；
4.Ruby还提供好了eql?方法来判断对象的值是否相等。"=="与eql?都是Object定义的方法，
大部分情况下执行结果都是一样的，但是在Numeric中重新定义eql?,使之能够判断数值精度。
=end
#*************************************************************************
ary1 = []
ary2 = []
p ary1.object_id
p ary2.object_id

str1 = "foo"
str2 = "foo"
str3 = str1
p str1.equal?(str2)  #the reference compare
p str1.equal?(str3)
p str1 == str2       #the value compare

p 1.0 == 1           #true
p 1.0.eql?(1)        #false,Hash use eql? to compare keys
hash = {0 => "0"}
p hash[0.0]          #nil
p hash[0]            #"0"
