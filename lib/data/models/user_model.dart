// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ListUserModel {
  List<Result> results;
  Info info;

  ListUserModel({
    required this.results,
    required this.info,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'results': results.map((x) => x.toMap()).toList(),
      'info': info.toMap(),
    };
  }

  factory ListUserModel.fromMap(Map<String, dynamic> map) {
    return ListUserModel(
      results: List<Result>.from(
        (map['results'] as List<dynamic>).map<Result>(
          (x) => Result.fromMap(x as Map<String, dynamic>, x.length),
        ),
      ),
      info: Info.fromMap(map['info'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListUserModel.fromJson(String source) =>
      ListUserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Info {
  String seed;
  int results;
  int page;
  String version;

  Info({
    required this.seed,
    required this.results,
    required this.page,
    required this.version,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'seed': seed,
      'results': results,
      'page': page,
      'version': version,
    };
  }

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      seed: map['seed'] as String,
      results: map['results'] as int,
      page: map['page'] as int,
      version: map['version'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Info.fromJson(String source) =>
      Info.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Result {
  Name name;
  String phone;
  Id id;
  Picture picture;
  int number = 0;

  Result({
    required this.name,
    required this.phone,
    required this.id,
    required this.picture,
    required this.number,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name.toMap(),
      'phone': phone,
      'id': id.toMap(),
      'picture': picture.toMap(),
      'number': number,
    };
  }

  int numberValue = 1;

  factory Result.fromMap(Map<String, dynamic> map, length) {
    return Result(
      name: Name.fromMap(map['name'] as Map<String, dynamic>),
      phone: map['phone'] as String,
      id: Id.fromMap(map['id'] as Map<String, dynamic>),
      picture: Picture.fromMap(map['picture'] as Map<String, dynamic>),
      number: length,
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) => Result.fromMap(
      json.decode(source) as Map<String, dynamic>, source.length);
}

class Id {
  String name;
  String value;

  Id({
    required this.name,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'value': value,
    };
  }

  factory Id.fromMap(Map<String, dynamic> map) {
    return Id(
      name: map['name'] as String,
      value: map['value'] as String,
    );
  }
}

class Name {
  String title;
  String first;
  String last;

  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'first': first,
      'last': last,
    };
  }

  factory Name.fromMap(Map<String, dynamic> map) {
    return Name(
      title: map['title'] as String,
      first: map['first'] as String,
      last: map['last'] as String,
    );
  }
}

class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'large': large,
      'medium': medium,
      'thumbnail': thumbnail,
    };
  }

  factory Picture.fromMap(Map<String, dynamic> map) {
    return Picture(
      large: map['large'] as String,
      medium: map['medium'] as String,
      thumbnail: map['thumbnail'] as String,
    );
  }
}
