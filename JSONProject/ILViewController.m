//
//  ILViewController.m
//  JSONProject
//
//  Created by jeremy Templier on 05/06/12.
//  Copyright (c) 2012 particulier. All rights reserved.
//

#import "ILViewController.h"
#import "JSONKit.h"

@interface ILViewController ()

@end

@implementation ILViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"json"];
    NSString* sampleJSONString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSData* dataJSON = [sampleJSONString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary* jsonObject = [NSJSONSerialization JSONObjectWithData:dataJSON options:0 error:nil];
//    NSDictionary* jsonObject = [dataJSON objectFromJSONData];
//    NSDictionary* jsonObject = [sampleJSONString objectFromJSONString];

    NSLog(@"object: %@", jsonObject);
    NSLog(@"class: %@", [jsonObject class]);
    NSLog(@"popup: %@", [[jsonObject objectForKey:@"menu"] objectForKey:@"popup"]);
    
    NSMutableDictionary* dico = [NSMutableDictionary dictionary];
    [dico setObject:@"premier object" forKey:@"un"];
    [dico setObject:@"second object" forKey:@"deux"];
    [dico setObject:[NSArray arrayWithObject:@"dans un tableau"] forKey:@"array with one element"];
    [dico setObject:[NSNumber numberWithInt:3] forKey:@"a number"];
    
//    NSData* dataJSON = [dico JSONData];
//    NSString* stringJSON =  [dico JSONString];
    if ([NSJSONSerialization isValidJSONObject:dico]) {
        NSLog(@"serializable");
        NSData* dataJSON = [NSJSONSerialization dataWithJSONObject:dico options:0 error:nil];
        NSLog(@"dataJSON: %@", dataJSON);
        NSString* stringJSON =  [[NSString alloc] initWithData:dataJSON encoding:NSASCIIStringEncoding];
        NSLog(@"stringJSON: %@", stringJSON);
    } else {
        NSLog(@"no!");
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
