// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// This example shows how to build a render tree with a non-cartesian coordinate
// system. Most of the guts of this examples are in src/sector_layout.dart.

import 'package:flutter/rendering.dart';
import 'src/sector_layout.dart';

RenderBox buildSectorExample() {
  final RenderSectorRing rootCircle = new RenderSectorRing(padding: 20.0);
  rootCircle.add(new RenderSolidColor(const Color(0xFF00FFFF), desiredDeltaTheta: kTwoPi * 0.15));
  rootCircle.add(new RenderSolidColor(const Color(0xFF0000FF), desiredDeltaTheta: kTwoPi * 0.4));
  final RenderSectorSlice stack = new RenderSectorSlice(padding: 2.0);
  stack.add(new RenderSolidColor(const Color(0xFFFFFF00), desiredDeltaRadius: 20.0));
  stack.add(new RenderSolidColor(const Color(0xFFFF9000), desiredDeltaRadius: 20.0));
  stack.add(new RenderSolidColor(const Color(0xFF00FF00)));
  rootCircle.add(stack);
  return new RenderBoxToRenderSectorAdapter(innerRadius: 50.0, child: rootCircle);
}

void main() {
  new RenderingFlutterBinding(root: buildSectorExample());
}