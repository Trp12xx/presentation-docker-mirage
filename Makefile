all:
	pandoc --template=template.tex -f rst -t beamer -V colortheme=seagull -V fonttheme=structurebold -V fontsize=14pt --toc --slide-level 2 -o slides.pdf slides.rst

clean:
	rm -f slides.pdf
