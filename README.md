DCDate
====================

Objective-Cで UIDatePickerの取得や、年号日付時刻等の情報を取得／判別する「DCDate」クラスです。

##主な機能

1. UIDatePickerの取得
2. UIDatePickerの選択時刻と現在時刻の比較
3. UIDatePickerで選択した日付と現在の日付の比較
4. UIDatePickerで選択中の年号/月日/時分の取得
4. 現在の年号/月日/時分秒の取得

##使用方法

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
