import 'dart:convert';

class Entity {
  int? entityID;
  String? entityName;
  String? category;
  String? wikiLink;
  Entity({this.entityID, this.entityName, this.category, this.wikiLink});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'entityID': entityID,
      'entityName': entityName,
      'category': category,
      'wikiLink': wikiLink
    };
  }

  factory Entity.fromMap(Map<String, dynamic> map) {
    return Entity(
        entityID: map['entity_id'] != null ? map['entity_id'] as int : null,
        entityName: map['entity_alias'] != null
            ? map['entity_alias'] as String
            : map["entity_name"] != null
                ? map["entity_name"] as String
                : null,
        category: map['category_readable'] != null
            ? map['category_readable'] as String
            : map['category'] !=null
            ? map["category"] as String : null,
        wikiLink: map['entity_alias_url'] != null
            ? map['entity_alias_url'] as String
            : map['wikipedia'] !=null
            ? map["wikipedia"] as String
            : null);
  }
  String toJson() => json.encode(toMap());

  factory Entity.fromJson(String source) =>
      Entity.fromMap(json.decode(source) as Map<String, dynamic>);
}
