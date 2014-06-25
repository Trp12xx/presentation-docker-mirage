all:
	./create_diagrams.py
	pandoc --template=template.tex -f rst -t beamer -V colortheme=seagull -V fonttheme=professionalfonts -V fontsize=14pt --toc --slide-level 2 -o slides.pdf slides.rst

clean:
	rm -f slides.pdf
