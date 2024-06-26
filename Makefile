IMAGES_URL=https://cloud.uni-hamburg.de/s/ZndexSjSH9ZqxTG/download
IMAGES_ARCHIVE=version-control-course.zip
IMAGES_DIR=images/

.PHONY: preview
preview:
	quarto preview

.PHONY: render
render: clean images
	quarto render

.PHONY: deploy
deploy: clean images
	quarto publish gh-pages

.PHONY: images
images:
	wget $(IMAGES_URL) -O $(IMAGES_ARCHIVE)
	unzip -j -o $(IMAGES_ARCHIVE) -d $(IMAGES_DIR)
	rm -f $(IMAGES_ARCHIVE)

.PHONY: objectives
objectives: objectives.txt
	rm -rf ./objectives
	mkdir -p objectives
	wget -P ./objectives -i objectives.txt  

.PHONY: clean
clean:
	rm -rf _site $(IMAGES_DIR)*
