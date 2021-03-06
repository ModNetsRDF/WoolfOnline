<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/" xmlns:collex="http://www.collex.org/schema#"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:role="http://www.loc.gov/loc.terms/relators/"
    xmlns:wo="http://www.woolfonline.com/schema#" exclude-result-prefixes="xs" version="2.0">


    <!-- navigationLinks2mergedRecords.xsl stylesheet created by Nikolaus 
        Wasmoen, 6/28/2015, for Woolf Online to transform the result of 
        noDuplicates2mergedRecords.xsl. This stylesheet generates ModNets
        RDF. 
        
        Updated, Nikolaus Wasmoen, 7/24/2015.
        
        Should be merged with other WO RDF generation stylesheets in future.        
        
        Files for Woolf Online ModNets aggregation archived at:
        https://github.com/ModNetsRDF/WoolfOnline
        
        Contact: pm@modnets.org -->


    <xsl:output method="xml" encoding="utf-8" indent="yes"/>


    <!-- GLOBAL VARIABLES 
    
        federation, disciplines, and freeculture set globally using $disciplines variable. 
        To assign separately to each object, declare this variable within the local context. -->

    <!-- Collex REQUIRES one or more federation ids. -->

    <xsl:variable name="federation-id">ModNets</xsl:variable>

    <!-- Collex REQUIRES one archive. -->

    <xsl:variable name="archive">
        <collex:archive>woolf_ol</collex:archive>
    </xsl:variable>

    <!-- Collex REQUIRES one or more disciplines. -->

    <xsl:variable name="disciplines">
        <collex:discipline>Literature</collex:discipline>
    </xsl:variable>

    <!-- Collex does not require freeculture element. If not present, default value is "True". -->
    <xsl:variable name="freeculture">
        <collex:freeculture>True</collex:freeculture>
    </xsl:variable>

    <!-- Woolf Online Collection Objects 
        
        Eventually we should either generate these with the rest of the metadata, or pull these from a 
        separate XML document or other separately maintained resource. -->

    <xsl:variable name="Berg_Materials">Berg_Materials_Notes_For_Writing</xsl:variable>
    <xsl:variable name="Typescript_Of_Time_Passes">Typescript_Of_Time_Passes</xsl:variable>
    <xsl:variable name="Le_Temps_Passe">Le_Temps_Passe</xsl:variable>
    <xsl:variable name="Proofs_Complete_Set">Proofs_Complete_Set</xsl:variable>
    <xsl:variable name="Proofs_Second_Copy_Gatherings">Proofs_Second_Copy_Gatherings</xsl:variable>
    <xsl:variable name="USA_1st_Edition">USA_1st_Edition</xsl:variable>
    <xsl:variable name="GB_1st_Edition">GB_1st_Edition</xsl:variable>
    <xsl:variable name="Uniform_Edition">Uniform_Edition</xsl:variable>
    <xsl:variable name="Everyman_Edition">Everyman_Edition</xsl:variable>
    <xsl:variable name="Albatross_Edition">Albatross_Edition</xsl:variable>
    <xsl:variable name="Sketch_of_the_Past_MS">Sketch_of_the_Past_Manuscript</xsl:variable>
    <xsl:variable name="Sketch_of_the_Past_TS">Sketch_of_the_Past_Typescript</xsl:variable>



    <!-- TEMPLATES -->

    <!-- These "*/text()" templates remove empty lines and spaces from the output -->

    <xsl:template match="*/text()[normalize-space()]">
        <xsl:value-of select="normalize-space()"/>
    </xsl:template>

    <xsl:template match="*/text()[not(normalize-space())]"/>


    <!-- RDF root element is REQUIRED -->

    <xsl:template match="/">
        <rdf:RDF>

            <!-- Collection objects added directly to the template. These collection objects do not exist in the Mojulem
                 metadata file. -->

            <wo:Description rdf:about="http://woolfonline.com/{$Berg_Materials}">
                <collex:federation>ModNets</collex:federation>
                <collex:archive>woolf_ol</collex:archive>
                <collex:discipline>Literature</collex:discipline>
                <collex:freeculture>True</collex:freeculture>
                <collex:genre>Fiction</collex:genre>
                <collex:source_html
                    rdf:resource="http://woolfonline.com/?node=content/image/gallery&amp;project=1&amp;parent=6&amp;taxa=16"/>
                <rdfs:seeAlso
                    rdf:resource="http://woolfonline.com/?node=content/image/gallery&amp;project=1&amp;parent=6&amp;taxa=16"/>
                <dc:title>Berg Materials: Notes For Writing &amp; Notebooks I-III</dc:title>
                <dc:type>Manuscript</dc:type>
                <dc:type>Collection</dc:type>
                <dc:date>1925</dc:date>
                <dc:subject>fiction</dc:subject>
                <role:AUT>Virginia Woolf</role:AUT>
                <role:CRE>Virginia Woolf</role:CRE>
                <role:RPS>New York Public Library</role:RPS>
            </wo:Description>
            <wo:Description rdf:about="http://woolfonline.com/{$Typescript_Of_Time_Passes}">
                <collex:federation>ModNets</collex:federation>
                <collex:archive>woolf_ol</collex:archive>
                <collex:discipline>Literature</collex:discipline>
                <collex:freeculture>True</collex:freeculture>
                <collex:genre>Fiction</collex:genre>
                <collex:source_html
                    rdf:resource="http://woolfonline.com/?node=content/image/gallery&amp;project=1&amp;parent=2&amp;taxa=17"/>
                <rdfs:seeAlso
                    rdf:resource="http://woolfonline.com/?node=content/image/gallery&amp;project=1&amp;parent=2&amp;taxa=17"/>
                <dc:title>Typescript of 'Time Passes' by Virginia Woolf</dc:title>
                <dc:type>Typescript</dc:type>
                <dc:type>Collection</dc:type>
                <dc:date>1926</dc:date>
                <dc:subject>fiction</dc:subject>
                <role:AUT>Virginia Woolf</role:AUT>
                <role:CRE>Virginia Woolf</role:CRE>
                <role:RPS>Mauron Estate</role:RPS>
                <role:OWN>Mauron Estate</role:OWN>
            </wo:Description>
            <wo:Description rdf:about="http://woolfonline.com/{$Le_Temps_Passe}">
                <collex:federation>ModNets</collex:federation>
                <collex:archive>woolf_ol</collex:archive>
                <collex:discipline>Literature</collex:discipline>
                <collex:freeculture>True</collex:freeculture>
                <collex:genre>Fiction</collex:genre>
                <collex:source_html
                    rdf:resource="http://woolfonline.com/?node=content/image/gallery&amp;project=1&amp;parent=60&amp;taxa=25"/>
                <rdfs:seeAlso
                    rdf:resource="http://woolfonline.com/?node=content/image/gallery&amp;project=1&amp;parent=60&amp;taxa=25"/>
                <dc:title>Commerce: Le Temps Passe</dc:title>
                <dc:type>Periodical</dc:type>
                <dc:type>Collection</dc:type>
                <dc:date>1926</dc:date>
                <dc:subject>fiction</dc:subject>
                <role:AUT>Virginia Woolf</role:AUT>
                <role:CRE>Virginia Woolf</role:CRE>
                <role:RPS> Smith College Libraries</role:RPS>
            </wo:Description>
            <wo:Description rdf:about="http://woolfonline.com/{$Proofs_Complete_Set}">
                <collex:federation>ModNets</collex:federation>
                <collex:archive>woolf_ol</collex:archive>
                <collex:discipline>Literature</collex:discipline>
                <collex:freeculture>True</collex:freeculture>
                <collex:genre>Fiction</collex:genre>
                <collex:source_html
                    rdf:resource="http://woolfonline.com/?node=content/image/gallery&amp;project=1&amp;parent=2&amp;taxa=18"/>
                <rdfs:seeAlso
                    rdf:resource="http://woolfonline.com/?node=content/image/gallery&amp;project=1&amp;parent=2&amp;taxa=18"/>
                <dc:title>To The Lighthouse: Proofs, Complete Set</dc:title>
                <dc:type>Typescript</dc:type>
                <dc:type>Collection</dc:type>
                <dc:date>1927</dc:date>
                <dc:subject>fiction</dc:subject>
                <role:AUT>Virginia Woolf</role:AUT>
                <role:CRE>Virginia Woolf</role:CRE>
                <role:RPS>Smith College Libraries</role:RPS>
            </wo:Description>
            <wo:Description rdf:about="http://woolfonline.com/{$Proofs_Second_Copy_Gatherings}">
                <collex:federation>ModNets</collex:federation>
                <collex:archive>woolf_ol</collex:archive>
                <collex:discipline>Literature</collex:discipline>
                <collex:freeculture>True</collex:freeculture>
                <collex:genre>Fiction</collex:genre>
                <collex:source_html
                    rdf:resource="http://woolfonline.com/?node=content/image/gallery&amp;project=1&amp;parent=18&amp;taxa=27"/>
                <rdfs:seeAlso
                    rdf:resource="http://woolfonline.com/?node=content/image/gallery&amp;project=1&amp;parent=18&amp;taxa=27"/>
                <dc:title>To The Lighthouse: Proofs, Second Copy Gatherings S-U</dc:title>
                <dc:type>Codex</dc:type>
                <dc:type>Collection</dc:type>
                <dc:date>1927</dc:date>
                <dc:subject>fiction</dc:subject>
                <role:AUT>Virginia Woolf</role:AUT>
                <role:CRE>Virginia Woolf</role:CRE>
                <role:RPS>Smith College Libraries</role:RPS>
            </wo:Description>
            <wo:Description rdf:about="http://woolfonline.com/{$USA_1st_Edition}">
                <collex:federation>ModNets</collex:federation>
                <collex:archive>woolf_ol</collex:archive>
                <collex:discipline>Literature</collex:discipline>
                <collex:freeculture>True</collex:freeculture>
                <collex:genre>Fiction</collex:genre>
                <collex:source_html
                    rdf:resource="http://woolfonline.com/?node=content&amp;project=1&amp;taxa=19"/>
                <rdfs:seeAlso
                    rdf:resource="http://woolfonline.com/?node=content&amp;project=1&amp;taxa=19"/>
                <dc:title>To The Lighthouse, USA 1st Edition</dc:title>
                <dc:type>Codex</dc:type>
                <dc:type>Collection</dc:type>
                <dc:date>1927</dc:date>
                <dc:subject>fiction</dc:subject>
                <role:AUT>Virginia Woolf</role:AUT>
                <role:CRE>Virginia Woolf</role:CRE>
                <role:PBL>Harcourt, Brace &amp; Company</role:PBL>
            </wo:Description>
            <wo:Description rdf:about="http://woolfonline.com/{$GB_1st_Edition}">
                <collex:federation>ModNets</collex:federation>
                <collex:archive>woolf_ol</collex:archive>
                <collex:discipline>Literature</collex:discipline>
                <collex:freeculture>True</collex:freeculture>
                <collex:genre>Fiction</collex:genre>
                <collex:source_html
                    rdf:resource="http://woolfonline.com/?node=content&amp;project=1&amp;taxa=20"/>
                <rdfs:seeAlso
                    rdf:resource="http://woolfonline.com/?node=content&amp;project=1&amp;taxa=20"/>
                <dc:title>To The Lighthouse, GB 1st Edition</dc:title>
                <dc:type>Codex</dc:type>
                <dc:type>Collection</dc:type>
                <dc:date>1927</dc:date>
                <dc:subject>fiction</dc:subject>
                <role:AUT>Virginia Woolf</role:AUT>
                <role:CRE>Virginia Woolf</role:CRE>
                <role:PBL>R &amp; R Clark Limited</role:PBL>
            </wo:Description>
            <wo:Description rdf:about="http://woolfonline.com/{$Uniform_Edition}">
                <collex:federation>ModNets</collex:federation>
                <collex:archive>woolf_ol</collex:archive>
                <collex:discipline>Literature</collex:discipline>
                <collex:freeculture>True</collex:freeculture>
                <collex:genre>Fiction</collex:genre>
                <collex:source_html
                    rdf:resource="http://woolfonline.com/?node=content&amp;project=1&amp;taxa=21"/>
                <rdfs:seeAlso
                    rdf:resource="http://woolfonline.com/?node=content&amp;project=1&amp;taxa=21"/>
                <dc:title>To The Lighthouse, Uniform Edition</dc:title>
                <dc:type>Codex</dc:type>
                <dc:type>Collection</dc:type>
                <dc:date>1932</dc:date>
                <dc:subject>fiction</dc:subject>
                <role:AUT>Virginia Woolf</role:AUT>
                <role:CRE>Virginia Woolf</role:CRE>
                <role:PBL>The Hogarth Press</role:PBL>
            </wo:Description>
            <wo:Description rdf:about="http://woolfonline.com/{$Everyman_Edition}">
                <collex:federation>ModNets</collex:federation>
                <collex:archive>woolf_ol</collex:archive>
                <collex:discipline>Literature</collex:discipline>
                <collex:freeculture>True</collex:freeculture>
                <collex:genre>Fiction</collex:genre>
                <collex:source_html
                    rdf:resource="http://woolfonline.com/?node=content&amp;project=1&amp;taxa=22"/>
                <rdfs:seeAlso
                    rdf:resource="http://woolfonline.com/?node=content&amp;project=1&amp;taxa=22"/>
                <dc:title>To The Lighthouse, Everyman Edition</dc:title>
                <dc:type>Codex</dc:type>
                <dc:type>Collection</dc:type>
                <dc:date>1952</dc:date>
                <dc:subject>fiction</dc:subject>
                <role:AUT>Virginia Woolf</role:AUT>
                <role:CRE>Virginia Woolf</role:CRE>
                <role:PBL>J. M. Dent &amp; Sons LTD</role:PBL>
            </wo:Description>
            <wo:Description rdf:about="http://woolfonline.com/{$Albatross_Edition}">
                <collex:federation>ModNets</collex:federation>
                <collex:archive>woolf_ol</collex:archive>
                <collex:discipline>Literature</collex:discipline>
                <collex:freeculture>True</collex:freeculture>
                <collex:genre>Fiction</collex:genre>
                <collex:source_html
                    rdf:resource="http://woolfonline.com/?node=content&amp;project=1&amp;taxa=23"/>
                <rdfs:seeAlso
                    rdf:resource="http://woolfonline.com/?node=content&amp;project=1&amp;taxa=23"/>
                <dc:title>To The Lighthouse, Albatross Edition</dc:title>
                <dc:type>Codex</dc:type>
                <dc:type>Collection</dc:type>
                <dc:date>1932</dc:date>
                <dc:subject>fiction</dc:subject>
                <role:AUT>Virginia Woolf</role:AUT>
                <role:CRE>Virginia Woolf</role:CRE>
                <role:PBL>The Albatross</role:PBL>
            </wo:Description>
            <wo:Description rdf:about="http://woolfonline.com/{$Sketch_of_the_Past_MS}">
                <collex:federation>ModNets</collex:federation>
                <collex:archive>woolf_ol</collex:archive>
                <collex:discipline>Literature</collex:discipline>
                <collex:freeculture>True</collex:freeculture>
                <collex:genre>Life Writing</collex:genre>
                <collex:source_html
                    rdf:resource="http://woolfonline.com/?node=content/image/gallery&amp;project=1&amp;parent=57&amp;taxa=58"/>
                <rdfs:seeAlso
                    rdf:resource="http://woolfonline.com/?node=content/image/gallery&amp;project=1&amp;parent=57&amp;taxa=58"/>
                <dc:title>A Sketch of the Past, Manuscript</dc:title>
                <dc:type>Manuscript</dc:type>
                <dc:type>Collection</dc:type>
                <dc:date>1939</dc:date>
                <dc:subject>memoir</dc:subject>
                <role:AUT>Virginia Woolf</role:AUT>
                <role:CRE>Virginia Woolf</role:CRE>
                <role:RPS>University of Sussex Library</role:RPS>
            </wo:Description>
            <wo:Description rdf:about="http://woolfonline.com/{$Sketch_of_the_Past_TS}">
                <collex:federation>ModNets</collex:federation>
                <collex:archive>woolf_ol</collex:archive>
                <collex:discipline>Literature</collex:discipline>
                <collex:freeculture>True</collex:freeculture>
                <collex:genre>Life Writing</collex:genre>
                <collex:source_html
                    rdf:resource="http://woolfonline.com/?node=content/image/gallery&amp;project=1&amp;parent=57&amp;taxa=59"/>
                <rdfs:seeAlso
                    rdf:resource="http://woolfonline.com/?node=content/image/gallery&amp;project=1&amp;parent=57&amp;taxa=59"/>
                <dc:title>A Sketch of the Past</dc:title>
                <dc:type>Typescript</dc:type>
                <dc:type>Collection</dc:type>
                <dc:date>1939</dc:date>
                <dc:subject>memoir</dc:subject>
                <role:AUT>Virginia Woolf</role:AUT>
                <role:CRE>Virginia Woolf</role:CRE>
                <role:RPS>University of Sussex Library</role:RPS>
            </wo:Description>

            <xsl:apply-templates/>
        </rdf:RDF>
    </xsl:template>



    <!-- Each RDF object is generated from one of the merged metadata tables 
        created by applying the wometadata_mergeDuplicates.xsl stylesheet to 
        the wometadata.xml file generated from mojulem.  -->

    <xsl:template match="table">

        <!-- a URL is required for an object to be indexed, so we only process records 
        that do not lack a value in the 'url' column of the wometadata_MERGED.xml file. -->

        <xsl:choose>
            <xsl:when test="column[@name = 'taxa_subset'] != ''">

                <!-- Variables used to generate unique rdf:about values for each object; note that 
                merged transcriptions+images will end in the format "1+2", where "1" is the original
                content_id of the transcription record and "2" the content_id of the original image.
                -->

                <xsl:variable name="project_id">
                    <xsl:value-of select="column[@name = 'project_id']"/>
                </xsl:variable>
                <xsl:variable name="taxa_parent_id">
                    <xsl:value-of select="column[@name = 'taxa_parent_id']"/>
                </xsl:variable>
                <xsl:variable name="taxa_id">
                    <xsl:value-of select="column[@name = 'taxa_id']"/>
                </xsl:variable>
                <xsl:variable name="meta_source">
                    <xsl:value-of select="column[@name = 'meta_source']"/>
                </xsl:variable>

                <xsl:variable name="content_id">
                    <xsl:value-of select="column[@name = 'content_id']"/>
                </xsl:variable>

                <!-- namespace:Description element with unique object ID's in @rdf:about are REQUIRED. 
                     Generated by combining numeric id fields from merged objects. 
                     
                     Note that merged objects are reflected by presence of "#+#" at end of RDF object ID, 
                     where each # reflects the original WO Mojulem content_id numbers of the merged objects.
                     This is useful for identifying the multiple sources of merged RDF objects in the 
                     original mojulem metadata file. -->

                <wo:Description
                    rdf:about="http://woolfonline.com/{$project_id}_{$taxa_parent_id}_{$taxa_id}_{$content_id}">

                    <!-- dc:title element is REQUIRED -->

                    <dc:title>
                        <xsl:value-of select="column[@name = 'content_description']"/>
                    </dc:title>

                    <!-- collex:federation element(s) is REQUIRED -->

                    <collex:federation>
                        <xsl:value-of select="$federation-id"/>
                    </collex:federation>

                    <!-- collex:archive element is REQUIRED -->

                    <xsl:copy-of select="$archive"/>

                    <!-- collex:discipline element(s) is REQUIRED -->

                    <xsl:copy-of select="$disciplines"/>

                    <!-- collex:freeculture element is optional, default is "True" -->

                    <xsl:copy-of select="$freeculture"/>


                    <!-- dcterms:isPartOf is Optional
                        
                         Set by taxa_parent_id and taxa_id values of merged records. -->

                    <xsl:variable name="taxa_parent_id" select="column[@name = 'taxa_parent_id']"/>
                    <xsl:variable name="taxa_id" select="column[@name = 'taxa_id']"/>

                    <xsl:choose>
                        <xsl:when test="$taxa_parent_id = '2' and $taxa_id = '6'">
                            <dcterms:isPartOf
                                rdf:resource="http://woolfonline.com/{$Berg_Materials}"/>
                        </xsl:when>
                        <xsl:when test="$taxa_parent_id = '2' and $taxa_id = '17'">
                            <dcterms:isPartOf
                                rdf:resource="http://woolfonline.com/{$Typescript_Of_Time_Passes}"/>
                        </xsl:when>
                        <xsl:when test="$taxa_parent_id = '60' and $taxa_id = '25'">
                            <dcterms:isPartOf
                                rdf:resource="http://woolfonline.com/{$Le_Temps_Passe}"/>
                        </xsl:when>
                        <xsl:when test="$taxa_parent_id = '2' and $taxa_id = '18'">
                            <dcterms:isPartOf
                                rdf:resource="http://woolfonline.com/{$Proofs_Complete_Set}"/>
                        </xsl:when>
                        <xsl:when test="$taxa_parent_id = '18' and $taxa_id = '27'">
                            <dcterms:isPartOf
                                rdf:resource="http://woolfonline.com/{$Proofs_Second_Copy_Gatherings}"
                            />
                        </xsl:when>
                        <xsl:when test="$taxa_parent_id = '2' and $taxa_id = '19'">
                            <dcterms:isPartOf
                                rdf:resource="http://woolfonline.com/{$USA_1st_Edition}"/>
                        </xsl:when>
                        <xsl:when test="$taxa_parent_id = '2' and $taxa_id = '20'">
                            <dcterms:isPartOf
                                rdf:resource="http://woolfonline.com/{$GB_1st_Edition}"/>
                        </xsl:when>
                        <xsl:when test="$taxa_parent_id = '2' and $taxa_id = '21'">
                            <dcterms:isPartOf
                                rdf:resource="http://woolfonline.com/{$Uniform_Edition}"/>
                        </xsl:when>
                        <xsl:when test="$taxa_parent_id = '2' and $taxa_id = '22'">
                            <dcterms:isPartOf
                                rdf:resource="http://woolfonline.com/{$Everyman_Edition}"/>
                        </xsl:when>
                        <xsl:when test="$taxa_parent_id = '2' and $taxa_id = '23'">
                            <dcterms:isPartOf
                                rdf:resource="http://woolfonline.com/{$Albatross_Edition}"/>
                        </xsl:when>
                        <xsl:when test="$taxa_id = '57' and $meta_source = 'manuscript'">
                            <dcterms:isPartOf
                                rdf:resource="http://woolfonline.com/{$Sketch_of_the_Past_MS}"/>
                        </xsl:when>
                        <xsl:when test="$taxa_id = '57' and $meta_source = 'typescript'">
                            <dcterms:isPartOf
                                rdf:resource="http://woolfonline.com/{$Sketch_of_the_Past_TS}"/>
                        </xsl:when>

                    </xsl:choose>


                    <!-- dc:type values (Required) set by project_id and taxa_id; type values assigned by Pamela Caughie and 
                         Niamh McGuigan April 2015 -->

                    <!-- Choosing dc:type values for WO Texts -->

                    <xsl:choose>

                        <!-- Berg Materials (Notes For Writing, Notebook I-III): taxa_parent_id "2" and taxa_id "6" -->

                        <xsl:when
                            test="column[@name = 'taxa_parent_id'] = '2' and column[@name = 'taxa_id'] = '6'">
                            <dc:type>Manuscript</dc:type>
                        </xsl:when>

                        <!-- Typescript of Time Passes: taxa_parent_id "2" taxa_id "17" -->

                        <xsl:when
                            test="column[@name = 'taxa_parent_id'] = '2' and column[@name = 'taxa_id'] = '17'">
                            <dc:type>Typescript</dc:type>
                        </xsl:when>

                        <!-- Le Temps Passe: taxa_parent_id "60" taxa_id "25" -->

                        <xsl:when
                            test="column[@name = 'taxa_parent_id'] = '60' and column[@name = 'taxa_id'] = '25'">
                            <dc:type>Periodical</dc:type>
                        </xsl:when>

                        <!-- Proofs Complete Set: taxa_parent_id "2" taxa_id "18" -->

                        <xsl:when
                            test="column[@name = 'taxa_parent_id'] = '2' and column[@name = 'taxa_id'] = '18'">
                            <dc:type>Codex</dc:type>
                        </xsl:when>

                        <!-- Proofs - Second Copy Gatherings S-U: taxa_parent_id "18" taxa_id "27" -->

                        <xsl:when
                            test="column[@name = 'taxa_parent_id'] = '18' and column[@name = 'taxa_id'] = '27'">
                            <dc:type>Codex</dc:type>
                        </xsl:when>

                        <!-- USA 1st Edition: taxa_parent_id "2" taxa_id "19" -->

                        <xsl:when
                            test="column[@name = 'taxa_parent_id'] = '2' and column[@name = 'taxa_id'] = '19'">
                            <dc:type>Codex</dc:type>
                        </xsl:when>

                        <!-- GB 1st Edition: taxa_parent_id "2" taxa_id "20" -->

                        <xsl:when
                            test="column[@name = 'taxa_parent_id'] = '2' and column[@name = 'taxa_id'] = '20'">
                            <dc:type>Codex</dc:type>
                        </xsl:when>

                        <!-- Uniform Edition: taxa_parent_id "2" taxa_id "21" -->

                        <xsl:when
                            test="column[@name = 'taxa_parent_id'] = '2' and column[@name = 'taxa_id'] = '21'">
                            <dc:type>Codex</dc:type>
                        </xsl:when>

                        <!-- Everyman Edition: taxa_parent_id "2" taxa_id "22" -->

                        <xsl:when
                            test="column[@name = 'taxa_parent_id'] = '2' and column[@name = 'taxa_id'] = '22'">
                            <dc:type>Codex</dc:type>
                        </xsl:when>

                        <!-- Albatross Edition: taxa_parent_id "2" taxa_id "23" -->

                        <xsl:when
                            test="column[@name = 'taxa_parent_id'] = '2' and column[@name = 'taxa_id'] = '23'">
                            <dc:type>Codex</dc:type>
                        </xsl:when>

                        <!-- Choosing dc:type values for WO Contexts -->

                        <!-- Agreement between Hogarth Press and Albatross Presse taxa_id "6" content_id "5553"  -->

                        <xsl:when
                            test="column[@name = 'taxa_id'] = '6' and column[@name = 'content_id'] = '5553'">
                            <dc:type>Sheet</dc:type>
                        </xsl:when>

                        <!-- Cornwall Gallery taxa_parent_id "2" taxa_id "37"  -->

                        <xsl:when
                            test="column[@name = 'taxa_parent_id'] = '2' and column[@name = 'taxa_id'] = '37'">
                            <dc:type>Still Image</dc:type>
                        </xsl:when>

                        <!-- Cornwall 1905 Jouranl taxa_parent_id "56" taxa_id "50"  -->

                        <xsl:when
                            test="column[@name = 'taxa_parent_id'] = '56' and column[@name = 'taxa_id'] = '50'">
                            <dc:type>Manuscript</dc:type>
                        </xsl:when>

                        <!-- Dial Ad for To The Lighthouse taxa_parent_id "2" taxa_id "6" content_id=""  -->

                        <xsl:when
                            test="
                                column[@name = 'taxa_parent_id'] = '56' and column[@name = 'taxa_id'] = '50'
                                and column[@name = 'content_id'] = '744'">
                            <dc:type>Sheet</dc:type>
                        </xsl:when>

                        <!-- Diary Entries by Virginia Woolf taxa_parent_id "41" taxa_id "42"  -->

                        <xsl:when
                            test="column[@name = 'taxa_parent_id'] = '41' and column[@name = 'taxa_id'] = '42'">
                            <dc:type>Manuscript</dc:type>
                        </xsl:when>

                        <!-- Essays by Virginia Woolf taxa_parent_id "45" taxa_id "46"  -->

                        <xsl:when
                            test="column[@name = 'taxa_parent_id'] = '45' and column[@name = 'taxa_id'] = '46'">
                            <dc:type>Periodical</dc:type>
                        </xsl:when>

                        <!-- Letters of Virginia Woolf taxa_parent_id "48" taxa_id "49"  -->

                        <xsl:when
                            test="column[@name = 'taxa_parent_id'] = '48' and column[@name = 'taxa_id'] = '49'">
                            <dc:type>Manuscript</dc:type>
                        </xsl:when>

                        <!-- Reviews of To The Lighthouse taxa_parent_id "2" taxa_id "52"  -->

                        <xsl:when
                            test="column[@name = 'taxa_parent_id'] = '2' and column[@name = 'taxa_id'] = '52'">
                            <dc:type>Periodical</dc:type>
                        </xsl:when>

                        <!-- Interviews taxa_parent_id "2" taxa_id "62"  -->

                        <xsl:when
                            test="column[@name = 'taxa_parent_id'] = '2' and column[@name = 'taxa_id'] = '62'">
                            <dc:type>Periodical</dc:type>
                        </xsl:when>

                        <!-- Sketch of the Past Holograph MS taxa_id "57" meta_source "manuscript"  -->

                        <xsl:when
                            test="column[@name = 'taxa_id'] = '57' and column[@name = 'meta_source'] = 'manuscript'">
                            <dc:type>Manuscript</dc:type>
                        </xsl:when>

                        <!-- Sketch of the Past Holograph TS taxa_id "57" meta_source "typescript"  -->

                        <xsl:when
                            test="column[@name = 'taxa_id'] = '57' and column[@name = 'meta_source'] = 'typescript'">
                            <dc:type>Typescript</dc:type>
                        </xsl:when>

                        <!-- Photo Album meta_source "photo_album" -->

                        <xsl:when test="column[@name = 'meta_source'] = 'photo album'">
                            <dc:type>Still Image</dc:type>
                        </xsl:when>

                        <!-- Talland House OS Map taxa_parent_id "2" taxa_id "2" content_id="6381"  -->

                        <xsl:when
                            test="
                                column[@name = 'taxa_parent_id'] = '2' and column[@name = 'taxa_id'] = '2'
                                and column[@name = 'content_id'] = '6381'">
                            <dc:type>Map</dc:type>
                        </xsl:when>

                        <!-- Talland House by Marion Dell taxa_id "45" content_id="5845"  -->

                        <xsl:when
                            test="column[@name = 'taxa_id'] = '45' and column[@name = 'content_id'] = '5845'">
                            <dc:type>Typescript</dc:type>
                        </xsl:when>

                        <!-- Time Passes by Michael Lackey taxa_id "45" content_id="5846"  -->

                        <xsl:when
                            test="column[@name = 'taxa_id'] = '45' and column[@name = 'content_id'] = '5846'">
                            <dc:type>Typescript</dc:type>
                        </xsl:when>

                        <!-- Virginia Woolf and Poor Women by Alison Light taxa_id "45" content_id="5847"  -->

                        <xsl:when
                            test="column[@name = 'taxa_id'] = '45' and column[@name = 'content_id'] = '5847'">
                            <dc:type>Typescript</dc:type>
                        </xsl:when>

                        <!-- The Composition, Revision, Printing and Publications of To the Lighthouse 
                            by M. Hussey and P. Shillingsburg taxa_id "45" and content_id "6955" -->

                        <xsl:when
                            test="column[@name = 'taxa_id'] = '45' and column[@name = 'content_id'] = '6955'">
                            <dc:type>Typescript</dc:type>
                        </xsl:when>

                        <!-- Set dc:type values for any object not classified by project/taxa above as "Sheet" -->

                        <xsl:otherwise>
                            <dc:type>Sheet</dc:type>
                        </xsl:otherwise>
                    </xsl:choose>

                    <!-- role:CRE and role:AUT
                         Generated from meta_creator column values known to correspond to specific authors and creators,
                         including the original essays written for WO's context section by editors and other scholars. -->

                    <xsl:variable name="creator_name">
                        <xsl:value-of select="column[@name = 'meta_creator']"/>
                    </xsl:variable>
                    <xsl:if test="$creator_name">
                        <xsl:choose>
                            <xsl:when test="$creator_name = 'Mark Hussey &amp; Peter Shillingsburg'">
                                <role:AUT>
                                    <xsl:value-of select="$creator_name"/>
                                </role:AUT>
                                <role:CRE>
                                    <xsl:value-of select="$creator_name"/>
                                </role:CRE>
                            </xsl:when>
                            <xsl:when test="$creator_name = 'Marion Dell'">
                                <role:AUT>
                                    <xsl:value-of select="$creator_name"/>
                                </role:AUT>
                                <role:CRE>
                                    <xsl:value-of select="$creator_name"/>
                                </role:CRE>
                            </xsl:when>
                            <xsl:when test="$creator_name = 'Alison Light'">
                                <role:AUT>
                                    <xsl:value-of select="$creator_name"/>
                                </role:AUT>
                                <role:CRE>
                                    <xsl:value-of select="$creator_name"/>
                                </role:CRE>
                            </xsl:when>
                            <xsl:when test="$creator_name = 'Michael Lackey'">
                                <role:AUT>
                                    <xsl:value-of select="$creator_name"/>
                                </role:AUT>
                                <role:CRE>
                                    <xsl:value-of select="$creator_name"/>
                                </role:CRE>
                            </xsl:when>
                            <xsl:when test="$creator_name = 'Unknown'">
                                <role:AUT>
                                    <xsl:value-of select="$creator_name"/>
                                </role:AUT>
                            </xsl:when>
                            <xsl:when test="$creator_name = 'Unsigned'">
                                <role:AUT>Anonymous</role:AUT>
                            </xsl:when>
                            <xsl:when test="$creator_name = 'Anonymous'">
                                <role:AUT>Anonymous</role:AUT>
                            </xsl:when>
                            <xsl:when test="$creator_name = ''">
                                <role:AUT>Unknown</role:AUT>
                            </xsl:when>
                            <xsl:otherwise>
                                <role:AUT>
                                    <xsl:value-of select="$creator_name"/>
                                </role:AUT>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>

                    <!-- role:PBL -->

                    <xsl:variable name="publisher_name">
                        <xsl:value-of select="column[@name = 'meta_publisher']"/>
                    </xsl:variable>
                    <xsl:if test="$publisher_name != ''">
                        <xsl:choose>
                            <xsl:when test="$publisher_name != 'N/A'">
                                <role:PBL>
                                    <xsl:value-of select="$publisher_name"/>
                                </role:PBL>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:if>

                    <!-- role:ART and role:TRL 
                         Both generated from meta_contributor column values known to correspond to specific artists and translators -->

                    <xsl:variable name="contributor_name">
                        <xsl:value-of select="column[@name = 'meta_contributor']"/>
                    </xsl:variable>
                    <xsl:if test="$contributor_name != ''">
                        <xsl:choose>
                            <xsl:when test="$contributor_name = 'Marie Laurencin'">
                                <role:ART> Marie Laurencin </role:ART>
                            </xsl:when>
                            <xsl:when test="$contributor_name = 'Charles Mauron'">
                                <role:TRL>Charles Mauron</role:TRL>
                            </xsl:when>
                            <xsl:when test="$contributor_name = 'Anne Calahan'">
                                <role:TRL>Anne Calahan</role:TRL>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:if>

                    <!-- role:OWN set by meta_rights_holder -->

                    <xsl:variable name="meta_rights_holder"
                        select="column[@name = 'meta_rights_holder']"/>
                    <xsl:if test="$meta_rights_holder != ''">
                        <xsl:if test="$meta_rights_holder != 'N/A'">
                            <role:OWN>
                                <xsl:value-of select="$meta_rights_holder"/>
                            </role:OWN>
                        </xsl:if>
                    </xsl:if>

                    <!-- role:RPS set by meta_provenance -->

                    <xsl:variable name="meta_provenance" select="column[@name = 'meta_provenance']"/>
                    <xsl:if test="$meta_provenance != ''">
                        <xsl:if test="$meta_provenance != 'N/A'">
                            <role:RPS>
                                <xsl:value-of select="$meta_provenance"/>
                            </role:RPS>
                        </xsl:if>
                    </xsl:if>


                    <!-- collex:genre element REQUIRED -->

                    <xsl:variable name="meta_subject">
                        <xsl:value-of select="column[@name = 'meta_subject']"/>
                    </xsl:variable>
                    <xsl:if test="$meta_subject != ''">
                        <xsl:choose>
                            <xsl:when test="$meta_subject = 'fiction'">
                                <collex:genre>Fiction</collex:genre>
                            </xsl:when>
                            <xsl:when test="$meta_subject = 'stephen family'">
                                <collex:genre>Photograph</collex:genre>
                            </xsl:when>
                            <xsl:when test="$meta_subject = 'diary'">
                                <collex:genre>Life Writing</collex:genre>
                            </xsl:when>
                            <xsl:when test="$meta_subject = 'St Ives, Cornwall'">
                                <collex:genre>Photograph</collex:genre>
                            </xsl:when>
                            <xsl:when test="$meta_subject = 'essay'">
                                <collex:genre>Criticism</collex:genre>
                            </xsl:when>
                            <xsl:when test="$meta_subject = 'letter'">
                                <collex:genre>Correspondence</collex:genre>
                            </xsl:when>
                            <xsl:when test="$meta_subject = 'journal'">
                                <collex:genre>Criticism</collex:genre>
                            </xsl:when>
                            <xsl:when test="$meta_subject = 'article'">
                                <collex:genre>Criticism</collex:genre>
                            </xsl:when>
                            <xsl:when test="$meta_subject = 'review'">
                                <collex:genre>Review</collex:genre>
                            </xsl:when>
                            <xsl:when test="$meta_subject = 'review/illustration'">
                                <collex:genre>Visual Art</collex:genre>
                            </xsl:when>
                            <xsl:when test="$meta_subject = 'essay/review'">
                                <collex:genre>Criticism</collex:genre>
                                <collex:genre>Review</collex:genre>
                            </xsl:when>
                            <xsl:when test="$meta_subject = 'map'">
                                <collex:genre>Reference Works</collex:genre>
                            </xsl:when>
                            <xsl:when test="$meta_subject = 'interview'">
                                <collex:genre>Criticism</collex:genre>
                            </xsl:when>
                            <xsl:otherwise>
                                <collex:genre>Unspecified</collex:genre>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <xsl:if test="$meta_subject = ''">
                        <collex:genre>Unspecified</collex:genre>
                    </xsl:if>
                    <!-- dc:date element calculated using string length -->
                    <xsl:variable name="meta_date" select="column[@name = 'meta_date']"/>
                    <xsl:choose>
                        <!-- precise dates like "1926" -->
                        <xsl:when test="string-length($meta_date) = 4">
                            <dc:date>
                                <xsl:value-of select="$meta_date"/>
                            </dc:date>
                        </xsl:when>
                        <!-- approximate single dates like "circa 1905" -->
                        <xsl:when test="string-length($meta_date) = 10">
                            <dc:date>
                                <collex:date>
                                    <rdfs:label>
                                        <xsl:value-of select="$meta_date"/>
                                    </rdfs:label>
                                    <rdf:value>
                                        <xsl:value-of select="substring($meta_date, 7, 3)"/>u
                                    </rdf:value>
                                </collex:date>
                            </dc:date>
                        </xsl:when>
                        <!-- decade approximations like "circa 1890s" -->
                        <xsl:when test="string-length($meta_date) = 11">
                            <dc:date>
                                <collex:date>
                                    <rdfs:label>
                                        <xsl:value-of select="$meta_date"/>
                                    </rdfs:label>
                                    <rdf:value>
                                        <xsl:value-of select="substring($meta_date, 7, 3)"/>u
                                    </rdf:value>
                                </collex:date>
                            </dc:date>
                        </xsl:when>
                        <!-- year ranges like "circa 1867-1878"  The rigidity
                            of rdf:value seems to work awkwardly with ranges 
                            spanning decades and dates spanning the year 1900 
                            that include two centuries! -->
                        <xsl:when test="string-length($meta_date) = 15">
                            <dc:date>
                                <collex:date>
                                    <rdfs:label>
                                        <xsl:value-of select="$meta_date"/>
                                    </rdfs:label>
                                    <rdf:value>
                                        <xsl:value-of select="substring($meta_date, 7, 4)"
                                            />,<xsl:value-of select="substring($meta_date, 12, 4)"/>
                                    </rdf:value>
                                </collex:date>
                            </dc:date>
                        </xsl:when>
                        <!-- late decade approximations like "circa late 1860s" -->
                        <xsl:when test="string-length($meta_date) = 16">
                            <dc:date>
                                <collex:date>
                                    <rdfs:label>
                                        <xsl:value-of select="$meta_date"/>
                                    </rdfs:label>
                                    <rdf:value>
                                        <xsl:value-of select="substring($meta_date, 12, 3)"/>u
                                    </rdf:value>
                                </collex:date>
                            </dc:date>
                        </xsl:when>
                        <!-- early decade approximations like "circa early 1870s" -->
                        <xsl:when test="string-length($meta_date) = 17">
                            <dc:date>
                                <collex:date>
                                    <rdfs:label>
                                        <xsl:value-of select="$meta_date"/>
                                    </rdfs:label>
                                    <rdf:value>
                                        <xsl:value-of select="substring($meta_date, 13, 3)"/>u
                                    </rdf:value>
                                </collex:date>
                            </dc:date>
                        </xsl:when>
                        <!-- partial 19th century approximation: "circa late 19th century" -->
                        <xsl:when test="string-length($meta_date) = 17">
                            <dc:date>
                                <collex:date>
                                    <rdfs:label>
                                        <xsl:value-of select="$meta_date"/>
                                    </rdfs:label>
                                    <rdf:value>1850,1899</rdf:value>
                                </collex:date>
                            </dc:date>
                            <dc:date>Uncertain</dc:date>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:if test="string-length($meta_date) = 0">
                        <dc:date>Uncertain</dc:date>
                    </xsl:if>
                    <xsl:variable name="taxa_subset" select="column[@name = 'taxa_subset']"/>
                    <xsl:if
                        test="$taxa_subset != '' and $taxa_subset/contains($taxa_subset, 'transcriptions')">
                        <collex:fulltext>true</collex:fulltext>
                    </xsl:if>


                    <!-- rdfs:seeAlso is REQUIRED 
                        
                        Merged records often contain multiple URLS from which we want to
                        select the first in the sequence of merged records, so that a 
                        user will be taken to the first page of the merged work/collection
                        represented by the ModNets RDF object. The first 'url' value will
                        be a transcription if one is available, based on previous sorting
                        and processing, and will only be a galler url if no transcription
                        is available. -->

                    <xsl:variable name="url" select="column[@name = 'url']"/>

                    <rdfs:seeAlso>
                        
                        <xsl:variable name="URLS" select="column[@name = 'url']"/>
                        <xsl:variable name="tokenizedURLS" select="tokenize($URLS, ',')"/>
                        <xsl:variable name="first" select="$tokenizedURLS[position() = 1]"/>
                        
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="$first"/>
                        </xsl:attribute>
                    </rdfs:seeAlso>
                    
                </wo:Description>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
