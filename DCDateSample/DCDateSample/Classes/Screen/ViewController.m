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
@property NSDate       *nowDate;
@property NSString     *nowDateString;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // 現在日時を保持
    [self setNowDate];
    
    // ピッカー配置
    [self setDatePicker];
    
    // 日付の差を表示するラベル配置
    [self setSinceDateLabel];
}

// 現在日時を保持
- (void)setNowDate
{
    // 現在日時を NSDate型で保持
    _nowDate = [NSDate date];
    
    // 現在日時を NSString型で保持
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:DATE_FMT];
    _nowDateString = [dateFormatter stringFromDate:_nowDate];
}

// ピッカー配置
- (void)setDatePicker
{
    _datePicker = [DCDate picker:self rect:CGRectMake(0, self.view.frame.size.height - PICKER_HEIGHT, PICKER_WIDTH, PICKER_HEIGHT)
                            mode:UIDatePickerModeDateAndTime minuteInterval:PICKER_MINUTE_INTERVAL
                        dateText:_nowDateString dateFormat:DATE_FMT
                          action:@selector(pickerChanged:)];
    [self.view addSubview:_datePicker];
}

// ピッカー変更時のイベント
- (void)pickerChanged:(UIDatePicker *)datePicker
{
    // ピッカーで選択した時刻が現在時刻であればアラート表示
    if ([DCDate isCurrentTime]) {
        [DCUtil showAlert:nil message:@"選択した時刻が現在時刻です" cancelButtonTitle:nil otherButtonTitles:@"OK"];
    }
    
    // ピッカーで選択した時刻が現在の日付であればアラート表示
    if ([DCDate isCurrentDate]) {
        [DCUtil showAlert:nil message:@"選択した日付が現在の日付です" cancelButtonTitle:nil otherButtonTitles:@"OK"];
    }
}

// 日時の単位
typedef NS_ENUM(NSUInteger, dateUnitId) {
    SEC  = 0,
    MIN  = 1,
    HOUR = 2,
    DAY  = 3
};

// 日付の差を表示するラベル配置
- (void)setSinceDateLabel
{
    // 日付フォーマット定義
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:DATE_FMT];
    
    // 基点となる日付(2014年1月1日)と目標の日付(今日)を定義
    NSString *referenceDateString = @"2014-01-01 00:00:00";
    NSString *targetDateString    = _nowDateString;
    
    // 2014年1月1日から今日までの経過日数を取得
    CGFloat since = [DCDate since:referenceDateString targetDateString:targetDateString dateFormat:DATE_FMT dateUnit:DAY];
    
    // 四捨五入
    NSNumber *sinceNum = @(floorf(since));
    
    // ラベル配置
    UILabel *sinceLabel = [DCLabel planeLabel:CGRectMake(0, 180, 320, 48)
                                         text:[NSString stringWithFormat:@"今日は 2014年1月1日から %@日経過しています", sinceNum]
                                         font:[UIFont systemFontOfSize:12.0f] textColor:[UIColor blackColor]
                                textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
    [self.view addSubview:sinceLabel];
}

@end
