index.html: src/*
	elm make --optimize src/*

run: index.html
	docker build -t diplomski .
	docker run -p 8000:80 diplomski
