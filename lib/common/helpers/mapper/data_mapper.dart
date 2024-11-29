import 'package:cred/data/home/models/data_model.dart';
import 'package:cred/domain/home/entities/data_entity.dart';

class DataMapper {
  // Map `DataModel` to `DataEntity`
  static DataEntity toEntity(DataModel dataModel) {
    return DataEntity(
      items: dataModel.items.map(toEntityDataModelItem).toList(),
    );
  }

  // Map `BodyItem` to `BodyItemEntity`
  static BodyItemEntity toEntityBodyItem(BodyItem bodyItem) {
    return BodyItemEntity(
      emi: bodyItem.emi,
      duration: bodyItem.duration,
      title: bodyItem.title,
      subtitle: bodyItem.subtitle,
      tag: bodyItem.tag,
      icon: bodyItem.icon,
    );
  }

  // Map `Card` to `CardEntity`
  static CardEntity toEntityCard(Card card) {
    return CardEntity(
      header: card.header,
      description: card.description,
      maxRange: card.maxRange,
      minRange: card.minRange,
    );
  }

  // Map `ClosedState` to `ClosedStateEntity`
  static ClosedStateEntity toEntityClosedState(ClosedState closedState) {
    return ClosedStateEntity(
      body: closedState.body != null
          ? toEntityClosedStateBody(closedState.body!)
          : null,
    );
  }

  // Map `ClosedStateBody` to `ClosedStateBodyEntity`
  static ClosedStateBodyEntity toEntityClosedStateBody(
      ClosedStateBody body) {
    return ClosedStateBodyEntity(
      key1: body.key1,
      key2: body.key2,
    );
  }

  // Map `DataModelItem` to `DataModelItemEntity`
  static DataModelItemEntity toEntityDataModelItem(DataModelItem dataModelItem) {
    return DataModelItemEntity(
      openState: dataModelItem.openState != null
          ? toEntityOpenState(dataModelItem.openState!)
          : null,
      closedState: dataModelItem.closedState != null
          ? toEntityClosedState(dataModelItem.closedState!)
          : null,
      ctaText: dataModelItem.ctaText,
    );
  }

  // Map `OpenState` to `OpenStateEntity`
  static OpenStateEntity toEntityOpenState(OpenState openState) {
    return OpenStateEntity(
      body: openState.body != null
          ? toEntityOpenStateBody(openState.body!)
          : null,
    );
  }

  // Map `OpenStateBody` to `OpenStateBodyEntity`
  static OpenStateBodyEntity toEntityOpenStateBody(OpenStateBody body) {
    return OpenStateBodyEntity(
      title: body.title,
      subtitle: body.subtitle,
      card: body.card != null ? toEntityCard(body.card!) : null,
      footer: body.footer,
      items: body.items.map(toEntityBodyItem).toList(),
    );
  }
}
