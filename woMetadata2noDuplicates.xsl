<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <!-- woMetadata2noDuplicates.xsl stylesheet created by Nikolaus Wasmoen, 7/23/2015, 
         for Woolf Online to be used to transform the wometadata.xml Mojoulem metadata 
         export file provided by Nick Hayward in fall 2014. 
         
         This stylesheet removes image objects for dual gallery/transcriptions objects 
         when more than one record exists for the same underlying object. 
     
         Should be merged with other WO RDF generation stylesheets in future. 
     
         Files for Woolf Online ModNets aggregation archived at:
         https://github.com/ModNetsRDF/WoolfOnline
 
         Contact: pm@modnets.org -->

    <xsl:template match="/">
        <pma_xml_export version="1.0">
            <database name="woolf-mojulem-summer">
                <xsl:for-each-group select="//table"
                    group-by="column[@name = 'content_description']">
                    <xsl:sort select="column[@name = 'content_description']"/>
                    <xsl:sort select="column[@name = 'taxa_subset']"/>
                    <xsl:for-each select="current-group()">
                        <xsl:if test="count(current-group()) = 1">
                            <xsl:copy-of select=".[position() = 1]"/>
                        </xsl:if>
                        <xsl:if test="count(current-group()) gt 1">
                            <xsl:copy-of select=".[contains(column[@name='taxa_subset'],'transcriptions')]"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:for-each-group>
            </database>
        </pma_xml_export>
    </xsl:template>

</xsl:stylesheet>
