//
//  ViewController.m
//  DCDateSample
//
//  Created by 廣川政樹 on 2013/09/10.
//  Copyright (c) 2013年 Masaki Hirokawa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UIDatePicker *datePicker;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //ピッカー配置
    [self setDatePicker];
}

//ピッカー配置
- (void)setDatePicker
{
    _datePicker = [DCDate picker:self rect:CGRectMake(0, self.view.frame.size.height - PICKER_HEIGHT, PICKER_WIDTH, PICKER_HEIGHT)
                            mode:UIDatePickerModeDateAndTime minuteInterval:PICKER_MINUTE_INTERVAL
                        dateText:@"2013-09-09 15:00:00" dateFormat:@"yyyy-MM-dd HH:mm:ss"
                          action:@selector(pickerChanged:)];
    [self.view addSubview:_datePicker];
}

//ピッカー変更時のイベント
- (void)pickerChanged:(UIDatePicker *)datePicker
{
    //ピッカーで選択した時刻が現在時刻であればアラート表示
    if ([DCDate isCurrentTime]) {
        [DCUtil showAlert:nil message:@"選択した時刻が現在時刻です" cancelButtonTitle:nil otherButtonTitles:@"OK"];
    }
    
    //ピッカーで選択した時刻が現在の日付であればアラート表示
    if ([DCDate isCurrentDate]) {
        [DCUtil showAlert:nil message:@"選択した日付が現在の日付です" cancelButtonTitle:nil otherButtonTitles:@"OK"];
    }
}

@end
