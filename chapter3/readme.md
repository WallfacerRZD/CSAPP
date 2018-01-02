- ## 摩尔定律:当价格不变时，集成电路上可容纳的元器件的数目，约每隔18-24个月便会增加一倍，性能也将提升一倍。

- ## 汇编代码的主要特点是它用可读性更好的文本格式表示机器代码的二进制格式.

- ## 机器代码简单地将内存看成一个很大的,按字节寻址的数组

- ## C语言中的数组和结构,在机器代码中用一组连续的字节来表示,不区分有符号或无符号整数, 不区分各类型的指针, 不区分指针和整数

- ## 程序内存用虚拟地址来寻址, 在任意给定的时刻只有有限的一部分虚拟地址被认为是合法的.虚拟地址空间由操作系统负责管理


- ## 汇编代码格式: ATT和intel

- ## 寄存器
> - 8086有8个16位寄存器 %ax-%bp
> - 扩展到IA32(Intel Architecture 32bit)架构时, 这些寄存器也扩展到32位, 标号%eax-%ebp
> - 扩展到x86-64后, 这些寄存器扩展到64位, 标号%rax-%rbp此外还增加8个寄存器, 标号%r8-%r15;所有16个寄存器的地位部分都可以作为字节, 字, 双字, 和四字数字访问.

- ## 分支

### 用条件控制来实现条件分支

c语言中if-else语句通用形式模板如下:
```
if (test-expre){
    then-statement
}
else{
    else-statement
}
```
编译器通常会使用下面这种形式:
```
t = test-expre;
if (!t)
    goto false;
then-statement
goto done;
false:
    else-statment
done:
```
汇编器为then-statement和else-statement产生各自的代码块.插入条件和无条件分支,以保证能执行正确的代码块

### 用条件传送来实现条件分支
> - 编译器会计算两个表达式的值, 最后通过条件传送(cmove等指令)来把表达式的值传送给寄存器.
> - 优点是契合现代cpu流水线,避免分支预测错误造成的性能处罚
> - 缺点是如果两个表达式需要大量计算,会做大量不必要的计算.此外,如果两个表达式都计算可能会出现空指针的异常

### 编译器不具有足够的信息来做出可靠的决定使用(条件控制还是条件传送)

- ## 循环
#### do-while循环
通常会翻译为:
```
loop:
 body-statement
 t = test-expr;
 if (t)
    goto loop;
```

#### while循环
翻译方法
1. jump to middle(gcc -Og优化)
```
goto test;
loop:
    body-statement
test:
    t = test-expr;
    if (t)
        goto loop;
```
2. guarded-do(gcc -O1优化)
```
t = test-expr;
if(!t)
    goto done;
do
    body-statement
    while(test-expr)
done:
```

#### for循环
C语言标准说明下面两种代码行为一样
```
for (init-expr; test-expr; update-expre) {
    body-statement
}
```

```
init-expr
while (test-expre) {
    body-statement
    update-expr;
}

```
与for循环等价的while循环的翻译取决于优化等级(见while循环)









