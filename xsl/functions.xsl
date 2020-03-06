<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:local="local:local"
    exclude-result-prefixes="local"
    version="2.0">

    <xsl:function name="local:listeIntervenants">
        <xsl:param name="intervenants" as="element(intervenant)*"/>

        <h2 class="title is-5">Responsables</h2>
        <div class="list is-hoverable">
            <xsl:for-each select="$intervenants" >
                <a href="{@id}.html" class="list-item"><xsl:value-of select="prenom"/>&#160;<xsl:value-of select="nom"/></a>
            </xsl:for-each>
        </div>
    </xsl:function>

    <xsl:function name="local:listeParcours">
        <xsl:param name="parcours" as="element(parcour)*"/>

        <h2 class="title is-5">Parcours</h2>
        <div class="list is-hoverable">
            <xsl:for-each select="$parcours">
                <a href="{@id}.html" class="list-item"><xsl:value-of select="nom-court"/></a>
            </xsl:for-each>
        </div>
    </xsl:function>

    <xsl:function name="local:listeSemestres">
        <xsl:param name="semestres" as="element(semestre)*"/>

        <h2 class="title is-5">Semestres</h2>
        <div class="list is-hoverable">
            <xsl:for-each select="$semestres">
                <a href="{@id}.html" class="list-item"><xsl:value-of select="nom"/></a>
            </xsl:for-each>
        </div>
    </xsl:function>

    <xsl:function name="local:listeUnites">
        <xsl:param name="unites" as="element(unite)*"/>

        <h2 class="title is-5">Semestres</h2>
        <div class="list is-hoverable">
            <xsl:for-each select="$unites">
                <a href="{@id}.html" class="list-item"><xsl:value-of select="nom"/></a>
            </xsl:for-each>
        </div>
    </xsl:function>

</xsl:stylesheet>