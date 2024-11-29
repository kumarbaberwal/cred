class BodyItem {
  final String? emi;

  final String? duration;
  final String? title;
  final dynamic subtitle;
  final String? tag;
  final String? icon;
  BodyItem({
    required this.emi,
    required this.duration,
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.icon,
  });

  factory BodyItem.fromJson(Map<String, dynamic> json) {
    return BodyItem(
      emi: json["emi"],
      duration: json["duration"],
      title: json["title"],
      subtitle: json["subtitle"],
      tag: json["tag"],
      icon: json["icon"],
    );
  }
}

class Card {
  final String? header;

  final String? description;
  final int? maxRange;
  final int? minRange;
  Card({
    required this.header,
    required this.description,
    required this.maxRange,
    required this.minRange,
  });

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      header: json["header"],
      description: json["description"],
      maxRange: json["max_range"],
      minRange: json["min_range"],
    );
  }
}

class ClosedState {
  final ClosedStateBody? body;

  ClosedState({
    required this.body,
  });

  factory ClosedState.fromJson(Map<String, dynamic> json) {
    return ClosedState(
      body:
          json["body"] == null ? null : ClosedStateBody.fromJson(json["body"]),
    );
  }
}

class ClosedStateBody {
  final String? key1;

  final String? key2;
  ClosedStateBody({
    required this.key1,
    required this.key2,
  });

  factory ClosedStateBody.fromJson(Map<String, dynamic> json) {
    return ClosedStateBody(
      key1: json["key1"],
      key2: json["key2"],
    );
  }
}

class DataModel {
  final List<DataModelItem> items;

  DataModel({
    required this.items,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      items: json["items"] == null
          ? []
          : List<DataModelItem>.from(
              json["items"]!.map((x) => DataModelItem.fromJson(x))),
    );
  }
}

class DataModelItem {
  final OpenState? openState;

  final ClosedState? closedState;
  final String? ctaText;
  DataModelItem({
    required this.openState,
    required this.closedState,
    required this.ctaText,
  });

  factory DataModelItem.fromJson(Map<String, dynamic> json) {
    return DataModelItem(
      openState: json["open_state"] == null
          ? null
          : OpenState.fromJson(json["open_state"]),
      closedState: json["closed_state"] == null
          ? null
          : ClosedState.fromJson(json["closed_state"]),
      ctaText: json["cta_text"],
    );
  }
}

class OpenState {
  final OpenStateBody? body;

  OpenState({
    required this.body,
  });

  factory OpenState.fromJson(Map<String, dynamic> json) {
    return OpenState(
      body: json["body"] == null ? null : OpenStateBody.fromJson(json["body"]),
    );
  }
}

class OpenStateBody {
  final String? title;

  final String? subtitle;
  final Card? card;
  final String? footer;
  final List<BodyItem> items;
  OpenStateBody({
    required this.title,
    required this.subtitle,
    required this.card,
    required this.footer,
    required this.items,
  });

  factory OpenStateBody.fromJson(Map<String, dynamic> json) {
    return OpenStateBody(
      title: json["title"],
      subtitle: json["subtitle"],
      card: json["card"] == null ? null : Card.fromJson(json["card"]),
      footer: json["footer"],
      items: json["items"] == null
          ? []
          : List<BodyItem>.from(
              json["items"]!.map((x) => BodyItem.fromJson(x))),
    );
  }
}
