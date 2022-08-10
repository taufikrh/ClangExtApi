unit LibClang.CXErrorCode;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords} 
{$modeswitch typehelpers}
{$PACKRECORDS C}

interface

type
  {
  Error codes returned by libclang routines.

  Zero (CXError_Success) is the only error code indicating success.  Other
  error codes, including not yet assigned non-zero values, indicate errors.
  }
  CXErrorCode = type Integer;

  CXErrorCodeHelper = type helper for CXErrorCode
  public const
    // No error.
    CXError_Success = 0;

    // A generic error code, no further details are available.
    // Errors of this kind can get their own specific error codes in future
    // libclang versions.
    CXError_Failure = 1;

    // libclang crashed while performing the requested operation.
    CXError_Crashed = 2;

    // The function detected that the arguments violate the function
    // contract.
    CXError_InvalidArguments = 3;

    // An AST deserialization error has occurred.
    CXError_ASTReadError = 4;
  end;

implementation

end.

