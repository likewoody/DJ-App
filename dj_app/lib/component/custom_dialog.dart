import 'package:dj_app/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomDialog {
  // * method //
  static void showCalendarDialog(
    BuildContext context,
    TextEditingController birthdayController,
    DateTime? selectedDay,
  ) {
    Get.defaultDialog(
      title: "생년월일",
      titlePadding: const EdgeInsets.only(top: 30),
      titleStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: const Color.fromARGB(255, 226, 248, 232),
      barrierDismissible: false,
      content: SizedBox(
        width: Get.width * 1.0,
        height: Get.height * 0.45,
        child: _buildCalendarContent(birthdayController, selectedDay),
      ),
    );
  } // showCalendarDialog

  // ---------------------------------------------------------------------------

  static void buttonDialog(
    String title,
    String middleText,
    List<Widget> buttonList,
  ) {
    Get.defaultDialog(
      title: title,
      titleStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      middleText: middleText,
      middleTextStyle: const TextStyle(
        fontSize: 16,
      ),
      backgroundColor: Colors.yellow.shade200,
      barrierDismissible: false,
      actions: buttonList,
    );
  } // buttonDialog

  // ---------------------------------------------------------------------------

  static void signUpResultDialog(BuildContext context) {
    Get.defaultDialog(
      title: "축하합니다!",
      titleStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      middleText: "[DANG JN]\n"
          "회원가입이 완료되었습니다.\n"
          "이제 [DANG JN]의 모든 기능을\n"
          "이용하실 수 있습니다.\n"
          "지금 바로 로그인하세요 :)\n"
          "(아래 확인 버튼을 누르시면 로그인 페이지로\n"
          "이동합니다.)",
      middleTextStyle: const TextStyle(
        fontSize: 16,
      ),
      backgroundColor: const Color.fromARGB(255, 206, 234, 239),
      barrierDismissible: false,
      actions: [
        TextButton(
          onPressed: () {
            Get.offAll(
              () => const LoginView(),
              transition: Transition.fadeIn,
            );
          },
          child: const Text(
            'OK',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  } // si

  // ---------------------------------------------------------------------------

  // * Widget //
  static Widget _buildCalendarContent(
      TextEditingController birthdayController, DateTime? selectedDay) {
    return ListView(
      children: [
        TableCalendar(
          locale: "ko_KR",
          firstDay: DateTime.utc(1950, 1, 1),
          lastDay: DateTime.utc(2050, 12, 31),
          focusedDay: selectedDay ?? DateTime.now(),
          calendarFormat: CalendarFormat.month,
          selectedDayPredicate: (day) => isSameDay(selectedDay, day),
          onDaySelected: (selectedDay, focusedDay) {
            birthdayController.text =
                DateFormat('yyyy-MM-dd').format(selectedDay);
            Get.back();
          },
          // * DaysOfWeek Custom //
          daysOfWeekStyle: const DaysOfWeekStyle(
            // 일요일 Text Color
            weekendStyle: TextStyle(
              color: Colors.red,
            ),
          ),
          // * Calender Header Custom //
          headerStyle: HeaderStyle(
            titleCentered: true,
            titleTextFormatter: (date, locale) =>
                DateFormat.yMMMM(locale).format(date),
            formatButtonVisible: false,
            titleTextStyle: const TextStyle(
              fontSize: 20.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
            headerPadding: const EdgeInsets.symmetric(vertical: 4.0),
            leftChevronIcon: const Icon(
              Icons.arrow_left,
              size: 40.0,
            ),
            rightChevronIcon: const Icon(
              Icons.arrow_right,
              size: 40.0,
            ),
          ),
          // * Calendar Custom //
          calendarStyle: const CalendarStyle(
            // * Today Indicator Custom //
            // today 표시 여부
            isTodayHighlighted: true,
            // today 글자 조정
            todayTextStyle: TextStyle(
              color: Color(0xFFFAFAFA),
              fontSize: 16.0,
            ),
            // today 모양 조정
            todayDecoration: BoxDecoration(
              color: Color(0xFF9FA8DA),
              shape: BoxShape.circle,
            ),
            // * Weekend(주말) Indicator Custom //
            // weekend 글자 조정
            weekendTextStyle: TextStyle(
              color: Color(0xFF5A5A5A),
            ),
            // weekend 모양 조정
            weekendDecoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 198, 206),
              shape: BoxShape.circle,
            ),
            // * Outside Day(다른 달) Indicator Custom //
            // outsideDay 노출 여부
            outsideDaysVisible: true,
            // outsideDay 글자 조정
            outsideTextStyle: TextStyle(
              color: Color(0xFFAEAEAE),
            ),
          ),
        ),
      ],
    );
  } // _buildCalendarContent
} // end of CustomDialog