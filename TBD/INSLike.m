//
//  INSLike.m
//  INSParse
//
//  Created by XueFeng Chen on 2021/6/22.
//

#import "INSLike.h"

#import <Parse/PFObject+Subclass.h>

#import "INSParseDefines.h"

@implementation INSLike

@dynamic category;

@dynamic type;
@dynamic toTopic;
@dynamic toPost;
@dynamic fromUser;

+ (NSString *)parseClassName {
    return INSTopicLikeKeyClass;
}

@end
