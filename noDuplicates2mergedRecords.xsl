<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <!-- navigationLinks2mergedRecords.xsl stylesheet created by Nikolaus 
        Wasmoen, 6/28/2015, for Woolf Online to transform the result of 
        noDuplicates2navigationLinks.xsl. This stylesheet merges records 
        for identical content_descriptions, such as the pages of a 
        periodical review that are not distinguished in Mojulem besides 
        their content_id numbers. This cleans up the apparent duplicate 
        entries in ModNets, where the WO content_id numbers are not 
        visible. 
        
        Updated, Nikolaus Wasmoen, 7/24/2015.
        
        Should be merged with other WO RDF generation stylesheets in future.        
        
        Files for Woolf Online ModNets aggregation archived at:
        https://github.com/ModNetsRDF/WoolfOnline
        
        Contact: pm@modnets.org -->

    <xsl:output indent="yes"/>

    <!-- distinctTable key used below to match all tables with identical 
        content_description -->

    <xsl:key name="distinctTable" match="table" use="column[@name = 'content_description']"/>


    <xsl:template match="/">
        <metadata_records_merged>

            <!-- columns -->

            <!-- run a for-each loop on each set of tables with 
                identical 'content_description' -->

            <xsl:for-each
                select="
                    //table[generate-id(.) = generate-id(key('distinctTable',
                    column[@name = 'content_description'])[1])]">

                
                
                <xsl:variable name="content_title" select="column[@name = 'content_title']"/>
                
                <xsl:variable name="content_description" select="column[@name = 'content_description']"/>
                
                <xsl:variable name="taxa" select="column[@name = 'taxa']"/>


                <!-- Discard records that do not have a URL, since these cannot be indexed. -->
                <xsl:if test="column[@name = 'url'] != ''">

                <!-- Discard "blank" or "Blank" pages, since these are not useful in the COLLEX index. -->
                    <xsl:if test="not(contains(column[@name = 'content_description'],'blank' or 'Blank'))"> 

                    <table>

                        <!-- add 'content_description' column using variable set within for-each loop, 
                            add "taxa" to content_description to reduce number of identically titled 
                            objects. -->

                        <column name="content_description">
                            <xsl:value-of select="$content_description"/>, <xsl:value-of
                                select="$taxa"/>
                        </column>

                        <!-- Multiple values only retained in columns where these 
                        are needed for further processing. Mutliple values 
                        separated by ", " except for "content_id", which 
                        uses "+"; this is so that we can see in output file where
                        objects represent merged records. -->

                        <column name="meta_id">
                            <xsl:for-each select="key('distinctTable', $content_description)">
                                <xsl:if test="position() != 1">, </xsl:if>
                                <xsl:value-of select="column[@name = 'meta_id']"/>
                            </xsl:for-each>
                        </column>
                        <column name="meta_subject">
                            <xsl:for-each
                                select="
                                    key('distinctTable',
                                    $content_description)">
                                <xsl:if test="position() = 1">
                                    <xsl:value-of select="column[@name = 'meta_subject']"/>
                                </xsl:if>
                            </xsl:for-each>
                        </column>
                        <column name="meta_source">
                            <xsl:for-each select="key('distinctTable', $content_description)">
                                <xsl:if test="position() = 1">
                                    <xsl:value-of select="column[@name = 'meta_source']"/>
                                </xsl:if>
                            </xsl:for-each>
                        </column>
                        <column name="meta_coverage">
                            <xsl:for-each select="key('distinctTable', $content_description)">
                                <xsl:if test="position() = 1">
                                    <xsl:value-of select="column[@name = 'meta_coverage']"/>
                                </xsl:if>
                            </xsl:for-each>
                        </column>
                        <column name="meta_creator">
                            <xsl:for-each
                                select="
                                    key('distinctTable',
                                    $content_description)">
                                <xsl:if test="position() = 1">
                                    <xsl:value-of select="column[@name = 'meta_creator']"/>
                                </xsl:if>
                            </xsl:for-each>
                        </column>
                        <column name="meta_publisher">
                            <xsl:for-each
                                select="
                                    key('distinctTable',
                                    $content_description)">
                                <xsl:if test="position() = 1">
                                    <xsl:value-of select="column[@name = 'meta_publisher']"/>
                                </xsl:if>
                            </xsl:for-each>
                        </column>
                        <column name="meta_contributor">
                            <xsl:for-each
                                select="
                                    key('distinctTable',
                                    $content_description)">
                                <xsl:if test="position() = 1">
                                    <xsl:value-of select="column[@name = 'meta_contributor']"/>
                                </xsl:if>
                            </xsl:for-each>
                        </column>
                        <column name="meta_rights_holder">
                            <xsl:for-each
                                select="
                                    key('distinctTable',
                                    $content_description)">
                                <xsl:if test="position() = 1">
                                    <xsl:value-of select="column[@name = 'meta_rights_holder']"/>
                                </xsl:if>
                            </xsl:for-each>
                        </column>
                        <column name="meta_date">
                            <xsl:for-each select="key('distinctTable', $content_description)">
                                <xsl:if test="position() = 1">
                                    <xsl:value-of select="column[@name = 'meta_date']"/>
                                </xsl:if>
                            </xsl:for-each>
                        </column>
                        <column name="meta_format">
                            <xsl:for-each
                                select="
                                    key('distinctTable',
                                    $content_description)">
                                <xsl:if test="position() != 1">, </xsl:if>
                                <xsl:value-of select="column[@name = 'meta_format']"/>
                            </xsl:for-each>
                        </column>
                        <column name="meta_provenance">
                            <xsl:for-each
                                select="
                                    key('distinctTable',
                                    $content_description)">
                                <xsl:if test="position() = 1">
                                    <xsl:value-of select="column[@name = 'meta_provenance']"/>
                                </xsl:if>
                            </xsl:for-each>
                        </column>
                        <column name="content_title">
                            <xsl:for-each
                                select="
                                    key('distinctTable',
                                    $content_description)">
                                <xsl:if test="position() = 1">
                                    <xsl:value-of select="column[@name = 'content_title']"/>
                                </xsl:if>
                            </xsl:for-each>
                        </column>

                        <!-- content_id values are included in generated @rdf:about 
                        values, so a "+" is used instead of ", " between them. This
                        allows us to see in output file which objects represent 
                        merged records. -->

                        <column name="content_id">
                            <xsl:for-each
                                select="
                                    key('distinctTable',
                                    $content_description)">
                                <xsl:if test="position() != 1">+</xsl:if>
                                <xsl:value-of select="column[@name = 'content_id']"/>
                            </xsl:for-each>
                        </column>
                        <column name="taxa">
                            <xsl:for-each
                                select="
                                    key('distinctTable',
                                    $content_description)">
                                <xsl:if test="position() = 1">
                                    <xsl:value-of select="column[@name = 'taxa']"/>
                                </xsl:if>
                            </xsl:for-each>
                        </column>
                        <column name="taxa_id">
                            <xsl:for-each
                                select="
                                    key('distinctTable',
                                    $content_description)">
                                <xsl:if test="position() = 1">
                                    <xsl:value-of select="column[@name = 'taxa_id']"/>
                                </xsl:if>
                            </xsl:for-each>
                        </column>
                        <column name="taxa_subset">
                            <xsl:for-each
                                select="
                                    key('distinctTable',
                                    $content_description)">
                                <xsl:if test="position() != 1">, </xsl:if>
                                <xsl:value-of select="column[@name = 'taxa_subset']"/>
                            </xsl:for-each>
                        </column>
                        <column name="taxa_root">
                            <xsl:for-each
                                select="
                                    key('distinctTable',
                                    $content_description)">
                                <xsl:if test="position() != 1">, </xsl:if>
                                <xsl:value-of select="column[@name = 'taxa_root']"/>
                            </xsl:for-each>
                        </column>
                        <column name="taxa_parent_id">
                            <xsl:for-each
                                select="
                                    key('distinctTable',
                                    $content_description)">
                                <xsl:if test="position() = 1">
                                    <xsl:value-of select="column[@name = 'taxa_parent_id']"/>
                                </xsl:if>
                            </xsl:for-each>
                        </column>
                        <column name="project">
                            <xsl:for-each
                                select="
                                    key('distinctTable',
                                    $content_description)">
                                <xsl:if test="position() = 1">
                                    <xsl:value-of select="column[@name = 'project']"/>
                                </xsl:if>
                            </xsl:for-each>
                        </column>
                        <column name="project_id">
                            <xsl:for-each
                                select="
                                    key('distinctTable',
                                    $content_description)">
                                <xsl:if test="position() = 1">
                                    <xsl:value-of select="column[@name = 'project_id']"/>
                                </xsl:if>
                            </xsl:for-each>
                        </column>
                        <column name="url">
                            <xsl:for-each
                                select="
                                    key('distinctTable',
                                    $content_description)">
                                <xsl:if test="position() != 1">,</xsl:if>
                                <xsl:value-of select="column[@name = 'url']"/>
                            </xsl:for-each>
                        </column>
                    </table>
                </xsl:if>
                </xsl:if>
            </xsl:for-each>
        </metadata_records_merged>
    </xsl:template>

</xsl:stylesheet>
