<xsl:stylesheet
    version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:local="local:local"
    exclude-result-prefixes="local">

    <xsl:output method="html" version="5.0" encoding="utf-8" indent="yes"/>
    <xsl:import href="header.xsl" />
    <xsl:import href="nav.xsl" />
    <xsl:import href="indexs.xsl" />
    <xsl:import href="functions.xsl" />

    <xsl:template match="/">
        <html>
        <xsl:copy-of select="$head"/>
        <body>     
            <xsl:copy-of select="$navbar"/>      
            <xsl:apply-templates/>
        </body>
        </html>
    </xsl:template>
    
    <xsl:template match="infos">
        <section class="section">
            <div class="container">
                <h1 class="title is-3">Master <xsl:value-of select="nom"/></h1>

                <hr/>
                <h2 class="title is-5">Résumé</h2>
                <xsl:copy-of select="resume/*"/>

                <hr/>
                <xsl:sequence select="local:listeParcours(//parcour)"/>

                <hr/>
                <xsl:sequence select="local:listeIntervenants(//intervenant[@id = current()/ref-intervenant/@ref])"/>
            </div>
        </section>
    </xsl:template>

    <xsl:template match="unites">
        <xsl:call-template name="indexUnites" />
        <xsl:for-each select="unite">
            <xsl:result-document href="{@id}.html">  
                <html>
                    <xsl:copy-of select="$head"/>
                    <body>
                    <xsl:copy-of select="$navbar"/>  
                        <section class="section">
                            <div class="container">
                                <h1 class="title"><xsl:value-of select="nom"/></h1>
                                <h2 class="subtitle"><xsl:value-of select="credits"/> crédits <xsl:value-of select="@role"/></h2>
                                <hr/>
                                <h2 class="title is-5">Résumé</h2>
                                <xsl:copy-of select="resume/*"/>
                                <hr/>                               
                                <xsl:sequence select="local:listeParcours(//parcour[@id = current()/ref-parcour/@ref])"/>
                                <hr/>
                                <xsl:sequence select="local:listeIntervenants(//intervenant[@id = current()/ref-intervenant/@ref])"/>
                            </div>
                        </section>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="groupes">
        <xsl:for-each select="groupe">
            <xsl:result-document href="{@id}.html">  
                <html>
                    <xsl:copy-of select="$head"/>
                    <body>
                    <xsl:copy-of select="$navbar"/>  
                        <section class="section">
                            <div class="container">
                                <h1 class="title"><xsl:value-of select="nom"/></h1>
                                <h2 class="subtitle"><xsl:value-of select="credits"/> crédits <xsl:value-of select="@role"/></h2>
                                <hr/>
                                <h2 class="title is-5">Unités a choisir</h2>
                                <div class="list is-hoverable">
                                    <xsl:for-each select="//unite[@id = current()/ref-unite/@ref]">
                                        <a href="{@id}.html" class="list-item"><xsl:value-of select="nom"/> (<xsl:value-of select="credits"/> crédits)</a>
                                    </xsl:for-each>
                                    <xsl:for-each select="//groupe[@id = current()/ref-groupe/@ref]">
                                        <a href="{@id}.html" class="list-item"><xsl:value-of select="nom"/> (<xsl:value-of select="credits"/> crédits)</a>
                                    </xsl:for-each>
                                </div>
                                <hr/>
                                <xsl:sequence select="local:listeParcours(//parcour[@id = current()/ref-parcour/@ref])"/>
                            </div>
                        </section>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="intervenants">
        <xsl:call-template name="indexIntervenants" />
        <xsl:for-each select="intervenant">
            <xsl:result-document href="{@id}.html">  
                <html>
                    <xsl:copy-of select="$head"/>
                    <body>
                        <xsl:copy-of select="$navbar"/>  
                        <section class="section">
                            <div class="container">
                                <h1 class="title"><xsl:value-of select="prenom"/>&#160;<xsl:value-of select="nom"/></h1>
                                <h3>Email: <xsl:value-of select="email"/></h3>
                                <hr/>
                                <h2 class="title is-4">Unités enseignées</h2>
                                <div class="list is-hoverable">
                                    <xsl:for-each select="//unite[ref-intervenant/@ref = current()/@id]">
                                        <a href="{@id}.html" class="list-item"><xsl:value-of select="nom"/></a>
                                    </xsl:for-each>
                                </div>
                            </div>
                        </section>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="parcours">
        <xsl:for-each select="parcour">
            <xsl:result-document href="{@id}.html" method="html">  
                <html>
                    <xsl:copy-of select="$head"/>
                    <body>
                        <xsl:copy-of select="$navbar"/>  
                        <section class="section">
                            <div class="container">
                                <h1 class="title"><xsl:value-of select="nom"/></h1>
                                <hr/>
                                <h2 class="title is-5">Résumé</h2>
                                <xsl:copy-of select="resume/*"/>
                                <hr/>
                                <xsl:sequence select="local:listeSemestres(//semestre[ref-parcour/@ref = current()/@id])"/>
                                <hr/>
                                <xsl:sequence select="local:listeIntervenants(//intervenant[@id = current()/ref-intervenant/@ref])"/>
                            </div>
                        </section>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="semestres">
        <xsl:for-each select="semestre">
            <xsl:result-document href="{@id}.html" method="html">  
                <html>
                    <xsl:copy-of select="$head"/>
                    <body>
                        <xsl:copy-of select="$navbar"/>  
                        <section class="section">
                            <div class="container">
                                <h1 class="title"><xsl:value-of select="nom"/></h1>
                                <hr/>
                                <h2 class="title is-5">Unités</h2>
                                <div class="list is-hoverable">
                                    <xsl:for-each select="//unite[@id = current()/ref-unite/@ref]">
                                        <a href="{@id}.html" class="list-item"><xsl:value-of select="nom"/></a>
                                    </xsl:for-each>
                                    <xsl:for-each select="//groupe[@id = current()/ref-groupe/@ref]">
                                        <a href="{@id}.html" class="list-item"><xsl:value-of select="nom"/> (<xsl:value-of select="credits"/> crédits)</a>
                                    </xsl:for-each>
                                </div>
                                <hr/>
                                <xsl:sequence select="local:listeParcours(//parcour[@id = current()/ref-parcour/@ref])"/>
                            </div>
                        </section>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>