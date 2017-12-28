### 当一个有符号数和一个无符号数进行运算时,c语言会隐式地将有符号参数强制类型转换为无符号数

### ex2.25无符号数造成死循环

[代码](https://github.com/WallfacerRZD/CSAPP/blob/master/chapter2/ex2.25.c)

### ex2.26字符串长度比较
[代码](https://github.com/WallfacerRZD/CSAPP/blob/master/chapter2/ex2.26.c)

### 对于x+y的位级表示, 简单丢弃任何权重大于![](http://chart.googleapis.com/chart?cht=tx&chl=2^{w-1})的位数就可以计算出和模![](http://chart.googleapis.com/chart?cht=tx&chl=2^{w})

### 模数加法构成阿贝尔群(闭, 结, 幺, 逆, 可交换)

### ex2.27 检测无符号数溢出
[代码](https://github.com/WallfacerRZD/CSAPP/blob/master/chapter2/ex2.27.c)
### ex2.30 检测有符号数溢出
[代码](https://github.com/WallfacerRZD/CSAPP/blob/master/chapter2/ex2.30.c)

### ex2.31
```
/*detect whether arguments can be added without overflow*/
/*WARNING: This code is buggy*/
int tadd_ok(int x, int y) {
    int sum = x + y;
    return (sum-x == y) && (sum-y == x);
}
```
> 解答:
因为模数加法构成阿贝尔群具有交换性和逆元
> 故无论是否溢出以下等式成立:
> (x + y) -x = (x - x) + y = (0) + y = y
> (x + y) -y = x + (y - y) = x + (0) = x
> 所以返回值始终为1

[代码](https://github.com/WallfacerRZD/CSAPP/blob/master/chapter2/ex2.31.c)


