#!/bin/sh

######Def. Functions
sprint(){
	echo " startTeXmacs.sh: "$1
	echo " "
}
###

######Set envairoment vars
architecture_type=$(uname -m)
perl_version=$(ls /app/texlive/lib/perl5/site_perl/)

if ! [[ $perl_version =~ ^[0-9.]+$ ]]; then
  sprint "Possible error in environment variables."
fi

export PATH=/app/plugins/SweaveKnitr/bin:/app/plugins/LilyPond/bin:/app/texlive/bin:/app/texlive/bin/${architecture_type}-linux:${PATH}
export LD_LIBRARY_PATH=/app/texlive/lib:/app/texlive/lib/perl5/${perl_version}/${architecture_type}-linux/CORE:${LD_LIBRARY_PATH}
export PERL5LIB=/app/texlive/lib/perl5/${perl_version}:/app/texlive/lib/perl5/site_perl/${perl_version}
export ASPELL_CONF='dict-dir /app/share/dicts'
###

######Aditional settings
doc_path_dir=$(xdg-user-dir DOCUMENTS)
lyx_temp_dir_name=.tmplyx

if ! [[ -f ~/.lyx/preferences ]]; then
	cat >~/.lyx/preferences << EOl
# LyX 2.4.0 generated this file. If you want to make your own
# modifications you should do them from inside LyX and save.



Format 38



#
# MISC SECTION ######################################
#


#
# SCREEN & FONTS SECTION ############################
#

\\screen_font_sizes 5 7 8 9 10 12 14.4 17.26 20.74 24.88
\\single_instance false

#
# COLOR SECTION ###################################
#


#
# PRINTER SECTION ###################################
#


#
# TEX SECTION #######################################
#


#
# FILE SECTION ######################################
#

\\tempdir_path "${doc_path_dir}/${lyx_temp_dir_name}"

#
# PLAIN TEXT EXPORT SECTION ##############################
#


#
# SPELLCHECKER SECTION ##############################
#


#
# LANGUAGE SUPPORT SECTION ##########################
#


\\spellchecker hunspell

\\language_custom_package ""



#
# 2nd MISC SUPPORT SECTION ##########################
#


#
# FORMATS SECTION ##########################
#



#
# CONVERTERS SECTION ##########################
#


#
# COPIERS SECTION ##########################
#
EOl
	if ! [[ -d ${doc_path_dir}/${lyx_temp_dir_name} ]]; then
		sprint "creating temporary directory \"${doc_path_dir}/${lyx_temp_dir_name}\"."
		mkdir -p ${doc_path_dir}/${lyx_temp_dir_name}
	fi

fi


exec lyx "$@"
