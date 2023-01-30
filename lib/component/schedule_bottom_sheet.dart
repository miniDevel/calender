import 'package:calender/component/custom_text_field.dart';
import 'package:calender/const/colors.dart';
import 'package:flutter/material.dart';

class ScheduleBottomSheet extends StatelessWidget {
  const ScheduleBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 시스템 UI로 인해 가려진 부분만큼 밀려나서 보이게 해줌
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () {
        // 현재 포커스가 되어있는 포커스에서 포커스를 없앨 수 있다.(키보드 닫을때 사용)
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height / 2 + bottomInset,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
            child: Padding(
              padding: EdgeInsets.only(bottom: bottomInset),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Time(),
                  SizedBox(height: 16),
                  _Contents(),
                  SizedBox(height: 16),
                  _ColorPicker(),
                  SizedBox(height: 8),
                  _SaveButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Time extends StatelessWidget {
  const _Time({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomTextField(lable: '시작 시간', isTime: true)),
        SizedBox(width: 16),
        Expanded(child: CustomTextField(lable: '마감 시간', isTime: true)),
      ],
    );
  }
}

class _Contents extends StatelessWidget {
  const _Contents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: CustomTextField(lable: '내용', isTime: false));
  }
}

class _ColorPicker extends StatelessWidget {
  const _ColorPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // 사이사이의 간격을 둘수 있다.
      spacing: 8,
      // 각각의 row별로 간격을 줄수 있음
      runSpacing: 10,
      children: [
        renderColor(Colors.red),
        renderColor(Colors.orange),
        renderColor(Colors.yellow),
        renderColor(Colors.green),
        renderColor(Colors.blue),
        renderColor(Colors.indigo),
        renderColor(Colors.purple),
      ],
    );
  }

  Widget renderColor(Color color) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      width: 32,
      height: 32,
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('저장'),
        style: ElevatedButton.styleFrom(primary: PrimaryColor),
      ),
    );
  }
}
