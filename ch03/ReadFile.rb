=begin
从文件中读取数据：
1.打开文件
2.读取文件中的文本数据
3.输出文件的文本数据
4.关闭文件流
=end
filename = ARGV[0]
file = File.open(filename)

#全部读取
#1.一次读取所有文件内容非常耗时；
#2.读取文件的内容会暂时保存在内存中，遇到大文件时，程序有可能因此而崩溃;
#content = file.read #读取整个文件，存放在内存中
#print content

#逐行读取
file.each_line do |line|
    print line
end

file.close
