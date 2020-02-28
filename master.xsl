<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    <xsl:output method="html" encoding="utf-8" indent="yes" />

    <xsl:template match="/">
        <xsl:apply-templates />
        <html>
        <xsl:copy-of select="$head"/>
        <body>     
            <xsl:copy-of select="$navbar"/>      
            <section class="section">
                <div class="container">
                    <h1 class="title is-3">Master <xsl:copy-of select="master/infos/nom"/></h1>

                    <hr/>
                    <h2 class="title is-5">Résumé</h2>
                    <xsl:copy-of select="master/infos/resume"/>

                    <hr/>
                    <h2 class="title is-5">Parcours types</h2>
                    <div class="list is-hoverable">
                        <xsl:for-each select="//parcour">
                            <a href="{@id}.html" class="list-item"><xsl:copy-of select="nom-court"/></a>
                        </xsl:for-each>
                    </div>

                    <hr/>
                    <h2 class="title is-5">Responsables</h2>
                    <div class="list is-hoverable">
                        <xsl:for-each select="//intervenant[@id = /master/infos/ref-intervenant/@ref]">
                            <a href="{@id}.html" class="list-item"><xsl:copy-of select="prenom"/> <xsl:copy-of select="nom"/></a>
                        </xsl:for-each>
                    </div>
                </div>
            </section>
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
            
                <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasic">
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                </a>
            </div>
            
            <div id="navbarBasic" class="navbar-menu">
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
        <li><a href="{@id}.html"> <xsl:value-of select="nom"/></a></li>
    </xsl:template>    

    <xsl:template match="unites">
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
                                <xsl:copy-of select="resume"/>
                                <hr/>
                                <h2 class="title is-5">Responsables</h2>
                                <div class="list is-hoverable">
                                    <xsl:for-each select="//intervenant[@id = current()/ref-intervenant/@ref]">
                                        <a href="{@id}.html" class="list-item"><xsl:copy-of select="prenom"/> <xsl:copy-of select="nom"/></a>
                                    </xsl:for-each>
                                </div>
                            </div>
                        </section>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

    <xsl:variable name="unite"  select="//unite[//intervenant/@id = ref-intervenant/@ref]" />

    <xsl:template match="intervenants">
        <xsl:for-each select="intervenant">
            <xsl:result-document href="{@id}.html">  
                <html>
                    <xsl:copy-of select="$head"/>
                    <body>
                        <xsl:copy-of select="$navbar"/>  
                        <section class="section">
                            <div class="container">
                                <h1 class="title"><xsl:copy-of select="prenom"/> <xsl:copy-of select="nom"/></h1>
                                <h3>Email: <xsl:value-of select="email"/></h3>
                                <hr/>
                                <h2 class="title is-4">Unités enseignées</h2>
                                <div class="list is-hoverable">
                                    <xsl:for-each select="//unite[ref-intervenant/@ref = current()/@id]">
                                        <a href="{@id}.html" class="list-item"><xsl:copy-of select="nom"/></a>
                                    </xsl:for-each>
                                </div>
                                <hr/>
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
                                <xsl:copy-of select="resume"/>
                                <hr/>
                                <h2 class="title is-5">Semestres</h2>
                                <div class="list is-hoverable">
                                    <xsl:for-each select="//semestre[ref-parcour/@ref = current()/@id]">
                                        <a href="{@id}.html" class="list-item"><xsl:copy-of select="nom"/></a>
                                    </xsl:for-each>
                                </div>
                                <hr/>
                                <h2 class="title is-5">Responsables</h2>
                                <div class="list is-hoverable">
                                    <xsl:for-each select="//intervenant[@id = current()/ref-intervenant/@ref]">
                                        <a href="{@id}.html" class="list-item"><xsl:copy-of select="prenom"/> <xsl:copy-of select="nom"/></a>
                                    </xsl:for-each>
                                </div>
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
                                        <a href="{@id}.html" class="list-item"><xsl:copy-of select="nom"/></a>
                                    </xsl:for-each>
                                </div>
                                <hr/>
                                <h2 class="title is-5">Parcours</h2>
                                <div class="list is-hoverable">
                                    <xsl:for-each select="//parcour[@id = current()/ref-parcour/@ref]">
                                        <a href="{@id}.html" class="list-item"><xsl:copy-of select="nom"/></a>
                                    </xsl:for-each>
                                </div>
                                <hr/>
                            </div>
                        </section>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

    

</xsl:stylesheet>