//
//  TableViewController.m
//  BlogReader
//
//  Created by Jason Koceja on 8/26/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import "TableViewController.h"
#import "BlogPost.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/"];
    
    NSData *blogData = [NSData dataWithContentsOfURL:blogURL];
    
    NSError *error = nil;
    
    NSDictionary *blogDictionary = [NSJSONSerialization JSONObjectWithData:blogData options:0 error:&error];
    
    self.blogPosts = [NSMutableArray array];
    
    NSArray *blogPostArray = [blogDictionary objectForKey:@"posts"];
    
    for (NSDictionary *blogDictionary in blogPostArray) {
        BlogPost *blogPost = [BlogPost blogPostWithTitle:[blogDictionary objectForKey:@"title"]];
        blogPost.author = [blogDictionary objectForKey:@"author"];
        blogPost.thumbnail = [blogDictionary objectForKey:@"thumbnail"];
        [self.blogPosts addObject:blogPost];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.blogPosts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    
    if([blogPost.thumbnail isKindOfClass:[NSString class]]){
        
        NSData *imageData = [NSData dataWithContentsOfURL:blogPost.thumbnailURL];
    
        UIImage *image = [UIImage imageWithData:imageData];
    
        cell.imageView.image = image;
    }else{
        cell.imageView.image = [UIImage imageNamed:@"treehouse.png"];
    }
    cell.textLabel.text = blogPost.title;
    cell.detailTextLabel.text = blogPost.author;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

@end
