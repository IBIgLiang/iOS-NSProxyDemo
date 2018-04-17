//
//  BGClothesProvider.m
//  ceshi
//
//  Created by zhangzhiliang on 2018/4/17.
//  Copyright © 2018年 zhangzhiliang. All rights reserved.
//

#import "BGClothesProvider.h"

@implementation BGClothesProvider

- (void)purchaseClothesWithSize:(BGClothesSize)size {
    
    switch (size) {
        case BGClothesSizeS:
            NSLog(@"我要买一件小号的衣服");
            break;
        case BGClothesSizeM:
            NSLog(@"我要买一件中号的衣服");
            break;
        case BGClothesSizeL:
            NSLog(@"我要买一件大号的衣服");
            break;
            
        default:
            break;
    }
}

@end
