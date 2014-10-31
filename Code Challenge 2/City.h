//
//  City.h
//  Code Challenge 2
//
//  Created by CHRISTINA GUNARTO on 10/30/14.
//  Copyright (c) 2014 Christina Gunarto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property NSString *name;
@property NSString *state;
@property NSData *image;
//@property UIImage *image;
@property NSURL *url;

- (instancetype)initWithName:(NSString *)name withState:(NSString *)state withImage:(NSData *)image withURL:(NSURL *)url;


@end
