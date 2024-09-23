The 'beta' branch uses the 'org.kde.Platform//6.7' runtime.

LyX is by default set to store temporary files in the path '~/Documents/.tmplyx', which can be changed from the 'Tools->Preferences->Paths' menu. In this path, LyX stores pdfs, if it is not accessible it will use the '/tpm' folder. The path must be accessible from outside the sandbox or it will not be possible to use an external pdf viewer.
If you have problems viewing pdfs, try:
- Granting access permissions to the path where you want temporary files to be stored. You can do this with 'Flatseal' or with commands:
  - sudo flatpak override org.lyx.LyX --filesystem=path_to_temporary_directory

- Set that path for temporary files in LyX 'Tools->Preferences->Paths->Temporary directory'
