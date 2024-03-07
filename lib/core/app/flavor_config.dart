enum Flavor { dev, production }

class FlavorConfig {
  final Flavor _flavor;
  final String _baseUrl;
  static FlavorConfig? _instance;

  FlavorConfig._internal(this._flavor, this._baseUrl);

  static FlavorConfig get instance {
    _instance ??= FlavorConfig(flavor: Flavor.dev, baseUrl: '');
    return _instance!;
  }

  factory FlavorConfig({required Flavor flavor, required String baseUrl}) {
    _instance = FlavorConfig._internal(flavor, baseUrl);
    return _instance!;
  }

  static bool isProduction() => _instance?._flavor == Flavor.production;

  static bool isDevelopment() => _instance?._flavor == Flavor.dev;

  static String get baseUrl => _instance?._baseUrl ?? '';
}
