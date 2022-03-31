import 'dart:async';

import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:pinball_components/pinball_components.dart';
import 'package:sandbox/common/common.dart';

class BasicSpaceship extends BasicGame with TapDetector {
  static String info = 'Renders a spaceship and allows balls to be '
      'spawned upon click to test their interactions';

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    camera.followVector2(Vector2.zero());

    unawaited(
      addFromBlueprint(Spaceship(position: Vector2.zero())),
    );
  }

  @override
  void onTapUp(TapUpInfo info) {
    add(
      Ball(baseColor: Colors.blue)
        ..initialPosition = info.eventPosition.game
        ..layer = Layer.jetpack,
    );
  }
}