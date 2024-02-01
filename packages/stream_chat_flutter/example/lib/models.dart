import 'package:stream_chat/stream_chat.dart';

/// The data required to connect to the server.
class ConnectionData {
  /// Creates a new [ConnectionData] instance.
  const ConnectionData({
    required this.apiKey,
    required this.user,
    required this.userToken,
    this.baseURL,
  });

  /// The API key.
  final String apiKey;

  /// The user.
  final User user;

  /// The user token.
  final String userToken;

  /// The base URL.
  /// If null the default value will be used.
  final String? baseURL;
}

/// The local data.
final localData = ConnectionData(
  apiKey: 'hd8szvscpxvd',
  user: User(
    id: 'luke_skywalker',
    name: 'Luke Skywalker',
    image:
        'https://vignette.wikia.nocookie.net/starwars/images/2/20/LukeTLJ.jpg',
  ),
  userToken:
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibHVrZV9za3l3YWxrZXIifQ.75UE4KkzEMIyfdsZMGEQcv5o-O6faZcMhlzA3WlJC0s',
  baseURL: 'http://localhost:3030',
);

/// The remote data.
final remoteData = ConnectionData(
  apiKey: 's2dxdhpxd94g',
  user: User(
    id: 'super-band-9',
  ),
  userToken:
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoic3VwZXItYmFuZC05In0.0L6lGoeLwkz0aZRUcpZKsvaXtNEDHBcezVTZ0oPq40A',
);
