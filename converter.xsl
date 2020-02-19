<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   version="1.0">

   <xsl:output method="xml" indent="yes" doctype-system="master.dtd"/>

   <xsl:template match="/">
      <master>
         <xsl:for-each select="//objet[@type = 'mention']">
            <infos id="{@id}">
               <nom>
                  <xsl:value-of select="info[@nom='nom']/@value"/>
               </nom>
               <resume>
                  <xsl:copy-of select="info[@nom='contexte']/*"/>
               </resume>
               <xsl:for-each select="info[@nom='fils']">
                  <ref-parcour ref="{@value}" />
               </xsl:for-each>
               <xsl:for-each select="info[@nom='responsables']">
                  <ref-intervenant ref="{@ref}"/>
               </xsl:for-each>
            </infos>
         </xsl:for-each>
         <xsl:call-template name="personnes"/>
         <xsl:call-template name="parcours"/>
         <xsl:call-template name="semestres"/>
         <xsl:call-template name="unites"/>
      </master>
   </xsl:template>

   <xsl:template name="personnes">
        <intervenants>
         <xsl:for-each select="//objet[@type = 'personne']">
            <intervenant id="{@id}">
               <nom>
                  <xsl:value-of select="info[@nom='nom']/@value"/>
               </nom>
               <prenom>
                  <xsl:value-of select="info[@nom='prenom']/@value"/>
               </prenom>
               <email>
                  <xsl:value-of select="info[@nom='mail']/@value"/>
               </email>
            </intervenant>
         </xsl:for-each>
      </intervenants>
   </xsl:template>

   <xsl:template name="parcours">
        <parcours>
         <xsl:for-each select="//objet[@type = 'programme']">
            <parcour id="{@id}">
               <nom>
                  <xsl:value-of select="info[@nom='nom']/@value"/>
               </nom>
               <nom-court>
                  <xsl:value-of select="info[@nom='nom_court']/@value"/>
               </nom-court>
               <resume>
                  <xsl:copy-of select="info[@nom='objectifs']/*"/>
               </resume>
               <xsl:for-each select="info[@nom='responsables']">
                  <ref-intervenant ref="{@ref}"/>
               </xsl:for-each>
            </parcour>
         </xsl:for-each>
      </parcours>
   </xsl:template>

   <xsl:template name="semestres">
        <semestres>
         <xsl:for-each select="//objet[@type = 'semestre']">
            <semestre id="{@id}">
               <nom>
                  <xsl:value-of select="info[@nom='nom']/@value"/>
               </nom>
               <xsl:for-each select="info[@nom='fils']">
                  <ref-unite ref="{@value}" />
               </xsl:for-each>
               <xsl:for-each select="info[@nom='xref']">
                  <ref-parcour ref="{@value}" />
               </xsl:for-each>
            </semestre>
         </xsl:for-each>
      </semestres>
   </xsl:template>

   <xsl:template name="unites">
        <unites>
         <xsl:for-each select="//objet[@type = 'enseignement']">
            <unite id="{@id}" role="obligatoire">
               <nom>
                  <xsl:value-of select="info[@nom='nom']/@value"/>
               </nom>
               <credits>
                  <xsl:value-of select="info[@nom='nb_credits']/@value"/>
               </credits>
               <resume>
                  <xsl:copy-of select="info[@nom='contenu']/*"/>
               </resume>
               <xsl:for-each select="info[@nom='responsables']">
                  <ref-intervenant ref="{@ref}"/>
               </xsl:for-each>
               <xsl:for-each select="info[@nom='xref']">
                  <ref-parcour ref="{@value}" />
               </xsl:for-each>
            </unite>
         </xsl:for-each>
         <xsl:for-each select="//objet[@type = 'option']">
            <unite id="{@id}" role="option">
               <nom>
                  <xsl:value-of select="info[@nom='nom']/@value"/>
               </nom>
               <credits>
                  <xsl:value-of select="info[@nom='nb_credits']/@value"/>
               </credits>
               <resume>
                  <xsl:copy-of select="info[@nom='contenu']/*"/>
               </resume>
               <xsl:for-each select="info[@nom='responsables']">
                  <ref-intervenant ref="{@ref}"/>
               </xsl:for-each>
               <xsl:for-each select="info[@nom='xref']">
                  <ref-parcour ref="{@value}" />
               </xsl:for-each>
            </unite>
         </xsl:for-each>
      </unites>
   </xsl:template>

</xsl:stylesheet>