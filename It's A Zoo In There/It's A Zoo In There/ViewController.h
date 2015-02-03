//
//  ViewController.h
//  It's A Zoo In There
//
//  Created by WangZhong on 15-1-19.
//  Copyright (c) 2015年 Zhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Animal.h"
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *animal;
@property (nonatomic) UIButton *button;
@property (nonatomic) UILabel *Label;
@property (nonatomic) UIImageView *imageView;
@property (nonatomic) NSArray *animals;

- (void) loadScroll;
- (void) button: (id)sender;

@end

