class Car {
  /// TODO: contoh properties
  final int wheels;
  final double? cc;
  final String? fuelType;
  final bool? isAutomatic;
  final bool? startEngine;

  /// TODO: contoh constructor
  Car(this.wheels, this.cc, this.fuelType, this.isAutomatic, this.startEngine);

  /// TODO: private function
  /// private function tidak dapat di panggil secara langsung oleh kelas lain
  void _checkEngine() {
    print('print => check engine');
  }

  /// TODO: public function bertipe void
  /// public function dapat di panggil secara langsung oleh kelas lain dengan cara menginstance
  /// contoh : Car().startingEngine();
  void startingEngine() {
    print('print => start engine');
  }

  /// TODO: public function bertipe data String sebagai return type
  String fuel() => fuelType.toString();
}

class Car2 {
  int? _wheels;
  double? _cc;
  String? _fuelType;
  bool? _isAutomatic;
  bool? _startEngine;

  /// TODO: contoh setter
  /// setter adalah salah satu cara untuk mengencapsulation
  set setCc(double newCc) => _cc = newCc;

  /// TODO: contoh getter
  /// getter adalah salah satu cara untuk mengencapsulation
  /// getter dapat digunakan sebagai calculate dari beberapa variable
  double? get getCc => _cc;
}

/// TODO: contoh enum
/// enum berguna untuk membatasi beberapa pilihan
/// biasanya berupa sesuatu yang sudah pasti contoh jenis kelamin,
enum Turn {left, right, u}
