//
//  BGBookProvider.h
//  ceshi
//
//  Created by zhangzhiliang on 2018/4/17.
//  Copyright © 2018年 zhangzhiliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BGBookProviderProtocol

- (void)purchaseBookWithTitle:(NSString *)title;

@end

@interface BGBookProvider : NSObject

@end
