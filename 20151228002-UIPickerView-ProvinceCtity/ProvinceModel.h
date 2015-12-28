//
//  ProvinceModel.h
//  20151228002-UIPickerView-ProvinceCtity
//
//  Created by Rainer on 15/12/28.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProvinceModel : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSArray *cities;

- (instancetype)initProvinceWithDictionary:(NSDictionary *)dictionary;

+ (instancetype)provinceWithDictionary:(NSDictionary *)dictionary;

- (NSArray *)provinceArray;

+ (NSArray *)provinceArray;

@end
