//
//  Array.m
//  It's A Zoo In There
//
//  Created by WangZhong on 15-1-19.
//  Copyright (c) 2015年 Zhong. All rights reserved.
//

#import "Array.h"

@implementation NSArray (shuffle)
- (NSArray *) shuffle{
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (id anObject in self) {
        NSInteger randomIndex = arc4random() % ([tmpArray count] +1);
        [tmpArray insertObject: anObject atIndex:randomIndex];
    }
    
    return [NSArray arrayWithArray: tmpArray];
}
@end
