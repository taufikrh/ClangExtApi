unit LibClang.Documentation;

{$mode ObjFPC}{$H+}
{$PACKRECORDS C}
{$minenumsize 4}
{$R-}

interface

uses
  LibClang.Base, LibClang.CXString, LibClang.Index;

{
The routines in this group provide access to information in documentation
comments. These facilities are distinct from the core and may be subject to
their own schedule of stability and deprecation.
}

type
  {
  A parsed comment.
  }
  CXComment = record
    ASTNode: Pointer; //const
    TranslationUnit: CXTranslationUnit;
  end;

  {
  Given a cursor that represents a documentable entity (e.g.,
  declaration), return the associated parsed comment as a
  CXComment_FullComment AST node.
  }
  function clang_Cursor_getParsedComment(
    C: CXCursor
    ): CXComment; cdecl; external LibClang_dll;

type
  {
  Describes the type of the comment AST node (CXComment).  A comment
  node can be considered block content (e. g., paragraph), inline content
  plain text) or neither (the root AST node).
  }
  CXCommentKind = (
    {
    Null comment.  No AST node is constructed at the requested location
    because there is no text or a syntax error.
    }
    CXComment_Null = 0,

    {
    Plain text.  Inline content.
    }
    CXComment_Text = 1,

    {
    A command with word-like arguments that is considered inline content.
    For example: \\c command.
    }
    CXComment_InlineCommand = 2,

    {
    HTML start tag with attributes (name-value pairs).  Considered
    inline content.

    For example:
    verbatim
       * <br> <br /> <a href="http://example.org/">
    endverbatim
    }
    CXComment_HTMLStartTag = 3,

    {
    HTML end tag.  Considered inline content.
    For example:
    verbatim
       </a>
    endverbatim
    }
    CXComment_HTMLEndTag = 4,

    {
    A paragraph, contains inline comment.  The paragraph itself is
    block content.
    }
    CXComment_Paragraph = 5,

    {
    A command that has zero or more word-like arguments (number of
    word-like arguments depends on command name) and a paragraph as an
    argument.  Block command is block content.

    Paragraph argument is also a child of the block command.

    For example: \has 0 word-like arguments and a paragraph argument.

    AST nodes of special kinds that parser knows about (e. g., \\param
    command) have their own node kinds.
    }
    CXComment_BlockCommand = 6,

    {
    A \\param or \\arg command that describes the function parameter
    name, passing direction, description).
    For example: \\param [in] ParamName description.
    }
    CXComment_ParamCommand = 7,

    {
    A \\tparam command that describes a template parameter (name and
    description).

    For example: \\tparam T description.
    }
    CXComment_TParamCommand = 8,

    {
    A verbatim block command (e. g., preformatted code).  Verbatim
    block has an opening and a closing command and contains multiple lines of
    text (\c CXComment_VerbatimBlockLine child nodes).

    For example:
    verbatim
    aaa
    endverbatim
    }
    CXComment_VerbatimBlockCommand = 9,

    {
    A line of text that is contained within a
    CXComment_VerbatimBlockCommand node.
    }
    CXComment_VerbatimBlockLine = 10,

    {
    A verbatim line command.  Verbatim line has an opening command,
    a single line of text (up to the newline after the opening command) and
    has no closing command.
    }
    CXComment_VerbatimLine = 11,

    {
    A full comment attached to a declaration, contains block content.
    }
    CXComment_FullComment = 12
  );

  {
  The most appropriate rendering mode for an inline command, chosen on
  command semantics in Doxygen.
  }
  CXCommentInlineCommandRenderKind = (

    {
    Command argument should be rendered in a normal font.
    }
    CXCommentInlineCommandRenderKind_Normal,

    {
    Command argument should be rendered in a bold font.
    }
    CXCommentInlineCommandRenderKind_Bold,

    {
    Command argument should be rendered in a monospaced font.
    }
    CXCommentInlineCommandRenderKind_Monospaced,

    {
    Command argument should be rendered emphasized (typically italic
    font).
    }
    CXCommentInlineCommandRenderKind_Emphasized,

    {
    Command argument should not be rendered (since it only defines an anchor).
    }
    CXCommentInlineCommandRenderKind_Anchor
  );

  {
  Describes parameter passing direction for \\param or \\arg command.
  }
  CXCommentParamPassDirection = (

    {
    The parameter is an input parameter.
    }
    CXCommentParamPassDirection_In,

    {
    The parameter is an output parameter.
    }
    CXCommentParamPassDirection_Out,

    {
    The parameter is an input and output parameter.
    }
    CXCommentParamPassDirection_InOut
  );

  {
  param Comment AST node of any kind.
  returns the type of the AST node.
  }
  function clang_Comment_getKind(
    Comment: CXComment
    ): CXCommentKind; cdecl; external LibClang_dll;

  {
  param Comment AST node of any kind.
  returns number of children of the AST node.
  }    
  function clang_Comment_getNumChildren(
    Comment: CXComment
    ): Cardinal; cdecl; external LibClang_dll;

  {
  param Comment AST node of any kind.
  param ChildIdx child index (zero-based).
  returns the specified child of the AST node.
  }
  function clang_Comment_getChild(
    Comment: CXComment;
    ChildIdx: Cardinal
    ): CXComment; cdecl; external LibClang_dll;

  {
  A CXComment_Paragraph node is considered whitespace if it contains
  only CXComment_Text nodes that are empty or whitespace.

  Other AST nodes (except CXComment_Paragraph and CXComment_Text) are
  never considered whitespace.

  returns non-zero if Comment is whitespace.
  }
  function clang_Comment_isWhitespace(
    Comment: CXComment
    ): Cardinal; cdecl; external LibClang_dll;

  {
  returns non-zero if Comment is inline content and has a newline
  immediately following it in the comment text. Newlines between paragraphs
  do not count.
  }
  function clang_InlineContentComment_hasTrailingNewline(
    Comment: CXComment
    ): Cardinal; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_Text AST node.

  returns text contained in the AST node.
  }
  function clang_TextComment_getText(
    Comment: CXComment
    ): CXString; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_InlineCommand AST node.
  returns name of the inline command.
  }
  function clang_InlineCommandComment_getCommandName(
    Comment: CXComment
    ): CXString; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_InlineCommand AST node.
  returns the most appropriate rendering mode, chosen on command
  semantics in Doxygen.
  }
  function clang_InlineCommandComment_getRenderKind(
    Comment: CXComment
    ): CXCommentInlineCommandRenderKind; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_InlineCommand AST node.
  returns number of command arguments.
  }
  function clang_InlineCommandComment_getNumArgs(
    Comment: CXComment
    ): Cardinal; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_InlineCommand AST node.
  param ArgIdx argument index (zero-based).
  returns text of the specified argument.
  }
  function clang_InlineCommandComment_getArgText(
    Comment: CXComment;
    ArgIdx: Cardinal
    ): CXString; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_HTMLStartTag or CXComment_HTMLEndTag AST
  node.
  returns HTML tag name.
  }
  function clang_HTMLTagComment_getTagName(
    Comment: CXComment
    ): CXString; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_HTMLStartTag AST node.
  returns non-zero if tag is self-closing (for example, &lt;br /&gt;).
  }
  function clang_HTMLStartTagComment_isSelfClosing(
    Comment: CXComment
    ): Cardinal; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_HTMLStartTag AST node.
  returns number of attributes (name-value pairs) attached to the start tag.
  }
  function clang_HTMLStartTag_getNumAttrs(
    Comment: CXComment
    ): Cardinal; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_HTMLStartTag AST node.
  param AttrIdx attribute index (zero-based).
  returns name of the specified attribute.
  }
  function clang_HTMLStartTag_getAttrName(
    Comment: CXComment;
    AttrIdx: Cardinal
    ): CXString; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_HTMLStartTag AST node.
  param AttrIdx attribute index (zero-based).
  returns value of the specified attribute.
  }
  function clang_HTMLStartTag_getAttrValue(
    Comment: CXComment;
    AttrIdx: Cardinal
    ): CXString; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_BlockCommand AST node.
  returns name of the block command.
  }
  function clang_BlockCommandComment_getCommandName(
    Comment: CXComment
    ): CXString; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_BlockCommand AST node.
  returns number of word-like arguments.
  }
  function clang_BlockCommandComment_getNumArgs(
    Comment: CXComment
    ): Cardinal; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_BlockCommand AST node.
  param ArgIdx argument index (zero-based).
  returns text of the specified word-like argument.
  }
  function clang_BlockCommandComment_getArgText(
    Comment: CXComment;
    AttrIdx: Cardinal
    ): CXString; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_BlockCommand or
  CXComment_VerbatimBlockCommand AST node.
  returns paragraph argument of the block command.
  }
  function clang_BlockCommandComment_getParagraph(
    Comment: CXComment
    ): CXComment; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_ParamCommand AST node.
  returns parameter name.
  }
  function clang_ParamCommandComment_getParamName(
    Comment: CXComment
    ): CXString; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_ParamCommand AST node.
  returns non-zero if the parameter that this AST node represents was found
  in the function prototype and clang_ParamCommandComment_getParamIndex
  function will return a meaningful value.
  }
  function clang_ParamCommandComment_isParamIndexValid(
    Comment: CXComment
    ): Cardinal; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_ParamCommand AST node.
  returns zero-based parameter index in function prototype.
  }
  function clang_ParamCommandComment_getParamIndex(
    Comment: CXComment
    ): Cardinal; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_ParamCommand AST node.
  returns non-zero if parameter passing direction was specified explicitly in
  the comment.
  }
  function clang_ParamCommandComment_isDirectionExplicit(
    Comment: CXComment
    ): Cardinal; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_ParamCommand AST node.
  returns parameter passing direction.
  }
  function clang_ParamCommandComment_getDirection(
    Comment: CXComment
    ): CXCommentParamPassDirection; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_TParamCommand AST node.
  returns template parameter name.
  }
  function clang_TParamCommandComment_getParamName(
    Comment: CXComment
    ): CXString; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_TParamCommand AST node.

  returns non-zero if the parameter that this AST node represents was found
  in the template parameter list and
  clang_TParamCommandComment_getDepth and
  clang_TParamCommandComment_getIndex functions will return a meaningful
  value.
  }
  function clang_TParamCommandComment_isParamPositionValid(
    Comment: CXComment
    ): Cardinal; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_TParamCommand AST node.

  returns zero-based nesting depth of this parameter in the template parameter list.

  For example,
  verbatim
    template<typename C, template<typename T> class TT>
    void test(TT<int> aaa);
  endverbatim
  for C and TT nesting depth is 0,
  for T nesting depth is 1.
  }
  function clang_TParamCommandComment_getDepth(
    Comment: CXComment
    ): Cardinal; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_TParamCommand AST node.

  returns zero-based parameter index in the template parameter list at a
  given nesting depth.

  For example,
  verbatim
    template<typename C, template<typename T> class TT>
    void test(TT<int> aaa);
  endverbatim
  for C and TT nesting depth is 0, so we can ask for index at depth 0:
  at depth 0 C's index is 0, TT's index is 1.

  For T nesting depth is 1, so we can ask for index at depth 0 and 1:
  at depth 0 T's index is 1 (same as TT's),
  at depth 1 T's index is 0.
  }
  function clang_TParamCommandComment_getIndex(
    Comment: CXComment;
    Depth: Cardinal
    ): Cardinal; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_VerbatimBlockLine AST node.
  returns text contained in the AST node.
  }
  function clang_VerbatimBlockLineComment_getText(
    Comment: CXComment
    ): CXString; cdecl; external LibClang_dll;

  {
  param Comment a CXComment_VerbatimLine AST node.
  returns text contained in the AST node.
  }
  function clang_VerbatimLineComment_getText(
    Comment: CXComment
    ): CXString; cdecl; external LibClang_dll;

  {
  Convert an HTML tag AST node to string.
  param Comment a CXComment_HTMLStartTag or CXComment_HTMLEndTag AST
  node.
  returns string containing an HTML tag.
  }
  function clang_HTMLTagComment_getAsString(
    Comment: CXComment
    ): CXString; cdecl; external LibClang_dll;

  {
  Convert a given full parsed comment to an HTML fragment.

  Specific details of HTML layout are subject to change.  Don't try to parse
  this HTML back into an AST, use other APIs instead.

  Currently the following CSS classes are used:
    "para-brief" for \paragraph and equivalent commands;
    "para-returns" for \\returns paragraph and equivalent commands;
    "word-returns" for the "Returns" word in \\returns paragraph.

  Function argument documentation is rendered as a \<dl\> list with arguments
  sorted in function prototype order.  CSS classes used:
    "param-name-index-NUMBER" for parameter name (\<dt\>);
    "param-descr-index-NUMBER" for parameter description (\<dd\>);
    "param-name-index-invalid" and "param-descr-index-invalid" are used if
  parameter index is invalid.

  Template parameter documentation is rendered as a \<dl\> list with
  parameters sorted in template parameter list order.  CSS classes used:
    "tparam-name-index-NUMBER" for parameter name (\<dt\>);
    "tparam-descr-index-NUMBER" for parameter description (\<dd\>);
    "tparam-name-index-other" and "tparam-descr-index-other" are used for
  names inside template template parameters;
    "tparam-name-index-invalid" and "tparam-descr-index-invalid" are used if
  parameter position is invalid.
  param Comment a CXComment_FullComment AST node.
  returns string containing an HTML fragment.
  }
  function clang_FullComment_getAsHTML(
    Comment: CXComment
    ): CXString; cdecl; external LibClang_dll;

  {
  Convert a given full parsed comment to an XML document.

  A Relax NG schema for the XML can be found in comment-xml-schema.rng file
  inside clang source tree.
  param Comment a \c CXComment_FullComment AST node.
  returns string containing an XML document.
  }
  function clang_FullComment_getAsXML(
    Comment: CXComment
    ): CXString; cdecl; external LibClang_dll;

implementation

end.

