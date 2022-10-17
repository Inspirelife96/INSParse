//
//  INSParseOperationManager+Report.m
//  INSParse
//
//  Created by XueFeng Chen on 2021/6/24.
//

#import "INSParseOperationManager+Report.h"

#import "INSParseDefines.h"

#import "INSTopicReport.h"
#import "INSPostReport.h"
#import "INSReplyReport.h"

@implementation INSParseOperationManager (Report)

//+ (BOOL)addReportFromUser:(PFUser *)fromUser toTopic:(INSTopic *)toTopic forReason:(INSParseReportReason)reason error:(NSError **)error {
//    INSTopicReport *topicReport = [[INSTopicReport alloc] init];
//    
//    topicReport.fromUser = fromUser;
//    topicReport.toTopic = toTopic;
//    topicReport.reason = @(reason);
//    
//    return [topicReport save:error];
//}
//
//+ (BOOL)addReportFromUser:(PFUser *)fromUser toPost:(INSPost *)toPost forReason:(INSParseReportReason)reason error:(NSError **)error {
//    INSPostReport *postReport = [[INSPostReport alloc] init];
//    
//    postReport.fromUser = fromUser;
//    postReport.toPost = toPost;
//    postReport.reason = @(reason);
//    
//    return [postReport save:error];
//}
//
//+ (BOOL)addReportFromUser:(PFUser *)fromUser toReply:(INSReply *)toReply forReason:(INSParseReportReason)reason error:(NSError **)error {
//    INSReplyReport *replyReport = [[INSReplyReport alloc] init];
//    
//    replyReport.fromUser = fromUser;
//    replyReport.toReply = toReply;
//    replyReport.reason = @(reason);
//    
//    return [replyReport save:error];
//}
//
////+ (BOOL)addReportFromUser:(PFUser *)fromUser feed:(INSTopic *)feed comment:(INSPost *)comment reason:(INSParseReportReason)reason error:(NSError **)error {
////    INSReport *report = [[INSReport alloc] init];
////    report.fromUser = fromUser;
////    
////    if (feed) {
////        report.feed = feed;
////        report.type = @(INSParseReportTypeTopic);
////    }
////    
////    if (comment) {
////        report.comment = comment;
////        report.type = @(INSParseReportTypePost);
////    }
////    
////    report.reason = @(reason);
////    
////    return [report save:error];
////}

@end
