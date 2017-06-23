//
//  MovieController.h
//  AssesmentObectiveC
//
//  Created by ALIA M NEELY on 6/23/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WNMovie;

NS_ASSUME_NONNULL_BEGIN

@interface WNMovieController : NSObject

@property (nonatomic, copy) NSMutableArray<WNMovie *> *moviesArray;

+ (WNMovieController *)sharedController;

+ (void)fetchMovieWithSearchTerm:(NSString *) searchTerm completion:(void(^) (NSArray<WNMovie *> *movies))completion;

@end

NS_ASSUME_NONNULL_END
