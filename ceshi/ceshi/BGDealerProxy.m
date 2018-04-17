//
//  BGDealerProxy.m
//  ceshi
//
//  Created by zhangzhiliang on 2018/4/17.
//  Copyright © 2018年 zhangzhiliang. All rights reserved.
//

/**
 NSProxy 类似于一个多继承的关系
 作用: 可以通过一个NSProxy类里面,调用其他两个不相关的类,可以避免业务和代码模块之间的耦合
 步骤:
    1) 先将包含了需要涉及到的methods的class的方法进行注册,放置在如以下的methodsMap中
        此过程的主要步骤看registerMethodsWithTarget(通过Runtime机制,获取方法,可以获取h/m文件中的所有方法)
    2) 通过消息转发机制的forwardInvocation方法,获取消息子sel,得到方法名,然后在methodsMap获取对应所属的类,进行消息转发
    3) 通过methodSignatureForSelector方法,调用对应方法的实现
 */

#import "BGDealerProxy.h"
#import <objc/runtime.h>

@interface BGDealerProxy ()

@property (nonatomic, strong) BGBookProvider *bookProvider;

@property (nonatomic, strong) BGClothesProvider *clothesProvider;

@property (nonatomic, strong) NSMutableDictionary *methodsMap;

@end

@implementation BGDealerProxy

+ (instancetype)shareDealerProxy {
    
    return [[BGDealerProxy alloc] init];
}

- (instancetype)init {
    
    self.methodsMap = [[NSMutableDictionary alloc] init];
    self.bookProvider = [[BGBookProvider alloc] init];
    self.clothesProvider = [[BGClothesProvider alloc] init];
    
    [self registerMethodsWithTarget:self.bookProvider];
    [self registerMethodsWithTarget:self.clothesProvider];
    return self;
}

- (void)registerMethodsWithTarget:(id)target {
    
    unsigned int count = 0;
    
    Method * methodList = class_copyMethodList([target class], &count);
    
    for (int i = 0; i < count; i ++) {
        
        Method tempMethod = methodList[i];
        SEL sel = method_getName(tempMethod);
        const char *tempMethodName = sel_getName(sel);
        [self.methodsMap setValue:target forKey:[NSString stringWithUTF8String:tempMethodName]];
    }
    
    free(methodList);
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    
    SEL tempSEL = invocation.selector;//获取当前消息转发的消息子
    
    NSString *SELStr = NSStringFromSelector(tempSEL);
    
    id target = self.methodsMap[SELStr];
    
    if (target && [target respondsToSelector:tempSEL]) {
        [invocation invokeWithTarget:target];
    } else {
        [super forwardInvocation:invocation];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    
    NSString *methodName = NSStringFromSelector(sel);
    
    id target = self.methodsMap[methodName];
    
    if (target && [target respondsToSelector:sel]) {
        return [target methodSignatureForSelector:sel];
    } else {
        return [super methodSignatureForSelector:sel];
    }
}

@end
