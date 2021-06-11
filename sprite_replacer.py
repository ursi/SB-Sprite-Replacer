from PIL import Image
import io
import os
import re
from shutil import copy

DSS_PATH = os.path.abspath(os.path.join('sprite-sheets', 'default'))
CSS_PATH = os.path.abspath(os.path.join('sprite-sheets', 'custom'))
TEXTURE_PATH = io.open('texture.txt').read()
spriteSheet = {'name': {}}
os.chdir('sprite-packs')
for texture in os.listdir(os.getcwd()):
	os.chdir(texture)
	for relSheet in os.listdir(os.getcwd()):
		os.chdir(relSheet)
		if relSheet not in spriteSheet:
			for defSpriteSheet in os.listdir(DSS_PATH):
				if re.match(relSheet, defSpriteSheet):
					spriteSheet['name'][relSheet] = defSpriteSheet
					spriteSheet[relSheet] = Image.open(os.path.join(DSS_PATH,defSpriteSheet))
		for sprite in os.listdir(os.getcwd()):
			coord = re.match('([0-9]+),([0-9]+)', sprite).groups()
			im = Image.open(sprite)
			spriteSheet[relSheet].paste(im, (int(coord[0]), int(coord[1])))
		os.chdir('..')
	os.chdir('..')
for css in spriteSheet:
	if css != 'name':
		spriteSheet[css].save(os.path.join(CSS_PATH, spriteSheet['name'][css]))
		if os.path.exists(TEXTURE_PATH):
			spriteSheet[css].save(os.path.join(TEXTURE_PATH, spriteSheet['name'][css]))
for css1 in os.listdir(CSS_PATH):
	keep = 0
	for css2 in spriteSheet:
		if re.match(css2, css1):
			keep = 1
			break
	if not keep:
		os.remove(os.path.join(CSS_PATH, css1))
		if os.path.exists(TEXTURE_PATH):
			copy(os.path.join(DSS_PATH, css1), TEXTURE_PATH)
