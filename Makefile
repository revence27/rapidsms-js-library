all: clientside.js
	true

marvin: tpt.py
	python tpt.py .

test:
	coffee --watch -cb .

clientside.js: clientside.coffee
	coffee -cb clientside.coffee
