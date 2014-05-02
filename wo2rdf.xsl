<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dc="http://purl.org/dc/elements/1.1/" 
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:collex="http://www.collex.org/schema#" 
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:role="http://www.loc.gov/loc.terms/relators/"
    xmlns:wo="http://www.woolfonline.com/schema#"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" encoding="utf-8" indent="yes"/>
   
    
    <!-- Collex REQUIRES one or more federation ids. An authorized string for ModNets would be nice
    but this will do for now. -->
    <xsl:variable name="federation-id" as="xs:string">ModNets</xsl:variable>
    
    <!-- Collex REQUIRES one or more disciplines.  These are not terribly well defined; 
    Literature seems to be the only one universally applicable to WO materials,
    so that will do for now (though we should revisit this soon). -->
    <xsl:variable name="disciplines">
        <disciplines>
            <discipline>Literature</discipline>
        </disciplines>
    </xsl:variable>
    
    <!--   
	 TEMPLATES
    -->
    
    <xsl:template match="/">
        <!-- The top-level RDF element is REQUIRED. -->
        <rdf:RDF>
            <xsl:apply-templates/>
        </rdf:RDF>
    </xsl:template>
    
    <xsl:template match="wo:table">
        <!-- An element with an rdf:about element is REQUIRED.  
            The spec says it should be an arbitrary element in the
            project's namespace.  -->
        <xsl:variable name="meta_id" select="@METAID"/>
        <wo:Description rdf:about="http://woolfonline.com/{@METAID}">
            <xsl:apply-templates select="//database">
                <xsl:with-param name="meta_id" select="@METAID"/>
            </xsl:apply-templates>
        </wo:Description>
    </xsl:template>
   
    <xsl:template match="table">
        <xsl:param name="meta_id"/>
        
        <!-- One or more <collex:federation> elements are REQUIRED. -->
        <collex:federation>
            <xsl:value-of select="$federation-id"/>
        </collex:federation>
    </xsl:template>
        
    <!-- WO uses wo_texts and wo_contexts for 
                the REQUIRED <collex:archive> element. -->
    <xsl:template match="table">
        <xsl:param name="meta_subject"/>
        <xsl:choose>
            <xsl:when test="column='fiction'">
                <collex:archive>wo_texts</collex:archive>
            </xsl:when>
            <xsl:otherwise>
                <collex:archive>wo_contexts</collex:archive>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- ONE OR MORE <dc:type> elements are REQUIRED. We determine
             the dc:type from the @meta_source. -->
    
    <xsl:template match="@meta_source">
        <xsl:variable name="type" select="wo:column/text()"/>
        <xsl:choose>
            <xsl:when test="$type = 'proofs'">
                <dc:type>Typescript</dc:type>
            </xsl:when>
            <xsl:when test="$type = 'typescript'">
                <dc:type>Typescript</dc:type>
            </xsl:when>
            <xsl:when test="$type = 'photo album'">
                <dc:type>Still Image</dc:type>
            </xsl:when>
            <xsl:when test="$type = 'book'">
                <dc:type>Codex</dc:type>
            </xsl:when>
            <xsl:when test="$type = 'book excerpt'">
                <dc:type>Codex</dc:type>
            </xsl:when>
            <xsl:when test="$type = 'Print Edition'">
                <dc:type>Codex</dc:type>
            </xsl:when>
            <xsl:when test="$type = 'postcard'">
                <dc:type>Manuscript</dc:type>
                <dc:type>Still Image</dc:type>
            </xsl:when>
            <xsl:when test="$type = 'postcards'">
                <dc:type>Manuscript</dc:type>
                <dc:type>Still Image</dc:type>
            </xsl:when>
            <xsl:when test="$type = 'original letter'">
                <dc:type>Manuscript</dc:type>
            </xsl:when>
            <xsl:when test="$type = 'manuscript'">
                <dc:type>Manuscript</dc:type>
            </xsl:when>
            <xsl:when test="$type = 'newspaper'">
                <dc:type>Periodical</dc:type>
            </xsl:when>
            <xsl:when test="$type = 'magazine'">
                <dc:type>Periodical</dc:type>
            </xsl:when>
            <xsl:when test="$type = 'journal'">
                <dc:type>Periodical</dc:type>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="@meta_creator">        
        <xsl:variable name="name"/>
        <xsl:if test="$name">
            <xsl:choose>
                <xsl:when test="$name = 'Unknown'">
                    <role:AUT>
                        <xsl:value-of select="$name"/>
                    </role:AUT>
                </xsl:when>
                <xsl:when test="$name = 'Unsigned'">
                    <role:AUT>Anonymous</role:AUT>
                </xsl:when>
                <xsl:when test="$name = 'Anonymous'">
                    <role:AUT>Anonymous</role:AUT>
                </xsl:when>
                <xsl:when test="$name = ''">
                    <role:AUT>Unknown</role:AUT>
                </xsl:when>
                <xsl:otherwise>
                    <role:AUT>
                        <xsl:value-of select="$name"/>
                    </role:AUT> 
                </xsl:otherwise>             
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xsl:template match="@meta_publisher">        
        <xsl:variable name="name"/>
        <role:PBL>
            <xsl:value-of select="$name"/>
        </role:PBL> 
    </xsl:template>

    <xsl:template match="@meta_contributor">        
        <xsl:variable name="name"/>
        <xsl:if test="$name">
            <xsl:choose>
                <xsl:when test="$name = 'Marie Laurencin'">
                    <role:ART>Marie Laurencin</role:ART>
                </xsl:when>
                <xsl:when test="$name = 'Charles Mauron'">
                    <role:TRL>Charles Mauron</role:TRL>
                </xsl:when>
                <xsl:when test="$name = 'Anne Calahan'">
                    <role:TRL>Anne Calahan</role:TRL>
                </xsl:when>    
                <!-- Mark Hussey is listed in one entry but I have no idea what
                his role would be, as that entry has next to no content. -->
            </xsl:choose>
        </xsl:if>
    </xsl:template>

        <!-- We will need to add a template for meta_rights_holder, probably
        to convert it to role:OWN and/or role:RPS  -->
  
    <!-- ONE OR MORE <collex:genre> elements are REQUIRED. -->
    <xsl:template match="@meta_subject">        
        <xsl:variable name="name"/>
        <xsl:if test="$name">
            <xsl:choose>
                <xsl:when test="$name = 'fiction'">
                    <collex:genre>
                        <xsl:value-of select="$name"/>
                    </collex:genre>
                </xsl:when>
                <xsl:when test="$name = 'stephen family'">
                    <collex:genre>Photograph</collex:genre>
                </xsl:when>
                <xsl:when test="$name = 'diary'">
                    <collex:genre>Life Writing</collex:genre>
                </xsl:when>
                <xsl:when test="$name = 'St Ives, Cornwall'">
                    <collex:genre>Photograph</collex:genre>
                </xsl:when>
                <xsl:when test="$name = 'essay'">
                    <collex:genre>Criticism</collex:genre>
                </xsl:when>
                <xsl:when test="$name = 'letter'">
                    <collex:genre>Correspondence</collex:genre>
                </xsl:when>
                <xsl:when test="$name = 'journal'">
                    <collex:genre>Criticism</collex:genre>
                </xsl:when>
                <xsl:when test="$name = 'article'">
                    <collex:genre>Criticism</collex:genre>
                </xsl:when>
                <xsl:when test="$name = 'review'">
                    <collex:genre>Review</collex:genre>
                </xsl:when>
                <xsl:when test="$name = 'review/illustration'">
                    <collex:genre>Visual Art</collex:genre>
                </xsl:when>
                <xsl:when test="$name = 'essay/review'">
                    <collex:genre>Criticism</collex:genre>
                    <collex:genre>Review</collex:genre>
                </xsl:when>
                <xsl:when test="$name = 'map'">
                    <collex:genre>Reference Works</collex:genre>
                </xsl:when>
                <xsl:when test="$name = 'interview'">
                    <collex:genre>Criticism</collex:genre>
                </xsl:when>
                <xsl:otherwise>
                    <collex:genre>Unspecified</collex:genre> 
                </xsl:otherwise>             
            </xsl:choose>
        </xsl:if>
    </xsl:template>

        <!-- A SINGLE <dc:title> element is REQUIRED. -->
        <!--Some issues may have more than one title element; use the
	     first one. -->
    <xsl:template match="wo:table">
        <xsl:param name="meta_id"/>
        <dc:title>
            <xsl:apply-templates select="@content_title"/>
        </dc:title>
    </xsl:template>
    
        <!-- ONE OR MORE <dc:date> elements are REQUIRED. For lack of a better
        idea, I'm using string length to determine how to process Woolf Online's
        many date formats. -->
    <xsl:template match="@meta_date">   
        <xsl:variable name="name" select="wo:column/text()"/>
        <xsl:if test="string-length(.) > 0">
            <xsl:choose>
                        <!-- precise dates like "1926" -->
                <xsl:when test="string-length(.)=4">
                    <dc:date>
                        <xsl:value-of select="$name"/>
                    </dc:date>
                </xsl:when>
                        <!-- approximate single dates like "circa 1905" -->
                <xsl:when test="string-length(.) = 10">
                    <dc:date>
                        <collex:date>
                            <rdfs:label>
                                <xsl:value-of select="$name"/>
                            </rdfs:label>
                            <rdfs:value>
                                <xsl:value-of select="substring($name,7,3)"/>u
                            </rdfs:value>
                        </collex:date>
                    </dc:date>
                    <dc:date>Uncertain</dc:date>
                </xsl:when>
                        <!-- decade approximations like "circa 1890s" -->
                <xsl:when test="string-length(.) = 11">
                    <dc:date>
                        <collex:date>
                            <rdfs:label>
                                <xsl:value-of select="$name"/>
                            </rdfs:label>
                            <rdfs:value>
                                <xsl:value-of select="substring($name,7,3)"/>u
                            </rdfs:value>
                        </collex:date>
                    </dc:date>
                    <dc:date>Uncertain</dc:date>
                </xsl:when>
                            <!-- year ranges like "circa 1867-1878"  The rigidity
                            of rdfs:value seems to work awkwardly with ranges 
                            spanning decades and dates spanning the year 1900 
                            that include two centuries! -->
                <xsl:when test="string-length(.) = 15"> 
                    <dc:date>
                        <collex:date>
                            <rdfs:label>
                                <xsl:value-of select="$name"/>
                            </rdfs:label>
                            <rdfs:value>
                                <xsl:value-of select="substring($name,7,4)"/>,<xsl:value-of select="substring($name,12,4)"/>
                            </rdfs:value>
                        </collex:date>
                    </dc:date>
                    <dc:date>Uncertain</dc:date>
                </xsl:when>
                        <!-- late decade approximations like "circa late 1860s" -->
                <xsl:when test="string-length(.) = 16">
                    <dc:date>
                        <collex:date>
                            <rdfs:label>
                                <xsl:value-of select="$name"/>
                            </rdfs:label>
                            <rdfs:value>
                                <xsl:value-of select="substring($name,12,3)"/>u
                            </rdfs:value>
                        </collex:date>
                    </dc:date>
                    <dc:date>Uncertain</dc:date>
                </xsl:when>
                <!-- early decade approximations like "circa early 1870s" -->
                <xsl:when test="string-length(.) = 17">
                    <dc:date>
                        <collex:date>
                            <rdfs:label>
                                <xsl:value-of select="$name"/>
                            </rdfs:label>
                            <rdfs:value>
                                <xsl:value-of select="substring($name,13,3)"/>u
                            </rdfs:value>
                        </collex:date>
                    </dc:date>
                    <dc:date>Uncertain</dc:date>
                </xsl:when>
                <!-- partial 19th century approximation: "circa late 19th century" -->
                <xsl:when test="string-length(.) = 17">
                    <dc:date>
                        <collex:date>
                            <rdfs:label>
                                <xsl:value-of select="$name"/>
                            </rdfs:label>
                            <rdfs:value>1850,1899</rdfs:value>
                        </collex:date>
                    </dc:date>
                    <dc:date>Uncertain</dc:date>
                </xsl:when>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
        
        <!-- ONE <rdfs:seeAlso> element with the URL of the resource is REQUIRED. -->
    <xsl:template match="@url">
        <xsl:variable name="url" select="wo:column/text()"/>
        <rdfs:seeAlso rdf:resource="$url"/>
    </xsl:template>     
        <!-- END OF REQUIRED ELEMENTS -->
    
</xsl:stylesheet>