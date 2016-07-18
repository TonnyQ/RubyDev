class AccTest

    public #不指定参数时，以下的方法都被定义为public
    def pub
        puts "pub is public method."
    end
    #public :pub #把pub方法设定为public（可省略）

    private #不指定参数，以下所有的方法都被定义为private
    def priv
        puts "priv is a private method."
    end
    private :priv #把priv方法设定为private

    def pro
        puts "pro is a protected method."
    end
    protected :pro #把pro方法设定为protected
end

acc = AccTest.new
acc.pub
#acc.pro error,no access
#acc.priv error,no access
