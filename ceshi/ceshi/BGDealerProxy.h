//
//  BGDealerProxy.h
//  ceshi
//
//  Created by zhangzhiliang on 2018/4/17.
//  Copyright © 2018年 zhangzhiliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BGBookProvider.h"
#import "BGClothesProvider.h"

@interface BGDealerProxy : NSProxy<BGBookProviderProtocol, BGClothesProviderProtocol>

+ (instancetype)shareDealerProxy;

@end
