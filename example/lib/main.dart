import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zh_date_picker/zh_date_pickers.dart';
import 'package:zh_date_picker/zh_date_picker_dialog.dart';

void main() => runApp(MyApp());

const TextStyle select = TextStyle(
    fontSize: 16, color: Colors.green, decoration: TextDecoration.none);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DatePicker',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Zh(中文版本)Date-Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String yearMonthDay = '';
  String yearMonth = '';
  String monthDay = '';
  String year = '';
  String month = '';
  String day = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              OutlineButton(
                child: Text("(中文)选择年-月-日"),
                borderSide: BorderSide(color: Colors.grey, width: 2),
                disabledBorderColor: Colors.black,
                highlightedBorderColor: Colors.green,
                onPressed: () {
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
                },
              ),
              Text(yearMonthDay),
              OutlineButton(
                child: Text("(中文)选择年-月"),
                borderSide: BorderSide(color: Colors.grey, width: 2),
                disabledBorderColor: Colors.black,
                highlightedBorderColor: Colors.green,
                onPressed: () {
                  ZhCupertinoDatePickerDialog.show(
                      context: context,
                      selectStyle: select,
                      dateType: ZhCupertinoDatePickerMode.yearAndMonth,
                      //初始化日期
                      initialDateTime: DateTime.utc(2020, 6, 6),
                      onDateTimeChanged: (dateTime) {
                        setState(() {
                          yearMonth = dateTime.year.toString() +
                              '-' +
                              dateTime.month.toString();
                        });
                      });
                },
              ),
              Text(yearMonth),
              OutlineButton(
                child: Text("(中文)选择月-日"),
                borderSide: BorderSide(color: Colors.grey, width: 2),
                disabledBorderColor: Colors.black,
                highlightedBorderColor: Colors.green,
                onPressed: () {
                  ZhCupertinoDatePickerDialog.show(
                      context: context,
                      selectStyle: select,
                      dateType: ZhCupertinoDatePickerMode.monthAndDay,
                      onDateTimeChanged: (dateTime) {
                        setState(() {
                          monthDay = dateTime.month.toString() +
                              '-' +
                              dateTime.day.toString();
                        });
                      });
                },
              ),
              Text(monthDay),
              OutlineButton(
                child: Text("(中文)选择年"),
                borderSide: BorderSide(color: Colors.grey, width: 2),
                disabledBorderColor: Colors.black,
                highlightedBorderColor: Colors.green,
                onPressed: () {
                  ZhCupertinoDatePickerDialog.show(
                      context: context,
                      selectStyle: select,
                      dateType: ZhCupertinoDatePickerMode.year,
                      onDateTimeChanged: (dateTime) {
                        setState(() {
                          year = dateTime.year.toString();
                        });
                      });
                },
              ),
              Text(year),
              OutlineButton(
                child: Text("(中文)选择月"),
                borderSide: BorderSide(color: Colors.grey, width: 2),
                disabledBorderColor: Colors.black,
                highlightedBorderColor: Colors.green,
                onPressed: () {
                  ZhCupertinoDatePickerDialog.show(
                      context: context,
                      selectStyle: select,
                      dateType: ZhCupertinoDatePickerMode.month,
                      onDateTimeChanged: (dateTime) {
                        setState(() {
                          month = dateTime.month.toString();
                        });
                      });
                },
              ),
              Text(month),
              OutlineButton(
                child: Text("(中文)选择日"),
                borderSide: BorderSide(color: Colors.grey, width: 2),
                disabledBorderColor: Colors.black,
                highlightedBorderColor: Colors.green,
                onPressed: () {
                  ZhCupertinoDatePickerDialog.show(
                      context: context,
                      selectStyle: select,
                      dateType: ZhCupertinoDatePickerMode.day,
                      onDateTimeChanged: (dateTime) {
                        setState(() {
                          day = dateTime.day.toString();
                        });
                      });
                },
              ),
              Text(day),
            ],
          ),
        ));
  }
}
