import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class LoadingCard extends Card {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            title: SkeletonLine(
                style: SkeletonLineStyle(
                    height: 10,
                    width: 1000,
                    borderRadius: BorderRadius.circular(8))),
            subtitle: SkeletonLine(
                style: SkeletonLineStyle(
                    height: 10,
                    width: 200,
                    borderRadius: BorderRadius.circular(8)))));
  }
}
