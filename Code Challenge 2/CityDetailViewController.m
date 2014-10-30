//
//  CityDetailViewController.m
//  Code Challenge 2
//
//  Created by CHRISTINA GUNARTO on 10/30/14.
//  Copyright (c) 2014 Christina Gunarto. All rights reserved.
//

#import "CityDetailViewController.h"


@interface CityDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *cityImage;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;

@end

@implementation CityDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.city.name;
    self.cityImage.image = [UIImage imageWithData:self.city.image];
    self.cityNameLabel.text = self.city.name;
}



@end
