unit LibClang.BuildSystem;

{$mode ObjFPC}{$H+}
{$PACKRECORDS C}
{$minenumsize 4}

interface

uses
  LibClang.Base, LibClang.CXErrorCode;

  // Return the timestamp for use with Clang's
  // -fbuild-session-timestamp= option.
  function clang_getBuildSessionTimestamp: UInt64; cdecl; external LibClang_dll;
   
type
  // Object encapsulating information about overlaying virtual
  // file/directories over the real file system.
  CXVirtualFileOverlay = type Pointer;

  // Create a CXVirtualFileOverlay object.
  // Must be disposed with clang_VirtualFileOverlay_dispose().
  //
  // param options is reserved, always pass 0.
  function clang_VirtualFileOverlay_create(
    options: Cardinal
    ): CXVirtualFileOverlay; cdecl; external LibClang_dll;

  // Map an absolute virtual file path to an absolute real one.
  // The virtual path must be canonicalized (not contain "."/"..").
  // returns 0 for success, non-zero to indicate an error.
  function clang_VirtualFileOverlay_addFileMapping(
    overlay: CXVirtualFileOverlay;
    const virtualPath: PChar;
    const realPath: PChar
    ): CXErrorCode; cdecl; external LibClang_dll;

  // Set the case sensitivity for the CXVirtualFileOverlay object.
  // The CXVirtualFileOverlay object is case-sensitive by default, this
  // option can be used to override the default.
  // returns 0 for success, non-zero to indicate an error.
  function clang_VirtualFileOverlay_setCaseSensitivity(
    overlay: CXVirtualFileOverlay;
    caseSensitive: Integer
    ): CXErrorCode; cdecl; external LibClang_dll;

  // Write out the CXVirtualFileOverlay object to a char buffer.
  //
  // param options is reserved, always pass 0.
  // param out_buffer_ptr pointer to receive the buffer pointer, which should be
  // disposed using clang_free().
  // param out_buffer_size pointer to receive the buffer size.
  // returns 0 for success, non-zero to indicate an error.
  function clang_VirtualFileOverlay_writeToBuffer(
    overlay: CXVirtualFileOverlay;
    options: Cardinal;
    out out_buffer_ptr: PChar;
    out out_buffer_size: Cardinal
    ): CXErrorCode; cdecl; external LibClang_dll;

  // free memory allocated by libclang, such as the buffer returned by
  // CXVirtualFileOverlay() or clang_ModuleMapDescriptor_writeToBuffer().
  //
  // param buffer memory pointer to free.
  function clang_free(
    buffer: Pointer
    ): CXErrorCode; cdecl; external LibClang_dll;

  // Dispose a CXVirtualFileOverlay object.
  procedure clang_VirtualFileOverlay_dispose(
    overlay: CXVirtualFileOverlay
    ); cdecl; external LibClang_dll;

type
  // Object encapsulating information about a module.map file.
  CXModuleMapDescriptor = type Pointer;

  // Create a CXModuleMapDescriptor object.
  // Must be disposed with clang_ModuleMapDescriptor_dispose().
  //
  // param options is reserved, always pass 0.
  function clang_ModuleMapDescriptor_create(
    options: Cardinal
    ): CXModuleMapDescriptor; cdecl; external LibClang_dll;

  // Sets the framework module name that the module.map describes.
  // returns 0 for success, non-zero to indicate an error.
  function clang_ModuleMapDescriptor_setFrameworkModuleName(
    desc: CXModuleMapDescriptor;
    const name: PChar
    ): CXErrorCode; cdecl; external LibClang_dll;

  // Sets the umbrella header name that the module.map describes.
  // returns 0 for success, non-zero to indicate an error.
  function clang_ModuleMapDescriptor_setUmbrellaHeader(
    desc: CXModuleMapDescriptor;
    const name: PChar
    ): CXErrorCode; cdecl; external LibClang_dll;

  // Write out the CXModuleMapDescriptor object to a char buffer.

  // param options is reserved, always pass 0.
  // param out_buffer_ptr pointer to receive the buffer pointer, which should be
  // disposed using clang_free().
  // param out_buffer_size pointer to receive the buffer size.
  // returns 0 for success, non-zero to indicate an error.
  function clang_ModuleMapDescriptor_writeToBuffer(
    desc: CXModuleMapDescriptor;  
    options: Cardinal;
    out out_buffer_ptr: PChar;
    out out_buffer_size: Cardinal
    ): CXErrorCode; cdecl; external LibClang_dll;

implementation

end.

