<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">

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
</xsl:stylesheet>