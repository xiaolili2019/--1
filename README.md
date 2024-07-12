# 优化类模型

大概问题背景是：一个b2c的仓库，分为存储区和前置区。存储区用来储存大件货物和接收来物，前置区用来作为订单拣选的区域，现在想通过调整存储区和前置区的面积比例，来找到总成本的最优解或者近似最优解。

大概设计一个这样的优化模型，问题定义，优化基本三要素加上一个基础的算法就行。

**解题思路：**

- `k_s`：存储区每平方米成本系数。
- `k_o`：存储区操作成本系数。
- `k_p`：前置区每平方米成本系数。
- `k_f`：前置区拣选成本系数。
- `S`：总面积。
- `x`：存储区占总面积的比例，范围在0到1之间。

### 分解表达式

表达式 `C` 分为两部分，分别对应存储区和前置区的成本计算。
$$
C=(ks⋅(x⋅S)2+ko⋅(x⋅S))+(kp⋅((1−x)⋅S)2+kf⋅((1−x)⋅S))
$$

### 目的

通过调整 `x` 的值，你可以找到使总成本 `C` 最小化的最优值 `x`。
![image](https://github.com/user-attachments/assets/4e7566ac-ba94-4a76-aa6b-397f514ea27e)



这个模型非常简单还有很多因素应该考虑。
![889dc6749c315356ca5adaa6501a39d](https://github.com/user-attachments/assets/f48837a4-9f33-4404-a61a-78f5e34b1056)


