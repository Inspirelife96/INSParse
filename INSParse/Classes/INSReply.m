//
//  INSReply.m
//  INSParse
//
//  Created by XueFeng Chen on 2021/12/28.
//

#import "INSReply.h"

#import <Parse/PFObject+Subclass.h>

#import "INSParseTableDefines.h"

@implementation INSReply

@dynamic toComment;
@dynamic toReply;
@dynamic content;
@dynamic fromUser;
@dynamic likeCount;
@dynamic dislikeCount;

+ (NSString *)parseClassName {
    return kReplyClassKey;
}

@end
