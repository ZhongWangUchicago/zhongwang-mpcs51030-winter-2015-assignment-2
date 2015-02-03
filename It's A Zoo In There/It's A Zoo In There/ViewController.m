//
//  ViewController.m
//  It's A Zoo In There
//
//  Created by WangZhong on 15-1-19.
//  Copyright (c) 2015年 Zhong. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import <UIKit/UIView.h>
#import "Array.h"
#import "Animal.h"
@interface ViewController ()
@property (nonatomic) NSMutableArray *AnimalsData;
@property (nonatomic) int currentPage;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    Animal *tiger = [[Animal alloc] init];
    tiger.name = @"Fury";
    tiger.species = @"Tiger";
    tiger.age = @10;
    tiger.image = [UIImage imageNamed:@"tiger.jpg"];
    Animal *panda = [[Animal alloc]init];
    panda.name = @"Lele";
    panda.species = @"Panda";
    panda.age = @5;
    panda.image = [UIImage imageNamed:@"panda.jpg"];
    Animal *monkey = [[Animal alloc] init];
    monkey.name = @"Happy";
    monkey.species = @"Monkey";
    monkey.age = @6;
    monkey.image = [UIImage imageNamed:@"monkey.jpg"];;
    
    self.AnimalsData  = [NSMutableArray array];
    [self.AnimalsData addObject:tiger];
    [self.AnimalsData addObject:monkey];
    [self.AnimalsData addObject:panda];
    self.animals = [self.AnimalsData mutableCopy];
    NSLog(@"animals before shuffle: %@", self.animals);
    self.animals = [self.animals shuffle];
    NSLog(@"animals after shuffle: %@", [self.animals shuffle]);
}

- (void)scrollEnd:(UIScrollView *)scrollView{
    self.animal.delegate = self;
    static NSInteger previousPage = 0;
    CGFloat pageWidth = self.animal.frame.size.width;
    CGFloat fractionalPage = self.animal.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    if (previousPage != page) {
        self.currentPage = (int)page;
        previousPage = page;
        NSLog(@"page %d", self.currentPage);
        UILabel *myLabel1 = [self.animals[self.currentPage] Label];
        myLabel1.alpha = 0.0;
        [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            myLabel1.alpha = 1.0;
        }completion:NULL];
        
    }
    if (previousPage == page) {
        self.currentPage = (int)page;
        UILabel *myLabel1 = [self.animals[self.currentPage] Label];
        myLabel1.alpha = 0.0;
        [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            myLabel1.alpha = 1.0;
        }completion:NULL];    }
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self loadScroll];
}

- (void) loadScroll{
    int number = (int)[self.animals count];
    [self.animal setContentSize: CGSizeMake(number * self.animal.frame.size.width, self.animal.frame.size.height)];
    
    for (int i = 0; i < number; i++) {
        UIImage *myimage = [self.animals[i] image];
        CGRect imageFrame = CGRectMake(self.animal.frame.size.width * i, 60, self.animal.frame.size.width, 400);
        self.imageView = [[UIImageView alloc]initWithImage:myimage];
        [self.imageView setFrame:imageFrame];
        [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
        self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.button.frame = CGRectMake(self.animal.frame.size.width * i, 20, self.animal.frame.size.width, 80);
        [self.button setTitle: [self.animals[i] name] forState:UIControlStateNormal];
        [self.button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
        self.button.tag = i;
        CGRect labelFrame = CGRectMake(self.animal.frame.size.width * i, 360, self.animal.frame.size.width, 80);
        self.Label = [[UILabel alloc]initWithFrame:labelFrame];
        self.Label.text = [self.animals[i] name];
        self.Label.font = [UIFont boldSystemFontOfSize:16.0f];
        self.Label.textAlignment = NSTextAlignmentCenter;
        
        [self.animal addSubview:self.button];
        [self.animal addSubview:self.imageView];
        [self.animal addSubview:self.Label];
    }
    self.animal.pagingEnabled = YES;
}

- (void)button: (id)sender {
    UIButton *button = (UIButton *)sender;
    int tag = (int)button.tag;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: [self.animals[tag] name]
                                                message: [NSString stringWithFormat:  @"The %@ is %@!", [self.animals[tag] species], [self.animals[tag] age]]
                                                delegate:self  cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    NSLog(@"%@", [self.animals[tag] description]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
