#grep命令利用正则表达式搜索文本数据，输出按照指定模式匹配的行。

#Regexp.new(str):通过字符串创建一个新的模式
pattern = Regexp.new(ARGV[0])
file = File.read(ARGV[1])

file.each_line do |line|
    if pattern =~ line then
        print line
    end
end
file.close
