class Player {
  int lane;
  int score;

  Player({required this.lane, this.score = 0});

  void moveLeft() {
    print('MOVE LEFT');
    if (lane > 0) lane--;
  }

  void moveRight(int maxLane) {
    if (lane < maxLane - 1) lane++;
  }
}
