<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    <xsl:output method="html" version="5.0" encoding="utf-8" indent="yes" />

    <xsl:template match="/">
        <html>
        <xsl:copy-of select="$head"/>
        <body>     
            <xsl:copy-of select="$navbar"/>      
            <xsl:apply-templates/>
        </body>
        </html>
    </xsl:template>

    <xsl:variable name="head">
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <title>UltraMaster2K20</title>
            <link rel="stylesheet" href="bulma.min.css" />
            <link rel="icon" href="favicon.ico" type="image/x-icon" />
        </head>
    </xsl:variable>

    <xsl:variable name="navbar">
        <nav class="navbar" role="navigation" aria-label="main navigation">
            <div class="navbar-brand">
                <a class="navbar-item" href="index.html">
                    <img src="logo.png" alt="AMU" width="120" />
                </a>
            
                <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasic"/>
            </div>
            
            <div id="navbarBasic" class="navbar-menu">
                <div class="navbar-start">
                    <a class="navbar-item" href="index.html">Accueil</a>
                    <div class="navbar-item has-dropdown is-hoverable">
                        <a class="navbar-link">Parcours</a>
                        <div class="navbar-dropdown">
                            <xsl:for-each select="//parcour">
                                <a class="navbar-item" href="{@id}.html"><xsl:value-of select="nom-court"/></a>
                            </xsl:for-each>
                        </div>
                    </div>
                    <a class="navbar-item" href="unites.html">Unités d'enseignement</a>
                    <a class="navbar-item" href="intervenants.html">Intervenants</a>
                </div>
            </div>
        </nav>
    </xsl:variable>

    <xsl:template match="infos">
        <section class="section">
            <div class="container">
                <h1 class="title is-3">Master <xsl:value-of select="nom"/></h1>

                <hr/>
                <h2 class="title is-5">Résumé</h2>
                <xsl:copy-of select="resume/*"/>

                <hr/>
                <h2 class="title is-5">Parcours types</h2>
                <div class="list is-hoverable">
                    <xsl:for-each select="//parcour">
                        <a href="{@id}.html" class="list-item"><xsl:value-of select="nom-court"/></a>
                    </xsl:for-each>
                </div>

                <hr/>
                <h2 class="title is-5">Responsables</h2>
                <div class="list is-hoverable">
                    <xsl:for-each select="//intervenant[@id = current()/ref-intervenant/@ref]">
                        <a href="{@id}.html" class="list-item"><xsl:value-of select="prenom"/>&#160;<xsl:value-of select="nom"/></a>
                    </xsl:for-each>
                </div>
            </div>
        </section>
    </xsl:template>

    <xsl:template match="unites">
        <xsl:call-template name="listeUnites" />
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
                                <h2 class="title is-5">Parcours</h2>
                                <div class="list is-hoverable">
                                    <xsl:for-each select="//parcour[@id = current()/ref-parcour/@ref]">
                                        <a href="{@id}.html" class="list-item"><xsl:value-of select="nom-court"/></a>
                                    </xsl:for-each>
                                </div>
                                <hr/>
                                <h2 class="title is-5">Responsables</h2>
                                <div class="list is-hoverable">
                                    <xsl:for-each select="//intervenant[@id = current()/ref-intervenant/@ref]">
                                        <a href="{@id}.html" class="list-item"><xsl:value-of select="prenom"/>&#160;<xsl:value-of select="nom"/></a>
                                    </xsl:for-each>
                                </div>
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
                                <h2 class="title is-5">Parcours</h2>
                                <div class="list is-hoverable">
                                    <xsl:for-each select="//parcour[@id = current()/ref-parcour/@ref]">
                                        <a href="{@id}.html" class="list-item"><xsl:value-of select="nom-court"/></a>
                                    </xsl:for-each>
                                </div>
                            </div>
                        </section>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="intervenants">
        <xsl:call-template name="listeIntervenants" />
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
                                <h2 class="title is-5">Semestres</h2>
                                <div class="list is-hoverable">
                                    <xsl:for-each select="//semestre[ref-parcour/@ref = current()/@id]">
                                        <a href="{@id}.html" class="list-item"><xsl:value-of select="nom"/></a>
                                    </xsl:for-each>
                                </div>
                                <hr/>
                                <h2 class="title is-5">Responsables</h2>
                                <div class="list is-hoverable">
                                    <xsl:for-each select="//intervenant[@id = current()/ref-intervenant/@ref]">
                                        <a href="{@id}.html" class="list-item"><xsl:value-of select="prenom"/>&#160;<xsl:value-of select="nom"/></a>
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
                                        <a href="{@id}.html" class="list-item"><xsl:value-of select="nom"/></a>
                                    </xsl:for-each>
                                    <xsl:for-each select="//groupe[@id = current()/ref-groupe/@ref]">
                                        <a href="{@id}.html" class="list-item"><xsl:value-of select="nom"/> (<xsl:value-of select="credits"/> crédits)</a>
                                    </xsl:for-each>
                                </div>
                                <hr/>
                                <h2 class="title is-5">Parcours</h2>
                                <div class="list is-hoverable">
                                    <xsl:for-each select="//parcour[@id = current()/ref-parcour/@ref]">
                                        <a href="{@id}.html" class="list-item"><xsl:value-of select="nom-court"/></a>
                                    </xsl:for-each>
                                </div>
                            </div>
                        </section>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="listeUnites">
        <xsl:result-document href="unites.html">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>  
                    <section class="section">
                        <div class="container">
                            <h1 class="title">Unités d'enseignement</h1>
                            <table class="table is-striped is-hoverable">
                                <thead>
                                    <tr>
                                        <th>Nom</th>
                                        <th>Crédits</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <xsl:for-each select="//unite">
                                        <xsl:sort select="nom"/>
                                        <tr>
                                            <td><xsl:value-of select="nom"/></td>
                                            <td><xsl:value-of select="credits"/></td>
                                            <td><a class="button" href="{@id}.html">Détail</a></td>
                                        </tr>
                                    </xsl:for-each>
                                </tbody>
                            </table>
                        </div>
                    </section>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <xsl:template name="listeIntervenants">
        <xsl:result-document href="intervenants.html">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>  
                    <section class="section">
                        <div class="container">
                            <h1 class="title">Intervenants</h1>
                            <table class="table is-striped is-hoverable">
                                <thead>
                                    <tr>
                                        <th>Prenom</th>
                                        <th>Nom</th>
                                        <th>Email</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <xsl:for-each select="//intervenant">
                                        <xsl:sort select="nom"/>
                                        <tr>
                                            <td><xsl:value-of select="prenom"/></td>
                                            <td><xsl:value-of select="nom"/></td>
                                            <td><xsl:value-of select="email"/></td>
                                            <td><a class="button" href="{@id}.html">Détail</a></td>
                                        </tr>
                                    </xsl:for-each>
                                </tbody>
                            </table>
                        </div>
                    </section>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

</xsl:stylesheet>