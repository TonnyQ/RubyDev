#Ruby异常处理

#关于错误处理
#1.数据错误：数据格式错误等
#2.系统错误：硬件故障等
#3.程序错误：因调用了不存在的方法，属性，算法错误等导致错误结果，这类错误可修复；
#4.排除错误的原因：查看错误日志
#5.忽略错误
#6.恢复错误发生前的状态：向用户提示程序发生错误，指导用户改如何处理；
#7.重试一次
#8.终止程序

#异常处理:程序执行过程中，如果程序发生了错误就会发生异常。异常发生后，程序会暂时停止运行，并寻找是否
#有对应的异常处理程序。如果有则执行异常处理，如果没有程序就会报告异常信息，可能终止程序。

#异常日志的格式:
=begin
文件名：linenumber：in 方法名：错误信息（异常类名）
    from 文件名：linenumber：in 方法名
    |
=end

#异常处理的优点：
=begin
1.程序不需要逐个确认处理结果，也能自动检查出程序错误；
2.会同时报告发生错误的位置，便于排查错误；
3.正常处理与错误处理的程序可以分开书写，是程序便于阅读；
=end

#Ruby中异常处理的写法：
=begin
格式：
begin
    #可能发生异常的block
rescue => 引用异常对象的变量
    #发生异常时的处理block
end

异常自动赋值的变量：
$!:最后发生的异常
$@:最后发生的异常的位置信息

异常对象的方法：
class：异常的种类
message：异常信息
backtrace：异常堆栈信息
=end

#异常处理流程:不是所有的方法都需要异常处理，只需要根据需要在可能发生异常的方法中捕捉异常。
#异常的后处理：
=begin
begin
    #有可能发生异常的地方
rescue => 变量
    #发生异常后的处理
ensure
    #不管是否发生异常都希望执行的处理,例如关闭文件流，网络流等
end

begin
    #有可能发生异常的地方
rescue => 变量
    #发生异常后的处理
    retry #在rescue中调用后，begin以下的处理会再重做一遍
ensure
    #不管是否发生异常都希望执行的处理,例如关闭文件流，网络流等
end
=end

#指定需要捕捉的异常：当存在多个种类的异常，且需要按异常的中尅分别进行处理时
=begin
begin
    #有可能发生异常的地方
rescue Exception1，Exception2 => 变量
    #发生Exception1，Exception2异常后的处理
rescue Exception3 => 变量
    #发生Exception3异常后的处理
ensure
    #不管是否发生异常都希望执行的处理,例如关闭文件流，网络流等
end
=end

#rescue捕捉异常时不只会捕捉指定类，同时还会捕捉其子类；当不指定异常类时，程序会默认捕捉
#StandardError类以及其子类的异常；自定义异常一般继承自StandardError类，然后继承自这个新类。

#主动抛出异常
#使用raise方法，可以使程序主动抛出异常。在基于自己判定的条件抛出异常，或者把刚捕捉到的异常再次抛出
#并通知异常的调用者等情况下，我们可以使用raise方法；
#raise的四种调用形式：
#1. raise message：抛出RuntimeException,并把字符串作为message设置给新生成的异常对象；
#2. raise Exception：抛出执行的Exception；
#3. raise Exception，message：抛出指定Exception，并将message作为信息传递给Exception；
#4. raise：在rescue外抛出Runtime。在rescue中调用时，会再次抛出最后一次发生的异常($!)
