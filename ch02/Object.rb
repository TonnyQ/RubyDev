#数组(Array)：是一个按顺序存储多个对象的对象，是基本的容器之一。

#1.数组的创建，需要把各数组元素用逗号隔开，然后再用[]括起来。
names = ["One","Two","Three"]
emptyArr = [] #create a empty array object

#2.从array中通过index取数组对象
puts names[0] #index从0开始

#3.将对象保存到数组中，在保存对象时，如果指定的数组中不存在的索引值时，则数组的大小会随之改变。Ruby数组的大小是按实际情况自动调整的。
names[0] = "one" #修改数组的第一个元素
puts names
names[3] = "four"
puts names,names.length

#4.数组的元素，任何对象都可以作为数组元素保存到数组中。Ruby支持多种不同对象的混合保存.
num = [1,2,3,4,5,6,7]
mixedArr = [1,2,"3","abc"]

#5.数组的大小,使用size方法获取数组的大小.
puts num.size
puts num.length

#6.数组的遍历:each后do~end之间的部分称之为块，each方法会把数组元素逐个取出，
#赋值给指定的"|变量|",block中的方法可以访问该变量，从而实现循环遍历数组的操作。
num.each do |n|
    if n % 2 == 0 then
        puts "#{n}是偶数"
    else
        puts "#{n}是奇数"
    end
end

#散列(Hash):是键值对(Key-Value)形式的数据结构。在Ruby中，一般是以字符串或者符号(Symbol)作为键，来保存对象的。
address = { name:"Tonny",pinyin:"dds",:postal => "1234323" }

#1.什么是符号?在Ruby中，符号(Symbol)与字符串对象类似，符号也是对象，一般作为名称标签来使用，用来表示方法等对象的名称
#创建符号，只需要在标识符的开头加上":".符号能实现的功能，大部分字符串也能实现。但是在散列中符号会比字符串更有效率。例如:
sym = :foo #表示符号“:foo”
p sym #print :foo
p sym.to_s #symbol to string,print "foo"
p "foo".to_sym #string to symbol,print :foo

#2.Hash的创建,与数组类似，Hash使用{}来创建。使用=>来定义获取对象时所需的键(Key),以及键相对应的对象(Value).
classes = {} #create a empty hash object
classes2 = { :student0=>"Bob",:student1=>"Tom" }

#3.从Hash中取对象，将对象保存到Hash。
puts classes2[:student0] #print "Bob"
classes2[:student2] = "Tonny" #add a element to hash
puts classes2[:student2]
puts classes2[:student4] #return nil,because :student4 don't exist.

#hash的遍历：使用each方法也能遍历hash中的元素，循环按照键值对组合遍历元素。
address.each do |key,value|
    print "key:#{key}---value:#{value}\n"
end

#正则表达式：在Ruby中处理字符串时，使用正则表达式进行模式匹配以及分隔字符串等操作。

#1.模式与匹配：判断字符串是否适用于某种模式的过程称之为匹配，如果适用则匹配成功；
# /模式/ =~ 匹配的字符串:匹配成功返回匹配的index，否则返回nil。
# nil是一个特殊的值，表示对象不存在。方法不能返回有意义的值时会返回nil；另外从数组或者hash里获取数据对象时，
# 若指定不存在的索引或者键，则得到的返回值也是nil;此外if和while在判断条件时，如果碰到false和nil，则认为条件为假，其余为真；
puts /cde/ =~ "abcdefg" #return match success start index is 2
puts /哈哈/ =~ "哈哈，安倍是条狗" #support chinese match
puts /Ruby/ =~ "ruby is good language." #默认大小写敏感，在模式后加i则对大小写不敏感
puts /hello/i =~ "HELLo" #success match
