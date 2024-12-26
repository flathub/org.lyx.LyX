The 'beta' branch uses the 'org.kde.Platform//6.7' runtime.

LyX is by default set to store temporary files in the path '~/Documents/.tmplyx', which can be changed from the 'Tools->Preferences->Paths' menu. In this path, LyX stores pdfs, if it is not accessible it will use the '/tmp' folder. The path must be accessible from outside the sandbox or it will not be possible to use an external pdf viewer.
If you have problems viewing pdfs, try:
- Granting access permissions to the path where you want temporary files to be stored. You can do this with [Flatseal](https://flathub.org/apps/com.github.tchx84.Flatseal) or with commands:
  - sudo flatpak override org.lyx.LyX --filesystem=path_to_temporary_directory

- Set that path for temporary files in LyX 'Tools->Preferences->Paths->Temporary directory'

If you want to install lyx-2.3.7-1 from flathub, you can do so, although you need to complete the dependencies by hand:
- Download LyX
  - flatpak install --no-deps org.lyx.LyX
- Revert changes to v2.3.7-1
  - sudo flatpak update --commit=5bea7d745bdcd0cbbeda016068379833024f5c20c66e839fead875518752b242 org.lyx.LyX
- Install dependencies:
  - flatpak install org.freedesktop.Sdk.Extension.texlive//23.08
  - flatpak install org.kde.Platform//5.15-23.08

