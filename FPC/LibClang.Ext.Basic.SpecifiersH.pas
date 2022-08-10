unit LibClang.Ext.Basic.SpecifiersH;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

type
  ExplicitSpecKind = type Cardinal;
  ExplicitSpecKindHelper = type helper for ExplicitSpecKind
  public const
    ResolvedFalse = 0;
    ResolvedTrue = 1;
    Unresolved = 2;
  end;

  /// A C++ access specifier (public, private, protected), plus the
  /// special value "none" which means different things in different contexts.
  AccessSpecifier = type Integer;

  { AccessSpecifierHelper }

  AccessSpecifierHelper = type helper for AccessSpecifier
  public const
    AS_public = 0;
    AS_protected = 1;
    AS_private = 2;
    AS_none = 3;
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  ExprValueKind = type Integer;

  { ExprValueKindHelper }

  ExprValueKindHelper = type helper for ExprValueKind
  public const
    /// A pr-value expression (in the C++11 taxonomy)
    /// produces a temporary value.
    VK_PRValue = 0;

    /// An l-value expression is a reference to an object with
    /// independent storage.
    VK_LValue = 1;

    /// An x-value expression is a reference to an object with
    /// independent storage but which can be "moved", i.e.
    /// efficiently cannibalized for its resources.
    VK_XValue = 2;
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  ExprObjectKind = type Integer;
  ExprObjectKindHelper = type helper for ExprObjectKind
  public const
    /// An ordinary object is located at an address in memory.
    OK_Ordinary = 0;

    /// A bitfield object is a bitfield on a C or C++ record.
    OK_BitField = 1;

    /// A vector component is an element or range of elements on a vector.
    OK_VectorComponent = 2;

    /// An Objective-C property is a logical field of an Objective-C
    /// object which is read and written via Objective-C method calls.
    OK_ObjCProperty = 3;

    /// An Objective-C array/dictionary subscripting which reads an
    /// object or writes at the subscripted array/dictionary element via
    /// Objective-C method calls.
    OK_ObjCSubscript = 4;

    /// A matrix component is a single element of a matrix.
    OK_MatrixComponent = 5;
  end;

  ConstexprSpecKind = type Integer;

  { ConstexprSpecKindHelper }

  ConstexprSpecKindHelper = type helper for ConstexprSpecKind
  public const
    Unspecified = 0;
    Constexpr = 1;
    Consteval = 2;
    Constinit = 3;
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  StorageClass  = type Integer;

  { StorageClassHelper }

  StorageClassHelper = type helper for StorageClass
  public const
    // These are legal on both functions and variables.
    SC_None = 0;
    SC_Extern = 1;
    SC_Static = 2;
    SC_PrivateExtern = 3;

    // These are only legal on variables.
    SC_Auto = 4;
    SC_Register = 5;   
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  InClassInitStyle = type Integer;
  InClassInitStyleHelper = type helper for InClassInitStyle
  public const
    ICIS_NoInit = 0;   ///< No in-class initializer.
    ICIS_CopyInit = 1; ///< Copy initialization.
    ICIS_ListInit = 2; ///< Direct list-initialization.
  end;

  /// Describes the kind of template specialization that a
  /// particular template specialization declaration represents.
  TemplateSpecializationKind = type Integer;
  TemplateSpecializationKindHelper = type helper for TemplateSpecializationKind
  public const
    /// This template specialization was formed from a template-id but
    /// has not yet been declared, defined, or instantiated.
    TSK_Undeclared = 0;
    /// This template specialization was implicitly instantiated from a
    /// template. (C++ [temp.inst]).
    TSK_ImplicitInstantiation = 1;
    /// This template specialization was declared or defined by an
    /// explicit specialization (C++ [temp.expl.spec]) or partial
    /// specialization (C++ [temp.class.spec]).
    TSK_ExplicitSpecialization = 2;
    /// This template specialization was instantiated from a template
    /// due to an explicit instantiation declaration request
    /// (C++11 [temp.explicit]).
    TSK_ExplicitInstantiationDeclaration = 3;
    /// This template specialization was instantiated from a template
    /// due to an explicit instantiation definition request
    /// (C++ [temp.explicit]).
    TSK_ExplicitInstantiationDefinition = 4;
  end;

  ThreadStorageClassSpecifier = type Integer;
  ThreadStorageClassSpecifierHelper = type helper for ThreadStorageClassSpecifier
  public const
    TSCS_unspecified = 0;
    /// GNU __thread.
    TSCS___thread = 1;
    /// C++11 thread_local. Implies 'static' at block scope, but not at
    /// class scope.
    TSCS_thread_local = 2;
    /// C11 _Thread_local. Must be combined with either 'static' or 'extern'
    /// if used at block scope.
    TSCS__Thread_local = 3;
  end;

  StorageDuration = type Integer;
  StorageDurationHelper = type helper for StorageDuration
  public const
    SD_FullExpression = 0; ///< Full-expression storage duration (for temporaries).
    SD_Automatic = 1;      ///< Automatic storage duration (most local variables).
    SD_Thread = 2;         ///< Thread storage duration.
    SD_Static = 3;         ///< Static storage duration.
    SD_Dynamic = 4;        ///< Dynamic storage duration.
  end;

  CallingConv = type Integer;

  { CallingConvHelper }

  CallingConvHelper = type helper for CallingConv
  public const
    CC_C = 0;                   // __attribute__((cdecl))
    CC_X86StdCall = 1;          // __attribute__((stdcall))
    CC_X86FastCall = 2;         // __attribute__((fastcall))
    CC_X86ThisCall = 3;         // __attribute__((thiscall))
    CC_X86VectorCall = 4;       // __attribute__((vectorcall))
    CC_X86Pascal = 5;           // __attribute__((pascal))
    CC_Win64 = 6;               // __attribute__((ms_abi))
    CC_X86_64SysV = 7;          // __attribute__((sysv_abi))
    CC_X86RegCall = 8;          // __attribute__((regcall))
    CC_AAPCS = 9;               // __attribute__((pcs("aapcs")))
    CC_AAPCS_VFP = 10;          // __attribute__((pcs("aapcs-vfp")))
    CC_IntelOclBicc = 11;       // __attribute__((intel_ocl_bicc))
    CC_SpirFunction = 12;       // default for OpenCL functions on SPIR target
    CC_OpenCLKernel = 13;       // inferred for OpenCL kernels
    CC_Swift = 14;              // __attribute__((swiftcall))
    CC_SwiftAsync = 15;         // __attribute__((swiftasynccall))
    CC_PreserveMost = 16;       // __attribute__((preserve_most))
    CC_PreserveAll = 17;        // __attribute__((preserve_all))
    CC_AArch64VectorCall = 18;  // __attribute__((aarch64_vector_pcs))
    CC_AArch64SVEPCS = 19;      // __attribute__((aarch64_sve_pcs))
    CC_AMDGPUKernelCall = 20;   // __attribute__((amdgpu_kernel))
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  ParameterABI = type Integer;
  ParameterABIHelper = type helper for ParameterABI
  public const
    Ordinary = 0;
    SwiftIndirectResult = 1;
    SwiftErrorResult = 2;
    SwiftContext = 3;
    SwiftAsyncContext = 4;
  end;

  /// Assigned inheritance model for a class in the MS C++ ABI. Must match order
  /// of spellings in MSInheritanceAttr.
  MSInheritanceModel = type Integer;
  MSInheritanceModelHelper = type helper for MSInheritanceModel
  public const
    Single = 0;
    Multiple = 1;
    Virtual_ = 2;
    Unspecified = 3;
  end;

  NonOdrUseReason = type Integer;
  NonOdrUseReasonHelper = type helper for NonOdrUseReason
  public const
    /// This is an odr-use.
    NOUR_None = 0;
    /// This name appears in an unevaluated operand.
    NOUR_Unevaluated = 1;
    /// This name appears as a potential result of an lvalue-to-rvalue
    /// conversion that is a constant expression.
    NOUR_Constant = 2;
    /// This name appears as a potential result of a discarded value
    /// expression.
    NOUR_Discarded = 3;
  end;

implementation

uses
  SysUtils;

{ CallingConvHelper }

function CallingConvHelper.Value: Integer;
begin
  Result := Self;
end;

function CallingConvHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    CC_C:                 Result := 'C - cdecl';
    CC_X86StdCall:        Result := 'X86StdCall - stdcall';
    CC_X86FastCall:       Result := 'X86FastCall - fastcall';
    CC_X86ThisCall:       Result := 'X86ThisCall - thiscall';
    CC_X86VectorCall:     Result := 'X86VectorCall - vectorcall';
    CC_X86Pascal:         Result := 'X86Pascal - pascal';
    CC_Win64:             Result := 'Win64 - ms_abi';
    CC_X86_64SysV:        Result := 'X86_64SysV - sysv_abi';
    CC_X86RegCall:        Result := 'X86RegCall - regcall';
    CC_AAPCS:             Result := 'AAPCS - aapcs';
    CC_AAPCS_VFP:         Result := 'AAPCS_VFP - aapcs-vfp';
    CC_IntelOclBicc:      Result := 'IntelOclBicc - intel_ocl_bicc';
    CC_SpirFunction:      Result := 'SpirFunction - default for OpenCL functions on SPIR target';
    CC_OpenCLKernel:      Result := 'OpenCLKernel - inferred for OpenCL kernels';
    CC_Swift:             Result := 'Swift - swiftcall';
    CC_SwiftAsync:        Result := 'SwiftAsync - swiftasynccall';
    CC_PreserveMost:      Result := 'PreserveMost - preserve_most';
    CC_PreserveAll:       Result := 'PreserveAll - preserve_all';
    CC_AArch64VectorCall: Result := 'AArch64VectorCall - aarch64_vector_pcs';
    CC_AArch64SVEPCS:     Result := 'AArch64SVEPCS - aarch64_sve_pcs';
    CC_AMDGPUKernelCall:  Result := 'AMDGPUKernelCall - amdgpu_kernel';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ ConstexprSpecKindHelper }

function ConstexprSpecKindHelper.Value: Integer;
begin
  Result := Self;
end;

function ConstexprSpecKindHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    Unspecified: Result := 'Unspecified';
    Constexpr: Result := 'Constexpr';
    Consteval: Result := 'Consteval';
    Constinit: Result := 'Constinit';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ AccessSpecifierHelper }

function AccessSpecifierHelper.Value: Integer;
begin
  Result := Self;
end;

function AccessSpecifierHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    AS_public: Result := 'public';
    AS_protected: Result := 'protected';
    AS_private: Result := 'private';
    AS_none: Result := 'none';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ ExprValueKindHelper }

function ExprValueKindHelper.Value: Integer;
begin
  Result := Self;
end;

function ExprValueKindHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    VK_PRValue: Result := 'PRValue';
    VK_LValue: Result := 'LValue';
    VK_XValue: Result := 'XValue';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ StorageClassHelper }

function StorageClassHelper.Value: Integer;
begin
  Result := Self;
end;

function StorageClassHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    SC_None: Result := 'None';
    SC_Extern: Result := 'Extern';
    SC_Static: Result := 'Static';
    SC_PrivateExtern: Result := 'PrivateExtern';
    SC_Auto: Result := 'Auto';
    SC_Register: Result := 'Register';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

end.

