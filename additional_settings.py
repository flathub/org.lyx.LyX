
import os, subprocess


__varError_xdg=False
def __error(s):
	print(f"--> Error executing xdg-user-dir: {s}")
	
def __path(s):		
	__Aoutput = subprocess.run([ 'xdg-user-dir', s ], capture_output=True, text=True)

	if __Aoutput.returncode == 0:
		__p = __Aoutput.stdout.strip()
		return __p #path
	else:
		global __varError_xdg
		__varError_xdg=True
		return ""

__Aname="/.tmplyx"
__Apath_D=__path('DOCUMENTS')
if __varError_xdg:
	__error('DOCUMENTS')
	return 0
	
try:
	os.mkdir(f"{__Apath_D}{__Aname}")
except FileExistsError:
	print("--> The DOCUMENTS-temp directory already exists")

__Aconfig=f'''# LyX 2.4.0 generated this file. If you want to make your own\n
# modifications you should do them from inside LyX and save.\n
\n
Format 38
\n\n
#
# MISC SECTION ######################################
#\n\n
#
# SCREEN & FONTS SECTION ############################
#\n
\\screen_font_sizes 5 7 8 9 10 12 14.4 17.26 20.74 24.88
\\single_instance false\n
#
# COLOR SECTION ###################################
#\n\n
#
# PRINTER SECTION ###################################
#\n\n
#
# TEX SECTION #######################################
#\n\n
#
# FILE SECTION ######################################
#\n
\\tempdir_path "{__Apath_D}{__Aname}"\n
#
# PLAIN TEXT EXPORT SECTION ##############################
#\n\n
#
# SPELLCHECKER SECTION ##############################
#\n\n
#
# LANGUAGE SUPPORT SECTION ##########################
#
\n
\\spellchecker hunspell\n
\\language_custom_package ""\n
\n
#
# 2nd MISC SUPPORT SECTION ##########################
#\n\n
#
# FORMATS SECTION ##########################
#\n
\n
#
# CONVERTERS SECTION ##########################
#\n\n
#
# COPIERS SECTION ##########################
#
'''
__Apath_D=__path('HOME')
if __varError_xdg:
	__error('HOME')
	return 0
	
__Aruta=__Apath_D+"/.lyx/preferences"
	
	print("--> Path preferences file:",__Aruta)
	 
	with open(__Aruta, 'w') as arch:
		arch.write(__Aconfig)
