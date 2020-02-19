<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    <xsl:output method="html" encoding="utf-8" indent="yes" />

    <xsl:template match="/">
        <html>
        <xsl:copy-of select="$head"/>
        <xsl:copy-of select="$navbar"/>
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
                    <xsl:apply-templates select="//unite" mode="menuPages"/>
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
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <title>UltraMaster2K20</title>
            <link rel="stylesheet" href="bulma.min.css" />
            <link rel="icon" href="favicon.ico" type="image/x-icon" />
            <script src="https://use.fontawesome.com/releases/v5.3.1/js/all.js" />
            <script src="script.js" />
        </head>
    </xsl:variable>

    <xsl:variable name="navbar">
        <nav class="navbar" role="navigation" aria-label="main navigation">
            <div class="navbar-brand">
                <a class="navbar-item" href="index.html">
                    <img src="logo.png" width="120" />
                </a>
            
                <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                </a>
            </div>
            
            <div id="navbarBasicExample" class="navbar-menu">
                <div class="navbar-start">
                    <a class="navbar-item" href="index.html">Accueil</a>
                    <div class="navbar-item has-dropdown is-hoverable">
                        <a class="navbar-link">Parcours</a>
                        <div class="navbar-dropdown">
                            <xsl:for-each select="//parcour">
                                <a class="navbar-item" href="{@id}.html"><xsl:copy-of select="nom-court"/></a>
                            </xsl:for-each>
                        </div>
                    </div>
                    <a class="navbar-item" href="unites.html">Unités d'enseignement</a>
                    <a class="navbar-item" href="intervenants.html">Intervenants</a>
                </div>
            </div>
        </nav>
    </xsl:variable>

    <xsl:template match="intervenant" mode="menuPages">
        <li><a href="{@id}.html"> <xsl:value-of select="nom"/></a></li>
    </xsl:template>

    <xsl:template match="unite" mode="menuPages">
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
        <xsl:for-each select="//unite">
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

    <xsl:variable name="unite"  select="//unite[//intervenant/@id = ref-intervenant/@ref]" />

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
                            <xsl:apply-templates select="unite" mode="menuPages"/>
                        </ul>
                        <hr/>
                    </body>
                </html>
            </xsl:document>
        </xsl:for-each>
    </xsl:template>

    

</xsl:stylesheet>