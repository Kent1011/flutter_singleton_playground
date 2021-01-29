abstract class BasicCounter {
  int _amount;

  int get count {
    _initialChecker();
    return _amount ?? 0;
  }

  bool get isInitialized => _amount != null;

  bool get isAutoInitial => true;

  void _initialChecker() {
    if (isAutoInitial && isInitialized == false) init(0);
  }

  /// Set initial counter value
  void init(int defaultValue) {
    if (isInitialized) {
      print(
          'Warning! Counter has been initialized before. Can\'t initialize twice.');
      return;
    }

    _amount = defaultValue;
  }

  /// Increase counter value
  void increase() {
    _initialChecker();
    if (_amount != null) _amount += 1;
  }

  /// Decrease counter value
  void decrease() {
    _initialChecker();
    if (_amount != null) _amount -= 1;
  }
}

/// Singleton Counter by using static getter
class CounterStatic extends BasicCounter {
  static final CounterStatic _instance = CounterStatic._internal();
  static CounterStatic get instance => _instance;

  CounterStatic._internal();
}

/// Singleton Counter by using factory constructor
class CounterFactory extends BasicCounter {
  static final CounterFactory _instance = CounterFactory._internal();

  CounterFactory._internal();
  factory CounterFactory() {
    return _instance;
  }

  @override
  bool get isAutoInitial => false;
}
