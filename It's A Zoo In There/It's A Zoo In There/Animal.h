//
//  Animal.h
//  It's A Zoo In There
//
//  Created by WangZhong on 15-1-19.
//  Copyright (c) 2015年 Zhong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Animal : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *species;
@property (nonatomic,strong) NSNumber *age;
@property (nonatomic,strong) UIImage *image;
- (NSString *)description;
@end
