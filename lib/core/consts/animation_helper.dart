import 'package:flutter/material.dart';

TweenSequence<Offset> tweenSequence() {
  return TweenSequence(
    <TweenSequenceItem<Offset>>[
      TweenSequenceItem(
        tween: Tween(begin: const Offset(0, 0), end: const Offset(-.04, 0)),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween(begin: const Offset(-.04, 0), end: const Offset(0, 0)),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween(begin: const Offset(0, 0), end: const Offset(.04, 0)),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween(begin: const Offset(.04, 0), end: const Offset(0, 0)),
        weight: 25,
      ),
    ],
  );
}