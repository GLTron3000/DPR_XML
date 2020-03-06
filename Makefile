WEBNAV  = firefox
WEBDIR 	= www
LIBS    = binaries
RM      = rm -rf

all : dtd xsd web tidy xq 
	$(WEBNAV) $(WEBDIR)/index.html
	$(WEBNAV) $(WEBDIR)/xq.html

dtd :
	xmllint --valid --noout master.xml

xsd :
	xmllint --noout -schema master.xsd master.xml 

web : clean
	mkdir -p $(WEBDIR)
	cp -r resources/* $(WEBDIR)
	java -cp $(LIBS)/saxon9he.jar net.sf.saxon.Transform -xsl:xsl/master.xsl master.xml -o:$(WEBDIR)/index.html

tidy : 
	./$(LIBS)/tidy -im -asxhtml $(WEBDIR)/*.html;

xq :
	mkdir -p $(WEBDIR)
	cp -r resources/* $(WEBDIR)
	java -cp $(LIBS)/saxon9he.jar net.sf.saxon.Query -q:xq.txt -o:$(WEBDIR)/xq.html

clean :
	$(RM) $(WEBDIR)/*