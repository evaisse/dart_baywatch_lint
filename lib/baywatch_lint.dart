import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:analyzer/source/source_range.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:safer_safety_custom_lint/rules/string.dart';

import 'rules/iterator.dart';
import 'rules/unwrap.dart';

/// This object is a utility for checking whether a Dart variable is assignable
/// to a given class.
///
/// In this example, the class checked is `ProviderBase` from `package:riverpod`.
const _providerBaseChecker = TypeChecker.fromName(
  'ProviderBase',
  packageName: 'riverpod',
);

/// This is the entrypoint of our plugin.
/// All plugins must specify a `createPlugin` function in their `lib/<package_name>.dart` file
PluginBase createPlugin() => _LinterPlugin();

/// The class listing all the [LintRule]s and [Assist]s defined by our plugin.
class _LinterPlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        // AstExplorerDebuggerRule(),
        IteratorOffsetAccess(),
        IteratorQuickAccess(),
        StringThrowable(),
        ForceUnwrap(),
      ];

  @override
  List<Assist> getAssists() => [_ConvertToStreamProvider()];
}

/// A custom lint rule.
/// In our case, we want a lint rule which analyzes a Dart file. Therefore we
/// subclass [DartLintRule].
///
/// For emitting lints on non-Dart files, subclass [LintRule].
class AstExplorerDebuggerRule extends DartLintRule {
  AstExplorerDebuggerRule() : super(code: _code);

  /// Metadata about the lint define. This is the code which will show-up in the IDE,
  /// and its description..
  static const _code = LintCode(
    name: 'safer_safety_debug',
    problemMessage: 'debug.',
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
    print("""@@@@RUN DEBUG ANALYSIS
====

    """);

    context.registry.addAdjacentStrings((node) {
      print("""[DEBUG] addAdjacentStrings: $node""");
    });
    context.registry.addAnnotatedNode((node) {
      print("""[DEBUG] addAnnotatedNode: $node""");
    });
    context.registry.addAnnotation((node) {
      print("""[DEBUG] addAnnotation: $node""");
    });
    context.registry.addArgumentList((node) {
      print("""[DEBUG] addArgumentList: $node""");
    });
    context.registry.addAsExpression((node) {
      print("""[DEBUG] addAsExpression: $node""");
    });
    context.registry.addAssertInitializer((node) {
      print("""[DEBUG] addAssertInitializer: $node""");
    });
    context.registry.addAssertStatement((node) {
      print("""[DEBUG] addAssertStatement: $node""");
    });
    context.registry.addAssignedVariablePattern((node) {
      print("""[DEBUG] addAssignedVariablePattern: $node""");
    });
    context.registry.addAssignmentExpression((node) {
      print("""[DEBUG] addAssignmentExpression: $node""");
    });
    context.registry.addAugmentationImportDirective((node) {
      print("""[DEBUG] addAugmentationImportDirective: $node""");
    });
    context.registry.addAwaitExpression((node) {
      print("""[DEBUG] addAwaitExpression: $node""");
    });
    context.registry.addBinaryExpression((node) {
      print("""[DEBUG] addBinaryExpression: $node""");
    });
    context.registry.addBlock((node) {
      print("""[DEBUG] addBlock: $node""");
    });
    context.registry.addBlockFunctionBody((node) {
      print("""[DEBUG] addBlockFunctionBody: $node""");
    });
    context.registry.addBooleanLiteral((node) {
      print("""[DEBUG] addBooleanLiteral: $node""");
    });
    context.registry.addBreakStatement((node) {
      print("""[DEBUG] addBreakStatement: $node""");
    });
    context.registry.addCascadeExpression((node) {
      print("""[DEBUG] addCascadeExpression: $node""");
    });
    context.registry.addCaseClause((node) {
      print("""[DEBUG] addCaseClause: $node""");
    });
    context.registry.addCastPattern((node) {
      print("""[DEBUG] addCastPattern: $node""");
    });
    context.registry.addCatchClause((node) {
      print("""[DEBUG] addCatchClause: $node""");
    });
    context.registry.addCatchClauseParameter((node) {
      print("""[DEBUG] addCatchClauseParameter: $node""");
    });
    context.registry.addClassDeclaration((node) {
      print("""[DEBUG] addClassDeclaration: $node""");
    });
    context.registry.addClassMember((node) {
      print("""[DEBUG] addClassMember: $node""");
    });
    context.registry.addClassTypeAlias((node) {
      print("""[DEBUG] addClassTypeAlias: $node""");
    });
    context.registry.addCollectionElement((node) {
      print("""[DEBUG] addCollectionElement: $node""");
    });
    context.registry.addCombinator((node) {
      print("""[DEBUG] addCombinator: $node""");
    });
    context.registry.addComment((node) {
      print("""[DEBUG] addComment: $node""");
    });
    context.registry.addCommentReference((node) {
      print("""[DEBUG] addCommentReference: $node""");
    });
    context.registry.addCompilationUnit((node) {
      print("""[DEBUG] addCompilationUnit: $node""");
    });
    context.registry.addCompilationUnitMember((node) {
      print("""[DEBUG] addCompilationUnitMember: $node""");
    });
    context.registry.addConditionalExpression((node) {
      print("""[DEBUG] addConditionalExpression: $node""");
    });
    context.registry.addConfiguration((node) {
      print("""[DEBUG] addConfiguration: $node""");
    });
    context.registry.addConstantPattern((node) {
      print("""[DEBUG] addConstantPattern: $node""");
    });
    context.registry.addConstructorDeclaration((node) {
      print("""[DEBUG] addConstructorDeclaration: $node""");
    });
    context.registry.addConstructorFieldInitializer((node) {
      print("""[DEBUG] addConstructorFieldInitializer: $node""");
    });
    context.registry.addConstructorInitializer((node) {
      print("""[DEBUG] addConstructorInitializer: $node""");
    });
    context.registry.addConstructorName((node) {
      print("""[DEBUG] addConstructorName: $node""");
    });
    context.registry.addConstructorReference((node) {
      print("""[DEBUG] addConstructorReference: $node""");
    });
    context.registry.addConstructorSelector((node) {
      print("""[DEBUG] addConstructorSelector: $node""");
    });
    context.registry.addContinueStatement((node) {
      print("""[DEBUG] addContinueStatement: $node""");
    });
    context.registry.addDartPattern((node) {
      print("""[DEBUG] addDartPattern: $node""");
    });
    context.registry.addDeclaration((node) {
      print("""[DEBUG] addDeclaration: $node""");
    });
    context.registry.addDeclaredIdentifier((node) {
      print("""[DEBUG] addDeclaredIdentifier: $node""");
    });
    context.registry.addDeclaredVariablePattern((node) {
      print("""[DEBUG] addDeclaredVariablePattern: $node""");
    });
    context.registry.addDefaultFormalParameter((node) {
      print("""[DEBUG] addDefaultFormalParameter: $node""");
    });
    context.registry.addDirective((node) {
      print("""[DEBUG] addDirective: $node""");
    });
    context.registry.addDoStatement((node) {
      print("""[DEBUG] addDoStatement: $node""");
    });
    context.registry.addDottedName((node) {
      print("""[DEBUG] addDottedName: $node""");
    });
    context.registry.addDoubleLiteral((node) {
      print("""[DEBUG] addDoubleLiteral: $node""");
    });
    context.registry.addEmptyFunctionBody((node) {
      print("""[DEBUG] addEmptyFunctionBody: $node""");
    });
    context.registry.addEmptyStatement((node) {
      print("""[DEBUG] addEmptyStatement: $node""");
    });
    context.registry.addEnumConstantArguments((node) {
      print("""[DEBUG] addEnumConstantArguments: $node""");
    });
    context.registry.addEnumConstantDeclaration((node) {
      print("""[DEBUG] addEnumConstantDeclaration: $node""");
    });
    context.registry.addEnumDeclaration((node) {
      print("""[DEBUG] addEnumDeclaration: $node""");
    });
    context.registry.addExportDirective((node) {
      print("""[DEBUG] addExportDirective: $node""");
    });
    context.registry.addExpression((node) {
      print("""[DEBUG] addExpression: $node""");
    });
    context.registry.addExpressionFunctionBody((node) {
      print("""[DEBUG] addExpressionFunctionBody: $node""");
    });
    context.registry.addExpressionStatement((node) {
      print("""[DEBUG] addExpressionStatement: $node""");
    });
    context.registry.addExtendsClause((node) {
      print("""[DEBUG] addExtendsClause: $node""");
    });
    context.registry.addExtensionDeclaration((node) {
      print("""[DEBUG] addExtensionDeclaration: $node""");
    });
    context.registry.addExtensionOverride((node) {
      print("""[DEBUG] addExtensionOverride: $node""");
    });
    context.registry.addFieldDeclaration((node) {
      print("""[DEBUG] addFieldDeclaration: $node""");
    });
    context.registry.addFieldFormalParameter((node) {
      print("""[DEBUG] addFieldFormalParameter: $node""");
    });
    context.registry.addForEachParts((node) {
      print("""[DEBUG] addForEachParts: $node""");
    });
    context.registry.addForEachPartsWithDeclaration((node) {
      print("""[DEBUG] addForEachPartsWithDeclaration: $node""");
    });
    context.registry.addForEachPartsWithIdentifier((node) {
      print("""[DEBUG] addForEachPartsWithIdentifier: $node""");
    });
    context.registry.addForEachPartsWithPattern((node) {
      print("""[DEBUG] addForEachPartsWithPattern: $node""");
    });
    context.registry.addForElement((node) {
      print("""[DEBUG] addForElement: $node""");
    });
    context.registry.addFormalParameter((node) {
      print("""[DEBUG] addFormalParameter: $node""");
    });
    context.registry.addFormalParameterList((node) {
      print("""[DEBUG] addFormalParameterList: $node""");
    });
    context.registry.addForParts((node) {
      print("""[DEBUG] addForParts: $node""");
    });
    context.registry.addForPartsWithDeclarations((node) {
      print("""[DEBUG] addForPartsWithDeclarations: $node""");
    });
    context.registry.addForPartsWithExpression((node) {
      print("""[DEBUG] addForPartsWithExpression: $node""");
    });
    context.registry.addForPartsWithPattern((node) {
      print("""[DEBUG] addForPartsWithPattern: $node""");
    });
    context.registry.addForStatement((node) {
      print("""[DEBUG] addForStatement: $node""");
    });
    context.registry.addFunctionBody((node) {
      print("""[DEBUG] addFunctionBody: $node""");
    });
    context.registry.addFunctionDeclaration((node) {
      print("""[DEBUG] addFunctionDeclaration: $node""");
    });
    context.registry.addFunctionDeclarationStatement((node) {
      print("""[DEBUG] addFunctionDeclarationStatement: $node""");
    });
    context.registry.addFunctionExpression((node) {
      print("""[DEBUG] addFunctionExpression: $node""");
    });
    context.registry.addFunctionExpressionInvocation((node) {
      print("""[DEBUG] addFunctionExpressionInvocation: $node""");
    });
    context.registry.addFunctionReference((node) {
      print("""[DEBUG] addFunctionReference: $node""");
    });
    context.registry.addFunctionTypeAlias((node) {
      print("""[DEBUG] addFunctionTypeAlias: $node""");
    });
    context.registry.addFunctionTypedFormalParameter((node) {
      print("""[DEBUG] addFunctionTypedFormalParameter: $node""");
    });
    context.registry.addGenericFunctionType((node) {
      print("""[DEBUG] addGenericFunctionType: $node""");
    });
    context.registry.addGenericTypeAlias((node) {
      print("""[DEBUG] addGenericTypeAlias: $node""");
    });
    context.registry.addGuardedPattern((node) {
      print("""[DEBUG] addGuardedPattern: $node""");
    });
    context.registry.addHideCombinator((node) {
      print("""[DEBUG] addHideCombinator: $node""");
    });
    context.registry.addIdentifier((node) {
      print("""[DEBUG] addIdentifier: $node""");
    });
    context.registry.addIfElement((node) {
      print("""[DEBUG] addIfElement: $node""");
    });
    context.registry.addIfStatement((node) {
      print("""[DEBUG] addIfStatement: $node""");
    });
    context.registry.addImplementsClause((node) {
      print("""[DEBUG] addImplementsClause: $node""");
    });
    context.registry.addImplicitCallReference((node) {
      print("""[DEBUG] addImplicitCallReference: $node""");
    });
    context.registry.addImportDirective((node) {
      print("""[DEBUG] addImportDirective: $node""");
    });
    context.registry.addImportPrefixReference((node) {
      print("""[DEBUG] addImportPrefixReference: $node""");
    });
    context.registry.addIndexExpression((node) {
      print("""[DEBUG] addIndexExpression: $node""");
    });
    context.registry.addInstanceCreationExpression((node) {
      print("""[DEBUG] addInstanceCreationExpression: $node""");
    });
    context.registry.addIntegerLiteral((node) {
      print("""[DEBUG] addIntegerLiteral: $node""");
    });
    context.registry.addInterpolationElement((node) {
      print("""[DEBUG] addInterpolationElement: $node""");
    });
    context.registry.addInterpolationExpression((node) {
      print("""[DEBUG] addInterpolationExpression: $node""");
    });
    context.registry.addInterpolationString((node) {
      print("""[DEBUG] addInterpolationString: $node""");
    });
    context.registry.addInvocationExpression((node) {
      print("""[DEBUG] addInvocationExpression: $node""");
    });
    context.registry.addIsExpression((node) {
      print("""[DEBUG] addIsExpression: $node""");
    });
    context.registry.addLabel((node) {
      print("""[DEBUG] addLabel: $node""");
    });
    context.registry.addLabeledStatement((node) {
      print("""[DEBUG] addLabeledStatement: $node""");
    });
    context.registry.addLibraryAugmentationDirective((node) {
      print("""[DEBUG] addLibraryAugmentationDirective: $node""");
    });
    context.registry.addLibraryDirective((node) {
      print("""[DEBUG] addLibraryDirective: $node""");
    });
    context.registry.addLibraryIdentifier((node) {
      print("""[DEBUG] addLibraryIdentifier: $node""");
    });
    context.registry.addListLiteral((node) {
      print("""[DEBUG] addListLiteral: $node""");
    });
    context.registry.addListPattern((node) {
      print("""[DEBUG] addListPattern: $node""");
    });
    context.registry.addLiteral((node) {
      print("""[DEBUG] addLiteral: $node""");
    });
    context.registry.addLogicalAndPattern((node) {
      print("""[DEBUG] addLogicalAndPattern: $node""");
    });
    context.registry.addLogicalOrPattern((node) {
      print("""[DEBUG] addLogicalOrPattern: $node""");
    });
    context.registry.addMapLiteralEntry((node) {
      print("""[DEBUG] addMapLiteralEntry: $node""");
    });
    context.registry.addMapPattern((node) {
      print("""[DEBUG] addMapPattern: $node""");
    });
    context.registry.addMapPatternEntry((node) {
      print("""[DEBUG] addMapPatternEntry: $node""");
    });
    context.registry.addMethodDeclaration((node) {
      print("""[DEBUG] addMethodDeclaration: $node""");
    });
    context.registry.addMethodInvocation((node) {
      print("""[DEBUG] addMethodInvocation: $node""");
    });
    context.registry.addMixinDeclaration((node) {
      print("""[DEBUG] addMixinDeclaration: $node""");
    });
    context.registry.addNamedCompilationUnitMember((node) {
      print("""[DEBUG] addNamedCompilationUnitMember: $node""");
    });
    context.registry.addNamedExpression((node) {
      print("""[DEBUG] addNamedExpression: $node""");
    });
    context.registry.addNamedType((node) {
      print("""[DEBUG] addNamedType: $node""");
    });
    context.registry.addNamespaceDirective((node) {
      print("""[DEBUG] addNamespaceDirective: $node""");
    });
    context.registry.addNativeClause((node) {
      print("""[DEBUG] addNativeClause: $node""");
    });
    context.registry.addNativeFunctionBody((node) {
      print("""[DEBUG] addNativeFunctionBody: $node""");
    });
    context.registry.addNode((node) {
      print("""[DEBUG] addNode: $node""");
    });
    context.registry.addNormalFormalParameter((node) {
      print("""[DEBUG] addNormalFormalParameter: $node""");
    });
    context.registry.addNullAssertPattern((node) {
      print("""[DEBUG] addNullAssertPattern: $node""");
    });
    context.registry.addNullCheckPattern((node) {
      print("""[DEBUG] addNullCheckPattern: $node""");
    });
    context.registry.addNullLiteral((node) {
      print("""[DEBUG] addNullLiteral: $node""");
    });
    context.registry.addObjectPattern((node) {
      print("""[DEBUG] addObjectPattern: $node""");
    });
    context.registry.addOnClause((node) {
      print("""[DEBUG] addOnClause: $node""");
    });
    context.registry.addParenthesizedExpression((node) {
      print("""[DEBUG] addParenthesizedExpression: $node""");
    });
    context.registry.addParenthesizedPattern((node) {
      print("""[DEBUG] addParenthesizedPattern: $node""");
    });
    context.registry.addPartDirective((node) {
      print("""[DEBUG] addPartDirective: $node""");
    });
    context.registry.addPartOfDirective((node) {
      print("""[DEBUG] addPartOfDirective: $node""");
    });
    context.registry.addPatternAssignment((node) {
      print("""[DEBUG] addPatternAssignment: $node""");
    });
    context.registry.addPatternField((node) {
      print("""[DEBUG] addPatternField: $node""");
    });
    context.registry.addPatternFieldName((node) {
      print("""[DEBUG] addPatternFieldName: $node""");
    });
    context.registry.addPatternVariableDeclaration((node) {
      print("""[DEBUG] addPatternVariableDeclaration: $node""");
    });
    context.registry.addPatternVariableDeclarationStatement((node) {
      print("""[DEBUG] addPatternVariableDeclarationStatement: $node""");
    });
    context.registry.addPostfixExpression((node) {
      print("""[DEBUG] addPostfixExpression: $node""");
    });
    context.registry.addPrefixedIdentifier((node) {
      print("""[DEBUG] addPrefixedIdentifier: $node
      identifier: ${node.identifier}
      prefix: ${node.prefix.staticType}
      """);
    });
    context.registry.addPrefixExpression((node) {
      print("""[DEBUG] addPrefixExpression: $node""");
    });
    context.registry.addPropertyAccess((node) {
      print("""[DEBUG] addPropertyAccess: $node""");
    });
    context.registry.addRecordLiteral((node) {
      print("""[DEBUG] addRecordLiteral: $node""");
    });
    context.registry.addRecordPattern((node) {
      print("""[DEBUG] addRecordPattern: $node""");
    });
    context.registry.addRecordTypeAnnotation((node) {
      print("""[DEBUG] addRecordTypeAnnotation: $node""");
    });
    context.registry.addRecordTypeAnnotationField((node) {
      print("""[DEBUG] addRecordTypeAnnotationField: $node""");
    });
    context.registry.addRecordTypeAnnotationNamedField((node) {
      print("""[DEBUG] addRecordTypeAnnotationNamedField: $node""");
    });
    context.registry.addRecordTypeAnnotationNamedFields((node) {
      print("""[DEBUG] addRecordTypeAnnotationNamedFields: $node""");
    });
    context.registry.addRecordTypeAnnotationPositionalField((node) {
      print("""[DEBUG] addRecordTypeAnnotationPositionalField: $node""");
    });
    context.registry.addRedirectingConstructorInvocation((node) {
      print("""[DEBUG] addRedirectingConstructorInvocation: $node""");
    });
    context.registry.addRelationalPattern((node) {
      print("""[DEBUG] addRelationalPattern: $node""");
    });
    context.registry.addRestPatternElement((node) {
      print("""[DEBUG] addRestPatternElement: $node""");
    });
    context.registry.addRethrowExpression((node) {
      print("""[DEBUG] addRethrowExpression: $node""");
    });
    context.registry.addReturnStatement((node) {
      print("""[DEBUG] addReturnStatement: $node""");
    });
    context.registry.addScriptTag((node) {
      print("""[DEBUG] addScriptTag: $node""");
    });
    context.registry.addSetOrMapLiteral((node) {
      print("""[DEBUG] addSetOrMapLiteral: $node""");
    });
    context.registry.addShowCombinator((node) {
      print("""[DEBUG] addShowCombinator: $node""");
    });
    context.registry.addSimpleFormalParameter((node) {
      print("""[DEBUG] addSimpleFormalParameter: $node""");
    });
    context.registry.addSimpleIdentifier((node) {
      print("""[DEBUG] addSimpleIdentifier: $node""");
    });
    context.registry.addSimpleStringLiteral((node) {
      print("""[DEBUG] addSimpleStringLiteral: $node""");
    });
    context.registry.addSingleStringLiteral((node) {
      print("""[DEBUG] addSingleStringLiteral: $node""");
    });
    context.registry.addSpreadElement((node) {
      print("""[DEBUG] addSpreadElement: $node""");
    });
    context.registry.addStatement((node) {
      print("""[DEBUG] addStatement: $node""");
    });
    context.registry.addStringInterpolation((node) {
      print("""[DEBUG] addStringInterpolation: $node""");
    });
    context.registry.addStringLiteral((node) {
      print("""[DEBUG] addStringLiteral: $node""");
    });
    context.registry.addSuperConstructorInvocation((node) {
      print("""[DEBUG] addSuperConstructorInvocation: $node""");
    });
    context.registry.addSuperExpression((node) {
      print("""[DEBUG] addSuperExpression: $node""");
    });
    context.registry.addSuperFormalParameter((node) {
      print("""[DEBUG] addSuperFormalParameter: $node""");
    });
    context.registry.addSwitchCase((node) {
      print("""[DEBUG] addSwitchCase: $node""");
    });
    context.registry.addSwitchDefault((node) {
      print("""[DEBUG] addSwitchDefault: $node""");
    });
    context.registry.addSwitchExpression((node) {
      print("""[DEBUG] addSwitchExpression: $node""");
    });
    context.registry.addSwitchExpressionCase((node) {
      print("""[DEBUG] addSwitchExpressionCase: $node""");
    });
    context.registry.addSwitchMember((node) {
      print("""[DEBUG] addSwitchMember: $node""");
    });
    context.registry.addSwitchPatternCase((node) {
      print("""[DEBUG] addSwitchPatternCase: $node""");
    });
    context.registry.addSwitchStatement((node) {
      print("""[DEBUG] addSwitchStatement: $node""");
    });
    context.registry.addSymbolLiteral((node) {
      print("""[DEBUG] addSymbolLiteral: $node""");
    });
    context.registry.addThisExpression((node) {
      print("""[DEBUG] addThisExpression: $node""");
    });
    context.registry.addThrowExpression((node) {
      print("""[DEBUG] addThrowExpression: $node""");
    });
    context.registry.addTopLevelVariableDeclaration((node) {
      print("""[DEBUG] addTopLevelVariableDeclaration: $node""");
    });
    context.registry.addTryStatement((node) {
      print("""[DEBUG] addTryStatement: $node""");
    });
    context.registry.addTypeAlias((node) {
      print("""[DEBUG] addTypeAlias: $node""");
    });
    context.registry.addTypeAnnotation((node) {
      print("""[DEBUG] addTypeAnnotation: $node""");
    });
    context.registry.addTypeArgumentList((node) {
      print("""[DEBUG] addTypeArgumentList: $node""");
    });
    context.registry.addTypedLiteral((node) {
      print("""[DEBUG] addTypedLiteral: $node""");
    });
    context.registry.addTypeLiteral((node) {
      print("""[DEBUG] addTypeLiteral: $node""");
    });
    context.registry.addTypeParameter((node) {
      print("""[DEBUG] addTypeParameter: $node""");
    });
    context.registry.addTypeParameterList((node) {
      print("""[DEBUG] addTypeParameterList: $node""");
    });
    context.registry.addUriBasedDirective((node) {
      print("""[DEBUG] addUriBasedDirective: $node""");
    });
    context.registry.addVariableDeclaration((node) {
      print("""[DEBUG] addVariableDeclaration: $node""");
    });
    context.registry.addVariableDeclarationList((node) {
      print("""[DEBUG] addVariableDeclarationList: $node""");
    });
    context.registry.addVariableDeclarationStatement((node) {
      print("""[DEBUG] addVariableDeclarationStatement: $node""");
    });
    context.registry.addWhenClause((node) {
      print("""[DEBUG] addWhenClause: $node""");
    });
    context.registry.addWhileStatement((node) {
      print("""[DEBUG] addWhileStatement: $node""");
    });
    context.registry.addWildcardPattern((node) {
      print("""[DEBUG] addWildcardPattern: $node""");
    });
    context.registry.addWithClause((node) {
      print("""[DEBUG] addWithClause: $node""");
    });
    context.registry.addYieldStatement((node) {
      print("""[DEBUG] addYieldStatement: $node""");
    });
  }

  /// [LintRule]s can optionally specify a list of quick-fixes.
  ///
  /// Fixes will show-up in the IDE when the cursor is above the warning. And it
  /// should contain a message explaining how the warning will be fixed.
  @override
  List<Fix> getFixes() => [_MakeProviderFinalFix()];
}

/// We define a quick fix for an issue.
///
/// Our quick fix wants to analyze Dart files, so we subclass [DartFix].
/// For quick-fixes on non-Dart files, see [Fix].
class _MakeProviderFinalFix extends DartFix {
  /// Similarly to [LintRule.run], [Fix.run] is the core logic of a fix.
  /// It will take care or proposing edits within a file.
  @override
  void run(
    CustomLintResolver resolver,
    // Similar to ErrorReporter, ChangeReporter is an object used for submitting
    // edits within a Dart file.
    ChangeReporter reporter,
    CustomLintContext context,
    // This is the warning that was emitted by our [LintRule] and which we are
    // trying to fix.
    AnalysisError analysisError,
    // This is the other warnings in the same file defined by our [LintRule].
    // Useful in case we want to offer a "fix all" option.
    List<AnalysisError> others,
  ) {
    // Using similar logic as in "PreferFinalProviders", we inspect the Dart file
    // to search for variable declarations.
    context.registry.addVariableDeclarationList((node) {
      // We verify that the variable declaration is where our warning is located
      if (!analysisError.sourceRange.intersects(node.sourceRange)) return;

      // We define one edit, giving it a message which will show-up in the IDE.
      final changeBuilder = reporter.createChangeBuilder(
        message: 'Make provider final',
        // This represents how high-low should this qick-fix show-up in the list
        // of quick-fixes.
        priority: 1,
      );

      // Our edit will consist of editing a Dart file, so we invoke "addDartFileEdit".
      // The changeBuilder variable also has utilities for other types of files.
      changeBuilder.addDartFileEdit((builder) {
        final nodeKeyword = node.keyword;
        final nodeType = node.type;
        if (nodeKeyword != null) {
          // Replace "var x = ..." into "final x = ...""

          // Using "builder", we can emit changes to a file.
          // In this case, addSimpleReplacement is used to overrite a selection
          // with a new content.
          builder.addSimpleReplacement(
            SourceRange(nodeKeyword.offset, nodeKeyword.length),
            'final',
          );
        } else if (nodeType != null) {
          // Replace "Type x = ..." into "final Type x = ..."

          // Once again we emit an edit to our file.
          // But this time, we add new content without replacing existing content.
          builder.addSimpleInsertion(nodeType.offset, 'final ');
        }
      });
    });
  }
}

/// Using the same principle as we've seen before, we can define an "assist".
///
/// The main difference between an [Assist] and a [Fix] is that a [Fix] is associated
/// with a problem. While an [Assist] is a change without an associated problem.
///
/// These are commonly known as "refactoring".
class _ConvertToStreamProvider extends DartAssist {
  @override
  void run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    SourceRange target,
  ) {
    context.registry.addVariableDeclaration((node) {
      // Check that the visited node is under the cursor
      if (!target.intersects(node.sourceRange)) return;

      // verify that the visited node is a provider, to only show the assist on providers
      final element = node.declaredElement;
      if (element == null ||
          element.isFinal ||
          !_providerBaseChecker.isAssignableFromType(element.type)) {
        return;
      }

      final changeBuilder = reporter.createChangeBuilder(
        priority: 1,
        message: 'Convert to StreamProvider',
      );
      changeBuilder.addDartFileEdit((builder) {
        // <implement change to refactor the provider>
      });
    });
  }
}
