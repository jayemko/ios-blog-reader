//
//  WebViewController.h
//  BlogReader
//
//  Created by Jason Koceja on 9/1/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property (strong, nonatomic) NSURL *blogPostsURL;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
