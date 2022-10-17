//
//  INSLike.h
//  INSParse
//
//  Created by XueFeng Chen on 2021/6/22.
//

#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@class INSTopic;
@class INSPost;

@interface INSLike : PFObject <PFSubclassing>

@property (nonatomic, strong) NSNumber *category;

@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, strong) INSTopic *toTopic;
@property (nonatomic, strong) INSPost *toPost;
@property (nonatomic, strong) PFUser *fromUser;

@end

NS_ASSUME_NONNULL_END
