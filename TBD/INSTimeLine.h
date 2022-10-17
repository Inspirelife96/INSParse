//
//  INSTimeLine.h
//  INSParse
//
//  Created by XueFeng Chen on 2021/6/22.
//

#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@class INSTopic;
@class INSPost;
@class INSReply;

@interface INSTimeLine : PFObject <PFSubclassing>

@property (nonatomic, strong) PFUser *fromUser; // 主视角
@property (nonatomic, strong) PFUser *toUser;

@property (nonatomic, strong) NSString *timeLineType; // 事件类型，包括发布主题/回帖/评论， 点赞主题/回帖/评论，关注

@property (nonatomic, strong) INSTopic *topic;
@property (nonatomic, strong) INSPost *post;
@property (nonatomic, strong) INSReply *reply;

@end

NS_ASSUME_NONNULL_END
