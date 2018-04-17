//
//  main.m
//  ceshi
//
//  Created by zhangzhiliang on 2018/4/17.
//  Copyright © 2018年 zhangzhiliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Cat.h"
#import "BGProxy.h"
#import "BGDealerProxy.h"

int main(int argc, const char * argv[]) {
//    Dog *dog = [[Dog alloc]init];
//
//    //OC中方法的调用本质上是给这个对象发送一个消息
//    Cat *cat = [[Cat alloc] init];
//
//    //开始复制拦截方法
//    BGProxy *proxy = [BGProxy alloc];
//    //开始变身成猫
//    [proxy transformObjc:cat];
//    //开始调猫的方法
//    [proxy performSelector:@selector(eat:) withObject:@"猫发出消息"];
//
//    //开始变身成狗
//    [proxy transformObjc:dog];
//    //开始调用学生的方法
//    [proxy performSelector:@selector(shut)];

    BGDealerProxy *dealerProxy = [BGDealerProxy shareDealerProxy];
    [dealerProxy purchaseBookWithTitle:@"我要找一个好工作"];
    [dealerProxy purchaseClothesWithSize:BGClothesSizeL];
    
    return 0;
}
