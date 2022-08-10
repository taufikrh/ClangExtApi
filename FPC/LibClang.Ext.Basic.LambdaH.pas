unit LibClang.Ext.Basic.LambdaH;

{$mode ObjFPC}{$H+} 
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

type
  LambdaCaptureDefault = type Integer;
  LambdaCaptureDefaultHelper = type helper for LambdaCaptureDefault
  public const
    LCD_None = 0;
    LCD_ByCopy = 1;
    LCD_ByRef = 2;
  end;

  /// The different capture forms in a lambda introducer
  ///
  /// C++11 allows capture of \c this, or of local variables by copy or
  /// by reference.  C++1y also allows "init-capture", where the initializer
  /// is an expression.
  LambdaCaptureKind  = type Integer;
  LambdaCaptureKindHelper = type helper for LambdaCaptureKind
  public const
    LCK_This = 0;     ///< Capturing the \c *this object by reference
    LCK_StarThis = 1; ///< Capturing the \c *this object by copy
    LCK_ByCopy = 2;   ///< Capturing by copy (a.k.a., by value)
    LCK_ByRef = 3;    ///< Capturing by reference
    LCK_VLAType = 4;  ///< Capturing variable-length array type
  end;

implementation

end.

