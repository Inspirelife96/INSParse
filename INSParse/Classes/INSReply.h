//
//  INSReply.h
//  INSParse
//
//  Created by XueFeng Chen on 2021/12/28.
//

#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@class INSComment;

@interface INSReply : PFObject <PFSubclassing>

@property (nonatomic, strong) INSComment *toComment;
@property (nonatomic, strong) INSReply *toReply;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) PFUser *fromUser;
@property (nonatomic, assign) NSInteger likeCount;
@property (nonatomic, assign) NSInteger dislikeCount;


@end

NS_ASSUME_NONNULL_END
