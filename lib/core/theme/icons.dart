import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

IconData getSkillIcon(String skill) {
  switch (skill.toLowerCase()) {
    case 'java':
      return FontAwesomeIcons.java;

    case 'spring boot':
      return FontAwesomeIcons.leaf;

    case 'dart':
      return FontAwesomeIcons.bolt; // Or FontAwesomeIcons.code

    case 'flutter':
      return FontAwesomeIcons.mobileScreen;

    case 'firebase':
      return FontAwesomeIcons.fire;

    case 'git':
      return FontAwesomeIcons.gitAlt;

    case 'mvvm':
      return FontAwesomeIcons.diagramProject;
  // View ↔ ViewModel ↔ Model

    case 'mvc':
      return FontAwesomeIcons.sitemap;
  // Controller-based flow

    case 'clean':
    case 'clean architecture':
      return FontAwesomeIcons.layerGroup;

    case 'riverpod':
      return FontAwesomeIcons.droplet;

    case 'android studio':
      return FontAwesomeIcons.android;

    case 'vs code':
      return FontAwesomeIcons.code;
    case 'network security':
      return FontAwesomeIcons.shieldHalved;

    case 'cryptography':
      return FontAwesomeIcons.lock;


    case 'arrays':
      return FontAwesomeIcons.grip; // grid-like structure

    case 'strings':
      return FontAwesomeIcons.font; // text representation

    case 'hashmap':
    case 'hash map':
      return FontAwesomeIcons.hashtag; // hashing concept

    case 'stack':
      return FontAwesomeIcons.layerGroup; // LIFO layers

    case 'queue':
      return FontAwesomeIcons.arrowRightArrowLeft; // flow/order

    case 'binary search':
      return FontAwesomeIcons.magnifyingGlass; // search concept

    case 'provider':
      return FontAwesomeIcons.circleNodes;

    case 'github':
      return FontAwesomeIcons.github;

    case 'sql':
    case 'mysql':
      return FontAwesomeIcons.database;
    default:
      return FontAwesomeIcons.code;
  }
}