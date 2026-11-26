/// The whole site's content, grouped by the part of the page that needs it, so
/// each widget depends only on its own slice.
library;

import 'package:my_portfolio/features/portfolio/domain/entities/content.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/section_id.dart';

export 'content.dart';
export 'section_id.dart';

class Portfolio {
  const Portfolio({
    required this.profile,
    required this.contactDetails,
    required this.navigation,
    required this.hero,
    required this.domains,
    required this.apps,
    required this.stories,
    required this.experience,
    required this.skills,
    required this.contact,
    required this.caseStudy,
  });

  final Profile profile;
  final ContactDetails contactDetails;
  final NavigationContent navigation;
  final HeroContent hero;
  final List<String> domains;
  final AppsContent apps;
  final StoriesContent stories;
  final ExperienceContent experience;
  final SkillsContent skills;
  final ContactContent contact;
  final CaseStudy caseStudy;
}

class Profile {
  const Profile({
    required this.initials,
    required this.shortName,
    required this.fullName,
    required this.role,
    required this.availability,
    required this.photoDir,
    required this.photoPlaceholder,
  });

  final String initials;
  final String shortName;
  final String fullName;
  final String role;
  final String availability;
  final String photoDir;
  final String photoPlaceholder;
}

class ContactDetails {
  const ContactDetails({
    required this.email,
    required this.phone,
    required this.linkedIn,
    required this.gitHub,
    required this.cvPath,
  });

  final LinkItem email;
  final LinkItem phone;
  final LinkItem linkedIn;
  final LinkItem gitHub;
  final String cvPath;
}

class NavigationContent {
  const NavigationContent({
    required this.sectionLabels,
    required this.downloadCv,
    required this.openMenu,
    required this.backToTop,
  });

  final Map<SectionId, String> sectionLabels;
  final String downloadCv;
  final String openMenu;
  final String backToTop;

  String labelOf(SectionId id) => sectionLabels[id]!;
}

class HeroContent {
  const HeroContent({
    required this.headline,
    required this.summary,
    required this.seeApps,
    required this.getInTouch,
    required this.stats,
    required this.codeFileName,
    required this.code,
    required this.currently,
    required this.highlight,
  });

  final String headline;
  final String summary;
  final String seeApps;
  final String getInTouch;
  final List<Fact> stats;
  final String codeFileName;
  final String code;
  final TextBlock currently;
  final TextBlock highlight;
}

class AppsContent {
  const AppsContent({
    required this.heading,
    required this.featured,
    required this.projects,
    required this.featuredLabel,
    required this.readCaseStudy,
    required this.addProjectTitle,
    required this.addProjectBody,
    required this.emptyProjectSlots,
    required this.iconPlaceholder,
    required this.screenPlaceholder,
  });

  final SectionHeading heading;
  final Project featured;
  final List<Project> projects;
  final String featuredLabel;
  final String readCaseStudy;
  final String addProjectTitle;
  final String addProjectBody;
  final int emptyProjectSlots;
  final String iconPlaceholder;

  /// Label for the empty box of the 1-based screenshot number.
  final String Function(int number) screenPlaceholder;
}

class StoriesContent {
  const StoriesContent({
    required this.heading,
    required this.challengeLabel,
    required this.approachLabel,
    required this.resultLabel,
    required this.stories,
  });

  final SectionHeading heading;
  final String challengeLabel;
  final String approachLabel;
  final String resultLabel;
  final List<Story> stories;
}

class ExperienceContent {
  const ExperienceContent({required this.heading, required this.jobs});

  final SectionHeading heading;
  final List<Experience> jobs;
}

class SkillsContent {
  const SkillsContent({
    required this.heading,
    required this.groups,
    required this.educationTitle,
    required this.degree,
    required this.university,
    required this.educationNotes,
    required this.coursesTitle,
    required this.courses,
  });

  final SectionHeading heading;
  final List<SkillGroup> groups;
  final String educationTitle;
  final String degree;
  final String university;
  final List<String> educationNotes;
  final String coursesTitle;
  final List<Fact> courses;
}

class ContactContent {
  const ContactContent({
    required this.label,
    required this.title,
    required this.emailLabel,
    required this.phoneLabel,
    required this.linkedInLabel,
    required this.gitHubLabel,
    required this.emailMe,
    required this.downloadCvPdf,
    required this.copyright,
    required this.builtWith,
  });

  final String label;
  final String title;
  final String emailLabel;
  final String phoneLabel;
  final String linkedInLabel;
  final String gitHubLabel;
  final String emailMe;
  final String downloadCvPdf;
  final String copyright;
  final String builtWith;
}

class CaseStudy {
  const CaseStudy({
    required this.project,
    required this.back,
    required this.backShort,
    required this.label,
    required this.title,
    required this.intro,
    required this.facts,
    required this.problemHeading,
    required this.problemBody,
    required this.flowHeading,
    required this.flowSteps,
    required this.featuresHeading,
    required this.features,
    required this.architectureHeading,
    required this.layers,
    required this.delivery,
    required this.outcome,
    required this.nextProjectLabel,
    required this.nextProjectName,
  });

  /// The app being studied; supplies the screenshots.
  final Project project;
  final String back;
  final String backShort;
  final String label;
  final String title;
  final String intro;
  final List<Fact> facts;
  final SectionHeading problemHeading;
  final String problemBody;
  final SectionHeading flowHeading;
  final List<TextBlock> flowSteps;
  final SectionHeading featuresHeading;
  final List<TextBlock> features;
  final SectionHeading architectureHeading;
  final List<Layer> layers;
  final TextBlock delivery;
  final TextBlock outcome;
  final String nextProjectLabel;
  final String nextProjectName;
}
