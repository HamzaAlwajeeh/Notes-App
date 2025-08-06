import 'package:hive/hive.dart';

part 'setting_model.g.dart';

@HiveType(typeId: 1)
class SettingModel extends HiveObject {
  @HiveField(0)
  String? language;
  @HiveField(1)
  String? theme;

  SettingModel({this.language, this.theme});
}
