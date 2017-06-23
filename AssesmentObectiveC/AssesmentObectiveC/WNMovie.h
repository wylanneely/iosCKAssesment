//
//  WNMovie.h
//  AssesmentObectiveC
//
//  Created by ALIA M NEELY on 6/23/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WNMovie : NSObject

@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *overview;
@property (nonatomic, copy)NSString *imageEndpoint;
@property (nonatomic, readonly) float rating;


-(instancetype)initWithTitle:(NSString *)title rating:(float)rating overview:(NSString *)overview imageEndpoint:(NSString *)imageEndpoint NS_DESIGNATED_INITIALIZER;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
