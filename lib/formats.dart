import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

enum SnackBarType { info, error, success }
enum DialogType { info, error, success }


DateFormat _dateFormatMN = DateFormat('dd MMM yyyy');
DateFormat _dateFormatMNTime = DateFormat('dd MMM yyyy hh:mm a');
NumberFormat _numberFormat = NumberFormat('##,##,###.##');

String getFormattedDate(String date) {
  if (date.isEmpty) {
    return "-";
  }
  return _dateFormatMN.format(DateTime.parse(date));
}

String getFormattedDateTime(String date) {
  if (date.isEmpty) {
    return "-";
  }
  return _dateFormatMNTime.format(DateTime.parse(date));
}

String getFormattedDateTimeOfDate(DateTime? date) {
  if (date == null) {
    return "";
  }
  return _dateFormatMNTime.format(date);
}

String getFormattedAmount(double value) {
  const rupeeSymbol = "\u20B9";
  if (value == 0) {
    return "$rupeeSymbol 0";
  }
  return "$rupeeSymbol ${_numberFormat.format(value)}";
}

NumberFormat numberFormat = NumberFormat("#,##0.00", "en_US");


///for schedule Date Selection

chooseDate(Rx<DateTime> scheduledDate,RxString dateValue) async {
  DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: scheduledDate.value,
      firstDate: DateTime(DateTime.now().year - 60),
      lastDate: DateTime(DateTime.now().year + 3));

  if (pickedDate != null && pickedDate != scheduledDate.value) {
    scheduledDate.value = pickedDate;
  }
  dateValue.value = getFormattedDate(scheduledDate.value.toString());
}

void hideKeyboard() {
  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
}
void showMessageDialog(String message,
    {String title = "Message", DialogType type = DialogType.info}) {
  Color _bgColor = Colors.white;
  Color _textColor = Colors.black;

  switch (type) {
    case DialogType.info:
      break;
    case DialogType.error:
      _bgColor = Colors.red;
      _textColor = Colors.white;
      break;
    case DialogType.success:
      _bgColor = Colors.green;
      _textColor = Colors.white;
      break;
  }

  Get.defaultDialog(
    title: title,
    middleText: message,
    titleStyle: TextStyle(color: _textColor),
    middleTextStyle: TextStyle(color: _textColor),
    radius: 5,
    barrierDismissible: false,
    textConfirm: "OK",
    buttonColor: Colors.white,
    confirmTextColor: Colors.black,
    backgroundColor: _bgColor,
    onConfirm: () {
      Get.back();
    },
  );
}