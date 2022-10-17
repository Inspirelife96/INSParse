//
//  INSParseOperationManager+TimeLine.h
//  INSParse
//
//  Created by XueFeng Chen on 2022/5/20.
//

#import "INSParseOperationManager.h"

NS_ASSUME_NONNULL_BEGIN

@class INSTimeLine;

@interface INSParseOperationManager (TimeLine)

// 查找某一个用户的活动轨迹
- (NSArray <INSTimeLine *> *)findTimeLineOfUser:(PFUser *)user page:(NSInteger)page pageCount:(NSInteger)pageCount error:(NSError **)error;


@end

NS_ASSUME_NONNULL_END
