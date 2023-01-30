import 'package:calender/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final bool isTime;
  final String lable;
  const CustomTextField({required this.isTime, required this.lable, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle =
        TextStyle(color: PrimaryColor, fontWeight: FontWeight.w600);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lable,
          style: textStyle,
        ),
        isTime ? renderTextField() : Expanded(child: renderTextField())
      ],
    );
  }

  Widget renderTextField() {
    return TextField(
      // 커서 색깔 바꾸기
      cursorColor: Colors.grey,
      // 최대 줄의 개수를 설정 가능, null을 넣을경우 무제한
      maxLines: isTime ? 1 : null,
      // 실제 부모의 사이즈 만큼 커질수 있는 방법
      expands: !isTime,
      // 숫자만 쓸수 있게 할수 있다!
      keyboardType: isTime ? TextInputType.number : TextInputType.multiline,
      // 혹시나 다른 종류의 글씨가 들어오는걸 차단해버릴수 있다.
      inputFormatters: isTime ? [FilteringTextInputFormatter.digitsOnly] : [],
      // TextField 꾸미기
      decoration: InputDecoration(
          // 텍스트필드 아래 선 없애기
          border: InputBorder.none,
          // 색깔을 넣을때는 fill을 꼭  true로 해줘야함
          filled: true,
          fillColor: Colors.grey[300]),
    );
  }
}
