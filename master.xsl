<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    <xsl:output method="html" encoding="utf-8" indent="yes" />

    <xsl:template match="/">
        <html>
        <xsl:copy-of select="$head"/>
        <body>
            <menu>
                <h1>Intervenants</h1>
                <ul>
                    <xsl:apply-templates select="//intervenant" mode="menuPages"/>
                </ul>
                <hr/>
                <h1>Parcours</h1>
                <ul>
                    <xsl:apply-templates select="//parcours" mode="menuPages"/>
                </ul>
                <hr/>
                <h1>Semestres</h1>
                <ul>
                    <xsl:apply-templates select="//semestre" mode="menuPages"/>
                </ul>
                <hr/>
                <h1>Unites</h1>
                <ul>
                    <xsl:apply-templates select="//ue" mode="menuPages"/>
                </ul>
            </menu>
            
            <xsl:call-template name="intervenantsPages" />
            
            <xsl:call-template name="unitesPages" />

            <xsl:call-template name="parcoursPages" />

            <xsl:call-template name="semestresPages" />
        </body>
        </html>
    </xsl:template>

    <xsl:variable name="head">
        <head>
            <link rel="stylesheet" href="../style.css" type="text/css" />
            <link rel="stylesheet" href="../normalize.css" type="text/css" />
            <title>SuperMaster2k20</title>
        </head>
    </xsl:variable>

    <xsl:template match="intervenant" mode="menuPages">
        <li><a href="{@id}.html"> <xsl:value-of select="nom"/></a></li>
    </xsl:template>

    <xsl:template match="ue" mode="menuPages">
        <li><a href="{id}.html"> <xsl:value-of select="nom"/></a></li>
    </xsl:template>

    <xsl:template match="parcours" mode="menuPages">
        <li><a href="{nom}.html"> <xsl:value-of select="nom"/></a></li>
    </xsl:template>

    <xsl:template match="semestre" mode="menuPages">
        <li><a href="{@id}.html"> <xsl:value-of select="@id"/></a></li>
    </xsl:template>

    <xsl:template match="ref-intervenant" mode="ref">
        <a href="{@ref}.html"> intervenant</a>
    </xsl:template>

    

    <xsl:template name="unitesPages">
        <xsl:for-each select="//ue">
            <xsl:document href="{id}.html">  
                <html>
                    <xsl:copy-of select="$head"/>
                    <body>
                    <form action="index.html">
                        <input type="submit" value="Retour" />
                    </form>
                    <h1>Unite: <xsl:value-of select="nom"/></h1>
                    <p id="{id}"><xsl:value-of select="string(resume)" /></p>
                    <xsl:apply-templates select="./ref-intervenant" mode="ref"/>
                    <hr/>
                    </body>
                </html>
            </xsl:document>
        </xsl:for-each>
    </xsl:template>

    <xsl:variable name="ue"  select="//ue[//intervenant/@id = ref-intervenant/@ref]" />

    <xsl:template name="intervenantsPages">
        <xsl:for-each select="//intervenant">
            <xsl:document href="{@id}.html">  
                <html>
                    <xsl:copy-of select="$head"/>
                    <body>
                        <form action="index.html">
                            <input type="submit" value="Retour" />
                        </form>
                        <h1>Nom: <xsl:value-of select="nom"/></h1>
                        <h3>Email: <xsl:value-of select="email"/></h3>
                        <h3>Site: <xsl:value-of select="siteweb"/></h3>
                        <hr/>
                        <h2>Unités enseignées</h2>
                        <xsl:for-each select="">
                            <a href="{id}.html"><xsl:value-of select="nom"/></a>
                        </xsl:for-each>
                        <hr/>
                    </body>
                </html>
            </xsl:document>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="parcoursPages">
        <xsl:for-each select="//parcours">
            <xsl:document href="{nom}.html">  
                <html>
                    <xsl:copy-of select="$head"/>
                    <body>
                        <form action="index.html">
                            <input type="submit" value="Retour" />
                        </form>
                        <h1>Nom: <xsl:value-of select="nom"/></h1>
                        <p>Resume: <xsl:value-of select="resume"/></p>
                        <hr/>
                    </body>
                </html>
            </xsl:document>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="semestresPages">
        <xsl:for-each select="//semestre">
            <xsl:document href="{@id}.html">  
                <html>
                    <xsl:copy-of select="$head"/>
                    <body>
                        <form action="index.html">
                            <input type="submit" value="Retour" />
                        </form>
                        <h1>Semestre:  <xsl:value-of select="@id"/></h1>
                        <ul>
                            <xsl:apply-templates select="ue" mode="menuPages"/>
                        </ul>
                        <hr/>
                    </body>
                </html>
            </xsl:document>
        </xsl:for-each>
    </xsl:template>

    

</xsl:stylesheet>