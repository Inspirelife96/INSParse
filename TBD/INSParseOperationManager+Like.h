//
//  INSParseOperationManager+Like.h
//  INSParse
//
//  Created by XueFeng Chen on 2021/6/24.
//

#import "INSParseOperationManager.h"

@class INSTopic;
@class INSPost;
@class INSReply;
@class INSTopicLike;
@class INSPostLike;
@class INSReplyLike;

NS_ASSUME_NONNULL_BEGIN

@interface INSParseOperationManager (Like)

//// 查询喜欢某个Topic的所有用户
//+ (NSArray<PFUser *> *)queryWhoLikesTopic:(INSTopic *)toTopic error:(NSError **)error;
//
//// 查询某个用户喜欢的所有Topic
//+ (NSArray<PFUser *> *)queryWhoLikesTopic:(INSTopic *)toTopic error:(NSError **)error;
//
//+ (NSArray<PFUser *> *)findUsersWhoLikesTopic:(INSTopic *)topic page:(NSInteger)page pageCount:(NSInteger)pageCount error:(NSError **)error;
//
//+ (NSArray<INSTopic *> *)findTopicsLikedByUser:(PFUser *)fromUser page:(NSInteger)page pageCount:(NSInteger)pageCount error:(NSError **)error;
//
/////**
//// 查询XX用户喜欢的Topics，满足需求4
////
//// 这个API会从Like表中进行查询，此时我们不考虑黑名单的情况了。
//// 暂时的方案是：如果喜欢的内容由黑名单用户发布，那么继续展示，并由用户自己来进行后续的操作。
////
//// @param category 分类/板块，可以为nil，nil情况下不设置该条件。
//// @param fromUser XX用户
//// @param page 第几页，必须设置为 > 0的整数
//// @param pageCount 每页的记录数, 必须设置为 > 0的整数
//// @param error 出错信息， 不可以nil
////
//// @return 返回查询到的Topic列表，没有则返回空数组。
//// */
////+ (NSArray<INSTopic *> *)queryTopicWithCategory:(INSCategory * _Nullable)category
////                                   likeFromUser:(PFUser *)fromUser
////                                        orderBy:(NSString *)orderBy
////                                           page:(NSInteger)page
////                                      pageCount:(NSInteger)pageCount
////                                          error:(NSError **)error;
//
//
//+ (NSArray *)queryLikeToTopic:(INSTopic *__nullable)toTopic fromUser:(PFUser *__nullable)fromUser error:(NSError **)error;
//+ (NSArray *)queryLikeToPost:(INSPost *__nullable)toPost fromUser:(PFUser *__nullable)fromUser error:(NSError **)error;
//
//+ (BOOL)isTopic:(INSTopic *)topic likedbyUser:(PFUser *)user error:(NSError **)error;
//+ (BOOL)isPost:(INSPost *)post likedbyUser:(PFUser *)user error:(NSError **)error;
//+ (BOOL)isReply:(INSReply *)reply likedbyUser:(PFUser *)user error:(NSError **)error;
//
//// Like表添加
//
//+ (BOOL)addTopicLikeWithFromUser:(PFUser *)fromUser toTopic:(INSTopic *)toTopic error:(NSError **)error;
//
//+ (BOOL)addPostLikeWithFromUser:(PFUser *)fromUser toPost:(INSPost *)toPost error:(NSError **)error;
//
//+ (BOOL)addReplyLikeWithFromUser:(PFUser *)fromUser toReply:(INSReply *)toReply error:(NSError **)error;
//
//
//// Like表删除
//+ (BOOL)deleteTopicLike:(INSTopicLike *)topicLike error:(NSError **)error;
//+ (BOOL)deletePostLike:(INSPostLike *)postLike error:(NSError **)error;
//+ (BOOL)deleteReplyLike:(INSReplyLike *)replyLike error:(NSError **)error;
//+ (BOOL)deleteTopicLikeFromUser:(PFUser *)fromUser toTopic:(INSTopic *)toTopic error:(NSError **)error;
//+ (BOOL)deletePostLikeFromUser:(PFUser *)fromUser toPost:(INSPost *)toPost error:(NSError **)error;
//+ (BOOL)deleteReplyLikeFromUser:(PFUser *)fromUser toReply:(INSReply *)toReply error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
