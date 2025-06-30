import 'package:registerapp/features/get_delete/domain/entity/get_entity.dart';

class GetModel extends GetEntity {
  GetModel({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<DataModel>? data,
    SupportModel? support,
  }) : super(
          page: page,
          perPage: perPage,
          total: total,
          totalPages: totalPages,
          data: data,
          support: support,
        );

  factory GetModel.fromJson(Map<String, dynamic> json) {
    return GetModel(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data: json['data'] != null
          ? (json['data'] as List).map((e) => DataModel.fromJson(e)).toList()
          : null,
      support: json['support'] != null ? SupportModel.fromJson(json['support']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['per_page'] = perPage;
    map['total'] = total;
    map['total_pages'] = totalPages;
    if (data != null) {
      map['data'] = data!.map((e) => (e as DataModel).toJson()).toList();
    }
    if (support != null) {
      map['support'] = (support as SupportModel).toJson();
    }
    return map;
  }
}

class DataModel extends DataEntity {
  DataModel({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) : super(
          id: id,
          email: email,
          firstName: firstName,
          lastName: lastName,
          avatar: avatar,
        );

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'avatar': avatar,
      };
}

class SupportModel extends SupportEntity {
  SupportModel({String? url, String? text}) : super(url: url, text: text);

  factory SupportModel.fromJson(Map<String, dynamic> json) {
    return SupportModel(
      url: json['url'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() => {
        'url': url,
        'text': text,
      };
}
