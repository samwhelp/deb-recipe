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

DEFAULT_BUILD_DIR_PATH="${REF_BASE_DIR_PATH}/build"
REF_BUILD_DIR_PATH="${REF_BUILD_DIR_PATH:=$DEFAULT_BUILD_DIR_PATH}"


DEFAULT_SUBJECT_NAME="cook-appearance-orchis-gtk-theme"
REF_SUBJECT_NAME="${REF_SUBJECT_NAME:=$DEFAULT_SUBJECT_NAME}"


DEFAULT_DESTDIR="${REF_BASE_DIR_PATH}/debian/${REF_SUBJECT_NAME}"
DESTDIR="${DESTDIR:=$DEFAULT_DESTDIR}"


##
## ## Model / Start
##

model_start () {


	echo
	echo "P: install"

	echo
	echo "Shell: DESTDIR=${DESTDIR}"

	local pkgdir="${REF_BUILD_DIR_PATH}/pkg"


	echo
	echo mkdir -p "${pkgdir}"
	mkdir -p "${pkgdir}"


	echo
	echo mkdir -p "${DESTDIR}"
	mkdir -p "${DESTDIR}"


	echo
	echo cp -rfT "${pkgdir}" "${DESTDIR}"
	cp -rfT "${pkgdir}" "${DESTDIR}"




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
