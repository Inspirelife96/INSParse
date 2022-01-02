//
//  INSParseQueryManager+Reply.h
//  INSParse
//
//  Created by XueFeng Chen on 2021/12/28.
//

#import "INSParseQueryManager.h"

NS_ASSUME_NONNULL_BEGIN

@class INSComment;
@class INSReply;

@interface INSParseQueryManager (Reply)

// Reply表增加
+ (BOOL)addReplyToComment:(INSComment *)toComment
                       content:(NSString *)content
                      fromUser:(PFUser *)fromUser
                         error:(NSError **)error;

// Comment表删除

+ (BOOL)deleteReply:(INSReply *)reply error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
