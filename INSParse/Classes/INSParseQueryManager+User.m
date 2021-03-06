//
//  INSParseQueryManager+User.m
//  INSParse
//
//  Created by XueFeng Chen on 2021/6/24.
//

#import "INSParseQueryManager+User.h"

#import "INSStatisticsInfo.h"

#import <Parse/Parse-umbrella.h>

@implementation INSParseQueryManager (User)

+ (void)logInWithUsername:(NSString *)userName password:(NSString *)password error:(NSError **)error {
    PFUser *user = [PFUser logInWithUsername:userName password:password error:error];
    
    if (*error) {
        return;
    } else {
        BOOL succeed = [INSParseQueryManager _configUserAfterLogin:user error:error];
        if (!succeed) {
            [PFUser logOut];
        }
    }
}

+ (void)logInWithAnonymous:(NSError **)error {
    __block NSError *loginError = nil;
    [[[PFAnonymousUtils logInInBackground] continueWithBlock:^id _Nullable(BFTask<PFUser *> * _Nonnull task) {
        loginError = task.error;
        if (!task.isCancelled && !task.error) {
            PFUser *user = task.result;
            
            if (user) {
                BOOL succeeded = NO;
                if (user.isNew) {
                    succeeded = [INSParseQueryManager _configUserAfterSignUp:user error:&loginError];
                } else {
                    succeeded = [INSParseQueryManager _configUserAfterLogin:user error:&loginError];
                }
                
                if (!succeeded) {
                    [PFUser logOut];
                }
            }
        }
        
        return task;
    }] waitUntilFinished];
    
    *error = loginError;
}

+ (void)upgradeAnonymousUser:(PFUser *)user withUsername:(NSString *)userName password:(NSString *)password email:(NSString *)email error:(NSError **)error {
    user.username = userName;
    user.password = password;
    user.email = email;
    
    [user signUp:error];
    
    return;
}

+ (void)signUpWithUsername:(NSString *)userName password:(NSString *)password email:(NSString *)email error:(NSError **)error {
    PFUser *user = [PFUser user];
    user.username = userName;
    user.password = password;
    user.email = email;
    
    BOOL succeeded = [user signUp:error];
    
    if (succeeded) {
        succeeded = [INSParseQueryManager _configUserAfterSignUp:user error:error];
        if (!succeeded) {
            [PFUser logOut];
        }
    } else {
        return;
    }
}

+ (BFTask *)loginWithAppleAuthType:(NSString *)authType authData:(NSDictionary<NSString *, NSString *> *)authData username:(NSString *)userName email:(NSString *)email error:(NSError **)error {

    __block BFTask *appleAuthTask;
    
    __block NSError *loginError = nil;
    
    [[[PFUser logInWithAuthTypeInBackground:authType authData:authData] continueWithBlock:^id _Nullable(BFTask<__kindof PFUser *> * _Nonnull task) {
        appleAuthTask = task;
        loginError = task.error;
        if (!task.isCancelled && !task.error) {
            PFUser *user = task.result;
            
            if (user) {
                BOOL succeeded = NO;
                if (user.isNew) {
                    succeeded = [INSParseQueryManager _configUserAfterSignUp:user error:&loginError];
                } else {
                    succeeded = [INSParseQueryManager _configUserAfterLogin:user error:&loginError];
                }
 
                if (!succeeded) {
                    [PFUser logOut];
                }
            }
        }
        
        return task;
    }] waitUntilFinished];
    
    *error = loginError;
    
    return appleAuthTask;
}

+ (void)logOut {
    [INSParseQueryManager _configUserBeforeLogout];
    [PFUser logOut];
}

+ (void)unsubscribe:(NSError **)error; {
    [INSParseQueryManager _configUserBeforeUnsubscribe:[PFUser currentUser] error:error];
    [INSParseQueryManager logOut];
}

+ (void)requestPasswordResetForEmail:(NSString *)email error:(NSError **)error {
    [PFUser requestPasswordResetForEmail:email error:error];
}

#pragma mark Private Methods

+ (BOOL)_configUserAfterLogin:(PFUser *)user error:(NSError **)error {
    BOOL succeed =  [INSParseQueryManager _fetchStatisticsInfoForUser:user error:error];
    
    if (succeed) {
        succeed = [INSParseQueryManager _linkPushWithUser:user error:error];
    }
    
    if (succeed) {
        succeed = [INSParseQueryManager _removeSessions:user error:error];
    }
    
    return succeed;
}

+ (BOOL)_configUserAfterSignUp:(PFUser *)user error:(NSError **)error {
    BOOL succeed = [INSParseQueryManager _activeUser:user error:error];
    
    if (succeed) {
        succeed = [INSParseQueryManager _createStatisticsInfoForUser:user error:error];
    }
    
    if (succeed) {
        return [INSParseQueryManager _configUserAfterLogin:user error:error];
    }
    
    return succeed;
}

+ (void)_configUserBeforeLogout {
    return [INSParseQueryManager _unlinkPushWithUser];
}

+ (BOOL)_configUserBeforeUnsubscribe:(PFUser *)user error:(NSError **)error {
    return [INSParseQueryManager _unsubscribeUser:user error:error];
}

+ (BOOL)_activeUser:(PFUser *)user error:(NSError **)error {
    [user setObject:@"Actived" forKey:@"status"];
    return [user save:error];
}

+ (BOOL)_unsubscribeUser:(PFUser *)user error:(NSError **)error {
    [user setObject:@"unsubscribe" forKey:@"status"];
    return [user save:error];
}

+ (BOOL)_createStatisticsInfoForUser:(PFUser *)user error:(NSError **)error {
    INSStatisticsInfo *statisticsInfo = [[INSStatisticsInfo alloc] init];
    statisticsInfo.user = user;
    statisticsInfo.followCount = @(0);
    statisticsInfo.followedCount = @(0);
    statisticsInfo.feedCount = @(0);
    statisticsInfo.likedCount = @(0);
    BOOL succeeded = [statisticsInfo save:error];
    
    if (succeeded) {
        [user setObject:statisticsInfo forKey:@"statisticsInfo"];
        return [user save:error];
    } else {
        return NO;
    }
}

+ (BOOL)_fetchStatisticsInfoForUser:(PFUser *)user error:(NSError **)error {
    INSStatisticsInfo *statisticsInfo = [user objectForKey:@"statisticsInfo"];
    if (statisticsInfo) {
        return [statisticsInfo fetchIfNeeded:error];
    } else {
        return [INSParseQueryManager _createStatisticsInfoForUser:user error:error];
    }
}

// ??????????????????????????????badge
+ (BOOL)_linkPushWithUser:(PFUser *)user error:(NSError **)error {
    [[PFInstallation currentInstallation] setObject:user forKey:@"user"];
    [[PFInstallation currentInstallation] setBadge:0];
    return [[PFInstallation currentInstallation] save:error];
}

// ????????????????????????????????????badge
+ (void)_unlinkPushWithUser {
    [[PFInstallation currentInstallation] removeObjectForKey:@"user"];
    [[PFInstallation currentInstallation] setBadge:0];
    [[PFInstallation currentInstallation] saveEventually];
}

// ???????????????????????????session????????????????????????????????????session??????????????????
+ (BOOL)_removeSessions:(PFUser *)user error:(NSError **)error {
    PFQuery *querySession = [PFQuery queryWithClassName:@"_Session"];
    [querySession whereKey:@"user" equalTo:user];
    [querySession whereKey:@"sessionToken" notEqualTo:user.sessionToken];
    
    NSArray *sessionArray = [querySession findObjects:error];
    
    if (*error) {
        return NO;
    } else {
        for (NSInteger i = 0; i < sessionArray.count; i++) {
            PFSession *sessionObject = sessionArray[i];
            [sessionObject delete:error];
            
            if (*error) {
                return NO;
            }
        }
        
        return YES;
    }
}

@end
