SOURCE=Presentation.md
TARGET=$(SOURCE:.md=.html)

build:
	(cd pandoc && \
    	curl -s -o default.revealjs https://raw.githubusercontent.com/jgm/pandoc/refs/heads/main/data/templates/default.revealjs && \
    	patch < default.revealjs.patch)
	pandoc -o $(TARGET) $(SOURCE) --defaults pandoc/defaults.yaml

clean:
	rm pandoc/default.revealjs