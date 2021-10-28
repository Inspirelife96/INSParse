//
//  INSParse_ExampleTests.m
//  INSParse_ExampleTests
//
//  Created by XueFeng Chen on 2021/8/30.
//  Copyright © 2021 inspirelife@hotmail.com. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <INSParse-umbrella.h>

@interface INSParse_ExampleTests : XCTestCase

@end

@implementation INSParse_ExampleTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    [Parse initializeWithConfiguration:[ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration> configuration) {
        configuration.applicationId = @"makeitappid";
        configuration.clientKey = @"";
        configuration.server = @"https://iosreader.com/parsemakeit";
        configuration.networkRetryAttempts = 0;
        NSURLSessionConfiguration *URLSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        URLSessionConfiguration.timeoutIntervalForRequest = 15.0f;
        configuration.URLSessionConfiguration = URLSessionConfiguration;
    }]];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testSignUp {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSString *username = [[NSUUID UUID] UUIDString];
    NSString *password = @"IloveMS007";
    NSString *email = [NSString stringWithFormat:@"%@@hotmail.com", username];
    NSError *error = nil;
    
    [INSParseQueryManager signUpWithUsername:username password:password email:email error:&error];
    
    NSAssert([PFUser currentUser], @"Sign Up Failed");
    NSAssert(error == nil, @"Sign Up Failed");
    
    [INSParseQueryManager logOut];
    
    NSAssert(![PFUser currentUser], @"LogOut Failed");
    
    [INSParseQueryManager logInWithUsername:username password:password error:&error];
    NSAssert([PFUser currentUser], @"Sign Up Failed");
    NSAssert(error == nil, @"Sign Up Failed");
}

- (void)testAnonymousLogin {
    if ([PFUser currentUser]) {
        [PFUser logOut];
    }
    
    NSError *error = nil;
    
    [INSParseQueryManager logInWithAnonymous:&error];
    
    NSAssert([PFUser currentUser], @"Anonymous Login Failed");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
