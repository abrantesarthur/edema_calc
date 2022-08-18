import 'package:edema_calc/widgets/component.dart';
import 'package:edema_calc/widgets/option.dart';

class ComponentOptionInput {
  final String title;
  final int score;

  ComponentOptionInput({required this.title, required this.score});
}

enum ComponentInput {
  effacement,
  midlineShift,
  glucose,
  previousStroke,
  intervention
}

extension ComponentInputExtension on ComponentInput {
  String get title {
    switch (this) {
      case ComponentInput.effacement:
        return "Basilar Cistern Effacement";
      case ComponentInput.midlineShift:
        return "Midline Shift";
      case ComponentInput.glucose:
        return "Glucose";
      case ComponentInput.previousStroke:
        return "Previous Stroke";
      case ComponentInput.intervention:
        return "Intervention (tPA or thrombectomy)";
    }
  }

  String get description {
    switch (this) {
      case ComponentInput.effacement:
        return "Was there basilar cistern effacement within 24hrs of last seen well on CT?";
      case ComponentInput.midlineShift:
        return "How many millimeters of midline shift were there within 24hrs of last seen well on CT?";
      case ComponentInput.glucose:
        return "What was the patient’s admission glucose (first glucose)?";
      case ComponentInput.previousStroke:
        return "Did the patient have a previous stroke?";
      case ComponentInput.intervention:
        return "Did the patient undergo initial intervention with either tissue plasminogen activator (tPA) or mechanical thrombectomy?";
    }
  }

  List<ComponentOptionInput> get options {
    switch (this) {
      case ComponentInput.effacement:
        return [
          ComponentOptionInput(title: "No", score: 0),
          ComponentOptionInput(title: "Yes", score: 3),
        ];
      case ComponentInput.midlineShift:
        return [
          ComponentOptionInput(title: "0", score: 0),
          ComponentOptionInput(title: ">0 and ≤3 mm", score: 1),
          ComponentOptionInput(title: ">3 and ≤6 mm", score: 2),
          ComponentOptionInput(title: ">6 and ≤9 mm", score: 4),
          ComponentOptionInput(title: ">9 mm", score: 7),
        ];
      case ComponentInput.glucose:
        return [
          ComponentOptionInput(title: "<150", score: 0),
          ComponentOptionInput(title: "≥150", score: 2),
        ];
      case ComponentInput.previousStroke:
        return [
          ComponentOptionInput(title: "Yes", score: 0),
          ComponentOptionInput(title: "No", score: 1),
        ];
      case ComponentInput.intervention:
        return [
          ComponentOptionInput(title: "Yes", score: 0),
          ComponentOptionInput(title: "No", score: 1),
        ];
    }
  }
}

class PreselectedOptions {
  final int effacement;
  final int midlineShift;
  final int glucose;
  final int previousStroke;
  final int intervention;

  PreselectedOptions({
    this.effacement = 0,
    this.midlineShift = 0,
    this.glucose = 0,
    this.previousStroke = 0,
    this.intervention = 0,
  });

  int from(ComponentInput c) {
    switch (c) {
      case ComponentInput.effacement:
        return effacement;
      case ComponentInput.midlineShift:
        return midlineShift;
      case ComponentInput.glucose:
        return glucose;
      case ComponentInput.previousStroke:
        return previousStroke;
      case ComponentInput.intervention:
        return intervention;
    }
  }
}
