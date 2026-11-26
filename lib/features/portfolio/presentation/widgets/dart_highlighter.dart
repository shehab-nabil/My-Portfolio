/// A deliberately small Dart tokenizer for the hero code card.
library;

enum CodeToken { plain, comment, string, annotation, keyword, type }

typedef CodeSpan = ({String text, CodeToken token});

final _pattern = RegExp(
  r'(?<comment>//[^\n]*)'
  r"|(?<string>'[^'\n]*')"
  r'|(?<annotation>@\w+)'
  r'|(?<keyword>\b(?:class|extends|final|get|async|await|return|const|var)\b)'
  r'|(?<type>\b[A-Z]\w*)',
);

/// Splits [code] into consecutive spans that join back to the original.
List<CodeSpan> highlightDart(String code) {
  final spans = <CodeSpan>[];
  var end = 0;
  for (final match in _pattern.allMatches(code)) {
    if (match.start > end) {
      spans.add((
        text: code.substring(end, match.start),
        token: CodeToken.plain,
      ));
    }
    final token = CodeToken.values.firstWhere(
      (t) => t != CodeToken.plain && match.namedGroup(t.name) != null,
    );
    spans.add((text: match[0]!, token: token));
    end = match.end;
  }
  if (end < code.length) {
    spans.add((text: code.substring(end), token: CodeToken.plain));
  }
  return spans;
}
