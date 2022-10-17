//
//  INSParseOperationManager+Report.h
//  INSParse
//
//  Created by XueFeng Chen on 2021/6/24.
//

#import "INSParseOperationManager.h"

#import "INSParseDefines.h"

@class INSTopic;
@class INSPost;
@class INSReply;

NS_ASSUME_NONNULL_BEGIN

@interface INSParseOperationManager (Report)

//+ (BOOL)addReportFromUser:(PFUser *)fromUser toTopic:(INSTopic *)toTopic forReason:(INSParseReportReason)reason error:(NSError **)error;
//
//+ (BOOL)addReportFromUser:(PFUser *)fromUser toPost:(INSPost *)toPost forReason:(INSParseReportReason)reason error:(NSError **)error;
//
//+ (BOOL)addReportFromUser:(PFUser *)fromUser toReply:(INSReply *)toReply forReason:(INSParseReportReason)reason error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
