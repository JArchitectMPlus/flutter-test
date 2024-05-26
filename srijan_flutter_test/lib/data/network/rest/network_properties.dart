class NetworkProperties {
  static EnvTypeEnum envTypeEnum = EnvTypeEnum.dev;

  static String baseUrl = _getBaseUrl(envType: envTypeEnum);

  static String _getBaseUrl({required EnvTypeEnum envType}) {
    switch (envType) {
      case EnvTypeEnum.dev:
        return 'https://api.quotable.io';
      case EnvTypeEnum.prod:
        return const String.fromEnvironment('BASE_URL');
      default:
        return 'https://api.quotable.io';
    }
  }
}

enum EnvTypeEnum {
  dev,
  prod,
}
