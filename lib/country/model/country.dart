import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class Country{
  String name;
  String code;
  String timezone;
  String uuid;

  Country(this.name, this.code, this.timezone, this.uuid);

  Country.fromJson(Map json):
          name=json['name'],
          code=json['code'],
          timezone=json['timezone'],
          uuid=json['uuid'];
  Map toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

}