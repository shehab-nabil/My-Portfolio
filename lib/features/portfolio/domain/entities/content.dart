/// Small content building blocks. Pure Dart: no Flutter imports in `domain/`.
library;

class LinkItem {
  const LinkItem(this.label, this.url);

  final String label;

  /// A full URL. Leave a `[placeholder]` and the link renders but does nothing.
  final String url;
}

class Project {
  const Project({
    required this.name,
    required this.subtitle,
    required this.assetDir,
    required this.badges,
    required this.bullets,
    required this.tech,
    required this.links,
    this.description = '',
  });

  final String name;
  final String subtitle;

  /// Only shown on the featured card.
  final String description;

  /// Folder holding `icon.*` and `screen1.*` to `screen3.*`.
  final String assetDir;
  final List<String> badges;
  final List<String> bullets;
  final List<String> tech;
  final List<LinkItem> links;
}

class Story {
  const Story({
    required this.headline,
    required this.title,
    required this.challenge,
    required this.approach,
    required this.result,
  });

  final String headline;
  final String title;
  final String challenge;
  final String approach;
  final String result;
}

class Experience {
  const Experience({
    required this.role,
    required this.company,
    required this.dates,
    required this.bullets,
    this.current = false,
  });

  final String role;
  final String company;
  final String dates;
  final List<String> bullets;
  final bool current;
}

class SkillGroup {
  const SkillGroup(this.title, this.skills);

  final String title;
  final List<String> skills;
}

class Fact {
  const Fact(this.label, this.value);

  final String label;
  final String value;
}

class TextBlock {
  const TextBlock(this.title, this.body);

  final String title;
  final String body;
}

class Layer {
  const Layer(this.name, this.items);

  final String name;
  final List<String> items;
}

class SectionHeading {
  const SectionHeading(this.label, this.title);

  final String label;
  final String title;
}
