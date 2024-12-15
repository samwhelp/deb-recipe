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
## ## Theme / Util
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
## ## Grub Theme / Model
##

mod_theme_install_grub_theme () {

	local prj_dir_path="${prjdir}"
	local pkg_dir_path="${pkgdir}"

	local source_themes_dir_path="${prj_dir_path}"
	local target_themes_dir_path="${pkg_dir_path}/usr/share/grub/themes/grub-theme-cover-remix"




	echo
	echo util_copy_from_srcdir_to_desdir "${source_themes_dir_path}" "${target_themes_dir_path}"
	echo
	util_copy_from_srcdir_to_desdir "${source_themes_dir_path}" "${target_themes_dir_path}"


	echo
	echo rm -rf "${target_themes_dir_path}/.git"
	echo
	rm -rf "${target_themes_dir_path}/.git"




	echo

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




	mod_theme_install_grub_theme




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
