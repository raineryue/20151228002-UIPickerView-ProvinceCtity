//
//  ViewController.m
//  20151228002-UIPickerView-ProvinceCtity
//
//  Created by Rainer on 15/12/28.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "ViewController.h"
#import "ProvinceModel.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

/** 选择器控件 */
@property (weak, nonatomic) IBOutlet UIPickerView *provincePickerView;

/** 省市列表 */
@property (nonatomic, strong) NSArray *provinceArray;

/** 选择的行 */
@property (nonatomic, assign) NSInteger selectRow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.provincePickerView.dataSource = self;
    self.provincePickerView.delegate = self;
}

#pragma mark - 选择器控件数据源方法
/**
 *  返回选择器控件的列数
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

/**
 *  返回选择器控件没列的行数
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    // 返回第0列的行数
    if (0 == component) {
        return self.provinceArray.count;
    } else {
        // 取出选择的当前列的行的数据
        ProvinceModel *province = self.provinceArray[self.selectRow];
        // 返回当前行数
        return province.cities.count;
    }
}

#pragma mark - 选择器的代理方法
/**
 *  返回当前列的当前行
 */
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    // 1.重用查询
    UILabel *pickerLabel = (UILabel *)view;
    
    // 2.创建标签
    if (nil == pickerLabel) {
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.textAlignment = NSTextAlignmentCenter;
    }

    // 3.返回第0行的行
    if (0 == component) {
        ProvinceModel *province = self.provinceArray[row];
        
        pickerLabel.text = province.name;
    } else {
        // 3.1.返回第选择行的行
        ProvinceModel *province = self.provinceArray[self.selectRow];
        
        pickerLabel.text = province.cities[row];
    }
    
    return pickerLabel;
}

/**
 *  选择器控件选择的列的行
 */
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (0 == component) {
        // 1.设置当前选择行
        self.selectRow = row;
        
        // 2.刷新某一列数据
        [pickerView reloadComponent:1];
        
        // 3.选择当前列的下一列的第0行
        [pickerView selectRow:0 inComponent:component + 1 animated:YES];
    }
}

/**
 *  返回当前列的行高
 */
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 40;
}

/**
 *  返回当前列的行宽
 */
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (0 == component) {
        return 120;
    } else {
        return self.view.bounds.size.width - 120;
    }
}

- (NSArray *)provinceArray {
    if (nil == _provinceArray) {
        _provinceArray = [ProvinceModel provinceArray];
    }
    
    return _provinceArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
