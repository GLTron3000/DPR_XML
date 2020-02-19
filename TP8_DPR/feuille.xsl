<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0">

    <xsl:output indent="yes" />

    <xsl:template match="/">
        <resultats>
            <xsl:for-each select="()">
                <xsl:value-of select=""/>
            </xsl:for-each>
        </resultats>
    </xsl:template>

</xsl:stylesheet>