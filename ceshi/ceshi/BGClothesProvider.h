//
//  BGClothesProvider.h
//  ceshi
//
//  Created by zhangzhiliang on 2018/4/17.
//  Copyright © 2018年 zhangzhiliang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, BGClothesSize) {
    BGClothesSizeS,
    BGClothesSizeM,
    BGClothesSizeL,
};

@protocol BGClothesProviderProtocol

- (void)purchaseClothesWithSize:(BGClothesSize)size;

@end

@interface BGClothesProvider : NSObject

@end
