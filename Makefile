include $(TOPDIR)/rules.mk

PKG_NAME:=lua-periphery
PKG_VERSION:=2016-08-10
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_MAINTAINER:=Xue Liu <xue.liu@dks-koeln.de>

include $(INCLUDE_DIR)/package.mk

define Package/lua-periphery
  SUBMENU:=Lua
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=lua periphery library
  DEPENDS:=+liblua
endef

TARGET_CFLAGS += \
	-I$(STAGING_DIR)/usr/include \
	-D_GNU_SOURCE

MAKE_FLAGS += \
	FPIC="$(FPIC)" \
	CFLAGS="$(TARGET_CFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS)"

define Package/lua-periphery/description
	lua periphery.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)
endef

define Package/Configure

endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libcperiphery.so $(1)/usr/lib/libcperiphery.so
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/periphery.so $(1)/usr/lib/lua/periphery.so
	$(INSTALL_DIR) $(1)/usr/lib/lua/lua_periphery_test
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tests/* $(1)/usr/lib/lua/lua_periphery_test/
endef

define Package/lua-periphery/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libcperiphery.so $(1)/usr/lib/libcperiphery.so
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/periphery.so $(1)/usr/lib/lua/periphery.so
	$(INSTALL_DIR) $(1)/usr/lib/lua/lua_periphery_test
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tests/* $(1)/usr/lib/lua/lua_periphery_test/
endef

$(eval $(call BuildPackage,lua-periphery))
