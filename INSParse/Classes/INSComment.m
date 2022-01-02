//
//  INSComment.m
//  INSParse
//
//  Created by XueFeng Chen on 2021/6/22.
//

#import "INSComment.h"

#import <Parse/PFObject+Subclass.h>

#import "INSParseTableDefines.h"

@implementation INSComment

@dynamic category;

@dynamic toFeed;
@dynamic content;
@dynamic mediaContents;
@dynamic fromUser;
@dynamic replies;
@dynamic replyCount;
@dynamic likeCount;
@dynamic dislikeCount;

+ (NSString *)parseClassName {
    return kCommentClassKey;
}

@end
