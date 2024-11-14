import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lotura_v2/core/component/lotura_app_bar.dart';
import 'package:lotura_v2/core/component/lotura_gesture.dart';
import 'package:lotura_v2/core/component/lotura_scroll_widget.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/core/layout/lotura_layout.dart';
import 'package:lotura_v2/core/layout/lotura_loading_layout.dart';
import 'package:lotura_v2/core/layout/lotura_network_error_layout.dart';
import 'package:lotura_v2/presentation/notice/provider/get_notice_option_view_model_provider.dart';
import 'package:lotura_v2/presentation/notice/provider/get_notice_view_model_provider.dart';
import 'package:lotura_v2/presentation/notice/provider/state/get_notice_state.dart';

class NoticeMainScreen extends ConsumerStatefulWidget {
  const NoticeMainScreen({super.key});

  @override
  ConsumerState<NoticeMainScreen> createState() => _NoticeMainScreenState();
}

class _NoticeMainScreenState extends ConsumerState<NoticeMainScreen> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(getNoticeViewModelProvider.notifier).execute();
    });
    controller = ScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final readNoticeList = ref.watch(getNoticeOptionViewModelProvider).values;
    final noticeList = ref.watch(getNoticeViewModelProvider).values;
    final noticeState = ref.watch(getNoticeViewModelProvider).state;
    PreferredSizeWidget appBar = const LoturaAppBar(title: "공지사항");
    return switch (noticeState) {
      GetNoticeState.initial => LoturaLoadingLayout(appBar: appBar),
      GetNoticeState.loading => LoturaLoadingLayout(appBar: appBar),
      GetNoticeState.failure => LoturaNetworkErrorLayout(appBar: appBar),
      GetNoticeState.success => LoturaLayout(
          appBar: appBar,
          child: LoturaScrollWidget(
            controller: controller,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Image.asset(
                    "$imageNoticeAsset/notice_${Theme.of(context).colorScheme.brightness.name}_banner_image.png",
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                    /// item list의 크기만큼 ListView 크기 지정
                    shrinkWrap: true,

                    /// 스크롤 이벤트 x
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: noticeList.length,
                    itemBuilder: (context, index) {
                      final isRead = readNoticeList
                          .contains(noticeList.elementAt(index).id);
                      return LoturaGesture(
                        event: () =>
                            context.push("/noticeDetail", extra: index),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                "$iconNoticeAsset/comment_icon.svg",
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.primaryFixed,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(width: 24),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      noticeList.elementAt(index).title,
                                      style: LoturaTextStyle.subTitle2(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inverseSurface,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text(
                                          noticeList
                                              .elementAt(index)
                                              .date
                                              .split(" ")[0],
                                          style: LoturaTextStyle.label(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surfaceContainerLow,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        isRead
                                            ? Text(
                                                "읽음",
                                                style: LoturaTextStyle.body3(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondary,
                                                ),
                                              )
                                            : Text(
                                                "안 읽음",
                                                style: LoturaTextStyle.body3(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
    };
  }
}
