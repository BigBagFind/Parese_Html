////
////  AnalysisHtml.m
////  添加xml
////
////  Created by mac on 15/9/27.
////  Copyright (c) 2015年 chenhao. All rights reserved.
////
//
//#import "AnalysisHtml.h"
//#import "TFHpple.h"
//#import "TFHppleElement.h"
//#import "XPathQuery.h"
////#import "RegexKitLite.h"
//
//@implementation AnalysisHtml
//
//
//+ (NSMutableDictionary *)analysisALLNewsHtmlWithURLStr:(NSString *)str node:(NSString *)node
//{
//    str = [edu_news_base stringByAppendingString:str];
//    //创建二进制字符串
//    NSString *dataStr = [NSString stringWithContentsOfURL:[NSURL URLWithString:str] encoding:NSUTF8StringEncoding error:NULL];
//    //转换二进制数据
//    NSData *data = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
//    //创建tfhpple类
//    TFHpple *hpple = [[TFHpple alloc] initWithHTMLData:data];
//    
//    //创建字典接收数据
//    
//    NSMutableDictionary *allDataDic = [NSMutableDictionary dictionary];
//    //创建可变数组接收数据
//    NSMutableArray *allDataAry = [NSMutableArray array];
//    
//    NSArray *node1Ary = [hpple searchWithXPathQuery:@"//div[@class = 'NewsPage']//script"];
//    if (node1Ary) {
//        TFHppleElement *element = [node1Ary lastObject];
//        NSString *raw = element.raw;
//        NSString *regex = @"(?<=共).+(?=条记录)";
//        NSArray *ary = [raw componentsMatchedByRegex:regex];
//        NSString *allItem = [ary lastObject];
//        
//        if (allItem && allItem.length != 0) {
//            [allDataDic setObject:allItem forKey:@"count"];
//        }
//    }
//    
//    //获取节点数组
//    NSArray *nodeAry = [hpple searchWithXPathQuery:node];
//    
//    //遍历数组
//    for (TFHppleElement *element in nodeAry) {
//        NSMutableDictionary *subDic = [NSMutableDictionary dictionary];
//        //获取子属性数组
//        NSArray *subAry = element.children;
//        if (subAry != nil) {
//            for (TFHppleElement *subElement in subAry) {
//                //获取属性
//                NSDictionary *attribute = subElement.attributes;
//                if (attribute.count != 0) {
//                    [subDic addEntriesFromDictionary:attribute];
//                }
//                else
//                {
//                    [subDic setObject:subElement.content forKey:@"time"];
//                }
//            }
//            
//        }
//        //将每一条属性字典拼接到数组后
//        [allDataAry addObject:subDic];
//    }
//    [allDataDic setObject:allDataAry forKey:@"plist"];
//    
//    return allDataDic;
//}
//
/////error
///*
//+ (NSMutableArray *)aanalysisONENewsHtmlWithURLStr:(NSString *)str node:(NSString *)node
//{
//    node = @"//div[@class='page_show']";
//    //创建二进制字符串
//    NSString *dataStr = [NSString stringWithContentsOfURL:[NSURL URLWithString:str] encoding:NSUTF8StringEncoding error:NULL];
//    //转换二进制数据
//    NSData *data = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
//    //创建tfhpple类
//    TFHpple *hpple = [[TFHpple alloc] initWithHTMLData:data];
//    //获取节点数组
//    NSArray *nodeAry = [hpple searchWithXPathQuery:node];
//    //创建可变数组接收数据
//    NSMutableArray *allDataAry = [NSMutableArray array];
//    //遍历数组
//    for (TFHppleElement *element in nodeAry)
//    {
//        NSMutableDictionary *subDic = [NSMutableDictionary dictionary];
//        
//        
//        //获取子属性数组
//        
//        //获取来源
//        NSArray *news_info = [element childrenWithClassName:@"news_info"];
//        if (news_info) {
//            TFHppleElement *newsSource = [news_info lastObject];
//            //来源
//            NSString *str = newsSource.content;
////            str = [str substringFromIndex:4];
////            NSString *source = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
////            source = [source substringToIndex:source.length - 3];
//            NSString *source = [self removeSpace:str];
//            
//            //count
//            NSArray *newsary = newsSource.children;
//            TFHppleElement *news1 = newsary[1];
//            NSDictionary *dic = news1.attributes;
//            NSString *count = dic[@"src"];
//            NSString *url = [edu_news_base stringByAppendingString:count];
//            NSString *sourceCount = [NSString stringWithContentsOfURL:[NSURL URLWithString:url] encoding:NSUTF8StringEncoding error:NULL];
//            NSString *regex = @"\\d+";
//            NSArray *countAry = [sourceCount componentsMatchedByRegex:regex];
//            NSString *countStr = [countAry lastObject];
//            source = [source stringByAppendingString:countStr];
//            //存入字典
//            [subDic setObject:source forKey:@"source"];
//        }
//        
//        //获取内容
//        NSArray *news_content = [element childrenWithClassName:@"news_content"];
//        NSString *imageNode = @"//img";
//        if (news_content)
//        {
//            TFHppleElement *element = [news_content lastObject];
//            
//            NSArray *content = [element searchWithXPathQuery:@"//div//div"];
//            //获取内容
//            if (content) {
//                TFHppleElement *contentElement = [content lastObject];
//                NSString *content = contentElement.content;
//                content = [self segmentDisplay:content];
//                
//                [subDic setObject:content forKey:@"content"];
//            }
//            
//            //获取imageUrl
//            NSArray *imageAry = [element searchWithXPathQuery:imageNode];
//            if (imageAry) {
//                NSMutableArray *allImageAry = [NSMutableArray array];
//                for (TFHppleElement *imageElement in imageAry) {
//                    NSDictionary *dic = imageElement.attributes;
//                    NSString *str = imageElement.raw;
//                    NSString *imageStr = [self acquireImageUrl:str];
//                    [allImageAry addObject:imageStr];
//                }
//                [subDic setObject:allImageAry forKey:@"imageAry"];
//            }
//            
//        }
//        [allDataAry addObject:subDic];
//        
//    }
//    return allDataAry;
//}
//*/
//
//
//
//+ (NSMutableDictionary *)analysisONENewsHtmlWithURLStr:(NSString *)str node:(NSString *)node
//{
//    str = [edu_news_base stringByAppendingString:str];
//    node = @"//div[@class='page_show']";
//    //创建二进制字符串
//    NSString *dataStr = [NSString stringWithContentsOfURL:[NSURL URLWithString:str] encoding:NSUTF8StringEncoding error:NULL];
//    //转换二进制数据
//    NSData *data = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
//    //创建tfhpple类
//    TFHpple *hpple = [[TFHpple alloc] initWithHTMLData:data];
//    //获取节点数组
//    NSArray *nodeAry = [hpple searchWithXPathQuery:node];
//    //创建可变数组接收数据
//    NSMutableDictionary *allDataAry = [NSMutableDictionary dictionary];
//    //遍历数组
//    for (TFHppleElement *element in nodeAry)
//    {
//        NSMutableDictionary *subDic = [NSMutableDictionary dictionary];
//        
//        
//        //获取子属性数组
//        
//        //获取来源
//        NSArray *news_info = [element childrenWithClassName:@"news_info"];
//        if (news_info) {
//            TFHppleElement *newsSource = [news_info lastObject];
//            //来源
//            NSString *str = newsSource.content;
//            //            str = [str substringFromIndex:4];
//            //            NSString *source = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//            //            source = [source substringToIndex:source.length - 3];
//            NSString *source = [self removeSpace:str];
//            
//            //count
//            NSArray *newsary = newsSource.children;
//            TFHppleElement *news1 = newsary[1];
//            NSDictionary *dic = news1.attributes;
//            NSString *count = dic[@"src"];
//            NSString *url = [edu_news_base stringByAppendingString:count];
//            NSString *sourceCount = [NSString stringWithContentsOfURL:[NSURL URLWithString:url] encoding:NSUTF8StringEncoding error:NULL];
//            NSString *regex = @"\\d+";
//            NSArray *countAry = [sourceCount componentsMatchedByRegex:regex];
//            NSString *countStr = [countAry lastObject];
//            source = [source stringByAppendingString:countStr];
//            //存入字典
//            [subDic setObject:source forKey:@"source"];
//        }
//        
//        //获取内容
//        NSArray *news_content = [element childrenWithClassName:@"news_content"];
////        NSString *imageNode = @"//img";
//        if (news_content)
//        {
//            TFHppleElement *element = [news_content lastObject];
//            
//            NSArray *content = [element searchWithXPathQuery:@"//div//div"];
//            //获取内容
//            if (content) {
//                TFHppleElement *contentElement = [content lastObject];
//                NSString *raw = contentElement.raw;
//                NSString *regex = @"<p>\\s+<img.+?</p>";
//                NSArray *datas = [raw componentsMatchedByRegex:regex];
//                NSMutableArray *imageAry = [NSMutableArray array];
//                
//                /*
//                 <p>  <img alt="" width="640" height="408" src="/UploadFile/201509/20150915011319333.jpg"/><br/><br/>　　    校领导费君清、薛安克、陈畴镛、金一斌、冯浩、孙玲玲、胡华、郑宁，各学院、部门负责人，学生家长、合作单位代表、军训教官以及部分教职工出席开学典礼。典礼由校党委副书记金一斌主持。</p>
//                 */
//                for (NSString *oneValue in datas) {
//                    NSMutableDictionary *imageDic = [NSMutableDictionary dictionary];
//                    NSString *imageUrlStr = [self acquireImageUrl:oneValue];
//                    //取出imageUrl
//                    if (imageUrlStr) {
//                        [imageDic setObject:imageUrlStr forKey:@"imageUrl"];
//                    }
//                    NSString *imageContent = [self acquireImageContent:oneValue];
//                    //取出imageContent
//                    if (imageContent) {
//                        [imageDic setObject:imageContent forKey:@"imageContent"];
//                    }
//                    //将imageDic存入数组
//                    if (imageDic.count > 0) {
//                        [imageAry addObject:imageDic];
//                    }
//                    //删除图片内容
//                    raw = [raw stringByReplacingOccurrencesOfRegex:oneValue withString:@""];
//                    
//                }
//                //存入大字典
//                if (imageAry.count > 0) {
//                    [subDic setObject:imageAry forKey:@"image"];
//                }
//                
//                
//                //修改content
//                raw = [self acquireRawContect:raw];
//                
//                
//                
//               // [self acquireContentAndImageUrl:raw];
//                
//                /*
//                 <p>  <img alt="" width="640" height="392" src="/UploadFile/201509/20150915011417659.jpg"/></p
//                 */
//                
//                [subDic setObject:raw forKey:@"content"];
//            }
//            
//        
//            
//        }
//        allDataAry = subDic;
//        
//    }
//    return allDataAry;
//}
//
//
//
//
//
//
//
////将字符串分段显示
//+ (NSString *)segmentDisplay:(NSString *)str
//{
//    NSString *regex = @"\\s{2,}";
//    NSArray *ary = [str componentsMatchedByRegex:regex];
//    for (NSString *space in ary) {
//        str = [str stringByReplacingOccurrencesOfString:space withString:@"\r\n   "];
//    }
//   // str = [str stringByReplacingOccurrencesOfString:@"   " withString:@"\r\n    "];
//    str = [NSString stringWithFormat:@"  %@",str];
//    return str;
//}
//
////获取imageUrl
//+ (NSString *)acquireImageUrl:(NSString *)str
//{
//    NSString *regex = @"(?<=src=\").+(?=\")";
//    NSArray *ary = [str componentsMatchedByRegex:regex];
//    return [ary lastObject];
//}
//
////获取imageContent
//+ (NSString *)acquireImageContent:(NSString *)str
//{
//    NSString *regex = @"(?<=<br/>).+(?=</p>)";
//    NSArray *ary = [str componentsMatchedByRegex:regex];
//    str = [ary lastObject];
//    str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//    return str;
//}
//
//
////获取新闻内容
//+ (NSString *)acquireRawContect:(NSString *)str
//{
//    NSString *regex = @"(?<=<p>).+(?=</p>)";
//    NSArray *ary = [str componentsMatchedByRegex:regex];
//    str = [ary lastObject];
//    str = [str stringByReplacingOccurrencesOfString:@"<br/>" withString:@"\n"];
//    str = [NSString stringWithFormat:@"     %@",str];
//    return str;
//}
//
//
////消除空格
//+ (NSString *)removeSpace:(NSString *)str
//{
//    str = [str substringFromIndex:4];
//    NSString *source = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//    source = [source substringToIndex:source.length - 3];
//    return source;
//}
//
//
//
///*
// 9月14日晚，下沙校区体育馆内灯光璀璨，青春洋溢，怀揣希望与梦想的5000余名2015级博士研究生、硕士研究生、本科生和海外留学生相聚于此，参加隆重的开学典礼。  　　    校领导费君清、薛安克、陈畴镛、金一斌、冯浩、孙玲玲、胡华、郑宁，各学院、部门负责人，学生家长、合作单位代表、军训教官以及部分教职工出席开学典礼。典礼由校党委副书记金一斌主持。  　　    在民乐、西洋乐欢快明朗的演奏中，开学典礼拉开序幕。校领导为新生代表佩戴杭电校徽，祝贺他们成为一名新杭电人。　　校长薛安克热情致辞，他向每个新生提出一个问题：“作为杭电人，你可曾认真思考过：杭电四年准备怎样度过？”薛安克说，仰望生命之树，挂满枝头的是一串串的悔与不悔。后悔选错了学校，选错了专业，跟错了导师，进错了公司……人生岂是一个悔字了得。悔与不悔完全是由自己对待生命的态度所决定的。今天我们不谈人生无悔，只谈大学不悔，杭电四年不悔。  　　    薛安克说，大学生活要有“三个不悔”：不要为没有被录取理想的专业而后悔，只要有梦想，肯奋斗，心愿定能实现，请大家“努力”而不悔；不要为没有改变学习而后悔，来一次“学习的革命”，颠覆原来的学习方式，请大家“改变”而不悔；不要为没有创新实践而后悔，尽情地拥抱并融入这“万众创新，大众创业”的潮流，请大家“行动”而不悔。　　薛安克也对同学们提出“三个期望”，希望大家不悔于德行，因为在德行上犯的错实在难以追悔；不悔于青春，青春盛载着梦想，不要给梦想留下遗憾和悔恨；不悔于时代，在这个生活、学习、工作与思维大变革的时代，要有颠覆世界的魄力，既成为时代的宠儿，更应做时代的弄潮儿。　　最后，薛安克深情祝愿同学们，作为杭电人，牢记学校历史，践行“笃学力行，守正求新”的校训，经过四年的努力，从优秀走向卓越。大学无憾，青春不悔。（校长薛安克在2015级新生开学典礼上的讲话全文）　　典礼上，17个学院进行了各具特色的风采展示。或融汇古今，引经据典，将学科历史娓娓道来；或以科技制胜，将学院最高精尖的科技成果进行展示；或创意无限，将别具一格的表演搬上舞台。卓越学院的“奔跑吧，卓越君”、计算机学院的“杭电好学院”、电子信息学院和自动化学院的机器人表演，经济学院的经世济民主题沙画以及国际教育学院留学生们倾情演绎的歌曲《我爱北京天安门》等精彩节目，赢得了现场经久不息的掌声。各学院领导、教授代表依次登台献词、亲切寄语，欢迎新生们的到来。毕业生、在校生和新生代表也走上舞台，共同表达“杭电+我，梦想飞跃，共创未来”的美好期许。    　　    今年的开学典礼将典礼与晚会完美融合，璀璨的灯光、炫目的背景、精致的舞台，还有教职工代表、历届校“十佳歌手”代表、校大学生艺术团等联袂献上的精彩文艺汇演，都让新生们饱足耳福、眼福，提前感受到大学生活的丰富多彩。（校新闻中心/文  宋建跃、焦点摄影/摄）
// */
//
//@end
