import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Store{
  String id;
  String media_id;
  String activity_id; 
  String siret;
  String name;
  String phone;
  String description;
  String uuid;
  String created_at;
  String updated_at;
  String deleted_at;
  

  Store(this.id, this.media_id, this.activity_id,
   this.siret, this.name, this.phone, this.description,
   this.uuid, this.created_at, this.updated_at, this.deleted_at);

  Store.fromJson(Map json):
      id = json["id"],
      media_id = json["media_id"],
      activity_id = json["activity_id"],
      siret = json["siret"],
      name = json["name"],
      phone = json["phone"],
      description = json["description"],
      uuid = json["uuid"],
      created_at = json["created_at"],
      updated_at = json["updated_at"],
      deleted_at=json['deleted_at'];
  Map toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

}