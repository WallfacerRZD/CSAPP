- ## 当一个有符号数和一个无符号数进行运算时,c语言会隐式地将有符号参数强制类型转换为无符号数


- ## 对于x+y的位级表示, 简单丢弃任何权重大于![](http://chart.googleapis.com/chart?cht=tx&chl=2^{w-1})的位数就可以计算出和模![](http://chart.googleapis.com/chart?cht=tx&chl=2^{w})

- ## 模数加法构成阿贝尔群(闭, 结, 幺, 逆, 可交换)

- ## 对于补码加法来说, TMin是自己的加法逆元, 对其他任何x都有-x作为其加法逆元

- ## 对于任意整数值x, -x 和~x+1得到的结果完全一样

- ## C语言中无符号乘法被定义为产生W位的值(截断溢出的位),补码乘法相当于将结果转换为补码, 二者的位级表示是一样的

- ## 对于不固定字长和固定字长的乘法, 左移与乘以2的幂次等价

- ## 在大多数机器上,整数乘法指令相当慢,但编译器会用移位,加法和减法的组合进行优化.

- ## 对于无符号数, 使用逻辑右移, 与除以2的幂次后向下取整等价, 对于正数补码, 使用算术右移,算术右移效果与无符号数相同.对于负数补码, 使用算术右移或向下取整(-771.25 -> -772).可以加上适当的偏置量使得结果向上取整.
- ## 除法比乘法更慢, 编译器会优化

- ## 浮点加法
> 1. 浮点加法可交换, 不可结合
> 2. 除无穷和NaN外, 大多数值具有加法逆元(+无穷-无穷=NaN, NaN + x = NaN)
> 3. 浮点加法满足单调性:
> 如果a >= b, 对于任意a,b,x, 除了NaN有x + a >= x + b

- ## 浮点乘法
> 1. 浮点乘法封闭(可能产生无穷大和NaN), 可交换, 幺元为1.0
> 2. 由于可能溢出,舍入而失去精度, 不具可结合性.
> 3. 浮点乘法在加法上不具备分配性
> 4. 对于任意a,b,c(都不为NaN)有:
> a >= b 且 c >= 0 --> a * c >= b * c;
> a >= b 且 c <= 0 --> a * c <= b * c;
> 5. a != NaN, a * a >= 0;

- ## 强制转换
> 1. int转float: 不会溢出, 可能被舍入
> 2. int或float转double: 保存精确的数值
> 3. double转float: 可能溢出成+无穷或-无穷, 还可能被舍入
> 4. float转double或int: 值向零舍入



---
### ex2.25无符号数造成死循环

[代码](https://github.com/WallfacerRZD/CSAPP/blob/master/chapter2/ex2.25.c)

### ex2.26字符串长度比较
[代码](https://github.com/WallfacerRZD/CSAPP/blob/master/chapter2/ex2.26.c)

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

### ex2.35 检测乘法溢出
```
int tmult_ok(int x, int y) {
    int p = x * y
    return !x || p / x == y;
}
```
> 证明:见p104

### ex2.37改进XDR代码中的漏洞
```
// bug!
uint64_t asize = ele_cnt * (uint64_t) ele_size;
void *result = malloc(asize);
```
> 上面这段代码没有任何改进, 因为malloc的参数时size_t,任然会被截断,造成溢出;

```
// fix bug
uint64_t required_size = ele_cnt * (uint64_t)ele_size;
size_t request_size = (size_t)required_size;
if (request_size != required_size) {
    // overflow
    return;
}
void *result = malloc(request_size);
if (result == NULL) {
    // malloc failed
    return NULL;
}
// do something
```


