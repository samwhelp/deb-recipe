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
## ## Icon Theme / Util
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

util_index_theme_inherits_set () {

	local value="${1}"
	local index_theme_file_path="${2}"
	sed -i "s|^Inherits=.*|Inherits=${value}|g" "${index_theme_file_path}"

}




##
## ## Kde Theme / Model
##

mod_theme_install_icon_theme () {

	local prj_dir_path="${prjdir}"
	local pkg_dir_path="${pkgdir}"
	local icons_dir_path="${pkg_dir_path}/usr/share/icons"


	mkdir -p "${icons_dir_path}"


	echo
	echo cd "${prj_dir_path}"
	cd "${prj_dir_path}"

	#echo
	#echo ./install.sh -a -d "${icons_dir_path}"
	#echo
	#./install.sh -a -d "${icons_dir_path}"

	echo
	echo ./install.sh -red -d "${icons_dir_path}"
	echo
	./install.sh -red -d "${icons_dir_path}"


	echo
	echo cd "${OLDPWD}"
	cd "${OLDPWD}"




	local inherits_light="Numix-Circle-Light,Numix-Light,Papirus-Light,Adwaita,hicolor"
	local inherits_dark="Numix-Circle,Numix,Papirus-Dark,Adwaita,hicolor"

	echo
	echo util_index_theme_inherits_set "${inherits_light}" "${icons_dir_path}/Citrus-red/index.theme"
	echo
	util_index_theme_inherits_set "${inherits_light}" "${icons_dir_path}/Citrus-red/index.theme"


	echo
	echo util_index_theme_inherits_set "${inherits_dark}" "${icons_dir_path}/Citrus-red-dark/index.theme"
	echo
	util_index_theme_inherits_set "${inherits_dark}" "${icons_dir_path}/Citrus-red-dark/index.theme"




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




	mod_theme_install_icon_theme




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
