DCDate
====================

Objective-Cで UIDatePickerの取得や、年号日付時刻等の情報を取得／判別する「DCDate」クラスです。

##主な機能

1. UIDatePickerの取得
2. UIDatePickerの選択時刻と現在時刻の比較
3. UIDatePickerで選択した日付と現在の日付の比較
4. UIDatePickerで選択中の年号/月日/時分の取得
4. 現在の年号/月日/時分秒の取得
5. 指定した日時からの経過時間を取得

##使用方法

###指定した日時からの経過日数を取得

```objective-c
// 日付フォーマット定義
NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

// 基点となる日付(2014年1月1日)と目標の日付(今日)を定義
NSString *referenceDateString = @"2014-01-01 00:00:00";
NSString *targetDateString    = [dateFormatter stringFromDate:[NSDate date]];

// 2014年1月1日から今日までの経過日数を CGFloat型で取得
CGFloat since = [DCDate since:referenceDateString targetDateString:targetDateString dateFormat:@"yyyy-MM-dd HH:mm:ss" dateUnit:3];

// 四捨五入して NSNumber型に変換
NSNumber *sinceNum = @(floorf(since));

// コンソール出力
NSLog(@"今日は 2014年1月1日から %@日経過しています", sinceNum);
```

###UIDatePickerの取得

```objective-c
UIDatePicker *datePicker = [DCDate picker:self rect:CGRectMake(0, self.view.frame.size.height - 210, 320, 210)
                        mode:UIDatePickerModeDateAndTime minuteInterval:1
                    dateText:@"2013-09-09 15:00:00" dateFormat:@"yyyy-MM-dd HH:mm:ss"
                      action:@selector(pickerChanged:)];
```

###現在の日付とピッカーの日付を比較

```objective-c
BOOL isCurrentDate = [DCDate isCurrentDate];
```

###現在時刻とピッカーの時刻を比較

```objective-c
BOOL isCurrentTime = [DCDate isCurrentTime];
```

###UIDatePickerで選択中の年号/月日/時分の取得

```objective-c
NSInteger pickerYear = [DCDate pickerYear];
NSInteger pickerMonth = [DCDate pickerMonth];
NSInteger pickerDay = [DCDate pickerDay];
NSInteger pickerHour = [DCDate pickerHour];
NSInteger pickerMinute = [DCDate pickerMinute];
```

###現在の年号/月日/時分秒の取得

```objective-c
NSInteger currentYear = [DCDate currentYear];
NSInteger currentMonth = [DCDate currentMonth];
NSInteger currentDay = [DCDate currentDay];
NSInteger currentHour = [DCDate currentHour];
NSInteger currentMinute = [DCDate currentMinute];
NSInteger currentSecond = [DCDate currentSecond];
```
