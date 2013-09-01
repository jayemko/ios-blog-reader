//
//  BlogPost.h
//  BlogReader
//
//  Created by Jason Koceja on 8/29/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *date;

// Designated Initializer
- (id) initWithTitle:(NSString *)title;
// Convenience Constructor
+ (id) blogPostWithTitle:(NSString *)title;

- (NSURL *) thumbnailURL;

@end
