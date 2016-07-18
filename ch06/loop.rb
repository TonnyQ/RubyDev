=begin
1.程序中的循环是什么？重复执行的一段程序。
2.写循环时需要注意什么事项？循环的主体与循环的退出条件。
3.循环的种类以及写法：使用循环语句或者使用循环方法。
=end

#1.times方法：执行已知固定次数的循环,循环index从0开始。
7.times do |i|
    puts "#{i} 既自以心为形役，奚惆怅而独悲!"
end

#2.for语句：循环的开始值和结束值可以随意指定。不是任何对象都可以指定给for循环的，必须是可迭代对象；
sum = 0
for i in (1..5) #(1..5)表示循环的开始值以及结束值
    sum += i
end
puts sum

names = ["a","b","c"]
for name in names do
    puts name
end

#3.while语句：不管什么类型的循环，while语句都可以描述。
i = 1
while i < 4 do
    puts i
    i += 1
end

#4.until语句：until的判断条件刚好与while相反，不满足条件才执行循环处理,直到条件成立。
sum = 0
i = 1
until sum >= 50
    sum += i
    i += 2
end
puts sum , i

#5.each方法：将对象集合里的对象逐个取出。
names.each do |tt|
    puts tt
end
names.each { |tt3| #do~end block可以替换为{|var| } block
    puts tt3
}

#6.loop方法：没有终止循环条件，只是不断的执行循环处理.
=begin
loop do
    print "Ruby"
end
=end

#循环控制条件
#1.break：终止程序，跳出循环
#2.next：调到下一次循环
#3.redo：在相同的条件下重复刚才的处理
puts "break case"
i = 0
["perl","python","ruby","scheme"].each do |lang|
    i += 1
    if i == 3 then
        break #终止整个循环
    end
    p [i,lang]
end

puts "next case"
i = 0
["perl","python","ruby","scheme"].each do |lang|
    i += 1
    if i == 3 then
        next #相当于java中的continue,忽略next后面的部分，继续执行下一个循环
    end
    p [i,lang]
end

puts "redo case"
i = 0
["perl","python","ruby","scheme"].each do |lang|
    i += 1
    if i == 3 then
        redo #忽略redo后面的部分，重新从本轮循环的开始再次执行
    end
    p [i,lang]
end

#conclusion
=begin
1.times:确定的循环次数时使用
2.for：从对象取出元素时使用
3.while:希望自由指定循环条件时使用
4.until：使用while循环条件变得难懂时使用
5.each：从对象取出元素时使用
6.loop：不限制循环此时时使用（谨慎）

do~end与{~}
1.程序时跨行写的时候使用do~end
2.程序写在一行时使用{~}
=end
