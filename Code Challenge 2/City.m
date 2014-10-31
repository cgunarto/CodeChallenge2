//
//  City.m
//  Code Challenge 2
//
//  Created by CHRISTINA GUNARTO on 10/30/14.
//  Copyright (c) 2014 Christina Gunarto. All rights reserved.
//

#import "City.h"

@implementation City


- (instancetype)initWithName:(NSString *)name withState:(NSString *)state withImage:(NSData *)image withURL:(NSURL *)url
{
    self = [super init];
    self.name = name;
    self.state = state;
    self.image = image;
    self.url = url;
    return self;
}


- (void)getCityURL
{
    [self.delegate checkCityURL:self.url];
}

@end
