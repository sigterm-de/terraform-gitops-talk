SOURCE=Presentation_pd.md
TARGET=$(SOURCE:.md=.html)
PLUGINS="RevealMermaid"

.PHONY: all
all: build update_plugins


build:
	pandoc -o $(TARGET) $(SOURCE) \
		-t revealjs \
		--slide-level 2 --standalone \
		--lua-filter=filters.lua \
		-V maxScale=1.1 \
		-V height=1024 \
		-V width=1920 \
		-V css=assets/custom.css   

update_plugins:
	@echo "Adding plugins to list..."
	@sed -i -E "/plugins: \[/a \ \ \ \ $(PLUGINS)," $(TARGET)
	@echo "Plugins updated in $(TARGET)."
