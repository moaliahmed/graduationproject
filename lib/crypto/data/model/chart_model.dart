import 'package:graduation_project/crypto/domain/entities/chart.dart';

class ChartModel extends Chart {
 const ChartModel(
      {required super.time,
      required super.open,
      required super.high,
      required super.low,
      required super.close});

 factory ChartModel.fromJson(List l) {
   return ChartModel(
     time: l[0] == null ? null : l[0]!,
     open: l[1] == null ? null : l[1]!,
     high: l[2] == null ? null : l[2]!,
     low: l[3] == null ? null : l[3]!,
     close: l[4] == null ? null : l[4]!,
   );
 }
}
