unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonGenAll: TButton;
    procedure ButtonGenAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
     FPath: string;
     procedure GenAstType;
     procedure GenDeclKind;
     procedure GenAttrKind;
     procedure GenTypeLocClass;
     procedure GenBuiltInTypeKind;
     procedure GenAttributeCommonInfoKind;
     procedure GenTok_TokenKind;
     procedure GenTok_PPKeywordKind;
     procedure GenObjCKeywordKind;
     procedure GenStmtClass;
     procedure GenCastKind;
     procedure GenBinaryOperatorKind;
     procedure GenUnaryOperatorKind;
     procedure GenOverloadedOperatorKind;
     procedure GenUnaryExprOrTypeTrait;
     procedure GenTypeTrait;
     procedure GenArrayTypeTrait;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

uses
  LibClang.Ext.AST.TypeU,
  LibClang.Ext.AST.DeclBaseU,
  LibClang.Ext.AST.AttrU,
  LibClang.Ext.AST.TypeLocU,
  LibClang.Ext.Basic.TokenKindsU,
  LibClang.Ext.AST.StmtU,
  LibClang.Ext.AST.OperationKindsH,
  LibClang.Ext.Basic.OperatorKindsU,
  LibClang.Ext.Basic.TypeTraitsU
  ;

{ TForm1 }
 
procedure TForm1.FormCreate(Sender: TObject);
begin
  FPath := ExtractFilePath(Application.ExeName) + 'Inc\';
  ForceDirectories(FPath);
end;

procedure TForm1.GenAstType;
var
  c, i, x, y: Integer;
  lst, outList: TStringList;
  Fmt, s: string;
begin
  c := clangExt_Type_EnumGetTypeClassLength;

  outList := TStringList.Create();
  lst := TStringList.Create;
  try
    for i := 0 to c do
    begin
      lst.Add(clangExt_Type_EnumGetTypeClassName(i).ToString);
    end;

    s := 'ASTType_TypeClass_TypeLast';
    x := s.Length;
    for i := 0 to c do
    begin
      y := lst.Strings[i].Length;
      if y > x then
        x := y;
    end;

    Fmt := '%0:-' + x.ToString + 's';
    outList.Add(Format(Fmt, [s]) + ' = %d;', [c]);
    outList.Add(EmptyStr);

    for i := 0 to c do
    begin
      outList.Add(Format(Fmt, [lst.Strings[i]]) + ' = ' + i.ToString + ';');
    end;
    outList.SaveToFile(FPath + 'ASTType_TypeClass_h.inc');

    outList.Clear;
    for i := 0 to c do
    begin
      s := lst.Strings[i];
      outList.Add(Format(Fmt, [s]) + ': Result := ''' + s + ''';');
    end;
    outList.SaveToFile(FPath + 'ASTType_TypeClass_impl.inc');
  finally
    lst.Free;
    outList.Free;
  end;
end;

procedure TForm1.GenDeclKind;
var
  c, i, x, y: Integer;
  lst, buildin, outList: TStringList;
  Fmt1, Fmt2, s: string;
begin
  c := clangExt_Decl_Kind_getLastDecl;

  lst := TStringList.Create;
  buildin := TStringList.Create;
  outList := TStringList.Create;
  try
    for i := 0 to c do
    begin
      lst.Add(clangExt_Decl_Kind_getName(i).ToString);
    end;

    buildin.AddObject('firstBaseUsing', TObject(IntPtr(clangExt_Decl_Kind_BaseUsing_getFirst)));
    buildin.AddObject('lastBaseUsing', TObject(IntPtr(clangExt_Decl_Kind_BaseUsing_getLast)));

    buildin.AddObject('firstObjCImpl', TObject(IntPtr(clangExt_Decl_Kind_ObjCImpl_getFirst)));
    buildin.AddObject('lastObjCImpl', TObject(IntPtr(clangExt_Decl_Kind_ObjCImpl_getLast)));

    buildin.AddObject('firstObjCContainer', TObject(IntPtr(clangExt_Decl_Kind_ObjCContainer_getFirst)));
    buildin.AddObject('lastObjCContainer', TObject(IntPtr(clangExt_Decl_Kind_ObjCContainer_getLast)));

    buildin.AddObject('firstRedeclarableTemplate', TObject(IntPtr(clangExt_Decl_Kind_RedeclarableTemplate_getFirst)));
    buildin.AddObject('lastRedeclarableTemplate', TObject(IntPtr(clangExt_Decl_Kind_RedeclarableTemplate_getLast)));

    buildin.AddObject('firstTemplate', TObject(IntPtr(clangExt_Decl_Kind_Template_getFirst)));
    buildin.AddObject('lastTemplate', TObject(IntPtr(clangExt_Decl_Kind_Template_getLast)));

    buildin.AddObject('firstClassTemplateSpecialization', TObject(IntPtr(clangExt_Decl_Kind_ClassTemplateSpecialization_getFirst)));
    buildin.AddObject('lastClassTemplateSpecialization', TObject(IntPtr(clangExt_Decl_Kind_ClassTemplateSpecialization_getLast)));

    buildin.AddObject('firstCXXRecord', TObject(IntPtr(clangExt_Decl_Kind_CXXRecord_getFirst)));
    buildin.AddObject('lastCXXRecord', TObject(IntPtr(clangExt_Decl_Kind_CXXRecord_getLast)));

    buildin.AddObject('firstRecord', TObject(IntPtr(clangExt_Decl_Kind_Record_getFirst)));
    buildin.AddObject('lastRecord', TObject(IntPtr(clangExt_Decl_Kind_Record_getLast)));

    buildin.AddObject('firstTag', TObject(IntPtr(clangExt_Decl_Kind_Tag_getFirst)));
    buildin.AddObject('lastTag', TObject(IntPtr(clangExt_Decl_Kind_Tag_getLast)));

    buildin.AddObject('firstTypedefName', TObject(IntPtr(clangExt_Decl_Kind_TypedefName_getFirst)));
    buildin.AddObject('lastTypedefName', TObject(IntPtr(clangExt_Decl_Kind_TypedefName_getLast)));

    buildin.AddObject('firstType', TObject(IntPtr(clangExt_Decl_Kind_Type_getFirst)));
    buildin.AddObject('lastType', TObject(IntPtr(clangExt_Decl_Kind_Type_getLast)));

    buildin.AddObject('firstUsingShadow', TObject(IntPtr(clangExt_Decl_Kind_UsingShadow_getFirst)));
    buildin.AddObject('lastUsingShadow', TObject(IntPtr(clangExt_Decl_Kind_UsingShadow_getLast)));

    buildin.AddObject('firstField', TObject(IntPtr(clangExt_Decl_Kind_Field_getFirst)));
    buildin.AddObject('lastField', TObject(IntPtr(clangExt_Decl_Kind_Field_getLast)));

    buildin.AddObject('firstCXXMethod', TObject(IntPtr(clangExt_Decl_Kind_CXXMethod_getFirst)));
    buildin.AddObject('lastCXXMethod', TObject(IntPtr(clangExt_Decl_Kind_CXXMethod_getLast)));

    buildin.AddObject('firstFunction', TObject(IntPtr(clangExt_Decl_Kind_Function_getFirst)));
    buildin.AddObject('lastFunction', TObject(IntPtr(clangExt_Decl_Kind_Function_getLast)));

    buildin.AddObject('firstVarTemplateSpecialization', TObject(IntPtr(clangExt_Decl_Kind_VarTemplateSpecialization_getFirst)));
    buildin.AddObject('lastVarTemplateSpecialization', TObject(IntPtr(clangExt_Decl_Kind_VarTemplateSpecialization_getLast)));

    buildin.AddObject('firstVar', TObject(IntPtr(clangExt_Decl_Kind_Var_getFirst)));
    buildin.AddObject('lastVar', TObject(IntPtr(clangExt_Decl_Kind_Var_getLast)));

    buildin.AddObject('firstDeclarator', TObject(IntPtr(clangExt_Decl_Kind_Declarator_getFirst)));
    buildin.AddObject('lastDeclarator', TObject(IntPtr(clangExt_Decl_Kind_Declarator_getLast)));

    buildin.AddObject('firstValue', TObject(IntPtr(clangExt_Decl_Kind_Value_getFirst)));
    buildin.AddObject('lastValue', TObject(IntPtr(clangExt_Decl_Kind_Value_getLast)));

    buildin.AddObject('firstNamed', TObject(IntPtr(clangExt_Decl_Kind_Named_getFirst)));
    buildin.AddObject('lastNamed', TObject(IntPtr(clangExt_Decl_Kind_Named_getLast)));

    buildin.AddObject('firstDecl', TObject(IntPtr(clangExt_Decl_Kind_Decl_getFirst)));
    buildin.AddObject('lastDecl', TObject(IntPtr(clangExt_Decl_Kind_Decl_getLast)));


    x := 0;
    for i := 0 to c do
    begin
      y := lst.Strings[i].Length;
      if y > x then
        x := y;
    end;

    Fmt1 := '%0:-' + x.ToString + 's';
    for i := 0 to c do
    begin
      outList.Add(Format(Fmt1, [lst.Strings[i]]) + ' = ' + i.ToString + ';');
    end;
    outList.Add(EmptyStr);
    //-----------------------------------------------------------
    x := 0;
    for i := 0 to buildin.Count - 1 do
    begin
      y := buildin.Strings[i].Length;
      if y > x then
        x := y;
    end;
    Fmt2 := '%0:-' + x.ToString + 's';
    for i := 0 to buildin.Count - 1 do
    begin
      if (i > 0) and (i mod 2 = 0) then
        outList.Add(EmptyStr);
      s := buildin.Strings[i];
      y := Integer(IntPtr(buildin.Objects[i]));
      outList.Add(Format(Fmt2, [s]) + ' = ' + lst.Strings[y] + '; // ' + y.ToString);
    end;
    outList.SaveToFile(FPath + 'Decl_Kind_h.inc');

    outList.Clear;
    for i := 0 to c do
    begin
      s := lst.Strings[i];
      outList.Add(Format(Fmt1, [s]) + ': Result := ''' + s + ''';');
    end;
    outList.SaveToFile(FPath + 'Decl_Kind_impl.inc');
  finally
    lst.Free;
    buildin.Free;
    outList.Free;
  end;
end;

procedure TForm1.GenAttrKind;
var
  c, i, x, y: Integer;
  lst, buildin, outList: TStringList;
  Fmt1, Fmt2, s: string;
begin
  c := clangExt_Attr_Kind_getLastAttr();

  lst := TStringList.Create;
  buildin := TStringList.Create;
  outList := TStringList.Create;
  try
    for i := 0 to c do
    begin
      lst.Add(clangExt_Attr_Kind_getName(i).ToString);
    end;

    buildin.AddObject('FirstAttr', TObject(IntPtr(clangExt_Attr_Kind_getFirstAttr)));
    buildin.AddObject('LastAttr', TObject(IntPtr(clangExt_Attr_Kind_getLastAttr)));

    buildin.AddObject('FirstTypeAttr', TObject(IntPtr(clangExt_Attr_Kind_getFirstTypeAttr)));
    buildin.AddObject('LastTypeAttr', TObject(IntPtr(clangExt_Attr_Kind_getLastTypeAttr)));

    buildin.AddObject('FirstStmtAttr', TObject(IntPtr(clangExt_Attr_Kind_getFirstStmtAttr)));
    buildin.AddObject('LastStmtAttr', TObject(IntPtr(clangExt_Attr_Kind_getLastStmtAttr)));

    buildin.AddObject('FirstDeclOrStmtAttr', TObject(IntPtr(clangExt_Attr_Kind_getFirstDeclOrStmtAttr)));
    buildin.AddObject('LastDeclOrStmtAttr', TObject(IntPtr(clangExt_Attr_Kind_getLastDeclOrStmtAttr)));

    buildin.AddObject('FirstInheritableAttr', TObject(IntPtr(clangExt_Attr_Kind_getFirstInheritableAttr)));
    buildin.AddObject('LastInheritableAttr', TObject(IntPtr(clangExt_Attr_Kind_getLastInheritableAttr)));

    buildin.AddObject('FirstDeclOrTypeAttr', TObject(IntPtr(clangExt_Attr_Kind_getFirstDeclOrTypeAttr)));
    buildin.AddObject('LastDeclOrTypeAttr', TObject(IntPtr(clangExt_Attr_Kind_getLastDeclOrTypeAttr)));

    buildin.AddObject('FirstInheritableParamAttr', TObject(IntPtr(clangExt_Attr_Kind_getFirstInheritableParamAttr)));
    buildin.AddObject('LastInheritableParamAttr', TObject(IntPtr(clangExt_Attr_Kind_getLastInheritableParamAttr)));

    buildin.AddObject('FirstParameterABIAttr', TObject(IntPtr(clangExt_Attr_Kind_getFirstParameterABIAttr)));
    buildin.AddObject('LastParameterABIAttr', TObject(IntPtr(clangExt_Attr_Kind_getLastParameterABIAttr)));


    x := 0;
    for i := 0 to c do
    begin
      y := lst.Strings[i].Length;
      if y > x then
        x := y;
    end;

    Fmt1 := '%0:-' + x.ToString + 's';
    for i := 0 to c do
    begin
      outList.Add(Format(Fmt1, [lst.Strings[i]]) + ' = ' + i.ToString + ';');
    end;
    outList.Add(EmptyStr);
    //-----------------------------------------------------------
    x := 0;
    for i := 0 to buildin.Count - 1 do
    begin
      y := buildin.Strings[i].Length;
      if y > x then
        x := y;
    end;
    Fmt2 := '%0:-' + x.ToString + 's';
    for i := 0 to buildin.Count - 1 do
    begin
      if (i > 0) and (i mod 2 = 0) then
        outList.Add(EmptyStr);
      s := buildin.Strings[i];
      y := Integer(IntPtr(buildin.Objects[i]));
      outList.Add(Format(Fmt2, [s]) + ' = ' + lst.Strings[y] + '; // ' + y.ToString);
    end;
    outList.SaveToFile(FPath + 'Attr_Kind_h.inc');

    outList.Clear;
    for i := 0 to c do
    begin
      s := lst.Strings[i];
      outList.Add(Format(Fmt1, [s]) + ': Result := ''' + s + ''';');
    end;
    outList.SaveToFile(FPath + 'Attr_Kind_impl.inc');
  finally
    lst.Free;
    buildin.Free;
    outList.Free;
  end;
end;

procedure TForm1.GenTypeLocClass;
var
  c, i, x, y: Integer;
  lst, outList: TStringList;
  Fmt, s: string;
begin
  c := clangExt_TypeLoc_EnumTypeLocClassGetLast;
  outList := TStringList.Create;
  lst := TStringList.Create;
  try
    for i := 0 to c do
    begin
      lst.Add(clangExt_TypeLoc_EnumTypeLocClassGetName(i).ToString);
    end;

    x := 0;
    for i := 0 to c do
    begin
      y := lst.Strings[i].Length;
      if y > x then
        x := y;
    end;

    Fmt := '%0:-' + x.ToString + 's';
    outList.Add(EmptyStr);

    for i := 0 to c do
    begin
      outList.Add(Format(Fmt, [lst.Strings[i]]) + ' = ' + i.ToString + ';');
    end;
    outList.SaveToFile(FPath + 'TypeLocClass_h.inc');

    outList.Clear;
    for i := 0 to c do
    begin
      s := lst.Strings[i];
      outList.Add(Format(Fmt, [s]) + ': Result := ''' + s + ''';');
    end;
    outList.SaveToFile(FPath + 'TypeLocClass_impl.inc');
  finally
    lst.Free;
    outList.Free;
  end;
end;

procedure TForm1.GenBuiltInTypeKind;
var
  c, i, x, y: Integer;
  lst, outList: TStringList;
  Fmt, s: string;
begin
  c := clangExt_BuiltinType_Kind_LastKind;
  outList := TStringList.Create;
  lst := TStringList.Create;
  try
    for i := 0 to c do
    begin
      lst.Add(clangExt_BuiltinType_Kind_GetKindName(i).ToString);
    end;

    s := 'LastKind';
    x := s.Length;
    for i := 0 to c do
    begin
      y := lst.Strings[i].Length;
      if y > x then
        x := y;
    end;

    Fmt := '%0:-' + x.ToString + 's';
    outList.Add(Format(Fmt, [s]) + ' = %d;', [c]);
    outList.Add(EmptyStr);

    for i := 0 to c do
    begin
      outList.Add(Format(Fmt, [lst.Strings[i]]) + ' = ' + i.ToString + ';');
    end;
    outList.SaveToFile(FPath + 'BuiltinType_h.inc');

    outList.Clear;
    for i := 0 to c do
    begin
      s := lst.Strings[i];
      outList.Add(Format(Fmt, [s]) + ': Result := ''' + s + ''';');
    end;
    outList.SaveToFile(FPath + 'BuiltinType_impl.inc');
  finally
    lst.Free;
    outList.Free;
  end;
end;

procedure TForm1.GenAttributeCommonInfoKind;
var
  c, i, x, y: Integer;
  lst, outList: TStringList;
  Fmt, s: string;
begin
  c := clangExt_AttributeCommonInfo_Kind_getLast;
  outList := TStringList.Create;
  lst := TStringList.Create;
  try
    for i := 0 to c do
    begin
      lst.Add(clangExt_AttributeCommonInfo_Kind_getName(i).ToString);
    end;

    s := 'Last';
    x := s.Length;
    for i := 0 to c do
    begin
      y := lst.Strings[i].Length;
      if y > x then
        x := y;
    end;

    Fmt := '%0:-' + x.ToString + 's';
    outList.Add(Format(Fmt, [s]) + ' = %d;', [c]);
    outList.Add(EmptyStr);

    for i := 0 to c do
    begin
      outList.Add(Format(Fmt, [lst.Strings[i]]) + ' = ' + i.ToString + ';');
    end;
    outList.SaveToFile(FPath + 'AttributeCommonInfo_Kind_h.inc');

    outList.Clear;
    for i := 0 to c do
    begin
      s := lst.Strings[i];
      outList.Add(Format(Fmt, [s]) + ': Result := ''' + s + ''';');
    end;
    outList.SaveToFile(FPath + 'AttributeCommonInfo_Kind_impl.inc');
  finally
    lst.Free;
    outList.Free;
  end;
end;

procedure TForm1.GenTok_TokenKind;
var
  c, i, x, y: Integer;
  lst, outList: TStringList;
  Fmt, s: string;
begin
  c := clangExt_TokenKind_GetLast;
  outList := TStringList.Create;
  lst := TStringList.Create;
  try
    for i := 0 to c - 1 do
    begin
      lst.Add(StrPas(clangExt_TokenKind_getName(i)));
    end;

    s := 'NUM_TOKENS';
    x := s.Length;
    for i := 0 to lst.Count - 1 do
    begin
      y := lst.Strings[i].Length;
      if y > x then
        x := y;
    end;

    Fmt := '%0:-' + x.ToString + 's';
    outList.Add(Format(Fmt, [s]) + ' = %d;', [c]);
    outList.Add(EmptyStr);

    for i := 0 to lst.Count - 1 do
    begin
      outList.Add(Format(Fmt, [lst.Strings[i]]) + ' = ' + i.ToString + ';');
    end;   
    outList.SaveToFile(FPath + 'Tok_TokenKinds_h.inc');

    outList.Clear;
    for i := 0 to lst.Count - 1 do
    begin
      s := lst.Strings[i];
      outList.Add(Format(Fmt, [s]) + ': Result := ''' + s + ''';');
    end;
    outList.SaveToFile(FPath + 'Tok_TokenKinds_impl.inc');
  finally
    lst.Free;
    outList.Free;
  end;
end;

procedure TForm1.GenTok_PPKeywordKind;
var
  c, i, x, y: Integer;
  lst, outList: TStringList;
  Fmt, s: string;
begin
  c := clangExt_PPKeywordKind_GetLast;
  outList := TStringList.Create;
  lst := TStringList.Create;
  try
    for i := 0 to c - 1 do
    begin
      lst.Add(StrPas(clangExt_PPKeywordKind_getName(i)));
    end;

    s := 'NUM_PP_KEYWORDS';
    x := s.Length;
    for i := 0 to lst.Count - 1 do
    begin
      y := lst.Strings[i].Length;
      if y > x then
        x := y;
    end;

    Fmt := '%0:-' + x.ToString + 's';
    outList.Add(Format(Fmt, [s]) + ' = %d;', [c]);
    outList.Add(EmptyStr);

    for i := 0 to lst.Count - 1 do
    begin
      outList.Add(Format(Fmt, [lst.Strings[i]]) + ' = ' + i.ToString + ';');
    end;
    outList.SaveToFile(FPath + 'Tok_PPKeywordKind_h.inc');

    outList.Clear;
    for i := 0 to lst.Count - 1 do
    begin
      s := lst.Strings[i];
      outList.Add(Format(Fmt, [s]) + ': Result := ''' + s + ''';');
    end;
    outList.SaveToFile(FPath + 'Tok_PPKeywordKind_impl.inc');
  finally
    lst.Free;
    outList.Free;
  end;
end;

procedure TForm1.GenObjCKeywordKind;
var
  c, i, x, y: Integer;
  lst, outList: TStringList;
  Fmt, s: string;
begin
  c := clangExt_ObjCKeywordKind_GetLast;
  outList := TStringList.Create;
  lst := TStringList.Create;
  try
    for i := 0 to c - 1 do
    begin
      lst.Add(StrPas(clangExt_ObjCKeywordKind_getName(i)));
    end;

    s := 'NUM_OBJC_KEYWORDS';
    x := s.Length;
    for i := 0 to lst.Count - 1 do
    begin
      y := lst.Strings[i].Length;
      if y > x then
        x := y;
    end;

    Fmt := '%0:-' + x.ToString + 's';
    outList.Add(Format(Fmt, [s]) + ' = %d;', [c]);
    outList.Add(EmptyStr);

    for i := 0 to lst.Count - 1 do
    begin
      outList.Add(Format(Fmt, [lst.Strings[i]]) + ' = ' + i.ToString + ';');
    end;
    outList.SaveToFile(FPath + 'ObjCKeywordKind_h.inc');

    outList.Clear;
    for i := 0 to lst.Count - 1 do
    begin
      s := lst.Strings[i];
      outList.Add(Format(Fmt, [s]) + ': Result := ''' + s + ''';');
    end;
    outList.SaveToFile(FPath + 'ObjCKeywordKind_impl.inc');
  finally
    lst.Free;
    outList.Free;
  end;
end;

procedure TForm1.GenStmtClass;
var
  c, i, x, y: Integer;
  lst, outList: TStringList;
  Fmt, s: string;
begin
  c := clangExt_Stmt_getNumStmtClass;
  outList := TStringList.Create;
  lst := TStringList.Create;
  try
    for i := 0 to c - 1 do
    begin
      lst.Add(clangExt_Stmt_getNameStmtClass(i).ToString);
    end;

    s := 'lastStmtConstant';
    x := s.Length;
    for i := 0 to lst.Count - 1 do
    begin
      y := lst.Strings[i].Length;
      if y > x then
        x := y;
    end;

    Fmt := '%0:-' + x.ToString + 's';
    outList.Add(Format(Fmt, [s]) + ' = %d;', [c]);
    outList.Add(EmptyStr);

    for i := 0 to lst.Count - 1 do
    begin
      outList.Add(Format(Fmt, [lst.Strings[i]]) + ' = ' + i.ToString + ';');
    end;
    outList.SaveToFile(FPath + 'StmtClass_h.inc');

    outList.Clear;
    for i := 0 to lst.Count - 1 do
    begin
      s := lst.Strings[i];
      outList.Add(Format(Fmt, [s]) + ': Result := ''' + s + ''';');
    end;
    outList.SaveToFile(FPath + 'StmtClass_impl.inc');
  finally
    lst.Free;
    outList.Free;
  end;
end;

procedure TForm1.GenCastKind;
var
  i, x, y, mMax: Integer;
  lst, outList: TStringList;
  Fmt, s: string;
begin
  lst := TStringList.Create;
  outList := TStringList.Create;
  try
    mMax := 0;
    i := 0;
    repeat
      s := clangExt_CastKind_GetName(mMax).ToString;
      if not s.IsEmpty then
        lst.Add(s)
      else
      begin
        Break;
      end;
      Inc(mMax);
    until s.IsEmpty;

    s := 'CastKindMax';
    x := s.Length;
    for i := 0 to lst.Count - 1 do
    begin
      y := lst.Strings[i].Length;
      if y > x then
        x := y;
    end;

    Fmt := '%0:-' + x.ToString + 's';
    outList.Add(Format(Fmt, [s]) + ' = %d;', [mMax]);
    outList.Add(EmptyStr);

    for i := 0 to lst.Count - 1 do
    begin
      outList.Add(Format(Fmt, [lst.Strings[i]]) + ' = ' + i.ToString + ';');
    end;
    outList.SaveToFile(FPath + 'CastKind_h.inc');

    outList.Clear;
    for i := 0 to lst.Count - 1 do
    begin
      s := lst.Strings[i];
      outList.Add(Format(Fmt, [s]) + ': Result := ''' + s + ''';');
    end;
    outList.SaveToFile(FPath + 'CastKind_impl.inc');
  finally
    lst.Free;
    outList.Free;
  end;
end;

procedure TForm1.GenBinaryOperatorKind;
var
  i, x, y, mMax: Integer;
  lst, outList: TStringList;
  Fmt, s: string;
begin
  lst := TStringList.Create;
  outList := TStringList.Create;
  try
    mMax := 0;
    i := 0;
    repeat
      s := clangExt_BinaryOperatorKind_GetName(mMax).ToString;
      if not s.IsEmpty then
        lst.Add(s)
      else
      begin
        Break;
      end;
      Inc(mMax);
    until s.IsEmpty;

    s := 'BinaryOperatorKindMax';
    x := s.Length;
    for i := 0 to lst.Count - 1 do
    begin
      y := lst.Strings[i].Length;
      if y > x then
        x := y;
    end;

    Fmt := '%0:-' + x.ToString + 's';
    outList.Add(Format(Fmt, [s]) + ' = %d;', [mMax]);
    outList.Add(EmptyStr);

    for i := 0 to lst.Count - 1 do
    begin
      outList.Add(Format(Fmt, [lst.Strings[i]]) + ' = ' + i.ToString + ';');
    end;
    outList.SaveToFile(FPath + 'BinaryOperatorKind_h.inc');

    outList.Clear;
    for i := 0 to lst.Count - 1 do
    begin
      s := lst.Strings[i];
      outList.Add(Format(Fmt, [s]) + ': Result := ''' + s + ''';');
    end;
    outList.SaveToFile(FPath + 'BinaryOperatorKind_impl.inc');
  finally
    lst.Free;
    outList.Free;
  end;
end;

procedure TForm1.GenUnaryOperatorKind;
var
  i, x, y, mMax: Integer;
  lst, outList: TStringList;
  Fmt, s: string;
begin
  lst := TStringList.Create;
  outList := TStringList.Create;
  try
    mMax := 0;
    i := 0;
    repeat
      s := clangExt_UnaryOperatorKind_GetName(mMax).ToString;
      if not s.IsEmpty then
        lst.Add(s)
      else
      begin
        Break;
      end;
      Inc(mMax);
    until s.IsEmpty;

    s := 'UnaryOperatorKindMax';
    x := s.Length;
    for i := 0 to lst.Count - 1 do
    begin
      y := lst.Strings[i].Length;
      if y > x then
        x := y;
    end;

    Fmt := '%0:-' + x.ToString + 's';
    outList.Add(Format(Fmt, [s]) + ' = %d;', [mMax]);
    outList.Add(EmptyStr);

    for i := 0 to lst.Count - 1 do
    begin
      outList.Add(Format(Fmt, [lst.Strings[i]]) + ' = ' + i.ToString + ';');
    end;
    outList.SaveToFile(FPath + 'UnaryOperatorKind_h.inc');

    outList.Clear;
    for i := 0 to lst.Count - 1 do
    begin
      s := lst.Strings[i];
      outList.Add(Format(Fmt, [s]) + ': Result := ''' + s + ''';');
    end;
    outList.SaveToFile(FPath + 'UnaryOperatorKind_impl.inc');
  finally
    lst.Free;
    outList.Free;
  end;
end;

procedure TForm1.GenOverloadedOperatorKind;
var
  c, i, x, y: Integer;
  lst, outList: TStringList;
  Fmt, s: string;
begin
  c := clangExt_OverloadedOperatorKind_EnumGetOverloadedOperatorKindLength;
  outList := TStringList.Create;
  lst := TStringList.Create;
  try
    for i := 0 to c - 1 do
    begin
      lst.Add(clangExt_OverloadedOperatorKind_EnumGetOverloadedOperatorKindName(i).ToString);
    end;

    s := 'NUM_OVERLOADED_OPERATORS';
    x := s.Length;
    for i := 0 to lst.Count - 1 do
    begin
      y := lst.Strings[i].Length;
      if y > x then
        x := y;
    end;

    Fmt := '%0:-' + x.ToString + 's';
    outList.Add(Format(Fmt, [s]) + ' = %d;', [c]);
    outList.Add(EmptyStr);

    for i := 0 to lst.Count - 1 do
    begin
      outList.Add(Format(Fmt, [lst.Strings[i]]) + ' = ' + i.ToString + ';');
    end;
    outList.SaveToFile(FPath + 'OverloadedOperatorKind_h.inc');

    outList.Clear;
    for i := 0 to lst.Count - 1 do
    begin
      s := lst.Strings[i];
      outList.Add(Format(Fmt, [s]) + ': Result := ''' + s + ''';');
    end;
    outList.SaveToFile(FPath + 'OverloadedOperatorKind_impl.inc');
  finally
    lst.Free;
    outList.Free;
  end;
end;

procedure TForm1.GenUnaryExprOrTypeTrait;
var
  c, i, x, y: Integer;
  lst, outList: TStringList;
  Fmt, s: string;
begin
  c := clangExt_UnaryExprOrTypeTrait_getLast;
  outList := TStringList.Create;
  lst := TStringList.Create;
  try
    for i := 0 to c - 1 do
    begin
      lst.Add(clangExt_UnaryExprOrTypeTrait_getName(i));
    end;

    s := 'UETT_Last';
    x := s.Length;
    for i := 0 to lst.Count - 1 do
    begin
      y := lst.Strings[i].Length;
      if y > x then
        x := y;
    end;

    Fmt := '%0:-' + x.ToString + 's';
    outList.Add(Format(Fmt, [s]) + ' = %d;', [c]);
    outList.Add(EmptyStr);

    for i := 0 to lst.Count - 1 do
    begin
      outList.Add(Format(Fmt, [lst.Strings[i]]) + ' = ' + i.ToString + ';');
    end;
    outList.SaveToFile(FPath + 'UnaryExprOrTypeTrait_h.inc');

    outList.Clear;
    for i := 0 to lst.Count - 1 do
    begin
      s := lst.Strings[i];
      outList.Add(Format(Fmt, [s]) + ': Result := ''' + s + ''';');
    end;
    outList.SaveToFile(FPath + 'UnaryExprOrTypeTrait_impl.inc');
  finally
    lst.Free;
    outList.Free;
  end;
end;

procedure TForm1.GenTypeTrait;
var
  i, x, y, mMax: Integer;
  lst, outList: TStringList;
  Fmt, s: string;
begin
  lst := TStringList.Create;
  outList := TStringList.Create;
  try
    mMax := 0;
    i := 0;
    repeat
      s := StrPas(clangExt_TypeTrait_getName(mMax));
      if not s.IsEmpty then
        lst.Add(s)
      else
      begin
        Break;
      end;
      Inc(mMax);
    until s.IsEmpty;

    x := 0;
    for i := 0 to lst.Count - 1 do
    begin
      y := lst.Strings[i].Length;
      if y > x then
        x := y;
    end;

    Fmt := '%0:-' + x.ToString + 's';

    outList.Add(Format(Fmt, ['UTT_Last']) + ' = %d;', [clangExt_TypeTrait_get_UTT_Last]);
    outList.Add(Format(Fmt, ['BTT_Last']) + ' = %d;', [clangExt_TypeTrait_get_BTT_Last]);
    outList.Add(Format(Fmt, ['TT_Last']) + ' = %d;', [clangExt_TypeTrait_get_TT_Last]);

    outList.Add(EmptyStr);

    for i := 0 to lst.Count - 1 do
    begin
      outList.Add(Format(Fmt, [lst.Strings[i]]) + ' = ' + i.ToString + ';');
    end;
    outList.SaveToFile(FPath + 'TypeTrait_h.inc');

    outList.Clear;
    for i := 0 to lst.Count - 1 do
    begin
      s := lst.Strings[i];
      outList.Add(Format(Fmt, [s]) + ': Result := ''' + s + ''';');
    end;
    outList.SaveToFile(FPath + 'TypeTrait_impl.inc');
  finally
    lst.Free;
    outList.Free;
  end;
end;

procedure TForm1.GenArrayTypeTrait;
var
  c, i, x, y: Integer;
  lst, outList: TStringList;
  Fmt, s: string;
begin
  c := clangExt_ArrayTypeTrait_getLast;
  outList := TStringList.Create;
  lst := TStringList.Create;
  try
    for i := 0 to c do
    begin
      lst.Add(clangExt_ArrayTypeTrait_getName(i));
    end;

    s := 'ATT_Last';
    x := s.Length;
    for i := 0 to lst.Count - 1 do
    begin
      y := lst.Strings[i].Length;
      if y > x then
        x := y;
    end;

    Fmt := '%0:-' + x.ToString + 's';
    outList.Add(Format(Fmt, [s]) + ' = %d;', [c]);
    outList.Add(EmptyStr);

    for i := 0 to lst.Count - 1 do
    begin
      outList.Add(Format(Fmt, [lst.Strings[i]]) + ' = ' + i.ToString + ';');
    end;
    outList.SaveToFile(FPath + 'ArrayTypeTrait_h.inc');

    outList.Clear;
    for i := 0 to lst.Count - 1 do
    begin
      s := lst.Strings[i];
      outList.Add(Format(Fmt, [s]) + ': Result := ''' + s + ''';');
    end;
    outList.SaveToFile(FPath + 'ArrayTypeTrait_impl.inc');
  finally
    lst.Free;
    outList.Free;
  end;
end;

procedure TForm1.ButtonGenAllClick(Sender: TObject);
begin
  GenAstType;
  GenDeclKind;
  GenAttrKind;
  GenTypeLocClass;
  GenBuiltInTypeKind;
  GenAttributeCommonInfoKind;
  GenTok_TokenKind;
  GenTok_PPKeywordKind;
  GenObjCKeywordKind;
  GenStmtClass;
  GenCastKind;
  GenBinaryOperatorKind;
  GenUnaryOperatorKind;
  GenOverloadedOperatorKind;
  GenUnaryExprOrTypeTrait;
  GenTypeTrait;
  GenArrayTypeTrait;
end;

end.

