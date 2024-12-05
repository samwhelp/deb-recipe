#!/usr/bin/env bash


#set -e




##
## # Download Theme
##




##
## ## Main / Init
##

REF_BASE_DIR_PATH="$(cd -- "$(dirname -- "$0")" ; pwd)"
REF_CMD_FILE_NAME="$(basename "$0")"




##
## ## Main / Args
##

DEFAULT_ASSET_DIR_PATH="${REF_BASE_DIR_PATH}/asset"
REF_ASSET_DIR_PATH="${REF_ASSET_DIR_PATH:=$DEFAULT_ASSET_DIR_PATH}"

DEFAULT_BUILD_DIR_PATH="${REF_BASE_DIR_PATH}/build"
REF_BUILD_DIR_PATH="${REF_BUILD_DIR_PATH:=$DEFAULT_BUILD_DIR_PATH}"


DEFAULT_SUBJECT_NAME="cook-appearance-graphite-gtk-theme"
REF_SUBJECT_NAME="${REF_SUBJECT_NAME:=$DEFAULT_SUBJECT_NAME}"


DEFAULT_REPO_URL="https://github.com/vinceliuice/Graphite-gtk-theme.git"
REF_REPO_URL="${REF_REPO_URL:=$DEFAULT_REPO_URL}"


##
## ## Model / Theme
##

mod_theme_project_clone () {
	git clone "${REF_REPO_URL}" "${prjdir}"
}

mod_theme_copy_installer () {
	install -Dm755 "${REF_ASSET_DIR_PATH}/installer.sh" "${REF_BUILD_DIR_PATH}/installer.sh"
}

mod_theme_run_installer () {
	"${REF_BUILD_DIR_PATH}/installer.sh"
}




##
## ## Model / Start
##

model_start () {

	echo "P: build"

	prjdir="${REF_BUILD_DIR_PATH}/prj"

	pkgdir="${REF_BUILD_DIR_PATH}/pkg"



	mod_theme_project_clone

	mod_theme_copy_installer

	mod_theme_run_installer



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
