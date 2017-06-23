//
//  WNMovie.m
//  AssesmentObectiveC
//
//  Created by ALIA M NEELY on 6/23/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

#import "WNMovie.h"

@implementation WNMovie

-(instancetype)init; { return [self initWithTitle:@"" rating:0.0 overview:@"" imageEndpoint:@""]; }

-(instancetype)initWithTitle:(NSString *)title rating:(float)rating overview:(NSString *)overview imageEndpoint:(NSString *)imageEndpoint;{
    self = [super init];
    if (self) {
        _title = [title copy];
        _overview = [overview copy];
        _imageEndpoint = [imageEndpoint copy];
        _rating = rating;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;{
    NSString *title = dictionary[@"title"];
    NSString *overview = dictionary[@"overview"];
    NSString *imageEndpoint = dictionary[@"poster_path"];
    float rating = [dictionary[@"vote_average"] floatValue];
    
    return  [self initWithTitle:title rating:rating overview:overview imageEndpoint: imageEndpoint];
}

@end
