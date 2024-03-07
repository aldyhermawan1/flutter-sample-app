import 'package:sample/core/app/app_setup.dart';
import 'package:sample/core/app/flavor_config.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.production,
    baseUrl: 'https://api.sampleapis.com/',
  );
  setupApp();
}