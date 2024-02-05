import 'package:stream_chat/stream_chat.dart';

class UserData {
  const UserData({
    required this.user,
    required this.token,
  });

  final User user;
  final String token;
}

final localUserData = UserData(
  user: User(
    id: 'luke_skywalker',
    name: 'Luke Skywalker',
    image:
        'https://vignette.wikia.nocookie.net/starwars/images/2/20/LukeTLJ.jpg',
  ),
  token:
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibHVrZV9za3l3YWxrZXIifQ.75UE4KkzEMIyfdsZMGEQcv5o-O6faZcMhlzA3WlJC0s',
);

final remoteUserData = UserData(
  user: User(
    id: 'cool-shadow-7',
    name: 'Cool Shadow',
    image:
        'https://getstream.io/random_png/?id=cool-shadow-7&amp;name=Cool+shadow',
  ),
  token:
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiY29vbC1zaGFkb3ctNyJ9.gkOlCRb1qgy4joHPaxFwPOdXcGvSPvp6QY0S4mpRkVo',
);
