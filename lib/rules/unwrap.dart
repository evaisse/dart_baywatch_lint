import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class ForceUnwrap extends DartLintRule {
  ForceUnwrap() : super(code: _code);

  /// Metadata about the lint define. This is the code which will show-up in the IDE,
  /// and its description..
  static const _code = LintCode(
    name: 'baywatch_force_unwrap',
    problemMessage: 'Watch-out ! unwrapping using `!` is dangerous',
  );

  /// The core logic for our custom lint rule.
  /// In our case, it will search over all variables defined in a Dart file and
  /// search for the ones that implement a specific type (see [_providerBaseChecker]).
  @override
  void run(
    // This object contains metadata about the analyzed file
    CustomLintResolver resolver,
    // ErrorReporter is for submitting lints. It contains utilities to specify
    // where the lint should show-up.
    ErrorReporter reporter,
    // This contains various utilities, including tools for inspecting the content
    // of Dart files in an efficient manner.
    CustomLintContext context,
  ) {
    context.registry.addExpression((node) {
      if (node.childEntities
          .where((element) => element.toString() == '!')
          .isEmpty) {
        return;
      }
      // This emits our lint warning at the location of the variable.
      reporter.reportErrorForNode(code, node);
    });
  }
}
