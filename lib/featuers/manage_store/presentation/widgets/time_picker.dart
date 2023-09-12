import 'package:flutter/material.dart';

import 'package:jessy_mall/config/theme/color_manager.dart';
import 'package:jessy_mall/core/widgets/custom_button.dart';
import 'package:jessy_mall/featuers/manage_store/presentation/widgets/edit_store_info_body.dart';

/// Flutter code sample for [showTimePicker].

class TimePickerOptions extends StatefulWidget {
  const TimePickerOptions({
    Key? key,
    required this.themeMode,
    required this.useMaterial3,
    required this.textOpenOrClose,
    required this.color,
    required this.openOrCloseStoreTime,
  }) : super(key: key);

  final ThemeMode themeMode;
  final bool useMaterial3;
  final String textOpenOrClose;
  final Color color;
  final int openOrCloseStoreTime;

  @override
  State<TimePickerOptions> createState() => _TimePickerOptionsState();
}

class _TimePickerOptionsState extends State<TimePickerOptions> {
  TimeOfDay? selectedTime;
  TimePickerEntryMode entryMode = TimePickerEntryMode.dial; //input
  Orientation? orientation;
  TextDirection textDirection = TextDirection.ltr;
  MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.padded;
  bool use24HourTime = false;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: widget.color,
      text: widget.textOpenOrClose,
      onPressed: () async {
        print(TimeOfDay.now());
        final TimeOfDay? time = await showTimePicker(
          context: context,
          initialTime: selectedTime ?? TimeOfDay.now(),
          initialEntryMode: entryMode,
          orientation: orientation,
          builder: (BuildContext context, Widget? child) {
            // We just wrap these environmental changes around the
            // child in this builder so that we can apply the
            // options selected above. In regular usage, this is
            // rarely necessary, because the default values are
            // usually used as-is.
            return Theme(
              data: Theme.of(context).copyWith(
                materialTapTargetSize: tapTargetSize,
              ),
              child: Directionality(
                textDirection: textDirection,
                child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    alwaysUse24HourFormat: use24HourTime,
                  ),
                  child: child!,
                ),
              ),
            );
          },
        );
        setState(() {
          selectedTime = time;
          if (widget.openOrCloseStoreTime == 1) {
            String tempHourForOpen = selectedTime!.hour.toString();
            if (tempHourForOpen.length == 1) {
              tempHourForOpen = "0$tempHourForOpen";
            }
            String tempMinForOpen = selectedTime!.minute.toString();
            if (tempMinForOpen.length == 1) {
              tempMinForOpen = "0$tempMinForOpen";
            }
            openStoreTime = "${tempHourForOpen}:${tempMinForOpen}:00";
            print(openStoreTime);
          } else if (widget.openOrCloseStoreTime == 0) {
            String tempHourForColse = selectedTime!.hour.toString();
            if (tempHourForColse.length == 1) {
              tempHourForColse = "0$tempHourForColse";
            }
            String tempMinForClose = selectedTime!.minute.toString();
            if (tempMinForClose.length == 1) {
              tempMinForClose = "0$tempMinForClose";
            }
            closeStoreTime = "${tempHourForColse}:${tempMinForClose}:00";
            print(closeStoreTime);
          }
          print(selectedTime);
        });
      },
    );
  }
}
