import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginBackground extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()..color = Colors.blue;
    canvas.drawCircle(Offset(size.width/2,size.height*0.25), size.height/2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false ; // 여기서 그린 paint를 안에 이미지 프레임에 맞춰서 그 때마다 다시 생성해 줄것인지? 단순 background 기 때문에 재생성 필요 없어서 false
  }

}