class Car {
  final int wheels;
  final double? cc;
  final String? fuelType;
  final bool? isAutomatic;
  final bool? startEngine;

  Car(this.wheels, this.cc, this.fuelType, this.isAutomatic, this.startEngine);

  void _checkEngine() {
    print('print => check engine');
  }

  void startingEngine() {
    print('print => start engine');
  }

  String fuel() => fuelType.toString();
}

class Car2 {
  int? _wheels;
  double? _cc;
  String? _fuelType;
  bool? _isAutomatic;
  bool? _startEngine;

  set setCc(double newCc) => _cc = newCc;

  double? get getCc => _cc;
}

enum Turn {left, right, u}
