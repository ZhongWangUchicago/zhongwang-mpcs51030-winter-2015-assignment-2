//
//  Animal.m
//  It's A Zoo In There
//
//  Created by WangZhong on 15-1-19.
//  Copyright (c) 2015年 Zhong. All rights reserved.
//

#import "Animal.h"

@implementation Animal
-(NSString *)description{
    return [NSString stringWithFormat:@"name=%@,species=%@,age=%@",self.name,self.species,self.age];
}
@end
