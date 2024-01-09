import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

const _iteratorTypeChecker = TypeChecker.fromName(
  'Iterable',
);

void reportErrorForNode(
  ErrorReporter reporter,
  ErrorCode errorCode,
  AstNode node,
) {
  print('[ERR] report $errorCode for $node');
  reporter.reportErrorForNode(errorCode, node);
}

bool isIterator(DartType? type) {
  if (type == null) return false;
  return _iteratorTypeChecker.isAssignableFromType(type);
}

bool isString(DartType? type) {
  if (type == null) return false;
  return TypeChecker.fromName(
    'String',
  ).isAssignableFromType(type);
}

class IteratorQuickAccess extends DartLintRule {
  IteratorQuickAccess() : super(code: _code);

  /// Metadata about the lint define. This is the code which will show-up in the IDE,
  /// and its description..
  static const _code = LintCode(
    name: 'safer_safety_iterator_offset_access',
    problemMessage:
        'Watch-out ! Iterator method xxx is not null safe, use the xxxOrNull variant !',
  );

  static const _unsafeMethods = ['first', 'firstWhere', 'last', 'lastWhere'];
  static const _orNullAlternative = ["first", "last", "single", "elementAt"];

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
    context.registry.addPrefixedIdentifier((node) {
      if (isIterator(node.prefix.staticType) &&
          _unsafeMethods.contains(node.identifier.name)) {
        // This emits our lint warning at the location of the variable.
        reportErrorForNode(reporter, code, node);
      }
    });
    context.registry.addMethodInvocation((node) {
      if (isIterator(node.target?.staticType) &&
          _unsafeMethods.contains(node.methodName.name)) {
        reportErrorForNode(reporter, code, node);
      }
    });
  }
}

class IteratorOffsetAccess extends DartLintRule {
  IteratorOffsetAccess() : super(code: _code);

  /// Metadata about the lint define. This is the code which will show-up in the IDE,
  /// and its description..
  static const _code = LintCode(
    name: 'safer_safety_iterator_offset_access',
    problemMessage:
        'Watch-out ! Iterator direct access to slot is not null safe !',
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
    context.registry.addIndexExpression((node) {
      if (isIterator(node.target?.staticType) ||
          isString(node.target?.staticType)) {
        // This emits our lint warning at the location of the variable.
        reportErrorForNode(reporter, code, node);
      }
    });
  }
}
