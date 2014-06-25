all: diagrams tex

tex:
	pandoc --template=template.tex -f rst -t beamer -V colortheme=seagull -V fonttheme=professionalfonts -V fontsize=14pt --toc --slide-level 2 -o slides.pdf slides.rst

diagrams:
	python3 create_diagrams.py

clean:
	rm -f slides.pdf images/*.png
