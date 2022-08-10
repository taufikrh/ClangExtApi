unit LibClang.Ext.Basic.TypeTraitsU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.Ext.Basic.TypeTraitsH;

{$region 'TypeTrait'}
function clangExt_TypeTrait_get_UTT_Last: Integer; cdecl; external LibClang_dll;
function clangExt_TypeTrait_get_BTT_Last: Integer; cdecl; external LibClang_dll;
function clangExt_TypeTrait_get_TT_Last: Integer; cdecl; external LibClang_dll;
function clangExt_TypeTrait_getName(i: Integer): PChar; cdecl; external LibClang_dll;   
{$endregion 'TypeTrait'}
                         
{$region 'ArrayTypeTrait'}
function clangExt_ArrayTypeTrait_getLast: Integer; cdecl; external LibClang_dll;
function clangExt_ArrayTypeTrait_getName(i: Integer): PChar; cdecl; external LibClang_dll;
{$endregion 'ArrayTypeTrait'}
             
{$region 'UnaryExprOrTypeTrait'}
function clangExt_UnaryExprOrTypeTrait_getLast: Integer; cdecl; external LibClang_dll;
function clangExt_UnaryExprOrTypeTrait_getName(i: Integer): PChar; cdecl; external LibClang_dll;  
{$endregion 'UnaryExprOrTypeTrait'}
                                                      
//=======================================================================================================================
function clangExt_TypeTrait_getTraitName(T: TypeTrait): PChar; cdecl; external LibClang_dll;
function clangExt_TypeTrait_getTraitSpelling(T: TypeTrait): PChar; cdecl; external LibClang_dll;
//=======================================================================================================================
function clangExt_ArrayTypeTrait_getTraitName(T: ArrayTypeTrait): PChar; cdecl; external LibClang_dll;
function clangExt_ArrayTypeTrait_getTraitSpelling(T: ArrayTypeTrait): PChar; cdecl; external LibClang_dll;
//=======================================================================================================================
function clangExt_UnaryExprOrTypeTrait_getTraitName(T: UnaryExprOrTypeTrait): PChar; cdecl; external LibClang_dll;
function clangExt_UnaryExprOrTypeTrait_getTraitSpelling(T: UnaryExprOrTypeTrait): PChar; cdecl; external LibClang_dll;   
//=======================================================================================================================

implementation

end.

