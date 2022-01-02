//
//  INSParseQueryManager+Reply.m
//  INSParse
//
//  Created by XueFeng Chen on 2021/12/28.
//

#import "INSParseQueryManager+Reply.h"

#import "INSParseQueryManager+Activity.h"

#import "INSComment.h"
#import "INSReply.h"

@implementation INSParseQueryManager (Reply)

+ (BOOL)addReplyToComment:(INSComment *)toComment
                       content:(NSString *)content
                      fromUser:(PFUser *)fromUser
                         error:(NSError **)error {
    INSReply *reply = [[INSReply alloc] init];
    reply.toComment = toComment;
    reply.content = content;
    reply.fromUser = fromUser;
    
    BOOL succeeded = [reply save:error];
    
    // 这里我们不处理toComment里对应的计数和replies
    
    if (succeeded) {
        return [INSParseQueryManager addReplyActivity:reply error:error];
    } else {
        return NO;
    }
}

+ (BOOL)deleteReply:(INSReply *)reply error:(NSError **)error {
    BOOL succeeded = [INSParseQueryManager deleteReplyActivity:reply error:error];
    
    if (succeeded) {
        return [reply delete:error];
    } else {
        return NO;
    }
}

@end
