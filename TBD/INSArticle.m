//
//  INSArticle.m
//  INSParse
//
//  Created by XueFeng Chen on 2021/8/28.
//

#import "INSArticle.h"

#import <Parse/PFObject+Subclass.h>

#import "INSParseDefines.h"

@implementation INSArticle

@dynamic contentFile;
@dynamic originalLink;

+ (NSString *)parseClassName {
    return @"Will Remove in Future";
//    
//    return kArticleClassKey;
}

@end
