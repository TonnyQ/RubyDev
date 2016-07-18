# encoding : utf-8
class RingArray < Array #指定父类
    def [](i) #重载操作符
        idx = i % size #重计算索引
        super(idx)
    end
end

wday = RingArray["日","月","火","金","木","水","土"]
puts wday[6]
puts wday[11]
puts wday[15]
puts wday[-1]
