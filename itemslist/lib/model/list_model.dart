import 'dart:convert';

class ListModel {
    List<String> timings;
  

    ListModel({
        this.timings,
    });

    ListModel copyWith({
      List<String> timings,
    }) => 
        ListModel(
            timings: timings ?? this.timings,
        );

    factory ListModel.fromRawJson(String str) => ListModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
        timings: json["timings"] == null ? null : json["timings"],
    );

    Map<String, dynamic> toJson() => {
        "timings": timings == null ? null : timings,
    };
}
