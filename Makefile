RM      = rm -rf
WEBDIR 	= www

all : dtd xsd web tidy xq 
	firefox $(WEBDIR)/index.html

convert :
	xsltproc -o master.xml converter.xsl donnees-master.xml

dtd :
	xmllint --valid --noout master.xml

xsd :
	xmllint --noout -schema master.xsd master.xml 

web : clean
	mkdir -p $(WEBDIR)
	cp -r resources/* $(WEBDIR)
	saxon -o:$(WEBDIR)/index.html -xsl:master.xsl master.xml 

tidy : 
	tidy -im -asxhtml $(WEBDIR)/*.html;

xq :
	java -cp $HOME/saxon9/saxon9he.jar net.sf.saxon.Query "-q:requete.xq"

clean :
	$(RM) $(WEBDIR)/*