#!/bin/sh
set -e
export PATH=/bin:/usr/bin:/storage/local/bin:/storage/opt/mupen64plus
export LD_LIBRARY_PATH=/LD_LIBRARY_PATH=/usr/lib32/:/usr/lib/

GINSTALLFLAG=-D



if `which ginstall >/dev/null 2>&1`; then
    INSTALL=ginstall
elif install --help >/dev/null 2>&1; then
    INSTALL=install
elif [ -e "`which install 2>/dev/null`" ]; then 
    printf "warning: GNU install not found, assuming BSD install\n" >&2
    INSTALL=install
    GINSTALLFLAG=
else
    printf "error: install tool not found\n" >&2
    exit 1
fi



# INSTALL_STRIP_FLAG="${INSTALL_STRIP_FLAG:=-s}"

usage()
{
printf "usage: $(basename $0) [PREFIX] [SHAREDIR] [BINDIR] [LIBDIR] [PLUGINDIR] [MANDIR] [APPSDIR] [ICONSDIR]
\tPREFIX    - installation directories prefix (default: /storage/mupen64)
\tSHAREDIR  - path to Mupen64Plus shared data files (default: \$PREFIX/share/mupen64plus)
\tBINDIR    - path to Mupen64Plus binary program files (default: \$PREFIX/bin)
\tLIBDIR    - path to Mupen64Plus core library (default: \$PREFIX/lib)
\tPLUGINDIR - path to Mupen64Plus plugin libraries (default: \$PREFIX/lib/mupen64plus)
\tMANDIR    - path to manual files (default: \$PREFIX/share/man)
\tAPPSDIR   - path to install desktop file (default: \$PREFIX/share/applications)
\tICONSDIR  - path to install icon files (default: \$PREFIX/share/icons/hicolor)
"
}

if [ $# -gt 8 ]; then
	usage
	exit 1
fi


PREFIX="${1:-/storage/opt/mupen64plus}" 
SHAREDIR="${2:-${PREFIX}}" 
BINDIR="${3:-${PREFIX}}" 
LIBDIR="${4:-${PREFIX}}" 
PLUGINDIR="${5:-${PREFIX}}" 
MANDIR="${6:-${PREFIX}}" 
APPSDIR="${7:-${PREFIX}}" 
ICONSDIR="${8:-${PREFIX}/icons}" 

# simple check for permissions
if [ -d "${SHAREDIR}" -a ! -w "${SHAREDIR}" ]; then
	printf "Error: you do not have permission to install at: ${SHAREDIR}\nMaybe you need to be root?\n"
	exit 1
fi
if [ -d "${BINDIR}" -a ! -w "${BINDIR}" ]; then
	printf "Error: you do not have permission to install at: ${BINDIR}\nMaybe you need to be root?\n"
	exit 1
fi
if [ -d "${LIBDIR}" -a ! -w "${LIBDIR}" ]; then
	printf "Error: you do not have permission to install at: ${LIBDIR}\nMaybe you need to be root?\n"
	exit 1
fi
if [ -d "${PLUGINDIR}" -a ! -w "${PLUGINDIR}" ]; then
	printf "Error: you do not have permission to install at: ${PLUGINDIR}\nMaybe you need to be root?\n"
	exit 1
fi
if [ -d "${MANDIR}" -a ! -w "${MANDIR}" ]; then
	printf "Error: you do not have permission to install at: ${MANDIR}\nMaybe you need to be root?\n"
	exit 1
fi
if [ -d "${APPSDIR}" -a ! -w "${APPSDIR}" ]; then
	printf "Error: you do not have permission to install at: ${APPSDIR}\nMaybe you need to be root?\n"
	exit 1
fi
if [ -d "${ICONSDIR}" -a ! -w "${ICONSDIR}" ]; then
	printf "Error: you do not have permission to install at: ${ICONSDIR}\nMaybe you need to be root?\n"
	exit 1
fi

printf "Installing Mupen64Plus Binary Bundle to ${PREFIX}\n"

# Mupen64Plus-Core
$INSTALL -d -v "${LIBDIR}"
$INSTALL -m 0644 libmupen64plus.so.2* "${LIBDIR}"

# /sbin/ldconfig
$INSTALL -d -v "${SHAREDIR}"
$INSTALL -m 0644 font.ttf "${SHAREDIR}"
$INSTALL -m 0644 mupencheat.txt "${SHAREDIR}"
$INSTALL -m 0644 mupen64plus.ini "${SHAREDIR}"
$INSTALL -d -v "${SHAREDIR}/doc"
$INSTALL -m 0644 doc/* "${SHAREDIR}/doc"
# Mupen64Plus-ROM
$INSTALL -m 0644 m64p_test_rom.v64 "${SHAREDIR}"
# Mupen64Plus-UI-Console
$INSTALL -d -v "${BINDIR}"
$INSTALL $GINSTALLFLAG -m 0755 mupen64plus "${BINDIR}"
$INSTALL -d -v "${MANDIR}/man6"
$INSTALL -m 0644 man6/mupen64plus.6 "${MANDIR}/man6"
$INSTALL -d -v "${APPSDIR}"
$INSTALL -m 0644 mupen64plus.desktop "${APPSDIR}"
$INSTALL -d -v "${ICONSDIR}/48x48/apps"
$INSTALL -m 0644 icons/48x48/apps/mupen64plus.png "${ICONSDIR}/48x48/apps"
$INSTALL -d -v "${ICONSDIR}/scalable/apps"
$INSTALL -m 0644 icons/scalable/apps/mupen64plus.svg "${ICONSDIR}/scalable/apps"
# Plugins
$INSTALL -d -v "${PLUGINDIR}"
$INSTALL -m 0644 mupen64plus-audio-sdl.so "${PLUGINDIR}"
$INSTALL -m 0644 mupen64plus-input-sdl.so "${PLUGINDIR}"
$INSTALL -m 0644 mupen64plus-rsp-hle.so "${PLUGINDIR}"
$INSTALL -m 0644 mupen64plus-video-rice.so "${PLUGINDIR}"
$INSTALL -m 0644 mupen64plus-video-glide64mk2.so "${PLUGINDIR}"
$INSTALL -m 0644 RiceVideoLinux.ini "${SHAREDIR}"
$INSTALL -m 0644 InputAutoCfg.ini "${SHAREDIR}"
$INSTALL -m 0644 Glide64mk2.ini "${SHAREDIR}"

$INSTALL -d -v "/storage/local/bin"
$INSTALL -m 0644 n64.sh "/storage/local/bin"
$INSTALL -d -v "/storage/.config/mupen64plus"
$INSTALL -m 0644 mupen64plus.cfg "/storage/.config/mupen64plus/mupen64plus.cfg"
$INSTALL -m 0644 es_systems_custom_categories1.cfg "/storage/.config/emulationstation"

$INSTALL -d -v "${LIBDIR}/lib32"
$INSTALL -m 0644 lib32/libboost_system.so.1.67.0 "${LIBDIR}/lib32"
$INSTALL -d -v "${LIBDIR}/lib64"
$INSTALL -m 0644 lib64/libboost_system.so.1.67.0 "${LIBDIR}/lib64"
$INSTALL -m 0644 lib64/libboost_filesystem.so.1.67.0 "${LIBDIR}/lib64"
$INSTALL -m 0644 lib32/libboost_filesystem.so.1.67.0 "${LIBDIR}/lib32"


patchelf --set-interpreter /usr/lib32/ld-linux-armhf.so.3 mupen64plus
chmod +x /storage/local/bin/n64.sh


printf "Installation successful.\n"

