import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/core/component/lotura_app_bar.dart';
import 'package:lotura_v2/core/component/lotura_scroll_widget.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/core/layout/lotura_layout.dart';
import 'package:lotura_v2/core/layout/lotura_loading_layout.dart';
import 'package:lotura_v2/core/layout/lotura_network_error_layout.dart';
import 'package:lotura_v2/presentation/notice/provider/get_notice_option_view_model_provider.dart';
import 'package:lotura_v2/presentation/notice/provider/get_notice_view_model_provider.dart';
import 'package:lotura_v2/presentation/notice/provider/state/get_notice_state.dart';
import 'package:lotura_v2/presentation/notice/provider/update_notice_option_view_model_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticeDetailScreen extends ConsumerStatefulWidget {
  final int index;

  const NoticeDetailScreen({
    super.key,
    required this.index,
  });

  @override
  ConsumerState<NoticeDetailScreen> createState() => _NoticeDetailScreenState();
}

class _NoticeDetailScreenState extends ConsumerState<NoticeDetailScreen> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final noticeListId = ref.watch(getNoticeViewModelProvider).values.elementAt(widget.index).id;
      final readNoticeList = ref.watch(getNoticeOptionViewModelProvider).values;
      if (!readNoticeList.contains(noticeListId)) {
        ref.read(updateNoticeOptionViewModelProvider.notifier).execute(id: noticeListId);
        /// 데이터 재빌드
        ref.read(getNoticeOptionViewModelProvider.notifier).execute();
      }
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
    final noticeState = ref.watch(getNoticeViewModelProvider).state;
    final noticeList = ref.watch(getNoticeViewModelProvider).values;
    PreferredSizeWidget appBar = const LoturaAppBar();
    return switch (noticeState) {
      GetNoticeState.initial => LoturaLoadingLayout(appBar: appBar),
      GetNoticeState.loading => LoturaLoadingLayout(appBar: appBar),
      GetNoticeState.failure => LoturaNetworkErrorLayout(appBar: appBar),
      GetNoticeState.success => LoturaLayout(
          appBar: appBar,
          child: LoturaScrollWidget(
            controller: controller,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    noticeList.elementAt(widget.index).title,
                    style: LoturaTextStyle.heading3(
                      color: LoturaColor.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    noticeList.elementAt(widget.index).date.split(" ")[0],
                    style: LoturaTextStyle.button1(
                      color: LoturaColor.gray600,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Markdown(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    data: noticeList.elementAt(widget.index).contents,
                    onTapLink: (text, href, title) async {
                      await launchUrl(Uri.parse(href!));
                    },
                    styleSheet: MarkdownStyleSheet(
                      p: LoturaTextStyle.body1(color: LoturaColor.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    };
  }
}
