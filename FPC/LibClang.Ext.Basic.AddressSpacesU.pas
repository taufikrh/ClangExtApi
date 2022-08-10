unit LibClang.Ext.Basic.AddressSpacesU;

{$mode ObjFPC}{$H+}  
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

type
  LangAS = type Cardinal;
  LangASHelper = type helper for LangAS
  public const
    Default = 0;
    opencl_global = 1;
    opencl_local = 2;
    opencl_constant = 3;
    opencl_private = 4;
    opencl_generic = 5;
    opencl_global_device = 6;
    opencl_global_host = 7;

    cuda_device = 8;
    cuda_constant = 9;
    cuda_shared = 10;

    sycl_global = 11;
    sycl_global_device = 12;
    sycl_global_host = 13;
    sycl_local = 14;
    sycl_private = 15;

    ptr32_sptr = 16;
    ptr32_uptr = 17;
    ptr64 = 18;

    FirstTargetAddressSpace = 19;
  end;

implementation

end.

