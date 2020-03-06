<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">

    <xsl:template name="indexUnites">
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

    <xsl:template name="indexIntervenants">
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