import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

void reportErrorForNode(
  ErrorReporter reporter,
  ErrorCode errorCode,
  AstNode node,
) {
  print('[ERR] report $errorCode for $node');
  reporter.reportErrorForNode(errorCode, node);
}

bool isString(DartType? type) {
  if (type == null) return false;
  return TypeChecker.fromName(
    'String',
  ).isAssignableFromType(type);
}

class StringThrowable extends DartLintRule {
  StringThrowable() : super(code: _code);

  /// Metadata about the lint define. This is the code which will show-up in the IDE,
  /// and its description..
  static const _code = LintCode(
    name: 'safer_safety_string_throwable',
    problemMessage:
        'Watch-out ! method xxx is not null safe, use the xxxOrNull variant !',
  );

  static const _unsafeMethods = [
    'substring',
    'codeUnitAt',
  ];

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
      if (isString(node.prefix.staticType) &&
          _unsafeMethods.contains(node.identifier.name)) {
        // This emits our lint warning at the location of the variable.
        reportErrorForNode(reporter, code, node);
      }
    });
    context.registry.addMethodInvocation((node) {
      if (isString(node.target?.staticType) &&
          _unsafeMethods.contains(node.methodName.name)) {
        reportErrorForNode(reporter, code, node);
      }
    });
  }
}

class StringOffsetAccess extends DartLintRule {
  StringOffsetAccess() : super(code: _code);

  /// Metadata about the lint define. This is the code which will show-up in the IDE,
  /// and its description..
  static const _code = LintCode(
    name: 'safer_safety_string_offset_access',
    problemMessage: 'Watch-out ! String operator [] is not null safe !',
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
      if (isString(node.target?.staticType)) {
        // This emits our lint warning at the location of the variable.
        reportErrorForNode(reporter, code, node);
      }
    });
  }
}
