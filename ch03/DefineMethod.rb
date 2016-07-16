#Ruby中定义方法
def hello
    print "Hello,Ruby!\n"
end

#调用hello方法
print hello

def simple_grep(pattern,filename)
    file = File.read(filename)
    file.each_line do |line|
        if pattern =~ line then
            print line
        end
    end
    file.close
end
