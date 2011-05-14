all:

dist: dist/pdfcrowd-*.zip dist/pdfcrowd-*.tar.gz

dist/pdfcrowd-*.tar.gz dist/pdfcrowd-*.zip: setup.py pdfcrowd.py
	rm -rf dist/* build/* python/MANIFEST
	python setup.py clean && python setup.py sdist --formats=gztar,zip

test:
	python ./pdfcrowd.py $(API_USERNAME) $(API_TOKEN) $(API_HOSTNAME) $(API_HTTP_PORT) $(API_HTTPS_PORT)

.PHONY: clean
clean:
	rm -rf dist/* build/* python/MANIFEST
