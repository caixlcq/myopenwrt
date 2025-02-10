#!/bin/bash

# rm -rf feeds/luci/applications/luci-app-dockerman
# rm -rf package/feeds/luci/applications/luci-app-dockerman
# rm -rf feeds/packages/net/openvpn-easy-rsa && rm -rf feeds/packages/net/openvpn
# rm -rf package/feeds/packages/openvpn-easy-rsa && rm -rf package/feeds/packages/openvpn

git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git package/colin/luci-app-argon-config
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git package/colin/luci-theme-argon
#git clone --depth 1 https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/colin/luci-app-unblockneteasemusic
git clone --depth 1 https://github.com/sirpdboy/netspeedtest.git package/colin/netspeedtest
#git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall package/colin/luci-app-passwall
#git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2 package/colin/luci-app-passwall2
#git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git package/colin/passwall-packages
#git clone --depth 1 https://github.com/sbwml/luci-app-alist package/colin/luci-app-alist
#git clone --depth 1 https://github.com/sbwml/luci-app-qbittorrent package/colin/luci-app-qbittorrent
# git clone --depth 1 https://github.com/QiuSimons/openwrt-mos package/colin/luci-app-mosdns
git clone --depth 1 https://github.com/kenzok78/luci-app-adguardhome package/colin/luci-app-adguardhome
git clone --depth 1 https://github.com/zzsj0928/luci-app-pushbot package/colin/luci-app-pushbot
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go package/colin/luci-app-ddns-go
# git clone --depth 1 https://github.com/Jason6111/luci-app-netdata package/colin/luci-app-netdata
git clone --depth 1 https://github.com/esirplayground/luci-app-poweroff package/colin/luci-app-poweroff
git clone --depth 1 https://github.com/tty228/luci-app-wechatpush.git package/colin/luci-app-wechatpush
# git clone --depth 1 https://github.com/lisaac/luci-app-dockerman package/colin/luci-app-dockerman
git clone --depth 1 https://github.com/vernesong/OpenClash package/colin/luci-app-openclash
#git clone --depth=1 https://github.com/fw876/helloworld.git package/colin/helloworld

git clone --depth 1 https://github.com/kenzok8/small-package colin-tmp1 && mv colin-tmp1/wrtbwmon package/colin/wrtbwmon && mv colin-tmp1/dnsforwarder package/colin/dnsforwarder
# git clone --depth 1 https://github.com/messense/aliyundrive-webdav colin-tmp2 && mv colin-tmp2/openwrt package/colin/aliyundrive-webdav
git clone --depth 1 https://github.com/sundaqiang/openwrt-packages colin-tmp3 && mv colin-tmp3/luci-app-wolplus package/colin/luci-app-wolplus
git clone --depth 1 https://github.com/coolsnowwolf/lede colin-tmp4 && mv colin-tmp4/package/lean/autocore package/colin/autocore && mv colin-tmp4/package/lean/vsftpd-alt package/colin/vsftpd-alt
git clone --depth 1 https://github.com/coolsnowwolf/luci colin-tmp5 && mv colin-tmp5/applications/luci-app-vsftpd package/colin/luci-app-vsftpd && mv colin-tmp5/applications/luci-app-cpufreq package/colin/luci-app-cpufreq
#&& mv colin-tmp5/applications/luci-app-diskman package/colin/luci-app-diskman && mv colin-tmp5/applications/luci-app-qbittorrent package/colin/luci-app-qbittorrent 
# git clone --depth 1 https://github.com/coolsnowwolf/packages colin-tmp6 && mv colin-tmp6/libs/rblibtorrent package/colin/rblibtorrent && mv colin-tmp6/libs/qttools package/colin/qttools && mv colin-tmp6/libs/qtbase package/colin/qtbase && mv colin-tmp6/net/qBittorrent package/colin/qBittorrent && mv colin-tmp6/net/qBittorrent-static package/colin/qBittorrent-static
git clone --depth 1 https://github.com/immortalwrt/luci colin-tmp7 && mv colin-tmp7/applications/luci-app-dufs package/colin/luci-app-dufs
#&& mv colin-tmp7/applications/luci-app-openvpn-server package/colin/luci-app-openvpn-server
git clone --depth 1 https://github.com/immortalwrt/packages colin-tmp8 && mv colin-tmp8/net/dufs package/colin/dufs
#&& mv colin-tmp8/net/openvpn package/colin/openvpn && mv colin-tmp8/net/openvpn-easy-rsa package/colin/openvpn-easy-rsa
# git clone --depth 1 https://github.com/coolsnowwolf/lede colin-tmp9 && mv colin-tmp9/package/lean/shortcut-fe package/colin/shortcut-fe
# git clone --depth 1 https://github.com/coolsnowwolf/luci colin-tmp10 && mv colin-tmp10/applications/luci-app-turboacc package/colin/luci-app-turboacc
git clone --depth 1 https://github.com/lisaac/luci-app-diskman package/colin/luci-app-diskman
git clone --depth 1 https://github.com/asvow/luci-app-tailscale package/colin/luci-app-tailscale
#git clone --depth 1 https://github.com/Firsgith/luci-app-zerotier package/colin/luci-app-zerotier
#sed -i 's/PKG_VERSION:=[^ ]*-//g' package/colin/luci-app-zerotier/Makefile

# Modify default IP（FROM 192.168.1.1 CHANGE TO 192.168.123.1）
sed -i 's/192.168.1.1/192.168.25.115/g' package/base-files/files/bin/config_generate

# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-material）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

sed -i 's/invalid users = root/#invalid users = root/g' feeds/packages/net/samba4/files/smb.conf.template
sed -i 's#mount -t cifs#mount.cifs#g' feeds/luci/applications/luci-app-cifs-mount/root/etc/init.d/cifs

# sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/colin/luci-app-qbittorrent/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/colin/luci-app-vsftpd/Makefile
# sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/colin/luci-app-diskman/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/colin/luci-app-dufs/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/packages/#g' package/colin/dufs/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/colin/luci-app-cpufreq/Makefile
# sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/colin/luci-app-turboacc/Makefile
# sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/colin/luci-app-openvpn-server/Makefile
sed -i '/\/etc\/init\.d\/tailscale/d;/\/etc\/config\/tailscale/d;' feeds/packages/net/tailscale/Makefile



