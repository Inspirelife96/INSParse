//
//  INSCategoryTable.h
//  INSParse
//
//  Created by XueFeng Chen on 2022/5/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class INSCategory;

@interface INSCategoryTable : NSObject

+ (NSArray <INSCategory *> *)fetchAllCategories;

+ (BOOL)addCategoryWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
