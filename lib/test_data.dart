import 'package:hive/hive.dart';
import 'package:build_runner/build_runner.dart';
part 'test_data.g.dart';

@HiveType(typeId: 0)
class TestData {
  @HiveField(0)
  String name;
  @HiveField(1)
  int id;
  TestData({required this.name, required this.id});
}
