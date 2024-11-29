class BodyItemEntity {
  final String? emi;

  final String? duration;
  final String? title;
  final dynamic subtitle;
  final String? tag;
  final String? icon;
  BodyItemEntity({
    required this.emi,
    required this.duration,
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.icon,
  });
}

class CardEntity {
  final String? header;

  final String? description;
  final int? maxRange;
  final int? minRange;
  CardEntity({
    required this.header,
    required this.description,
    required this.maxRange,
    required this.minRange,
  });
}

class ClosedStateBodyEntity {
  final String? key1;

  final String? key2;
  ClosedStateBodyEntity({
    required this.key1,
    required this.key2,
  });
}

class ClosedStateEntity {
  final ClosedStateBodyEntity? body;

  ClosedStateEntity({
    required this.body,
  });
}

class DataEntity {
  final List<DataModelItemEntity> items;

  DataEntity({
    required this.items,
  });
}

class DataModelItemEntity {
  final OpenStateEntity? openState;

  final ClosedStateEntity? closedState;
  final String? ctaText;
  DataModelItemEntity({
    required this.openState,
    required this.closedState,
    required this.ctaText,
  });
}

class OpenStateBodyEntity {
  final String? title;

  final String? subtitle;
  final CardEntity? card;
  final String? footer;
  final List<BodyItemEntity> items;
  OpenStateBodyEntity({
    required this.title,
    required this.subtitle,
    required this.card,
    required this.footer,
    required this.items,
  });
}

class OpenStateEntity {
  final OpenStateBodyEntity? body;

  OpenStateEntity({
    required this.body,
  });
}
