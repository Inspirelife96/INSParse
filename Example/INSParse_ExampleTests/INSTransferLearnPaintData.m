//
//  INSTransferLearnPaintData.m
//  INSParse_ExampleTests
//
//  Created by XueFeng Chen on 2021/9/5.
//  Copyright © 2021 inspirelife@hotmail.com. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <INSParse-umbrella.h>

@interface INSTransferLearnPaintData : XCTestCase

@end

@implementation INSTransferLearnPaintData

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    [Parse initializeWithConfiguration:[ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration> configuration) {
        configuration.applicationId = @"oDzmpRypCHeD8K8bI8lD7yDpBGU1povw14h2dL9j";
        configuration.clientKey = @"hkUcWHSCAc82lHbsy3NgV5S7hdDT0wQgGkAxLufz";
        configuration.server = @"https://inspirelife2017.com/learnpaint2";
        configuration.networkRetryAttempts = 0;
        NSURLSessionConfiguration *URLSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        URLSessionConfiguration.timeoutIntervalForRequest = 15.0f;
        configuration.URLSessionConfiguration = URLSessionConfiguration;
    }]];
    
    
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testCreateTable {
//    NSError *error = nil;
//    [INSParseQueryManager logInWithUsername:@"inspirelife" password:@"IloveMS007" error:&error];
//    
//    PFQuery *query = [PFQuery queryWithClassName:kFeedClassKey];
//    INSFeed *feed = [query getObjectWithId:@"E4FYzL1qML"];
//    
//    INSComment *comment = [[INSComment alloc] init];
//    comment.toFeed = feed;
//    comment.content = @"abc";
//    comment.fromUser = [PFUser currentUser];
//    [comment save];
//    
//    comment.toComment = comment;
//    [comment save];
//    
//    
//    INSLike *like = [[INSLike alloc] init];
//    like.category = @(1);
//    like.toFeed = feed;
//    like.toComment = comment;
//    like.fromUser = [PFUser currentUser];
//    [like save];
//    
//    INSFollow *follow = [[INSFollow alloc] init];
//    follow.fromUser = [PFUser currentUser];
//    follow.toUser = [PFUser currentUser];
//    [follow save];
//    
//
//    
//    INSReport *report = [[INSReport alloc] init];
//    report.fromUser = [PFUser currentUser];
//    report.type = @(1);
//    report.reason = @(1);
//    report.feed = feed;
//    report.comment = comment;
//    
//    [report save];
//    
//    INSShare *share = [[INSShare alloc] init];
//    share.category = @(1);
//    share.feed = feed;
//    share.toPlatform = @"weixin";
//    share.fromUser = [PFUser currentUser];
//    
//    [share save];
//    
//    INSBlock *block = [[INSBlock alloc] init];
//    block.fromUser = [PFUser currentUser];
//    block.toUser = [PFUser currentUser];
//    [block save];
//    
//    INSFollowInfo *followInfo = [[INSFollowInfo alloc] init];
//    followInfo.followCount = @(0);
//    followInfo.followedCount = @(0);
//    
//    [followInfo save];
}

- (void)testTransferPhoto {
//    PFQuery *query = [PFQuery queryWithClassName:@"Photo"];
//    [query orderByDescending:@"createdAt"];
//
//    [query setLimit:10];
//
//    NSError *error = nil;
//
//    NSArray *photoObjectArray = [query findObjects:&error];
//
//    NSAssert(error == nil, @"Query photo table failed");
//
//
//
//    for (NSUInteger i = 0; i < photoObjectArray.count; i++) {
//        PFObject *photoObject = photoObjectArray[i];
//
//        PFFileObject *image = [photoObject objectForKey:@"image"];
//        PFUser *user = [photoObject objectForKey:@"user"];
//        NSString *content = [photoObject objectForKey:@"content"];
//        NSString *summary = [photoObject objectForKey:@"summary"];
//        NSString *objectId = photoObject.objectId;
//
//        NSNumber *category = @(-1);
//
//        if ([summary rangeOfString:@"课的练习"].location != NSNotFound ||
//            [summary rangeOfString:@"From Lession"].location != NSNotFound ||
//            [summary rangeOfString:@"来自导言的自我测试"].location != NSNotFound ||
//            [summary rangeOfString:@"From Introduction Test"].location != NSNotFound) {
//            category = @(1);
//        }
//
//        if ([summary rangeOfString:@"来自品画交流的新画"].location != NSNotFound ||
//            [summary rangeOfString:@"Published from community"].location != NSNotFound) {
//            category = @(2);
//        }
//
//
//        INSFeed *feed = [[INSFeed alloc] init];
//        //feed.objectId = objectId;
//        feed.status = @(INSParseRecordStatusPublic);
//        feed.category = category;
//        feed.title = summary;
//        feed.content = content;
//        feed.mediaContents = @[image];
//        feed.fromUser = user;
//        feed.isOriginal = YES;
//
//        feed.commentCount = @(0);
//        feed.likeCount = @(0);
//        feed.shareCount = @(0);
//        feed.tags = @[];
//
////        [feed setObject:photoObject.createdAt forKey:@"createdAt"];
//
//        [feed setObject:objectId forKey:@"photoId"];
//
//        [feed save:&error];
//
//        NSAssert(error == nil, @"Add Feed Failed");
//    }
        
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
