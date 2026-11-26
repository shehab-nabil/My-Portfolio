# Shehab Nabil Mokhtar · Portfolio

Single-page developer portfolio built with Flutter Web, plus a case study at `/case-study/nova`.

```bash
flutter pub get
flutter run -d chrome
```

Built with Flutter 3.47.7 (stable), CanvasKit renderer.

## Architecture

```
lib/
  main.dart                composition root: picks the concrete implementations
  app/                     MaterialApp and router
  core/                    theme, layout constants, motion
  data/portfolio_data.dart all content (the file you edit)
  features/portfolio/
    domain/                entities and interfaces, pure Dart
    data/                  repository, URL launcher, asset lookup
    presentation/          pages, sections, widgets, scroll controllers, DI scope
assets/images/             your photo, app icons and screenshots
web/                       index.html, splash, icons, cv/
test/                      layer rules and unit tests
```

Dependencies point inwards: `presentation` and `data` depend on `domain`, and `domain` depends on neither. `test/architecture/layer_rules_test.dart` fails if that is broken.

| Principle | Where it shows |
| --- | --- |
| Single responsibility | Sections and shared widgets are split into small files; `ScrollFlags`, `SectionNavigator` and `activeSectionIndex` each do one job |
| Open/closed | A new content source is a new `PortfolioRepository` class, with no edits in `presentation` |
| Liskov substitution | Any `PortfolioRepository`, `LinkLauncher` or `AssetResolver` can replace the current one |
| Interface segregation | The service interfaces have one method each; sections are passed their own slice of content, while a few shared widgets read labels from the scope |
| Dependency inversion | Widgets use the interfaces through `PortfolioScope`; only `main.dart` names the implementations |

To load content from somewhere else (JSON, a CMS), implement `PortfolioRepository` and pass it in `main.dart`. `load()` is synchronous, so a remote source would also need that signature made asynchronous.

## Updating content

Edit **`lib/data/portfolio_data.dart`**. Every visible string and link is there.

A new *field* (not just a new value) also needs a line in `domain/entities/portfolio.dart` and in `data/static_portfolio_repository.dart`.

- **Placeholders** are written in `[square brackets]`. Search the file for `[` and replace them.
- **New project:** add a `Project(...)` to `projects`, create its image folder, and list that folder in `pubspec.yaml`. Set `emptyProjectSlots` to control the dashed "add project" cards (`0` hides them).
- **Stories, jobs, skills:** edit `stories`, `experience` and `skillGroups`.
- **Links:** a link whose URL starts with `[` renders but does nothing when clicked.
- `web/index.html` and `web/manifest.json` hold the page title and meta description separately. Update them if your name or role changes.

## Images

Accepted formats: `png`, `jpg`, `jpeg`, `webp` (lower-case extensions). A missing image shows a placeholder box.

| What | Where | Suggested size |
| --- | --- | --- |
| Your photo | `assets/images/profile/photo.jpg` | square, 256×256 or larger |
| App icon | `assets/images/projects/<project>/icon.png` | 192×192 |
| Screenshots | `assets/images/projects/<project>/screen1.png`, `screen2.png`, `screen3.png` | 9:19 portrait, about 600 px wide |

Project folders: `nova_hr`, `dinamo`, `light_and_fast`, `qp_express`, `ta2sima`, `ershaad`, `tawsela`. The Nova HR screenshots are also used on the case study page.

Asset folders in `pubspec.yaml` are not recursive, so each new folder needs its own line. Restart `flutter run` after adding files. Compress images before adding them.

## CV

The "Download CV" buttons open `web/cv/Shehab_Nabil_Mokhtar_CV.pdf`. Replace that file to update it. To use another name, also change `cvPath` in `portfolio_data.dart`.

The PDF is public once deployed, including the phone number and email in it.

## Deploying to GitHub Pages

### Automatic (GitHub Actions)

1. Push this project to a GitHub repository, on the `main` branch.
2. In the repository, open **Settings → Pages → Build and deployment** and set **Source** to **GitHub Actions**.
3. Every push to `main` now runs `.github/workflows/deploy.yml`, which analyzes, builds and deploys.

The workflow derives `--base-href` from the repository name (`/` for a `<user>.github.io` repository).

### Manual build

```bash
flutter build web --release --base-href /<repo>/
cp build/web/index.html build/web/404.html
```

Publish the contents of `build/web/`.

### About `404.html`

The site uses path URLs, and GitHub Pages has no server-side routing. Copying `index.html` to `404.html` makes a direct visit or refresh on `/case-study/nova` load the app. The HTTP status of that first response is still 404, which some crawlers notice.

## Custom domain

For a custom domain, build with `--base-href /` (change the workflow's `BASE` line).

## Before committing changes

```bash
dart format lib test
flutter analyze
flutter test
```
