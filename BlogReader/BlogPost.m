//
//  BlogPost.m
//  BlogReader
//
//  Created by Jason Koceja on 8/29/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

// Designated Initializer
- (id) initWithTitle:(NSString *)title{
    self = [super init];
    if(self){
        self.title = title;
        self.thumbnail = nil;
        self.author = nil;
    }
    return self;
}

// Conventience Constructor
+ (id) blogPostWithTitle:(NSString *)title{
    return [[self alloc] initWithTitle:title];
}

- (NSURL *) thumbnailURL{
    return [NSURL URLWithString:self.thumbnail];
}

@end
