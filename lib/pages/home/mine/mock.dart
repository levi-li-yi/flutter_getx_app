/*
 * @Author: Levi Li
 * @Date: 2023-12-07 09:46:56
 * @description: 
 */
import 'package:dart_mock/dart_mock.dart' as mock;
import 'package:flutter_getx_app/wcao/kit/index.dart';

class MockMine {
  final String nickName;
  final String avatar;
  final int createDay;
  final List<String> tags;
  final String bg;
  final int visits;
  final int friends;
  final int fans;

  MockMine({
    required this.nickName,
    required this.avatar,
    required this.createDay,
    required this.tags,
    required this.bg,
    required this.visits,
    required this.friends,
    required this.fans,
  });

  static MockMine get() {
    return MockMine(
      nickName: mock.cname(),
      avatar: WcaoUtils.getRandomImage(),
      createDay: mock.integer(min: 1, max: 30),
      tags: List.generate(mock.integer(min: 1, max: 4),
          (index) => '#${mock.ctitle(min: 3, max: 10)}'),
      bg: WcaoUtils.getRandomImage(),
      visits: mock.integer(min: 1, max: 99),
      friends: mock.integer(min: 1, max: 99),
      fans: mock.integer(min: 1, max: 99),
    );
  }
}
