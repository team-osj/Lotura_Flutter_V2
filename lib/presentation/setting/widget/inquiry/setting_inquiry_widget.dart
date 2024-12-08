import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/component/lotura_gesture.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:url_launcher/url_launcher.dart';

/// 문의하기 버튼 위젯
class SettingInquiryWidget extends StatelessWidget {
  const SettingInquiryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LoturaGesture(
      event: () async => await launchUrl(
        Uri.parse('https://www.instagram.com/team.osj'),
        mode: LaunchMode.externalApplication,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "문의하기",
              style: LoturaTextStyle.subTitle2(
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            SvgPicture.asset(
              "$iconSettingAsset/right_arrow_icon.svg",
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.surfaceTint,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
