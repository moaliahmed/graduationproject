import 'package:equatable/equatable.dart';

class Chart extends Equatable {
  final int time;
  final double? open;
  final double? high;
  final double? low;
  final double? close;

  const Chart(
      {required this.time,
      required this.open,
      required this.high,
      required this.low,
      required this.close});

  @override
  List<Object?> get props => [
        time,
        open,
        high,
        low,
        close,
      ];
}
