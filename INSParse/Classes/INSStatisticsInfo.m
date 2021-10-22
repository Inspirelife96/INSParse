//
//  INSStatisticsInfo.m
//  INSParse
//
//  Created by XueFeng Chen on 2021/6/26.
//

#import "INSStatisticsInfo.h"

#import "INSParseTableDefines.h"

@implementation INSStatisticsInfo

@dynamic user;
@dynamic followCount;
@dynamic followedCount;
@dynamic feedCount;
@dynamic likedCount;

+ (NSString *)parseClassName {
    return kStatisticsInfoClassKey;
}

@end
