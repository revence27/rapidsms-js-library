ACTIVE_DIR=../display
ACTIVE_FILE=pregnancy.html

all: clientside.js
	true

marvin: tpt.py
	make ACTIVE_DIR=../dashboards/html test

test: tpt.py
	python tpt.py $(ACTIVE_DIR) $(ACTIVE_FILE)

coffee:
	coffee --watch -cb .

clientside.js: clientside.coffee
	coffee -cb clientside.coffee
