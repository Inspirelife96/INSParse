//
//  INSParseQueryManager+Follow.h
//  INSParse
//
//  Created by XueFeng Chen on 2021/6/24.
//

#import "INSParseQueryManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface INSParseQueryManager (Follow)

// Follow表查询
// fromUser的关注列表
+ (NSArray<PFUser *> *)queryFollowFromUser:(PFUser * __nullable)fromUser
                                    toUser:(PFUser * __nullable)toUser
                                      page:(NSInteger)page
                                 pageCount:(NSInteger)pageCount
                                     error:(NSError **)error;

// Follow表查询
+ (BOOL)isFollowFromUser:(PFUser *)fromUser toUser:(PFUser *)toUser error:(NSError **)error;


// Follow表添加
+ (BOOL)addFollowFromUser:(PFUser *)fromUser toUser:(PFUser *)toUser error:(NSError **)error;


// Follow表删除
+ (BOOL)deleteFollowFromUser:(PFUser *)fromUser toUser:(PFUser *)toUser error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
