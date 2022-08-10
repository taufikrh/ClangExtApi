// ConcreteTypeLoc

#define ConcreteTypeLoc_getLocalDataAlignment_H(X) CINDEX_LINKAGE unsigned clangExt_##X##_getLocalDataAlignment(CXTypeLoc loc);
#define ConcreteTypeLoc_getLocalDataSize_H(X) CINDEX_LINKAGE unsigned clangExt_##X##_getLocalDataSize(CXTypeLoc loc);
#define ConcreteTypeLoc_getNextTypeLoc_H(X) CINDEX_LINKAGE CXTypeLoc clangExt_##X##_getNextTypeLoc(CXTypeLoc loc);
#define ConcreteTypeLoc_getTypePtr_H(X, C) CINDEX_LINKAGE const C##* clangExt_##X##_getTypePtr(CXTypeLoc loc);

#define ConcreteTypeLoc_getLocalDataAlignment_I(X) \
	unsigned clangExt_##X##_getLocalDataAlignment(CXTypeLoc loc) { \
		return CXTypeLocToTypeLoc(loc).castAs<##X##>().getLocalDataAlignment(); \
	}

#define ConcreteTypeLoc_getLocalDataSize_I(X) \
	unsigned clangExt_##X##_getLocalDataSize(CXTypeLoc loc) { \
		return CXTypeLocToTypeLoc(loc).castAs<##X##>().getLocalDataSize(); \
	}

#define ConcreteTypeLoc_getNextTypeLoc_I(X) \
	CXTypeLoc clangExt_##X##_getNextTypeLoc(CXTypeLoc loc) { \
		return TypeLocToCXTypeLoc(CXTypeLocToTypeLoc(loc).castAs<##X##>().getNextTypeLoc()); \
	}

#define ConcreteTypeLoc_getTypePtr_I(X, C) \
	const C##* clangExt_##X##_getTypePtr(CXTypeLoc loc) { \
		return CXTypeLocToTypeLoc(loc).castAs<##X##>().getTypePtr(); \
	}

#define ConcreteTypeLoc_H(X, C) \
	ConcreteTypeLoc_getLocalDataAlignment_H(X) \
	ConcreteTypeLoc_getLocalDataSize_H(X) \
	ConcreteTypeLoc_getNextTypeLoc_H(X) \
	ConcreteTypeLoc_getTypePtr_H(X, C)

#define ConcreteTypeLoc_I(X, C) \
	ConcreteTypeLoc_getLocalDataAlignment_I(X) \
	ConcreteTypeLoc_getLocalDataSize_I(X) \
	ConcreteTypeLoc_getNextTypeLoc_I(X) \
	ConcreteTypeLoc_getTypePtr_I(X, C)

//===============================================================================================
// PointerLikeTypeLoc

#define PointerLikeTypeLoc_getSigilLoc_H(X) CINDEX_LINKAGE CXSourceLocation clangExt_##X##_getSigilLoc(CXTypeLoc loc, const ASTContext* Context);
#define PointerLikeTypeLoc_getPointeeLoc_H(X) CINDEX_LINKAGE CXTypeLoc clangExt_##X##_getPointeeLoc(CXTypeLoc loc);
#define PointerLikeTypeLoc_getLocalSourceRange_H(X) CINDEX_LINKAGE CXSourceRange clangExt_##X##_getLocalSourceRange(CXTypeLoc loc, const ASTContext* Context);
#define PointerLikeTypeLoc_getInnerType_H(X) CINDEX_LINKAGE const CXQualType clangExt_##X##_getInnerType(CXTypeLoc loc);

#define PointerLikeTypeLoc_getSigilLoc_I(X) \
	CXSourceLocation clangExt_##X##_getSigilLoc(CXTypeLoc loc, const ASTContext* Context) { \
		return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).castAs<##X##>().getSigilLoc()); \
	}

#define PointerLikeTypeLoc_getPointeeLoc_I(X) \
	CXTypeLoc clangExt_##X##_getPointeeLoc(CXTypeLoc loc) { \
		return TypeLocToCXTypeLoc(CXTypeLocToTypeLoc(loc).castAs<##X##>().getPointeeLoc()); \
	}

#define PointerLikeTypeLoc_getLocalSourceRange_I(X) \
	CXSourceRange clangExt_##X##_getLocalSourceRange(CXTypeLoc loc, const ASTContext* Context) { \
		return cxloc::translateSourceRange(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).castAs<##X##>().getLocalSourceRange()); \
	}

#define PointerLikeTypeLoc_getInnerType_I(X) \
	const CXQualType clangExt_##X##_getInnerType(CXTypeLoc loc) { \
		return CXTypeLocToTypeLoc(loc).castAs<##X##>().getInnerType().getAsOpaquePtr(); \
	}

#define PointerLikeTypeLoc_H(X) \
	PointerLikeTypeLoc_getSigilLoc_H(X) \
	PointerLikeTypeLoc_getPointeeLoc_H(X) \
	PointerLikeTypeLoc_getLocalSourceRange_H(X) \
	PointerLikeTypeLoc_getInnerType_H(X)

#define PointerLikeTypeLoc_I(X) \
	PointerLikeTypeLoc_getSigilLoc_I(X) \
	PointerLikeTypeLoc_getPointeeLoc_I(X) \
	PointerLikeTypeLoc_getLocalSourceRange_I(X) \
	PointerLikeTypeLoc_getInnerType_I(X)

//===============================================================================================
#define InheritingConcreteTypeLoc_H(X, C) \
	CINDEX_LINKAGE const C##* clangExt_##X##_getTypePtr(CXTypeLoc loc);

#define InheritingConcreteTypeLoc_I(X, C) \
	const C##* clangExt_##X##_getTypePtr(CXTypeLoc loc) { \
		return CXTypeLocToTypeLoc(loc).castAs<##X##>().getTypePtr(); \
	}

