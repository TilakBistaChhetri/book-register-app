class GetEntity {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<DataEntity>? data;
  final SupportEntity? support;

  const GetEntity({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });
}

class DataEntity {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const DataEntity({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });
}

class SupportEntity {
  final String? url;
  final String? text;

  const SupportEntity({
    this.url,
    this.text,
  });
}
