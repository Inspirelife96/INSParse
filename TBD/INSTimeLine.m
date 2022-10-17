//
//  INSTimeLine.m
//  INSParse
//
//  Created by XueFeng Chen on 2021/6/22.
//

#import "INSTimeLine.h"

#import <Parse/PFObject+Subclass.h>

#import "INSParseDefines.h"

@implementation INSTimeLine

@dynamic fromUser;
@dynamic toUser;
@dynamic timeLineType;
@dynamic topic;
@dynamic post;
@dynamic reply;

+ (NSString *)parseClassName {
    return INSTimeLineKeyClass;
}

@end
