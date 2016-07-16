#Ruby程序中，使用ARGV预定义好的数组来获取从命令行传递过来的数据。数组ARGV中的元素，
#就是在命令行中指定的脚本字符串参数

#编译指令：ruby ruby_script.rb args列表
puts "the first args:#{ARGV[0]}"
puts "the second args:#{ARGV[1]}"

#从命令参数获取的数据都是字符串，如果希望获取其他类型，则需要对获取的数据进行类型转换。
num0 = ARGV[0].to_i
num1 = ARGV[1].to_i #貌似会自动转型
puts "#{num0} + #{num1} = #{num0 + num1}"
