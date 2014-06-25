#!/usr/bin/env python3

import multiprocessing
import subprocess
import tempfile

lines = open("slides.rst").readlines()

def extractDiagramAndImageName(iterator):
    match = []
    matching = False
    for line in iterator:
        if not line.strip():
            continue
        if matching:
            if line.startswith(".. image::"):
                matching = False
                image = line[11:-1]
                yield ("".join(match), image)
                match = []
            else:
                match.append(line)
        if line == "..\n":
                matching = True

def create_diagram(args):
    diagram, image_name = args
    with tempfile.NamedTemporaryFile("wt") as diagram_file:
        diagram_file.write(diagram)
        diagram_file.flush()
        subprocess.call(["ditaa", "-s", "5", diagram_file.name, image_name])

with multiprocessing.Pool() as pool:
    pool.map(create_diagram, extractDiagramAndImageName(lines))
