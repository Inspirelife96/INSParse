//
//  INSComment.h
//  INSParse
//
//  Created by XueFeng Chen on 2021/6/22.
//

#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@class INSFeed;
@class INSReply;

@interface INSComment : PFObject <PFSubclassing>

@property (nonatomic, strong) NSNumber *category;

@property (nonatomic, strong) INSFeed *toFeed;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) NSArray<PFFileObject *> *mediaContents;
@property (nonatomic, strong) PFUser *fromUser;
@property (nonatomic, strong) NSArray <INSReply *> *replies; // 最近的5条
@property (nonatomic, strong) NSNumber *replyCount; //总数
@property (nonatomic, assign) NSNumber *likeCount;
@property (nonatomic, assign) NSNumber *dislikeCount;


@end

NS_ASSUME_NONNULL_END
