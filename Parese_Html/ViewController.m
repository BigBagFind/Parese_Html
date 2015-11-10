//
//  ViewController.m
//  Parese_Html
//
//  Created by 吴玉铁 on 15/11/10.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "ViewController.h"
#import "TFHpple.h"
#import "XPathQuery.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建二进制字符串
//    NSString *dataStr = [NSString stringWithContentsOfURL:[NSURL URLWithString:str] encoding:NSUTF8StringEncoding error:NULL];
    //NSString *filePath = [[NSBundle mainBundle]pathForResource:@"File" ofType:@"html"];
   // NSString *dataStr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSString *str = @"\n<p class=\"xqsxbox1\">\n<img src=\"resources/images/xqy_tu1.gif\" height=\"299\" width=\"788\">\n</p>\n<p class=\"xqsxbox1\">\n<img src=\"resources/images/xqy_tu2.gif\">\n</p>\n<p class=\"xqsxbox1\">\n<img src=\"resources/images/xqy_tu3.gif\">\n</p>\n\n";
    //转换二进制数据
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
//      NSData *data = [[NSData alloc] initWithContentsOfFile:@"example.html"];
    // Create parser
    TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
    //Get all the cells of the 2nd row of the 3rd table
//    NSArray *elements  = [xpathParser search:@"//table[3]/tr[2]/td"];
//    NSArray *elements  = [xpathParser searchWithXPathQuery:nodeString];
   // cd[@country]
    NSArray *elements = [xpathParser searchWithXPathQuery:@"//img[@src]"];
    // Access the first cell
    TFHppleElement *element = [elements objectAtIndex:0];
    // Get the text within the cell tag
    //NSString *content = [element content];
    NSLog(@"%@",element);
    NSLog(@"%@",[elements objectAtIndex:1]);
   // [xpathParser release];
    //[data release];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
