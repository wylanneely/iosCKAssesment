//
//  MovieController.m
//  AssesmentObectiveC
//
//  Created by ALIA M NEELY on 6/23/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

#import "WNMovieController.h"
#import "AssesmentObectiveC-Swift.h"
#import "WNMovie.h"

@implementation WNMovieController

+ (WNMovieController *)sharedController;{
    static WNMovieController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [WNMovieController new];
    });
    return sharedController;
}
+ (void)fetchMovieWithSearchTerm:(NSString *) searchTerm
                      completion:(void(^) (NSArray<WNMovie *> *movies))completion;{
    // Set up a URLSession
    NSURL *baseURL = [[NSURL alloc] initWithString:@"https://api.themoviedb.org/3/search/movie?"];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *apiKeyItem = [NSURLQueryItem queryItemWithName:@"api_key" value:@"28a4e9144ebc59b9bf38c9bee035181e"];
    NSURLQueryItem *languageItem = [NSURLQueryItem queryItemWithName:@"language" value:@"en-US"];
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:@"query" value:searchTerm.lowercaseString];
    NSArray *allQueryItems = @[apiKeyItem,languageItem,queryItem];
    urlComponents.queryItems = allQueryItems;
    NSURL *finalURL = urlComponents.URL;
    // Perform and handle session
    [[[NSURLSession sharedSession]dataTaskWithURL:finalURL
                                completionHandler:^(NSData * _Nullable data,
                                                    NSURLResponse * _Nullable response,
                                                    NSError * _Nullable error)
      {
          if (error) { NSLog(@"Error: %@", error); completion(nil); return; }
          if (!data) { NSLog(@"ERROR: NO DATA RETURNED FROM DATA DASK"); completion(nil); return; }
          
          NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                         options:NSJSONReadingAllowFragments
                                                                           error: &error];
          if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]) {
              NSLog(@"ERROR: COULD NOT PARSE"); completion(nil); return;}
          
          NSArray *movieDictionaies = jsonDictionary[@"results"];
          NSMutableArray *movies = [NSMutableArray new];
          for (NSDictionary *movie in movieDictionaies) {
              WNMovie *newMovie = [[WNMovie alloc] initWithDictionary:movie];
              if (newMovie) {
                  [movies addObject:newMovie];
              }
          }
          completion(movies);
      }]resume];
}

@end
