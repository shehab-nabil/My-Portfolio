/// ALL visible text and links live here. Edit this file to update the site.
///
/// Anything in [square brackets] is a placeholder waiting for real content.
library;

import 'package:my_portfolio/features/portfolio/domain/entities/content.dart';

abstract final class PortfolioData {
  // ── Identity ──────────────────────────────────────────────────────────────
  static const initials = 'SH';
  static const shortName = 'Shehab Nabil';
  static const fullName = 'Shehab Nabil Mokhtar';
  static const role = 'Senior Flutter Developer';
  static const availability = 'Open to new roles · Cairo, Egypt';
  static const photoDir = 'assets/images/profile/';
  static const photoPlaceholder = 'SHN';

  // ── Links & contact ───────────────────────────────────────────────────────
  static const email = LinkItem(
    'shehabnabil790@gmail.com',
    'mailto:shehabnabil790@gmail.com',
  );
  static const phone = LinkItem(
    '+20 128 975 6728',
    'https://wa.me/201289756728',
  );
  static const linkedIn = LinkItem(
    'linkedin.com/in/shehab-nabil-09a784213',
    'https://www.linkedin.com/in/shehab-nabil-09a784213/',
  );
  static const gitHub = LinkItem(
    'github.com/shehab-nabil',
    'https://github.com/shehab-nabil',
  );

  /// Served from the `web/` folder, relative to the site root.
  static const cvPath = 'cv/Shehab_Nabil_Mokhtar_CV.pdf';

  // ── Navigation (order matches the page sections) ──────────────────────────
  static const navApps = 'Apps';
  static const navStories = 'Case studies';
  static const navExperience = 'Experience';
  static const navSkills = 'Skills';
  static const navContact = 'Contact';
  static const downloadCv = 'Download CV';
  static const openMenu = 'Open menu';
  static const backToTop = 'Back to top';

  // ── Hero ──────────────────────────────────────────────────────────────────
  static const headline =
      'I build Flutter apps that ship to production, and stay there.';
  static const summary =
      'Flutter developer with 4 years of experience building scalable, '
      'production-ready mobile applications. Strong background in Clean '
      'Architecture, BLoC, Firebase and CI/CD pipelines. Delivered multiple '
      'apps to Google Play and the App Store across HR, medical, e-commerce '
      'and delivery domains.';
  static const seeApps = 'See my apps';
  static const getInTouch = 'Get in touch';
  static const stats = [
    Fact('Experience', '4+ yrs'),
    Fact('Apps shipped', '[+5]'),
    Fact('Android · iOS · Web · Desktop', '4 platforms'),
  ];

  static const codeFileName = 'about_me.dart';

  /// Keep lines under about 48 characters so phones can read them.
  static const code = '''
class ShehabNabil extends FlutterDeveloper {
  @override
  String get role =>
      'Senior Flutter Developer';

  final location = 'Cairo, Egypt';
  final platforms = [
    'Android', 'iOS', 'Web', 'Desktop',
  ];

  // Ship it, then keep it healthy.
  Future<void> build(Idea idea) async {
    await ship(idea, to: [playStore, appStore]);
  }
}''';

  static const currently = TextBlock(
    'Currently',
    'Senior Flutter Dev at Dynamic Business Solution',
  );
  static const highlight = TextBlock(
    'Recent highlight',
    'Face-liveness check-in',
  );

  static const domains = [
    'HR & Workforce',
    'Healthcare',
    'Smart Transportation',
    'E-commerce',
    'Delivery & Logistics',
  ];

  // ── Section headings ──────────────────────────────────────────────────────
  static const appsHeading = SectionHeading(
    '01 / Shipped apps',
    'Shipped apps',
  );
  static const storiesHeading = SectionHeading(
    '02 / Case studies',
    'Engineering stories',
  );
  static const experienceHeading = SectionHeading(
    '03 / Experience',
    'Experience',
  );
  static const skillsHeading = SectionHeading('04 / Skills', 'Skills');
  static const contactLabel = '05 / Contact';

  // ── Apps ──────────────────────────────────────────────────────────────────
  static const featuredLabel = 'Featured';
  static const readCaseStudy = 'Read the case study';
  static const addProjectTitle = 'Add project';
  static const addProjectBody = '[Your next app goes here]';

  /// Number of dashed "add project" cards at the end of the grid.
  static const emptyProjectSlots = 0;
  static const iconPlaceholder = '[icon]';

  static String screenPlaceholder(int n) => '[Screen $n]';

  static const featured = Project(
    name: 'Nova HR',
    subtitle: 'Dynamic Business Solution',
    description:
        'HR attendance and employee self-service, built in a team. I built the '
        'face-liveness check-in, background location tracking and many HR '
        'modules.',
    assetDir: 'assets/images/projects/nova_hr/',
    badges: ['HR & Workforce', 'Android · iOS · Windows', 'Arabic / English'],
    bullets: [
      'ML Kit face-liveness check-in: shuffled blink and head-turn challenges, '
          'then a smile, with failed attempts photographed and logged.',
      'Background location tracking during shifts: SignalR on Android, HTTP '
          'updates on iOS.',
      'Biometric sign-in, and Fastlane test builds through Firebase App '
          'Distribution.',
    ],
    tech: ['Clean Architecture', 'Provider', 'ML Kit', 'SignalR', 'Fastlane'],
    links: [
      LinkItem(
        'App Store',
        'https://apps.apple.com/eg/app/nova-hr/id6736897068?platform=iphone',
      ),
      LinkItem(
        'Google Play',
        'https://play.google.com/store/apps/details?id=com.dynamic.solutions.nova.hr&hl=en-us',
      ),
    ],
  );

  static const projects = [
    Project(
      name: 'Dinamo',
      subtitle: 'Trip booking app for riders',
      assetDir: 'assets/images/projects/dinamo/',
      badges: ['Smart Transportation', 'Team project'],
      bullets: [
        'Built location search, map picking and trip drafts for the new '
            'booking flow.',
        'Built booking details for round and side trips, with validation and a '
            'review step.',
      ],
      tech: ['BLoC/Cubit', 'Freezed', 'Dio', 'Google Maps', 'Flavors'],
      links: [
        LinkItem(
          'Google Play',
          'https://play.google.com/store/apps/details?id=com.dinamo.client&hl=en',
        ),
      ],
    ),
    Project(
      name: 'Light & Fast',
      subtitle: 'Three-app delivery platform',
      assetDir: 'assets/images/projects/light_and_fast/',
      badges: ['Delivery & Logistics', '3 apps', 'Arabic / English'],
      bullets: [
        'Built background driver tracking that streams location over Socket.IO '
            'on Android and iOS.',
        'Delivered live map tracking, FCM order alerts and Fastlane test builds '
            'for customer, store and driver apps.',
      ],
      tech: ['BLoC/Cubit', 'Socket.IO', 'Google Maps', 'FCM', 'Fastlane'],
      links: [
        LinkItem(
          'Customer app',
          'https://play.google.com/store/apps/details?id=com.dynamic.lightCustomer',
        ),
        LinkItem(
          'Store app',
          'https://play.google.com/store/apps/details?id=com.LightStore.Egypt',
        ),
        LinkItem(
          'Driver app',
          'https://play.google.com/store/apps/details?id=com.LightDriver.Egypt',
        ),
      ],
    ),
    Project(
      name: 'QP Express',
      subtitle: 'Daily operations for delivery couriers',
      assetDir: 'assets/images/projects/qp_express/',
      badges: ['Delivery & Logistics', 'In testing'],
      bullets: [
        'Built race-safe settlement previews with debounce, rollback and '
            'version checks.',
        'Streamlined parcel handling with barcode scanning, bulk actions and '
            'per-item error recovery.',
      ],
      tech: ['Riverpod', 'Dio', 'go_router', 'Freezed', 'Flavors'],
      links: [],
    ),
    Project(
      name: 'Ta2sima',
      subtitle: 'Sports venue booking · freelance',
      assetDir: 'assets/images/projects/ta2sima/',
      badges: ['Sports booking', 'Freelance'],
      bullets: [
        'Built venue search, filters and calendar booking of consecutive time '
            'slots.',
        'Added email-verification deep links that return users to their '
            'booking form.',
      ],
      tech: ['Cubit', 'Freezed', 'Retrofit', 'get_it', 'Deep links'],
      links: [],
    ),
    Project(
      name: 'Ershaad',
      subtitle: 'Therapist booking app & website',
      assetDir: 'assets/images/projects/ershaad/',
      badges: ['Healthcare', 'Mobile + Web'],
      bullets: [
        'Video and audio consultations with the Agora SDK, and real-time chat '
            'on Firebase.',
        'Fawaterak online payments and a responsive Flutter Web app alongside '
            'mobile.',
      ],
      tech: ['GetX', 'MVC', 'Agora', 'Firebase', 'Fawaterak'],
      links: [
        LinkItem(
          'Google Play',
          'https://play.google.com/store/apps/details?id=com.hayaatak.ershaad.patient',
        ),
        LinkItem(
          'App Store',
          'https://apps.apple.com/us/app/ershaad-%D8%A5%D8%B1%D8%B4%D8%A7%D8%AF/id6812397314',
        ),
        LinkItem('Web app', 'https://patient-web.ershaad.net/'),
      ],
    ),
    Project(
      name: 'Tawsela',
      subtitle: 'Shopping & delivery app',
      assetDir: 'assets/images/projects/tawsela/',
      badges: ['Delivery & Logistics'],
      bullets: [
        'Diagnosed and resolved critical bugs, improving overall app stability.',
        'API integration and Google Maps for real-time location and navigation.',
      ],
      tech: ['GetX', 'REST APIs', 'Google Maps'],
      links: [],
    ),
  ];

  // ── Engineering stories ───────────────────────────────────────────────────
  static const challengeLabel = 'Challenge:';
  static const approachLabel = 'Approach:';
  static const resultLabel = 'Result:';

  static const stories = [
    Story(
      headline: 'blink · turn · smile',
      title: 'Face liveness for attendance',
      challenge: 'A static photo must not pass as an employee at check-in.',
      approach:
          'Google ML Kit face detection on the camera stream, shuffled blink '
          'and head-turn challenges then a smile, with head-angle correction '
          'per platform.',
      result:
          'Liveness check-in with failed attempts photographed and logged. '
          '[metric]',
    ),
    Story(
      headline: 'offer → pick → go',
      title: 'Live captain offers',
      challenge:
          'Offers appear, withdraw and return while the rider is selecting or '
          'cancelling.',
      approach:
          'A Bloc with Freezed states over WebSocket streams, filtered per '
          'trip, with an offer cache and a duplicate-cancel guard.',
      result:
          'Offer, selection and cancellation states implemented in Dinamo. '
          '[release status]',
    ),
    Story(
      headline: 'call → pay',
      title: 'Therapy sessions online',
      challenge:
          'Users need to book a therapist, pay online and then meet remotely.',
      approach:
          'Agora SDK for video and audio consultations, Firebase for chat and '
          'authentication, Fawaterak for payments.',
      result:
          'Released on Google Play and as a responsive Flutter Web app. '
          '[metric]',
    ),
    Story(
      headline: '1 codebase → 3 platforms',
      title: 'Nova HR beyond the phone',
      challenge:
          'One HR product had to reach employees on phones and on desktop.',
      approach:
          'One layered Flutter codebase with Provider, plus a Windows installer '
          'built with Inno Setup.',
      result:
          'Live on the App Store and Google Play, with a Windows desktop build. '
          '[metric]',
    ),
    Story(
      headline: '3 apps, 1 system',
      title: 'Tracking with the screen off',
      challenge:
          'Customers and stores need the driver’s position even when the '
          'driver app is not in front.',
      approach:
          'An Android foreground service and iOS background geolocation '
          'streaming over Socket.IO, with the map pin animated between updates.',
      result:
          'Customer, store and driver apps, all live on Google Play. [metric]',
    ),
    Story(
      headline: 'EN ⇄ عربي',
      title: 'Bilingual delivery apps',
      challenge: 'The same screens must read naturally in English and Arabic.',
      approach:
          'Flutter localization with Arabic and English across the three Light '
          '& Fast apps, Arabic as the fallback.',
      result: 'Each app serves both languages. [metric]',
    ),
  ];

  // ── Experience ────────────────────────────────────────────────────────────
  static const experience = [
    Experience(
      role: 'Senior Flutter Developer',
      company: 'Dynamic Business Solution',
      dates: '10/2024 – present',
      current: true,
      bullets: [
        'Develop and maintain enterprise Flutter applications across HR, '
            'visitor management and delivery/logistics.',
        'Collaborate through code reviews, technical guidance and feature work '
            'across multiple production apps.',
        'Standardized Flutter architecture and reusable components to improve '
            'maintainability and consistency.',
        'Build and maintain production apps for Android, iOS and Desktop.',
      ],
    ),
    Experience(
      role: 'Mid-Level Mobile Developer',
      company: 'Dinamo',
      dates: '01/2024 – 10/2024',
      bullets: [
        'Acted as technical lead: code reviews, mentoring and leading complex '
            'features.',
        'Developed production Flutter apps across healthcare, smart '
            'transportation, e-commerce and delivery.',
        'Delivered cross-platform applications for Android, iOS and Web.',
      ],
    ),
    Experience(
      role: 'Junior Flutter Developer',
      company: 'Creative Corner',
      dates: '09/2023 – 01/2024',
      bullets: [
        'Contributed to the development and maintenance of Flutter apps.',
        'Integrated APIs and third-party services following Flutter best '
            'practices.',
        'Gained hands-on experience with scalable architecture and team '
            'workflows.',
      ],
    ),
    Experience(
      role: 'Junior Flutter Developer',
      company: 'ITSPARK',
      dates: '05/2023 – 09/2023',
      bullets: [
        'Contributed to Flutter applications for client projects.',
        'Implemented UI features, integrated REST APIs and resolved bugs.',
      ],
    ),
  ];

  // ── Skills ────────────────────────────────────────────────────────────────
  static const skillGroups = [
    SkillGroup('Languages', ['Dart', 'Python', 'C++', 'C#']),
    SkillGroup('Architecture & state', [
      'Clean Architecture',
      'BLoC / Cubit',
      'Provider',
      'Riverpod',
      'GetX',
      'MVC',
      'Freezed',
      'get_it',
      'SOLID',
      'Design Patterns',
      'OOP',
      'Algorithms',
    ]),
    SkillGroup('Real-time & backend', [
      'WebSockets',
      'Socket.IO',
      'SignalR',
      'REST APIs',
      'Dio',
      'Retrofit',
      'Firebase',
      'Push notifications',
      'Hive',
    ]),
    SkillGroup('Maps & device', [
      'Google Maps',
      'Geolocator',
      'Background location',
      'Huawei Location',
      'ML Kit Face Detection',
      'Biometric auth',
      'Barcode scanning',
      'Deep links',
    ]),
    SkillGroup('Payments & calls', ['Fawaterak', 'Agora SDK']),
    SkillGroup('Delivery', [
      'Fastlane',
      'Firebase App Distribution',
      'Flutter Flavors',
      'Git',
      'App Store',
      'Google Play',
      'Windows installer',
    ]),
  ];

  static const educationTitle = 'Education';
  static const degree = 'B.Sc. Computer Science & Artificial Intelligence';
  static const university = 'Benha University · 2018 – 2022';
  static const educationNotes = [
    'Specialized in Scientific Computing.',
    'Graduation project: stock monitoring website with a machine learning model.',
  ];

  static const coursesTitle = 'Courses & languages';
  static const courses = [
    Fact('Courses', '[Course names]'),
    Fact('Languages', '[Spoken languages and levels]'),
  ];

  // ── Contact & footer ──────────────────────────────────────────────────────
  static const contactTitle = 'Hiring a Flutter developer? Let’s talk.';
  static const emailLabel = 'Email';
  static const phoneLabel = 'Phone / WhatsApp';
  static const linkedInLabel = 'LinkedIn';
  static const gitHubLabel = 'GitHub';
  static const emailMe = 'Email me';
  static const downloadCvPdf = 'Download CV (PDF)';
  static const copyright = '© 2026 Shehab Nabil Mokhtar';
  static const builtWith = 'Built with Flutter';

  // ── Nova HR case study ────────────────────────────────────────────────────
  static const back = 'Back to portfolio';
  static const backShort = 'Back';
  static const caseLabel = 'Case study';
  static const caseTitle = 'Nova HR';
  static const caseIntro =
      'Enterprise workforce management, attendance and employee operations, '
      'with a liveness-checked check-in.';
  static const caseFacts = [
    Fact('Role', 'Senior Flutter Developer'),
    Fact('Company', 'Dynamic Business Solution'),
    Fact('Platforms', 'Android · iOS · Windows'),
    Fact('Timeline', '[timeline]'),
  ];

  static const problemHeading = SectionHeading(
    'Problem',
    'Checking who is really there',
  );
  static const problemBody =
      'A workforce app needs to know that the right person checked in, from the '
      'right place. A GPS pin or a selfie alone does not prove that. Nova HR '
      'combines a live face check with location and a photo record. [more context]';

  static const flowHeading = SectionHeading(
    'Liveness flow',
    'Four steps to check in',
  );
  static const flowSteps = [
    TextBlock(
      'Detect the face',
      'Google ML Kit Face Detection reads the camera stream.',
    ),
    TextBlock(
      'Challenge',
      'Blink and head turns in a shuffled order, then a smile.',
    ),
    TextBlock(
      'Guard',
      'After repeated failures a photo is captured and logged to the server.',
    ),
    TextBlock(
      'Record',
      'Attendance is GPS-based, with mock-location detection.',
    ),
  ];

  static const featuresHeading = SectionHeading(
    'Features',
    'Beyond the check-in',
  );
  static const features = [
    TextBlock(
      'Live tracking',
      'Background location during a shift: SignalR on Android, HTTP updates on '
          'iOS.',
    ),
    TextBlock(
      'Biometric sign-in',
      'Biometric authentication for secure user access.',
    ),
    TextBlock(
      'HR toolkit',
      'Leaves, permissions, missions, loans, overtime and expenses, among '
          'other modules.',
    ),
  ];

  static const architectureHeading = SectionHeading(
    'Architecture',
    'Clean, layered, replaceable',
  );
  static const layers = [
    Layer('Presentation', ['Screens & widgets', 'Provider state']),
    Layer('Domain', ['Entities', 'Use cases', 'Repository contracts']),
    Layer('Data', [
      'Repository implementations',
      'REST data sources',
      'SignalR client',
    ]),
    Layer('Device', ['ML Kit Face Detection', 'Camera', 'GPS', 'Biometrics']),
  ];

  static const delivery = TextBlock(
    'Delivery',
    'A Fastlane lane sends Android test builds to Firebase App Distribution, '
        'and Inno Setup packages the Windows installer.',
  );
  static const outcome = TextBlock(
    'Outcome',
    'Live on the App Store and Google Play, with a Windows desktop build. '
        '[downloads] [measured result]',
  );

  static const nextProjectLabel = 'Next project';
  static const nextProjectName = 'Dinamo';
}
