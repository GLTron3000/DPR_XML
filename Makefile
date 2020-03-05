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
	java -cp saxon9/saxon9he.jar net.sf.saxon.Transform -xsl:master.xsl master.xml -o:$(WEBDIR)/index.html

tidy : 
	tidy -im -asxhtml $(WEBDIR)/*.html;

xq :
	mkdir -p $(WEBDIR)
	cp -r resources/* $(WEBDIR)
	java -cp saxon9/saxon9he.jar net.sf.saxon.Query -q:xq.txt -o:$(WEBDIR)/xq.html

clean :
	$(RM) $(WEBDIR)/*