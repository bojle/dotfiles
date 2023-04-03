# Some scripts that you may find interesting:

[**sknife.bash**](./sknife.bash)
	The Swiss army knife of documents, image manipulating programs.
	sknife is a declarative-style program that can compress, merge,
	split pdfs, jpegs, pngs, mp3 and convert between them.
	I wrote this so I don't have to remember the difficult syntax of
	the programs (like ffmpeg, gs, imagemagick etc.) known to do their 
	job. This is essentially a wrapper around the aforementioned programs.
	Eg: sknife convert i1.png i2.png i3.png -o out.pdf
	will form a pdf from all the pngs.

[**sub-extract.sh**](./sub-extract.sh)
	Is a youtube.com subtitle extractor. It extracts the english subtitles
	from a video url and converts the downloaded subtitle file into a nice 
	text file free of the timestamp-clutter.

[**battery-alert.sh**](battery-alert.sh)
	A very important part of my system. This script is run by a
	[systemd-timer](~/systemd/.config/systemd/user/battery-alert.timer)
	every 90 seconds to check if the battery percentage is above or below a 
	certain threshold; if yes, sounds a alarm.

[**websurf.bash**](./websurf.bash)
	Find a random (hopefully interesting) webpage from a set of 
	websites and open it in the browser.
	Eg: websurf.bash [no arguments] 
	will open a random webpage.
		websurf.bash hn
	will open a random hn page.

[**se.sh**](./se.sh)
   Search across a search engine from your command line. See the source for
   more info.
