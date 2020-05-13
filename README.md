# zh_date_picker

中文版本日期选择控件,基于CupertinoDatePicker修改.

## Why?

> 已经存在CupertinoDatePicker，为什么需要再次封装中文版本？

* 自带的对中文支持不友好，需要做本地化处理，eg:zh的日期展示(年-月-日),而默认是月-日-年
* 自带的是属于iOS的Cupertino风格，滑动效果，与常规日期选择控件有出入
* 自带的是一个裸widget，使用时候，需要再次封装成Dialog或新页面，添加一些操作按钮，才能使用
* 自带的只能选择年月日，限制的比较死，不能选择年月日其他的组合，eg:年月，月日，年，月，日等

## What?

<img src="https://storage.jd.com/dqimage/img/demo/zh_date_picker.png" width = "600" height = "425" alt="" align=center />

## How?

依赖library：

```dart
dependencies:
  zh_date_picker: ^0.1.0
  
```
在需要显示选择日期地方调用：

```dart

ZhCupertinoDatePickerDialog.show(
  context: context,
  selectStyle: select,
  titleText: '选择时间',
  dateType: ZhCupertinoDatePickerMode.date,
  onDateTimeSelect: (dateTime) {
    print('select Date:' + dateTime.toUtc().toString());
  },
  onDateTimeChanged: (dateTime) {
    setState(() {
      yearMonthDay = dateTime.year.toString() +
          '-' +
          dateTime.month.toString() +
          '-' +
          dateTime.day.toString();
    });
  });
```

更多使用，参见example，或者查看源码.
