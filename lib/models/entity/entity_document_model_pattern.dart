import 'package:basic_model_structure/basic_model_structure.dart';

abstract class EntityDocumentModelPattern<DocumentType> extends PatternModel {
  DocumentType type;
  String document;

  EntityDocumentModelPattern() : super();
  EntityDocumentModelPattern.fromJson(json) : super.fromJson(json);

  DocumentType convertTypeFromValue(dynamic value);
  dynamic convertTypeToValue(DocumentType type);

  @override
  void readValues() {
    super.readValues();
    type = readValue<DocumentType>('type', convertion: (json) => convertTypeFromValue(json));
    document = readValue<String>('document');
  }

  @override
  void writeValues(bool exportOnlyChanged, bool ignoreNulls) {
    writeValue('type', convertTypeToValue(type));
    writeValue('document', document);
  }
}