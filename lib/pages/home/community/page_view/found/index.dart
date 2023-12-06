/*
 * @Author: Levi Li
 * @Date: 2023-12-06 10:06:50
 * @description: 
 */
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:flutter_getx_app/wcao/kit/index.dart';
import 'package:flutter_getx_app/wcao/ui/theme.dart';
import 'package:flutter_getx_app/pages/home/community/page_view/like/mock.dart';

class PageViewFound extends StatefulWidget {
  const PageViewFound({Key? key}) : super(key: key);

  @override
  State<PageViewFound> createState() => _PageViewFoundState();
}

class _PageViewFoundState extends State<PageViewFound> {
  List<MockLike> list = [];
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    MockLike.clear();
    setState(() {
      list = MockLike.get(num: 12);
    });
  }

  // 下拉刷新
  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    MockLike.clear();
    setState(() {
      list = MockLike.get(num: 12);
    });
    _refreshController.refreshCompleted();
  }

  // 上拉加载
  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    if (list.length < 60) {
      return _refreshController.loadNoData();
    }

    setState(() {
      list = MockLike.get(num: 12);
    });
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.6,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: list.length,
          itemBuilder: (ctx, index) {
            var item = list[index];
            return Column(
              children: [
                Expanded(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child:
                      WcaoUtils.imageCache(item.avatar, fit: BoxFit.fitHeight),
                )),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: Text(
                    item.text,
                    maxLines: 2,
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: WcaoUtils.imageCache(item.avatar),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 4),
                            child: Text(
                              item.nickName,
                              style: TextStyle(
                                  color: WcaoTheme.secondary,
                                  fontSize: WcaoTheme.fsSm),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.favorite_outline,
                            color: WcaoTheme.secondary,
                            size: WcaoTheme.fsBase,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 4),
                            child: Text(
                              "${item.fav}",
                              style: TextStyle(
                                color: WcaoTheme.secondary,
                                fontSize: WcaoTheme.fsSm,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
