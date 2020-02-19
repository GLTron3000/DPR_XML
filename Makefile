RM      = rm -rf
WEBDIR 	= www

convert :
	xsltproc -o master.xml converter.xsl donnees-master.xml

dtd :
	xmllint --valid --noout master.xml

xsd :
	xmllint -schema master.xml

web :
	mkdir -p $(WEBDIR)
	cp -r resources/* www
	xsltproc -o $(WEBDIR)/index.html master.xsl master.xml

tidy : 
	tidy -im -asxhtml -indent $(WEBDIR)/*

xq :
	java -cp $HOME/saxon9/saxon9he.jar net.sf.saxon.Query "-q:requete.xq"

all :
	dtd
	xsd
	web
	tidy
	xq
	firefox $(WEBDIR)/index.html

clean :
	$(RM) $(WEBDIR)/*