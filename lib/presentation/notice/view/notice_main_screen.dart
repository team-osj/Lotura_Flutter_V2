import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lotura_v2/core/component/lotura_app_bar.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/core/layout/lotura_layout.dart';

class NoticeMainScreen extends StatefulWidget {
  const NoticeMainScreen({super.key});

  @override
  State<NoticeMainScreen> createState() => _NoticeMainScreenState();
}

class _NoticeMainScreenState extends State<NoticeMainScreen> {
  @override
  Widget build(BuildContext context) {
    return LoturaLayout(
      appBar: const LoturaAppBar(popRoute: "/main", title: "공지사항"),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Image.asset(
                "$imageNoticeAsset/notice_banner_image.png",
              ),
              const SizedBox(height: 12),
              ListView.builder(
                /// item list의 크기만큼 ListView 크기 지정
                shrinkWrap: true,

                /// 스크롤 이벤트 x
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 100,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => context.push("/noticeDetail"),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset("$iconNoticeAsset/comment_icon.svg"),
                          const SizedBox(width: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "OSJ 사용 안내",
                                style: LoturaTextStyle.subTitle2(
                                  color: LoturaColor.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "1일전",
                                style: LoturaTextStyle.label(
                                  color: LoturaColor.gray600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
