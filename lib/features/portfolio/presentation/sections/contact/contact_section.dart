import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/layout.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_text.dart';
import 'package:my_portfolio/features/portfolio/domain/entities/portfolio.dart';
import 'package:my_portfolio/features/portfolio/presentation/di/portfolio_scope.dart';
import 'package:my_portfolio/features/portfolio/presentation/sections/contact/contact_grid.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/page_container.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/pill_button.dart';
import 'package:my_portfolio/features/portfolio/presentation/widgets/reveal.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
    super.key,
    required this.content,
    required this.details,
  });

  final ContactContent content;
  final ContactDetails details;

  @override
  Widget build(BuildContext context) {
    final mobile = Layout.isMobile(context);
    final columns = mobile ? 1 : (Layout.isDesktop(context) ? 4 : 2);

    return Padding(
      padding: EdgeInsets.only(
        top: Layout.sectionSpacing(context) * 0.75,
        bottom: 32,
      ),
      child: PageContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Reveal(
              child: Container(
                padding: EdgeInsets.all(mobile ? 24 : 56),
                decoration: BoxDecoration(
                  color: AppColors.dark,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      content.label.toUpperCase(),
                      style: AppText.label(
                        color: AppColors.accentOnDark,
                        size: 13,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 720),
                      child: Semantics(
                        header: true,
                        child: Text(
                          content.title,
                          style: AppText.heading(
                            Layout.fluid(context, 32, 48, 0.038),
                            color: AppColors.onDark,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                    ContactGrid(
                      columns: columns,
                      cells: [
                        (content.emailLabel, details.email),
                        (content.phoneLabel, details.phone),
                        (content.linkedInLabel, details.linkedIn),
                        (content.gitHubLabel, details.gitHub),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        PillButton(
                          label: content.emailMe,
                          style: PillStyle.light,
                          onTap: () => context.openLink(details.email.url),
                        ),
                        PillButton(
                          label: content.downloadCvPdf,
                          style: PillStyle.ghostDark,
                          onTap: () => context.openLink(details.cvPath),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: 16,
              runSpacing: 8,
              children: [
                Text(content.copyright, style: AppText.mono(size: 12)),
                Text(content.builtWith, style: AppText.mono(size: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
