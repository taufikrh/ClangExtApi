#ifndef LIB_CLANG_EXT_TYPES_H
#define LIB_CLANG_EXT_TYPES_H

#include <clang/AST/Type.h>

using namespace clang;

typedef void* CXQualType;

typedef struct {
	const Type* Ty;
	void* Data;
} CXTypeLoc;

typedef void* CXDeclarationName;

typedef unsigned CXQualifiers;

typedef struct {
	/// The locally-unqualified type.
	const Type* Ty;

	/// The local qualifiers.
	CXQualifiers Quals;
} CXSplitQualType;

#endif