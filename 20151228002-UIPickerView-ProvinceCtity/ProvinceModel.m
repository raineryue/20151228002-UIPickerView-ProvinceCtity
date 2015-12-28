//
//  ProvinceModel.m
//  20151228002-UIPickerView-ProvinceCtity
//
//  Created by Rainer on 15/12/28.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "ProvinceModel.h"

@implementation ProvinceModel

- (instancetype)initProvinceWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    
    return self;
}

+ (instancetype)provinceWithDictionary:(NSDictionary *)dictionary {
    return [[ProvinceModel alloc] initProvinceWithDictionary:dictionary];
}

- (NSArray *)provinceArray {
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"provinces" ofType:@"plist"]];
    
    NSMutableArray *provinceArray = [NSMutableArray array];
    
    [plistArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [provinceArray addObject:[ProvinceModel provinceWithDictionary:obj]];
    }];
    
    return provinceArray;
}

+ (NSArray *)provinceArray {
    return [[[ProvinceModel alloc] init] provinceArray];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@:%p>{name%@, cities:%@}", self.class, self, self.name, self.cities];
}

@end
