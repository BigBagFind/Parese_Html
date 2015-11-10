//
//  AnalysisHtml.h
//  添加xml
//
//  Created by mac on 15/9/27.
//  Copyright (c) 2015年 chenhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnalysisHtml : NSObject


//解析页面新闻
+ (NSMutableDictionary *)analysisALLNewsHtmlWithURLStr:(NSString *)str node:(NSString *)node;

//解析一条新闻
+ (NSMutableDictionary *)analysisONENewsHtmlWithURLStr:(NSString *)str node:(NSString *)node;

@end
