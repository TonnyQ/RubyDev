#请求使用库,库名省略“.rb”;库与脚本放在同一文件夹中，需要用"./"来明示文件存放在当前目录；
require "./DefineMethod"
require "date"
require "pp" #pretty print

pattern = Regexp.new(ARGV[0])
filename = ARGV[1]

#use standard library
days = Date.today - Date.new(1993,2,24)
puts days.to_i

v = [{
    key00: "Ruby is good.",
    key01: "Ruby is terrible.",
    :key02 => "Ruby is sb."
    }]
p v
pp v#?????

#use custom library method
simple_grep(pattern,filename)
