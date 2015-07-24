<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <!-- noDuplicates2navigationLinks.xsl stylesheet created by Nikolaus 
         Wasmoen, 7/23/2015, for Woolf Online to be used to transform the 
         noDuplicates.xml files generated using the woMedata2noDuplicates.xsl 
         stylesheet. This stylesheet adds the &pos= operator to the 'url'
         column values by sorting each work/collection with the taxonomy IDs
         to determine each object's relative position within its parent group,
         starting at zero. Objects without valid URLs or taxa_subset values
         are discarded in the next step, so the output to those objects does
         not matter. 
         
         Should be merged with other WO RDF generation stylesheets in future.
         
         Files for Woolf Online ModNets aggregation archived at:
         https://github.com/ModNetsRDF/WoolfOnline
         Contact: pm@modnets.org -->
    

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <pma_xml_export version="1.0">
            <database name="woolf-mojulem-summer">
                <xsl:for-each-group select="//table" group-by="column[@name = 'taxa_parent_id']">
                    <xsl:sort select="column[@name = 'taxa_parent_id']"/>
                    <xsl:for-each-group select="current-group()"
                        group-by="column[@name = 'taxa_id']">
                        <xsl:sort select="column[@name = 'taxa_id']"/>
                        <xsl:sort select="column[@name = 'content_id']"/>
                        <xsl:for-each select="current-group()">
                            <xsl:call-template name="table"/>
                        </xsl:for-each>
                    </xsl:for-each-group>
                </xsl:for-each-group>
            </database>
        </pma_xml_export>
    </xsl:template>
    <xsl:template match="table" name="table">
        <xsl:param name="position" select="position()"/>
        <table>
            <column name="meta_id">
                <xsl:value-of select="column[@name = 'meta_id']"/>
            </column>
            <column name="meta_subject">
                <xsl:value-of select="column[@name = 'meta_subject']"/>
            </column>
            <column name="meta_source">
                <xsl:value-of select="column[@name = 'meta_source']"/>
            </column>
            <column name="meta_coverage">
                <xsl:value-of select="column[@name = 'meta_coverage']"/>
            </column>
            <column name="meta_creator">
                <xsl:value-of select="column[@name = 'meta_creator']"/>
            </column>
            <column name="meta_publisher">
                <xsl:value-of select="column[@name = 'meta_publisher']"/>
            </column>
            <column name="meta_contributor">
                <xsl:value-of select="column[@name = 'meta_contributor']"/>
            </column>
            <column name="meta_rights_holder">
                <xsl:value-of select="column[@name = 'meta_rights_holder']"/>
            </column>
            <column name="meta_date">
                <xsl:value-of select="column[@name = 'meta_date']"/>
            </column>
            <column name="meta_format">
                <xsl:value-of select="column[@name = 'meta_format']"/>
            </column>
            <column name="meta_provenance">
                <xsl:value-of select="column[@name = 'meta_provenance']"/>
            </column>
            <column name="content_title">
                <xsl:value-of select="column[@name = 'content_title']"/>
            </column>
            <column name="content_id">
                <xsl:value-of select="column[@name = 'content_id']"/>
            </column>
            <column name="content_description">
                <xsl:value-of select="column[@name = 'content_description']"/>
            </column>
            <column name="taxa">
                <xsl:value-of select="column[@name = 'taxa']"/>
            </column>
            <column name="taxa_id">
                <xsl:value-of select="column[@name = 'taxa_id']"/>
            </column>
            <column name="taxa_subset">
                <xsl:value-of select="column[@name = 'taxa_subset']"/>
            </column>
            <column name="taxa_root">
                <xsl:value-of select="column[@name = 'taxa_root']"/>
            </column>
            <column name="taxa_parent_id">
                <xsl:value-of select="column[@name = 'taxa_parent_id']"/>
            </column>
            <column name="project">
                <xsl:value-of select="column[@name = 'project']"/>
            </column>
            <column name="project_id">
                <xsl:value-of select="column[@name = 'project_id']"/>
            </column>
            <column name="url"><xsl:value-of select="column[@name = 'url']"/>&amp;pos=<xsl:value-of
                    select="position() - 1"/></column>
        </table>
    </xsl:template>
</xsl:stylesheet>
