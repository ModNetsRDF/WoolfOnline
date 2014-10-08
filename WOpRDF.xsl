<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"  exclude-result-prefixes="xs" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dc="http://purl.org/dc/elements/1.1/" 
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:collex="http://www.collex.org/schema#" 
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:role="http://www.loc.gov/loc.terms/relators/"
    xmlns:wo="http://www.woolfonline.com/schema#">
    
    <xsl:output method="xml" encoding="iso-8859-1" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- Global Variables-->
    <xsl:variable name="baseURL">http://woolfonline.com</xsl:variable>
    <xsl:variable name="newline">
        <xsl:text>   
  </xsl:text>
    </xsl:variable>
    
    <xsl:template match="/">
        <rdf:RDF>
            <xsl:apply-templates/>
        </rdf:RDF>
    </xsl:template>
    
    
  <!-- Template -->  
   <xsl:template match="table">
           <xsl:variable name="id">
               <xsl:text>http://woolfonline.com/</xsl:text>
               <xsl:value-of select="column[@name='meta_id']"/>
               <xsl:text>.</xsl:text>
               <xsl:choose>
                   <xsl:when test="column[@name='meta_subject']='fiction'">
                       <xsl:text>wo_texts</xsl:text>
                   </xsl:when>
                   <xsl:otherwise>    
                   <xsl:text>wo_contexts</xsl:text>
                   </xsl:otherwise>
               </xsl:choose>    
      <!--Collex XSLT Instructions -->         
           </xsl:variable>          
       <xsl:value-of select="$newline"/>
       <wo:Description rdf:about="{$id}">
           <xsl:value-of select="$newline"/>
           <xsl:comment>Collex RDF Elements</xsl:comment>
          <collex:federation>ModNets</collex:federation>
          <collex:archive>WoolfOnline</collex:archive>
          <collex:discipline>Literature</collex:discipline>
          <collex:freeculture>False</collex:freeculture>
             <xsl:choose>
                   <xsl:when test="column[@name='meta_subject']='fiction'">
                      <collex:genre>Fiction</collex:genre>
                   </xsl:when>
                   <xsl:when test="column[@name='meta_subject']='review'">
                       <collex:genre>Review</collex:genre>>                      
                   </xsl:when>
                   <xsl:when test="column[@name='meta_subject']='essay/review'">
                       <collex:genre>Review</collex:genre>
                       <collex:genre>Criticism</collex:genre>
                   </xsl:when>
                   <xsl:when test="column[@name='meta_subject']='review/illustration'">
                       <collex:genre>Review</collex:genre>
                       <collex:genre>Visual Art</collex:genre>
                   </xsl:when>
                   <xsl:when test="column[@name='meta_subject']='diary'">
                       <collex:genre>Life Writing</collex:genre>
                   </xsl:when>
                   <xsl:when test="column[@name='meta_subject']='stephen family'">
                       <collex:genre>Photographs</collex:genre>
                   </xsl:when>
                   <xsl:when test="column[@name='meta_subject']='St Ives, Cornwall'">
                       <collex:genre>Photographs</collex:genre>
                   </xsl:when>
                   <xsl:when test="column[@name='meta_subject']='letter'">
                       <collex:genre>Correspondence</collex:genre>
                   </xsl:when>
                   <xsl:when test="column[@name='meta_subject']='essay'">
                       <collex:genre>Criticism</collex:genre>
                   </xsl:when> 
                   <xsl:when test="column[@name='meta_subject']='journal'">
                       <collex:genre>Criticism</collex:genre>
                   </xsl:when> 
                   <xsl:when test="column[@name='meta_subject']='article'">
                       <collex:genre>Criticism</collex:genre>
                   </xsl:when> 
                   <xsl:when test="column[@name='meta_subject']='interview'">
                       <collex:genre>Criticism</collex:genre>
                   </xsl:when>
                 <xsl:when test="column[@name='meta_subject']='map'">
                     <collex:genre>Reference Works</collex:genre>
                 </xsl:when>
                   <xsl:otherwise>
                       <collex:genre>Unspecified</collex:genre>
                   </xsl:otherwise>
               </xsl:choose>
           <xsl:choose>
               <xsl:when test="column[@name='meta_format']='text/plain'">
                   <collex:fulltext>True</collex:fulltext>
               </xsl:when>
               <xsl:when test="column[@name='meta_format']='image/jpeg'">
                   <collex:image>
                       <xsl:attribute name="rdf:resource">
                           <xsl:value-of select="column[@name='url']"/>     
                       </xsl:attribute>
                   </collex:image>
               </xsl:when>
               <xsl:otherwise></xsl:otherwise>
           </xsl:choose>
           
           <collex:source_html rdf:type="HTML">
               <xsl:attribute name="rdf:resource">
           <xsl:choose>
               <xsl:when test="column[@name='url'] !=''">                
                   <xsl:value-of select="column[@name='url']"/>
               </xsl:when>
               <xsl:otherwise>
                   <xsl:text>Unspecified</xsl:text>
               </xsl:otherwise>
           </xsl:choose>
                   </xsl:attribute>
           </collex:source_html>          
      
       <xsl:value-of select="$newline"/>
       <xsl:value-of select="$newline"/>
           <!-- RDFS XSLT Instructions -->
       <xsl:comment>RDFS RDF Elements</xsl:comment>
       <rdfs:SeeAlso>
           <xsl:attribute name="rdf:resource">
               <xsl:value-of select="column[@name='url']"/>
           </xsl:attribute>
       </rdfs:SeeAlso>
       <xsl:value-of select="$newline"/>
       <xsl:value-of select="$newline"/>
           <!-- DublinCore XSLT Instructions -->
       <xsl:comment>DublinCore RDF Elements</xsl:comment>
       <dc:title>
           <xsl:choose>
               <xsl:when test="column[@name='content_title'] != ''">
           <xsl:value-of select="column[@name='content_title']"/>
               </xsl:when>
               <xsl:otherwise>
                   <xsl:text>Unspecified</xsl:text>
               </xsl:otherwise>
           </xsl:choose>
       </dc:title>
       <xsl:choose>
           <xsl:when test="column[@name='meta_source']='proofs'">
           <dc:type>Typescript</dc:type>
           </xsl:when>
           <xsl:when test="column[@name='meta_source']='typescript'">
           <dc:type>Typescript</dc:type>
           </xsl:when>
           <xsl:when test="column[@name='meta_source']='photo album'">
               <dc:type>Still Image</dc:type>
           </xsl:when>
           <xsl:when test="column[@name='meta_source']='book'">
               <dc:type>Codex</dc:type>
           </xsl:when>
           <xsl:when test="column[@name='meta_source']='book excerpt'">
               <dc:type>Codex</dc:type>
           </xsl:when>
           <xsl:when test="column[@name='meta_source']='Print Edition'">
               <dc:type>Codex</dc:type>
           </xsl:when>
           <xsl:when test="column[@name='meta_source']='postcards'">
               <dc:type>Manuscript</dc:type>
               <dc:type>Still Image</dc:type>
           </xsl:when>
           <xsl:when test="column[@name='meta_source']='original letter'">
               <dc:type>Manuscript</dc:type>
           </xsl:when>
           <xsl:when test="column[@name='meta_source']='newspaper'">
               <dc:type>Periodical</dc:type>
           </xsl:when>
           <xsl:when test="column[@name='meta_source']='magazine'">
               <dc:type>Periodical</dc:type>
           </xsl:when>
           <xsl:when test="column[@name='meta_source']='journal'">
               <dc:type>Periodical</dc:type>
           </xsl:when>
           <xsl:otherwise>
               <dc:type>Unspecified</dc:type>
           </xsl:otherwise>              
       </xsl:choose>
            <dc:date>
               <xsl:choose>
                   <xsl:when test="contains(column[@name='meta_date'], 'circa')">
                       <collex:date>
                           <xsl:value-of select="column[@name='meta_date']"/>
                       </collex:date>
                   </xsl:when>
                   <xsl:when test="column[@name='meta_date']>=1700">
                       <xsl:value-of select="column[@name='meta_date']"/>
                   </xsl:when>
                   <xsl:otherwise>
                       <collex:date>n.d.</collex:date>
                   </xsl:otherwise>           
               </xsl:choose>
           </dc:date>
       <dc:subject>
           <xsl:choose>
               <xsl:when test="column[@name='meta_subject'] != ''"> 
           <xsl:value-of select="column[@name='meta_subject']"/>
               </xsl:when>
               <xsl:otherwise>
                   <xsl:text>Unspecified</xsl:text>
               </xsl:otherwise>
           </xsl:choose>
       </dc:subject>
       <dc:source>
       <xsl:choose>
           <xsl:when test="column[@name='content_description'] != ''">
               <xsl:value-of select="column[@name='content_description']"/>
           </xsl:when>
           <xsl:otherwise>
               <xsl:text>Unspecified</xsl:text>
           </xsl:otherwise>
       </xsl:choose>
       </dc:source>
       <xsl:value-of select="$newline"/>
       <xsl:value-of select="$newline"/>
       <xsl:comment>Role RDF Elements</xsl:comment>
       <xsl:value-of select="$newline"/>   
           <!-- ROLE XSLT Instructions -->
       <xsl:comment>The &lt;role:AUT&gt; is just pulling the author's name as entered into the database. 
           A future project manager should replace this with LC Authority file where applicable</xsl:comment>
       <role:AUT>
       <xsl:choose>
           <xsl:when test="column[@name='meta_creator'] != ''">
               <xsl:value-of select="column[@name='meta_creator']"/>
           </xsl:when>
           <xsl:otherwise>
               <xsl:text>Unsigned</xsl:text>
           </xsl:otherwise>
       </xsl:choose>
       </role:AUT>
    <role:PBL>
        <xsl:choose>
            <xsl:when test="column[@name='meta_publisher'] != ''">
                <xsl:value-of select="column[@name='meta_publisher']"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>Unsigned</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </role:PBL>
       <role:OWN>
           <xsl:choose>
               <xsl:when test="column[@name='meta_rights_holder'] != ''">
                   <xsl:value-of select="column[@name='meta_rights_holder']"/>
               </xsl:when>
               <xsl:otherwise>
                   <xsl:text>Unspecified</xsl:text>
               </xsl:otherwise>
           </xsl:choose>
       </role:OWN>
       <role:RPS>
           <xsl:choose>
               <xsl:when test="column[@name='meta_provenance'] != ''">
                   <xsl:value-of select="column[@name='meta_provenance']"/>
               </xsl:when>
               <xsl:otherwise>
                   <xsl:text>Unspecified</xsl:text>
               </xsl:otherwise>
           </xsl:choose>
       </role:RPS>
       </wo:Description>
    </xsl:template>   
</xsl:stylesheet>