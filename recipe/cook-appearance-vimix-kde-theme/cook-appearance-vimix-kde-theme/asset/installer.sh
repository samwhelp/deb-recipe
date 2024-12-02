#!/usr/bin/env bash


#set -e




##
## # Install Theme
##




##
## ## Main / Init
##

REF_BASE_DIR_PATH="$(cd -- "$(dirname -- "$0")" ; pwd)"
REF_CMD_FILE_NAME="$(basename "$0")"




##
## ## Main / Args
##

DEFAULT_SRCDIR="${REF_BASE_DIR_PATH}/prj"
SRCDIR="${SRCDIR:=$DEFAULT_SRCDIR}"


DEFAULT_DESTDIR="${REF_BASE_DIR_PATH}/pkg"
DESTDIR="${DESTDIR:=$DEFAULT_DESTDIR}"




##
## ## Kde Theme / Util
##

util_copy_from_srcdir_to_desdir () {

	local src_dir_path="${1}"
	local des_dir_path="${2}"


	echo
	echo mkdir -p "${src_dir_path}"
	mkdir -p "${src_dir_path}"


	echo
	echo mkdir -p "${des_dir_path}"
	mkdir -p "${des_dir_path}"


	echo
	echo cp -rfT "${src_dir_path}" "${des_dir_path}"
	cp -rfT "${src_dir_path}" "${des_dir_path}"


	echo

	return 0

}




##
## ## Kde Theme / Model
##

mod_theme_install_aurorae_theme () {

	local src_dir_path="${prjdir}/aurorae"
	local des_dir_path="${pkgdir}/usr/share/aurorae/themes"

	util_copy_from_srcdir_to_desdir "${src_dir_path}" "${des_dir_path}"


	return 0
}

mod_theme_install_color_schemes () {

	local src_dir_path="${prjdir}/color-schemes"
	local des_dir_path="${pkgdir}/usr/share/color-schemes"

	util_copy_from_srcdir_to_desdir "${src_dir_path}" "${des_dir_path}"


	return 0
}

mod_theme_install_kvantum_theme () {

	local src_dir_path="${prjdir}/Kvantum"
	local des_dir_path="${pkgdir}/usr/share/Kvantum"

	util_copy_from_srcdir_to_desdir "${src_dir_path}" "${des_dir_path}"


	return 0
}

mod_theme_install_plasma_theme () {

	local src_dir_path="${prjdir}/plasma"
	local des_dir_path="${pkgdir}/usr/share/plasma"

	util_copy_from_srcdir_to_desdir "${src_dir_path}" "${des_dir_path}"


	return 0
}

mod_theme_install_sddm_theme () {

	local src_dir_path="${prjdir}/sddm/themes"
	local des_dir_path="${pkgdir}/usr/share/sddm/themes"

	util_copy_from_srcdir_to_desdir "${src_dir_path}" "${des_dir_path}"


	return 0
}

mod_theme_install_wallpaper () {

	local src_dir_path="${prjdir}/wallpaper"
	local des_dir_path="${pkgdir}/usr/share/wallpapers"

	util_copy_from_srcdir_to_desdir "${src_dir_path}" "${des_dir_path}"


	return 0
}




##
## ## Model / Start
##

model_start () {


	echo
	echo "P: theme install"

	echo
	echo "Shell: DESTDIR=${DESTDIR}"

	prjdir="${SRCDIR}"

	pkgdir="${DESTDIR}"


	echo
	echo mkdir -p "${prjdir}"
	mkdir -p "${prjdir}"


	echo
	echo mkdir -p "${pkgdir}"
	mkdir -p "${pkgdir}"




	mod_theme_install_aurorae_theme
	mod_theme_install_color_schemes
	mod_theme_install_kvantum_theme
	mod_theme_install_plasma_theme
	mod_theme_install_sddm_theme
	mod_theme_install_wallpaper




	echo

	return 0

}




##
## ## Main / Start
##

__main__ () {

	model_start "${@}"

}

__main__ "${@}"
