library zh_date_picker;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zh_date_picker/zh_date_pickers.dart';

///是否可见
bool _isShowing = false;

///样式
const TextStyle cancelStyle = TextStyle(
    fontSize: 16,
    color: Color.fromARGB(255, 153, 153, 153),
    decoration: TextDecoration.none);

const TextStyle titleStyle = TextStyle(
    fontSize: 16,
    color: Color.fromARGB(255, 51, 51, 51),
    decoration: TextDecoration.none);

const TextStyle selectStyle = TextStyle(
    fontSize: 16, color: Colors.blue, decoration: TextDecoration.none);

///文案
const String cancelText = '取消';
const String titleText = '';
const String selectText = '确认';

/// 中文版选择日期，年月日，扩展了年，月，日，以及年月，月日组合.
class ZhCupertinoDatePickerDialog {
  static Future<bool> show({
    @required BuildContext context,
    //日期变化回调
    @required ValueChanged<DateTime> onDateTimeChanged,
    //日期确认回调
    @required ValueChanged<DateTime> onDateTimeSelect,
    //日期样式，年月日组合
    ZhCupertinoDatePickerMode dateType = ZhCupertinoDatePickerMode.date,
    TextStyle cancelStyle = cancelStyle,
    TextStyle titleStyle = titleStyle,
    TextStyle selectStyle = selectStyle,
    String cancelText = cancelText,
    String titleText = titleText,
    String selectText = selectText,
    double pickerHeight = 250,
    DateTime initialDateTime,
    DateTime minimumDate,
    DateTime maximumDate,
    int minimumYear = 1,
    int maximumYear,
    int minuteInterval = 1,
    bool use24hFormat = false,
    Color backgroundColor = Colors.white,
  }) async {
    //当前滑动日期
    DateTime dateTimeChanged = initialDateTime ?? DateTime.now();
    try {
      if (!_isShowing) {
        _isShowing = true;
        await showDialog<dynamic>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return MaterialApp(
              localeListResolutionCallback:
                  (List<Locale> locales, Iterable<Locale> supportedLocales) {
                return Locale('zh');
              },
              localeResolutionCallback:
                  (Locale locale, Iterable<Locale> supportedLocales) {
                return Locale('zh');
              },
              localizationsDelegates: [
                ZhCupertinoLocalizations.delegate,
                ZhCupertinoLocalizations.delegate,
                ZhCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                const Locale('zh', 'CH'),
                const Locale('en', 'US'),
              ],
              debugShowCheckedModeBanner: false,
              home: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              cancelText,
                              style: cancelStyle,
                            ),
                          ),
                          Text(
                            titleText,
                            style: titleStyle,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              if (onDateTimeSelect != null) {
                                onDateTimeSelect(dateTimeChanged);
                              }
                              if (onDateTimeChanged != null) {
                                onDateTimeChanged(dateTimeChanged);
                              }
                            },
                            child: Text(
                              selectText,
                              style: selectStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: pickerHeight,
                      child: ZhCupertinoDatePicker(
                        mode: dateType,
                        backgroundColor: backgroundColor,
                        onDateTimeChanged: (dateTime) {
                          dateTimeChanged = dateTime;
                          if (onDateTimeChanged != null) {
                            onDateTimeChanged(dateTime);
                          }
                        },
                        use24hFormat: use24hFormat,
                        initialDateTime: initialDateTime,
                        minimumDate: minimumDate,
                        maximumDate: maximumDate,
                        minimumYear: minimumYear,
                        maximumYear: maximumYear,
                        minuteInterval: minuteInterval,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ).then((val) {
          _isShowing = false;
        });
        return true;
      } else {
        return false;
      }
    } catch (err) {
      _isShowing = false;
      debugPrint(err);
      return false;
    }
  }
}

//自定义国际化，支持中文日期相关展示
class ZhLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const ZhLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'zh';

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      ZhCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(ZhLocalizationsDelegate old) => false;

  @override
  String toString() => 'DefaultCupertinoLocalizations.delegate(zh)';
}

class ZhCupertinoLocalizations implements CupertinoLocalizations {
  const ZhCupertinoLocalizations();

  static const List<String> _shortWeekdays = <String>[
    '周一',
    '周二',
    '周三',
    '周四',
    '周五',
    '周六',
    '周日',
  ];

  static const List<String> _shortMonths = <String>[
    '01月',
    '02月',
    '03月',
    '04月',
    '05月',
    '06月',
    '07月',
    '08月',
    '09月',
    '10月',
    '11月',
    '12月',
  ];

  static const List<String> _months = <String>[
    '01月',
    '02月',
    '03月',
    '04月',
    '05月',
    '06月',
    '07月',
    '08月',
    '09月',
    '10月',
    '11月',
    '12月',
  ];

  @override
  String datePickerYear(int yearIndex) => yearIndex.toString() + '年';

  @override
  String datePickerMonth(int monthIndex) => _months[monthIndex - 1];

  @override
  String datePickerDayOfMonth(int dayIndex) => dayIndex.toString() + '日';

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String datePickerHourSemanticsLabel(int hour) => hour.toString() + " o'clock";

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerMinuteSemanticsLabel(int minute) {
    if (minute == 1) return '1分';
    return minute.toString() + '分';
  }

  @override
  String datePickerMediumDate(DateTime date) {
    return '${_shortWeekdays[date.weekday - DateTime.monday]} '
        '${_shortMonths[date.month - DateTime.january]} '
        '${date.day.toString().padRight(2)}';
  }

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.ymd;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder =>
      DatePickerDateTimeOrder.date_time_dayPeriod;

  @override
  String get anteMeridiemAbbreviation => '上午';

  @override
  String get postMeridiemAbbreviation => '下午';

  @override
  String get todayLabel => '今天';

  @override
  String get alertDialogLabel => 'Alert';

  @override
  String timerPickerHour(int hour) => hour.toString();

  @override
  String timerPickerMinute(int minute) => minute.toString();

  @override
  String timerPickerSecond(int second) => second.toString();

  @override
  String timerPickerHourLabel(int hour) => hour == 1 ? '小时' : '小时';

  @override
  String timerPickerMinuteLabel(int minute) => '分';

  @override
  String timerPickerSecondLabel(int second) => '秒';

  @override
  String get cutButtonLabel => '剪贴';

  @override
  String get copyButtonLabel => '复制';

  @override
  String get pasteButtonLabel => '粘贴';

  @override
  String get selectAllButtonLabel => '全选';

  static Future<CupertinoLocalizations> load(Locale locale) {
    return SynchronousFuture<CupertinoLocalizations>(
        const ZhCupertinoLocalizations());
  }

  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      ZhLocalizationsDelegate();
}
