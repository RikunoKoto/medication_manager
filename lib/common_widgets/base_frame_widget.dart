import 'package:flutter/material.dart';

class BaseFrameWidget extends StatelessWidget {
  const BaseFrameWidget({
    super.key,
    required this.title,
    this.appBar,
    required this.body,
    this.hasPrevButton = true,
    this.drawer,
    this.scaffoldKey,
    this.bottomBar,
  });

  //appbarのtitle
  final String title;

  //appbar
  final PreferredSizeWidget? appBar;

  //body
  final Widget body;

  //bottombar
  final Widget? bottomBar;

  //画面タップ時のフォーカス
  final bool hasPrevButton;

  //ドロワー
  final Widget? drawer;

  //ドロワーを開くときに使用
  final GlobalKey? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return hasPrevButton
        //画面全体にTapイベント
        ? GestureDetector(
            //Tapでフォーカスを外す
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: _baseScaffold(context),
          )
        : _baseScaffold(context);
  }

  //共通scaffold
  Widget _baseScaffold(BuildContext context) {
    return Scaffold(
      ///HACK: 一次的な対応
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: Colors.black,
      drawer: drawer,
      appBar: appBar,
      body: SafeArea(child: body),
      bottomNavigationBar:
          bottomBar != null ? SafeArea(child: bottomBar!) : null,
    );
  }
}
