SOURCE=Presentation_pd

build:
	pandoc -o ${SOURCE}.html ${SOURCE}.md \
		-t revealjs \
		--slide-level 2 --standalone \
		--lua-filter=filters.lua \
		-V maxScale=1.1 \
		-V css=assets/custom.css
