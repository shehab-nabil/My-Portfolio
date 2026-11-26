import 'package:my_portfolio/data/portfolio_data.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/domain/repositories/portfolio_repository.dart';

/// Maps the editable constants in `portfolio_data.dart` onto domain entities.
/// This is the only file that knows where the content is written.
class StaticPortfolioRepository implements PortfolioRepository {
  const StaticPortfolioRepository();

  @override
  Portfolio load() => const Portfolio(
    profile: Profile(
      initials: PortfolioData.initials,
      shortName: PortfolioData.shortName,
      fullName: PortfolioData.fullName,
      role: PortfolioData.role,
      availability: PortfolioData.availability,
      photoDir: PortfolioData.photoDir,
      photoPlaceholder: PortfolioData.photoPlaceholder,
    ),
    contactDetails: ContactDetails(
      email: PortfolioData.email,
      phone: PortfolioData.phone,
      linkedIn: PortfolioData.linkedIn,
      gitHub: PortfolioData.gitHub,
      cvPath: PortfolioData.cvPath,
    ),
    navigation: NavigationContent(
      sectionLabels: {
        SectionId.apps: PortfolioData.navApps,
        SectionId.stories: PortfolioData.navStories,
        SectionId.experience: PortfolioData.navExperience,
        SectionId.skills: PortfolioData.navSkills,
        SectionId.contact: PortfolioData.navContact,
      },
      downloadCv: PortfolioData.downloadCv,
      openMenu: PortfolioData.openMenu,
      backToTop: PortfolioData.backToTop,
    ),
    hero: HeroContent(
      headline: PortfolioData.headline,
      summary: PortfolioData.summary,
      seeApps: PortfolioData.seeApps,
      getInTouch: PortfolioData.getInTouch,
      stats: PortfolioData.stats,
      codeFileName: PortfolioData.codeFileName,
      code: PortfolioData.code,
      currently: PortfolioData.currently,
      highlight: PortfolioData.highlight,
    ),
    domains: PortfolioData.domains,
    apps: AppsContent(
      heading: PortfolioData.appsHeading,
      featured: PortfolioData.featured,
      projects: PortfolioData.projects,
      featuredLabel: PortfolioData.featuredLabel,
      readCaseStudy: PortfolioData.readCaseStudy,
      addProjectTitle: PortfolioData.addProjectTitle,
      addProjectBody: PortfolioData.addProjectBody,
      emptyProjectSlots: PortfolioData.emptyProjectSlots,
      iconPlaceholder: PortfolioData.iconPlaceholder,
      screenPlaceholder: PortfolioData.screenPlaceholder,
    ),
    stories: StoriesContent(
      heading: PortfolioData.storiesHeading,
      challengeLabel: PortfolioData.challengeLabel,
      approachLabel: PortfolioData.approachLabel,
      resultLabel: PortfolioData.resultLabel,
      stories: PortfolioData.stories,
    ),
    experience: ExperienceContent(
      heading: PortfolioData.experienceHeading,
      jobs: PortfolioData.experience,
    ),
    skills: SkillsContent(
      heading: PortfolioData.skillsHeading,
      groups: PortfolioData.skillGroups,
      educationTitle: PortfolioData.educationTitle,
      degree: PortfolioData.degree,
      university: PortfolioData.university,
      educationNotes: PortfolioData.educationNotes,
      coursesTitle: PortfolioData.coursesTitle,
      courses: PortfolioData.courses,
    ),
    contact: ContactContent(
      label: PortfolioData.contactLabel,
      title: PortfolioData.contactTitle,
      emailLabel: PortfolioData.emailLabel,
      phoneLabel: PortfolioData.phoneLabel,
      linkedInLabel: PortfolioData.linkedInLabel,
      gitHubLabel: PortfolioData.gitHubLabel,
      emailMe: PortfolioData.emailMe,
      downloadCvPdf: PortfolioData.downloadCvPdf,
      copyright: PortfolioData.copyright,
      builtWith: PortfolioData.builtWith,
    ),
    caseStudy: CaseStudy(
      project: PortfolioData.featured,
      back: PortfolioData.back,
      backShort: PortfolioData.backShort,
      label: PortfolioData.caseLabel,
      title: PortfolioData.caseTitle,
      intro: PortfolioData.caseIntro,
      facts: PortfolioData.caseFacts,
      problemHeading: PortfolioData.problemHeading,
      problemBody: PortfolioData.problemBody,
      flowHeading: PortfolioData.flowHeading,
      flowSteps: PortfolioData.flowSteps,
      featuresHeading: PortfolioData.featuresHeading,
      features: PortfolioData.features,
      architectureHeading: PortfolioData.architectureHeading,
      layers: PortfolioData.layers,
      delivery: PortfolioData.delivery,
      outcome: PortfolioData.outcome,
      nextProjectLabel: PortfolioData.nextProjectLabel,
      nextProjectName: PortfolioData.nextProjectName,
    ),
  );
}
