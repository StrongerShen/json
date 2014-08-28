//
//  ViewController.m
//  json_practice
//
//  Created by Stronger Shen on 2014/7/28.
//  Copyright (c) 2014年 MobileIT. All rights reserved.
//

#import "ViewController.h"

static NSString * const kJSON = @"http://10.120.0.67/json/nature.php";

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _textView.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)downloadAction:(id)sender {
    NSURLRequest *request = [NSURLRequest requestWithURL: [NSURL URLWithString:kJSON]];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSDictionary *dictData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
/*
    NSMutableArray *tiangans = [[NSMutableArray alloc] initWithArray: [dictData objectForKey:@"tiangans"]];
    
    NSMutableArray *dizhis = [[NSMutableArray alloc] initWithArray: [dictData objectForKey:@"dizhi"]];
    
    NSMutableArray *rainbows = [[NSMutableArray alloc] initWithArray: [dictData objectForKey:@"rainbow"]];
    
    
    NSMutableString *strings = [NSMutableString new];
    
    
    for (NSString *item in rainbows) {
        [strings appendString:[NSString stringWithFormat:@"%@,",item]];
    }
    [strings appendString:@"\n"];
    
    for (NSString *item in tiangans) {
        [strings appendString:item];
    }
    [strings appendString:@"\n"];
    
    for (NSString *item in dizhis) {
        [strings appendString:item];
    }
*/
    
    NSMutableString *strings = [NSMutableString new];
//    for (NSString *key in @[@"rainbow",@"tiangans",@"dizhi"]) {
    for (NSString *key in [dictData allKeys]) {
        for (NSString *item in [dictData objectForKey:key]) {
            [strings appendString:[NSString stringWithFormat:@"%@,",item]];
        }
        [strings deleteCharactersInRange:NSMakeRange([strings length]-1, 1)];
        [strings appendString:@"\n"];
    }
    
    _textView.text = strings;
}


@end
