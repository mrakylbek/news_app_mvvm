class Constants {
  static const API_KEY = '40f12d49c2f84017bd3a0bf92c6e2135';
  static const String TOP_HEADLINE_URL =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$API_KEY';

  static String headlinesFor(String country){
    return 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$API_KEY';
  }

  static const Map<String, String> Countries = {
    'USA': 'us',
    'India': 'in',
    'Korea': 'kr',
    'China': 'cn',
  };
}
