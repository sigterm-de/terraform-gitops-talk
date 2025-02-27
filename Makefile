SOURCE=Presentation.md
TARGET=$(SOURCE:.md=.html)
PLUGINS="RevealHighlight" # RevealMermaid

.PHONY: all
all: build update_plugins


build:
	pandoc -o $(TARGET) $(SOURCE) \
		--from markdown+emoji \
		-t revealjs \
		--slide-level 2 --standalone \
		--lua-filter=filters.lua \
		-V height=1200 \
		-V width=1920 \
		-V hash=1 \
		-V history=1 \
		-V loop=1

update_plugins:
	@echo "Adding plugins to list..."
	@sed -i -E "/plugins: \[/a \ \ \ \ $(PLUGINS)," $(TARGET)
	@echo "Plugins updated in $(TARGET)."
