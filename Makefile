.PHONY: examples


CC = xelatex
MAIN_DIR = siddharth
OUTPUT_DIR = output
RESUME_DIR = $(MAIN_DIR)/resume
CV_DIR = $(MAIN_DIR)/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
NAME = SiddharthNair
DATE = $(shell date +%m%d%Y)


all: coverletter.pdf cv.pdf resume.pdf


resume.pdf: $(MAIN_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(MAIN_DIR) $<
	mkdir -p $(OUTPUT_DIR)
	cp $(MAIN_DIR)/resume.pdf $(OUTPUT_DIR)/$(NAME)_$(DATE)_resume.pdf


cv.pdf: $(MAIN_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(MAIN_DIR) $<
	mkdir -p $(OUTPUT_DIR)
	cp $(MAIN_DIR)/cv.pdf $(OUTPUT_DIR)/$(NAME)_$(DATE)_cv.pdf


coverletter.pdf: $(MAIN_DIR)/coverletter.tex
	$(CC) -output-directory=$(MAIN_DIR) $<
	mkdir -p $(OUTPUT_DIR)
	cp $(MAIN_DIR)/coverletter.pdf $(OUTPUT_DIR)/$(NAME)_$(DATE)_coverletter.pdf


clean:
	rm -rf $(MAIN_DIR)/*.pdf $(OUTPUT_DIR)/*.pdf
