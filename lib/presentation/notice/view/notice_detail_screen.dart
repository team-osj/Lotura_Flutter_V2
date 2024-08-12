import 'package:flutter/material.dart';
import 'package:lotura_v2/core/component/lotura_app_bar.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/core/layout/lotura_layout.dart';

class NoticeDetailScreen extends StatelessWidget {
  const NoticeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoturaLayout(
      appBar: const LoturaAppBar(popRoute: "/notice"),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "OSJ 사용 안내",
                  style: LoturaTextStyle.heading3(
                    color: LoturaColor.black,
                  ),
                ),
                Text(
                  "1일전",
                  style: LoturaTextStyle.button1(
                    color: LoturaColor.gray600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              "오상진 선생님의 차량인 카니발의 연비가 잘 나온다는 소식입니다.오상진 선생님의 차량인 카니발의 연비가 잘 나온다는 소식입니다.오상진 선생님의 차량인 카니발의 연비가 잘 나온다는 소식입니다.오상진 선생님의 차량인 카니발의 연비가 잘 나온다는 소식입니다.오상진 선생님의 차량인 카니발의 연비가 잘 나온다는 소식입니다.",
              style: LoturaTextStyle.body1(
                color: LoturaColor.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
