//
//  INSParseOperationManager+Like.m
//  INSParse
//
//  Created by XueFeng Chen on 2021/6/24.
//

#import "INSParseOperationManager+Like.h"

#import "INSParseDefines.h"
#import "INSLike.h"
#import "INSTimeLine.h"

#import "INSParseOperationManager+Activity.h"

@implementation INSParseOperationManager (Like)

#pragma mark Public Methods

//+ (NSArray *)queryLikeToTopic:(INSTopic *)toTopic fromUser:(PFUser *)fromUser error:(NSError **)error {
//    return [INSParseOperationManager _queryLikeToTopic:toTopic toPost:nil fromUser:fromUser error:error];
//}
//
//+ (NSArray *)queryLikeToPost:(INSPost *)toPost fromUser:(PFUser *)fromUser error:(NSError **)error {
//    return [INSParseOperationManager _queryLikeToTopic:nil toPost:toPost fromUser:fromUser error:error];
//}
//
//+ (BOOL)isTopic:(INSTopic *)feed likedbyUser:(PFUser *)user error:(NSError **)error {
//    return [INSParseOperationManager _isTopic:feed orPost:nil likedbyUser:user error:error];
//}
//
//+ (BOOL)isPost:(INSPost *)comment likedbyUser:(PFUser *)user error:(NSError **)error {
//    return [INSParseOperationManager _isTopic:nil orPost:comment likedbyUser:user error:error];
//}
//
//+ (BOOL)addLikeWithCategory:(NSNumber *)category
//                       type:(NSNumber *)type
//                     toTopic:(INSTopic *)toTopic
//                  toPost:(INSPost *)toPost
//                   fromUser:(PFUser *)fromUser
//                      error:(NSError **)error {
//    NSAssert(fromUser, @"fromUser不能为空");
//    
//    BOOL succeeded = NO;
//    if ([type integerValue] == INSParseLikeTypeTopic) {
//        NSAssert(toTopic, @"如果是喜欢Topic，那么Topic不能为空");
//        succeeded = [INSParseOperationManager isTopic:toTopic likedbyUser:fromUser error:error];
//    }
//    
//    if ([type integerValue] == INSParseLikeTypePost) {
//        NSAssert(toTopic, @"如果是喜欢Post，那么Post不能为空");
//        succeeded = [INSParseOperationManager isPost:toPost likedbyUser:fromUser error:error];
//    }
//    
//    if (*error) {
//        return NO;
//    } else {
//        if (succeeded) {
//            return YES;
//        } else {
//            INSLike *like = [[INSLike alloc] init];
//            like.category = category;
//            like.toTopic = toTopic;
//            like.toPost = toPost;
//            like.fromUser = fromUser;
//            
//            succeeded = [like save:error];
//            
//            if (succeeded) {
//                return [INSParseOperationManager addLikeActivity:like error:error];
//            } else {
//                return NO;
//            }
//        }
//    }
//}
//
//+ (BOOL)deleteLike:(INSLike *)like error:(NSError **)error {
//    BOOL succeeded = [INSParseOperationManager deleteLikeActivity:like error:error];
//    
//    if (succeeded) {
//        return [like delete:error];
//    } else {
//        return NO;
//    }
//}
//
//+ (BOOL)deleteLikeToTopic:(INSTopic *)toTopic fromUser:(PFUser *)fromUser error:(NSError **)error {
//    return [INSParseOperationManager _deleteLikeToTopic:toTopic toPost:nil fromUser:fromUser error:error];
//}
//
//+ (BOOL)deleteLikeToPost:(INSPost *)comment fromUser:(PFUser *)fromUser error:(NSError **)error {
//    return [INSParseOperationManager _deleteLikeToTopic:nil toPost:comment fromUser:fromUser error:error];
//}
//
//
//#pragma mark Private Methods
//
//+ (NSArray *)_queryLikeToTopic:(INSTopic *)toTopic toPost:(INSPost*)toPost fromUser:(PFUser *)fromUser error:(NSError **)error {
//    PFQuery *query = [PFQuery queryWithClassName:INSTopicLikeKeyClass];
//    
//    if (toTopic) {
//        [query whereKey:kLikeToTopic equalTo:toTopic];
//    }
//    
//    if (toPost) {
//        [query whereKey:kLikeToPost equalTo:toPost];
//    }
//    
//    if (fromUser) {
//        [query whereKey:kLikeFromUser equalTo:fromUser];
//    }
//    
//    [query orderByDescending:INSKeyCreatedAt];
//    
//    return [query findObjects:error];
//}
//
//+ (BOOL)_isTopic:(INSTopic *)feed orPost:(INSPost *)comment likedbyUser:(PFUser *)user error:(NSError **)error {
//    NSArray *likeArray = [INSParseOperationManager _queryLikeToTopic:feed toPost:comment fromUser:user error:error];
//    
//    if (*error) {
//        return NO;
//    } else {
//        if (likeArray.count > 0) {
//            return YES;
//        } else {
//            return NO;
//        }
//    }
//}
//
//+ (BOOL)_deleteLikeToTopic:(INSTopic *)toTopic toPost:(INSPost *)comment fromUser:(PFUser *)fromUser error:(NSError **)error {
//    NSArray *likeArray = [INSParseOperationManager _queryLikeToTopic:toTopic toPost:comment fromUser:fromUser error:error];
//    
//    if (*error) {
//        return NO;
//    } else {
//        // 理论上应该只找到一条记录
//        if (likeArray.count > 0) {
//            // 删除所有
//            for (NSInteger i = 0; i < likeArray.count; i++) {
//                INSLike *like = likeArray[i];
//                BOOL succeeded = [INSParseOperationManager deleteLike:like error:error];
//                if (!succeeded) {
//                    return NO;
//                }
//            }
//            return YES;
//        } else {
//            return YES;//没找到，证明已经删除了
//        }
//    }
//}

@end
