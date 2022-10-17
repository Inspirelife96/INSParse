//
//  INSParseOperationManager+Activity.m
//  INSParse
//
//  Created by XueFeng Chen on 2021/6/24.
//

#import "INSParseOperationManager+Activity.h"

#import "INSParseDefines.h"
#import "INSTopic.h"
#import "INSPost.h"
#import "INSReply.h"
#import "INSLike.h"
#import "INSShare.h"
#import "INSFollow.h"
#import "INSTimeLine.h"

@implementation INSParseOperationManager (Activity)

//+ (NSArray *)queryActivityFromUser:(PFUser *)fromUser toUser:(PFUser *)toUser type:(NSString *)type page:(NSInteger)page pageCount:(NSInteger)pageCount error:(NSError **)error {
//    PFQuery *query = [PFQuery queryWithClassName:kActivityClassKey];
//    
//    if (fromUser) {
//        [query whereKey:kActivityFromUser equalTo:fromUser];
//    }
//    
//    if (toUser) {
//        [query whereKey:kActivityToUser equalTo:toUser];
//    }
//    
//    if (type) {
//        [query whereKey:kActivityType equalTo:type];
//    }
//    
//    [query orderByDescending:INSKeyCreatedAt];
//    
//    [query setSkip:pageCount * page];
//    [query setLimit:pageCount];
//    
//    return [query findObjects:error];
//}
//
//+ (BOOL)addTopicActivity:(INSTopic *)feed error:(NSError **)error {
//    return [INSParseOperationManager _addTopicActivity:feed type:INSParseActivityTypeAddTopic fromUser:nil error:error];
//}
//
//+ (BOOL)publicTopicActivity:(INSTopic *)feed fromUser:(PFUser *)fromUser error:(NSError **)error {
//    return [INSParseOperationManager _addTopicActivity:feed type:INSParseActivityTypePublicTopic fromUser:fromUser error:error];
//}
//
//+ (BOOL)banTopicActivity:(INSTopic *)feed fromUser:(PFUser *)fromUser error:(NSError **)error {
//    return [INSParseOperationManager _addTopicActivity:feed type:INSParseActivityTypeBanTopic fromUser:fromUser error:error];
//}
//
//+ (BOOL)addPostActivity:(INSPost *)comment error:(NSError **)error {
//    INSTimeLine *activity = [[INSTimeLine alloc] init];
//    
//    activity.type = @(INSParseActivityTypeAddPost);
//    activity.comment = comment;
//    activity.fromUser = comment.fromUser;
//    
//    [comment.toTopic fetchIfNeeded:error];
//    if (*error) {
//        return NO;
//    } else {
//        activity.toUser = comment.toTopic.fromUser;
//    }
//    
//    return [activity save:error];
//}
//
//+ (BOOL)addReplyActivity:(INSReply *)reply error:(NSError **)error {
//    INSTimeLine *activity = [[INSTimeLine alloc] init];
//    
//    activity.type = @(INSParseActivityTypeAddReply);
//    activity.reply = reply;
//    activity.fromUser = reply.fromUser;
//    if (reply.toReply) {
//        [reply.toReply fetchIfNeeded:error];
//        if (*error) {
//            return NO;
//        } else {
//            activity.toUser = reply.toReply.fromUser;
//        }
//    } else {
//        [reply.toPost fetchIfNeeded:error];
//        if (*error) {
//            return NO;
//        } else {
//            activity.toUser = reply.toPost.fromUser;
//        }
//    }
//    
//    return [activity save:error];
//}
//
//+ (BOOL)addLikeActivity:(INSLike *)like error:(NSError **)error {
//    INSTimeLine *activity = [[INSTimeLine alloc] init];
//    
//    activity.type = @(INSParseActivityTypeAddLike);
//    activity.like = like;
//    activity.fromUser = like.fromUser;
//
//    [like.toTopic fetchIfNeeded:error];
//    if (*error) {
//        return NO;
//    } else {
//        activity.toUser = like.toTopic.fromUser;
//    }
//    return [activity save:error];
//}
//
//+ (BOOL)addShareActivity:(INSShare *)share error:(NSError **)error {
//    INSTimeLine *activity = [[INSTimeLine alloc] init];
//    
//    activity.type = @(INSParseActivityTypeAddShare);
//    activity.share = share;
//    activity.fromUser = share.fromUser;
//
//    [share.feed fetchIfNeeded:error];
//    if (*error) {
//        return NO;
//    } else {
//        activity.toUser = share.feed.fromUser;
//    }
//    return [activity save:error];
//}
//
//+ (BOOL)addFollowActivity:(INSFollow *)follow error:(NSError **)error {
//    INSTimeLine *activity = [[INSTimeLine alloc] init];
//    
//    activity.type = @(INSParseActivityTypeAddFollow);
//    activity.fromUser = follow.fromUser;
//    activity.toUser = follow.toUser;
//
//    return [activity save:error];
//}
//
//+ (BOOL)deletePostActivity:(INSPost *)comment error:(NSError **)error {
//    return [INSParseOperationManager _deleteActivityWhereKey:kActivityPost equalTo:comment error:error];
//}
//
//+ (BOOL)deleteReplyActivity:(INSReply *)reply error:(NSError **)error {
//    return [INSParseOperationManager _deleteActivityWhereKey:kActivityPost equalTo:reply error:error];
//}
//
//+ (BOOL)deleteLikeActivity:(INSLike *)like error:(NSError **)error {
//    return [INSParseOperationManager _deleteActivityWhereKey:kActivityLike equalTo:like error:error];
//}
//
//+ (BOOL)deleteFollowActivity:(INSFollow *)follow error:(NSError **)error {
//    return [INSParseOperationManager _deleteActivityWhereKey:kActivityFollow equalTo:follow error:error];
//}
//
//#pragma mark Private Methods
//
//+ (BOOL)_addTopicActivity:(INSTopic *)feed type:(NSInteger)type fromUser:(PFUser *)fromUser error:(NSError **)error {
//    INSTimeLine *activity = [[INSTimeLine alloc] init];
//    
//    activity.type = @(type);
//    activity.feed = feed;
//    
//    if (fromUser) {
//        activity.fromUser = fromUser;
//    } else {
//        activity.fromUser = feed.fromUser;
//    }
//    
//    activity.toUser = feed.fromUser;
//
//    return [activity save:error];
//}
//
//+ (BOOL)_deleteActivityWhereKey:(NSString *)key equalTo:(id)object error:(NSError **)error {
//    PFQuery *query = [PFQuery queryWithClassName:kActivityClassKey];
//    [query whereKey:key equalTo:object];
//    
//    NSArray *activityArray = [query findObjects:error];
//    
//    if (*error) {
//        return NO;
//    }
//    
//    for (NSInteger i = 0; i < activityArray.count; i++) {
//        INSTimeLine *activity = activityArray[i];
//        BOOL succeeded = [activity delete:error];
//        if (!succeeded) {
//            return NO;
//        }
//    }
//
//    return YES;
//}

@end
