<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    <!-- Header configured to exclude TEI prefix -->

    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    <!-- Setting output method as html -->

    
    <xsl:template match="/">
        <xsl:variable name="file">
            <xsl:value-of select="replace(base-uri(.), 'xml', '')"/>
        </xsl:variable>
    <!-- defining filenames of documents to be produced at end of transformation -->
        <xsl:variable name="pathAcc">
            <xsl:value-of select="concat($file, 'accueil', '.html')"/>
        </xsl:variable>
        <xsl:variable name="pathIndex">
            <xsl:value-of select="concat($file, 'index', '.html')"/>
        </xsl:variable>
        <xsl:variable name="pathLetter1397">
            <xsl:value-of select="concat($file, 'lettre1397', '.html')"/>
        </xsl:variable>
        <xsl:variable name="pathLetter1398">
            <xsl:value-of select="concat($file, 'lettre1398', '.html')"/>
        </xsl:variable>
        
        <!-- defining variables -->
        <xsl:variable name="title">
            <xsl:value-of select="//fileDesc/titleStmt/title"/>
        </xsl:variable>
        
        <!-- Constituting Welcome Page  -->
        <xsl:result-document href="{$pathAcc}" method="html" indent="yes">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <title>
                        <xsl:value-of select="$title"/>
                    </title>
                </head>
                <body>
                    <!-- constituting navigation bar -->
                    <nav><button><a href="{$pathAcc}">Accueil</a></button><button><a href="{$pathIndex}">Index</a></button><button><a href="{//distributor/@facs}">lien vers l'edition</a></button></nav>
                    <h1>À propos</h1>
                    <!-- limited by the structure of TEI, I intersperse xsl:text and xsl:value-of to create a compelling introduction to project -->
                    <p>
                        <xsl:text>Cette édition des </xsl:text>
                        <xsl:value-of select="$title"/>
                        <xsl:text>, edité par </xsl:text>
                        <xsl:value-of select="//fileDesc/titleStmt/editor"/>
                        <xsl:text> contient </xsl:text>
                        <xsl:value-of select="//seriesStmt/respStmt/resp/text()"/>
                        <xsl:value-of select="//fileDesc/titleStmt/respStmt/resp/text()"/>
                        <xsl:text> par </xsl:text>
                        <xsl:value-of select="//fileDesc/titleStmt/respStmt/persName/forename/text()"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="//fileDesc/titleStmt/respStmt/persName/surname/text()"/>
                        <xsl:text>. </xsl:text><br/><br/> <!-- creating separation -->
                        <xsl:text>Vous pouvez naviguer dans la collection grâce au navigation bar au dessus, et en cliquant des liens dessous pour accéder aux lettres.</xsl:text>
                    </p>
                    <ul>
                        <h2>Des lettres :</h2> <!-- links to letters -->
                        <li><a href="{$pathLetter1397}">Lettre 1397</a></li>
                        <li><a href="{$pathLetter1398}">Lettre 1398</a></li>
                    </ul>
                </body>
                <footer>
                    <div>© Edward Gray, 2020</div> <!-- footer -->
                </footer>
            </html>
        </xsl:result-document>
        
        
        <!-- Constituting Index Page -->
        <xsl:result-document href="{$pathIndex}" method="html" indent="yes">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <title>
                        <xsl:value-of select="concat($title, ': Index')"/>
                    </title>
                </head>
                <body>
                    <!-- constituting navigation bar -->
                    <nav><button><a href="{$pathAcc}">Accueil</a></button><button><a href="{$pathIndex}">Index</a></button><button><a href="{//distributor/@facs}">lien vers l'edition</a></button></nav>
                    <h2>Index des Personnages cités dans les lettres</h2>
                    <ul>
                        <ul> <!-- calling templates for various indexes. The choice to make several, more refined indexes means more work here -->
                            <h3>Famille Sévigné</h3>
                            <xsl:call-template name="index_sev"/>
                        </ul>
                        <ul>
                            <h3>Maison de Bourbon</h3>
                            <xsl:call-template name="index_bourbon"/>
                        </ul>
                        <ul>
                            <h3>Autres</h3>
                            <xsl:call-template name="index_autres"/>
                        </ul>
                    </ul>
                    <h2>Index des Lieux cités dans les lettres</h2>
                    <ul>
                        <ul>
                            <h3>Lieux en France</h3>
                            <xsl:call-template name="index_France"/>
                        </ul>
                        <ul>
                            <h3>Lieux hors France</h3>
                            <xsl:call-template name="index_horsFrance"/>
                        </ul>
                    </ul>
                </body>
                <footer>
                    <div>© Edward Gray, 2020</div>
                </footer>
            </html>
        </xsl:result-document>
        
        
        <!-- Constituting page for Letter 1397 -->
        <xsl:result-document href="{$pathLetter1397}" method="html" indent="yes">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <title>
                        <xsl:value-of select="concat($title, ': Lettre 1397')"/>
                    </title>
                </head>
                <body>
                    <!-- constituting navigation bar -->
                    <nav><button><a href="{$pathAcc}">Accueil</a></button><button><a href="{$pathIndex}">Index</a></button><button><a href="{//distributor/@facs}">lien vers l'edition</a></button></nav>
                    <div>
                        <a href="{$pathAcc}">Retour accueil</a>
                    </div>
                    
                    <h1>Lettre 1397</h1>
                    <div>
                        <h2><xsl:value-of select="//div[@n='1397']/head"/></h2>
                        <!-- Selecting value of p and all child elements, except note. Perhaps not the most elegant way this could be done.-->
                        <p><xsl:value-of select="//div[@n='1397']/p/text() |//div[@n='1397']/p/persName/text() |//div[@n='1397']/p/placeName/text() |//div[@n='1397']/p/date/text() |//div[@n='1397']/p/emph/text()">
                        </xsl:value-of></p>
                        <div>
                            <xsl:for-each select="//div[@n='1397']/p/note">
                                <note>
                                    <xsl:attribute name="id">
                                        <xsl:number level="single" format="1"/> <!-- "any" is not a good choice for a large corpus, and multiple creates problems -->
                                    </xsl:attribute>
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:text>#</xsl:text>
                                            <text>n</text>
                                            <xsl:number level="single" format="1"/>
                                        </xsl:attribute>
                                        <xsl:number level="single" format="1. "/></a>
                                    <xsl:apply-templates/>
                                </note>
                                <br/> <!-- to ensure return between footnotes -->
                            </xsl:for-each>
                        </div>
                    </div>
                </body>
                <footer>
                    <div>© Edward Gray, 2020</div>
                </footer>
            </html>
        </xsl:result-document>
        
        
        <!-- Constituting page for Letter 1398 -->
        <xsl:result-document href="{$pathLetter1398}" method="html" indent="yes">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <title>
                        <xsl:value-of select="concat($title, ': Lettre 1398')"/>
                    </title>
                </head>
                <body>
                    <!-- constituting navigation bar -->
                    <nav><button><a href="{$pathAcc}">Accueil</a></button><button><a href="{$pathIndex}">Index</a></button><button><a href="{//distributor/@facs}">lien vers l'edition</a></button></nav>
                    <div>
                        <a href="{$pathAcc}">Retour accueil</a>
                    </div>         
                        <h1>Lettre 1398</h1>
                        <div>
                            <h2><xsl:value-of select="//div[@n='1398']/head"/></h2>
                            <!-- Selecting value of p and all child elements, except note. Perhaps not the most elegant way this could be done.-->
                            <p>
                                <xsl:value-of select="//div[@n='1398']/p/text() |//div[@n='1398']/p/persName/text() |//div[@n='1398']/p/placeName/text() |//div[@n='1398']/p/date/text() |//div[@n='1398']/p/emph/text()">
                                </xsl:value-of>
                            </p>
                            <div>
                                <xsl:for-each select="//div[@n='1398']/p/note">
                                    <note>
                                        <xsl:attribute name="id">
                                            <xsl:number level="single" format="1"/>
                                        </xsl:attribute>
                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:text>#</xsl:text>
                                                <text>n</text>
                                                <xsl:number level="single" format="1"/>
                                            </xsl:attribute>
                                            <xsl:number level="single" format="1. "/></a>
                                        <xsl:apply-templates/>
                                    </note>
                                    <br/> 
                                </xsl:for-each>
                            </div>
                        </div>
                </body>
                <footer>
                    <div>© Edward Gray, 2020</div>
                </footer>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match='emph'>
        <i><xsl:copy-of select="./text()"/></i>
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- (a failed attempt at) generating notes in text -->
    <xsl:template match="//body//p/note"> <!-- ensuring it only selects notes in body -->
        <sup>
            <xsl:element name="a"> <!-- creation of internal references -->
                <xsl:attribute name="href">
                    <xsl:text>n</xsl:text>
                    <xsl:number level="single"/> <!-- keep harmony with footnotes as constituted in letters -->
                </xsl:attribute>
            </xsl:element>
        </sup>
        <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>
    
    <!-- Generating indexes -->
    
    <xsl:template name="index_sev">
        <xsl:for-each select="//listPerson[@type='famille_sevigne']//persName">
            <xsl:sort select="surname" order="ascending"></xsl:sort> <!-- sorting by surname -->
            <li>
                <xsl:value-of select="concat(forename, ' ', surname, ', ', roleName)"/>
                <xsl:variable name="idPerson">
                    <xsl:value-of select="parent::person/@xml:id"/> <!-- ensuring ID are similar between index and citations in XML-TEI -->
                </xsl:variable>
                <xsl:text> : </xsl:text>
                <xsl:for-each select="ancestor::TEI//body//persName[replace(@ref, '#','')=$idPerson]"> <!-- ensuring ID are similar between index and citations in XML-TEI -->
                    <xsl:text> Lettre </xsl:text>
                    <xsl:value-of select="ancestor::div[@type = 'letter']/@n"/> <!-- selecting appropriate letter -->
                    <xsl:if test="position()!= last()">, </xsl:if>
                    <xsl:if test="position() = last()">.</xsl:if><!-- ensuring that citations have appropriate punctuation. -->
                </xsl:for-each>
            </li>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="index_bourbon">
        <xsl:for-each select="//listPerson[@type='maison-de-France']//persName">
            <xsl:sort select="forename" order="ascending"></xsl:sort> <!-- sorting by forename, since they all have the same surname (to the extent that we can say the 17th C French royal family had surnames) -->
            <li>
                <xsl:value-of select="concat(forename, ' ', surname, ', ', roleName)"/>
                <xsl:variable name="idPerson">
                    <xsl:value-of select="parent::person/@xml:id"/>
                </xsl:variable>
                <xsl:text> : </xsl:text>
                <xsl:for-each select="ancestor::TEI//body//persName[replace(@ref, '#','')=$idPerson]">
                    <xsl:text> Lettre </xsl:text>
                    <xsl:value-of select="ancestor::div[@type = 'letter']/@n"/>
                    <xsl:if test="position()!= last()">, </xsl:if>
                    <xsl:if test="position() = last()">.</xsl:if>
                </xsl:for-each>
            </li>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="index_autres">
        <xsl:for-each select="//listPerson[@type='autres']//persName">
            <xsl:sort select="surname" order="ascending"></xsl:sort>
            <li>
                <xsl:choose>
                    <!-- series of instructions meant to ensure that index appears properly despite the variety of information we have about persons -->
                    <xsl:when test="forename and surname and roleName">
                        <xsl:value-of select="concat(forename, ' ', surname, ', ', roleName)"/>
                    </xsl:when>
                    <xsl:when test="forename and surname">
                        <xsl:value-of select="concat(forename, ' ', surname)"/>
                    </xsl:when>
                    <xsl:when test="surname and roleName">
                        <xsl:value-of select="concat(surname, ', ', roleName)"/>
                    </xsl:when>
                    <xsl:when test="surname">
                        <xsl:value-of select="concat(surname, ', ', roleName)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="roleName"/>
                    </xsl:otherwise>
                </xsl:choose>
                
                <xsl:variable name="idPerson">
                    <xsl:value-of select="parent::person/@xml:id"/>
                </xsl:variable>
                <xsl:text> : </xsl:text>
                <xsl:for-each select="ancestor::TEI//body//persName[replace(@ref, '#','')=$idPerson]">
                    <xsl:text> Lettre </xsl:text>
                    <xsl:value-of select="distinct-values(ancestor::div[@type = 'letter']/@n)"/>
                    <xsl:if test="position()!= last()">, </xsl:if>
                    <xsl:if test="position() = last()">.</xsl:if>
                </xsl:for-each>
            </li>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="index_France">
        <xsl:for-each select="//listPlace[@type='France']//placeName">
            <xsl:sort select="placeName" order="ascending"></xsl:sort>
            <li>
                <xsl:choose>
                    <xsl:when test="@type='royaume'"> <!-- Ensuring that France generates in index -->
                        <xsl:value-of select="country"/>
                    </xsl:when>
                    <xsl:when test="child::name"> <!-- Generating names (generally, buildings) followed by their settlement -->
                        <xsl:value-of select="name"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="settlement"/>
                    </xsl:when>
                    <xsl:otherwise> <!-- Now that special cases are taken care of, the remaining French locations-->
                        <xsl:value-of select="settlement | region | geogName"/>                        
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:variable name="idPlace">
                    <xsl:value-of select="parent::place/@xml:id"/>
                </xsl:variable>
                <xsl:text> : </xsl:text>
                <xsl:for-each select="ancestor::TEI//body//placeName[replace(@ref, '#','')=$idPlace]">  
                    <xsl:text> Lettre </xsl:text>
                    <xsl:value-of select="ancestor::div[@type = 'letter']/@n"/> 
                    <xsl:if test="position()!= last()">, </xsl:if>
                    <xsl:if test="position() = last()">.</xsl:if> 
                </xsl:for-each>
            </li>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="index_horsFrance">
        <xsl:for-each select="//listPlace[@type='horsFrance']//placeName">
            <xsl:sort select="country" order="ascending"></xsl:sort> <!-- sorting by country -->
            <li>
                <xsl:choose>
                    <xsl:when test="child::settlement"> <!-- selecting for settlements first, to be followed by country -->
                        <xsl:value-of select="settlement"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="country"/>
                    </xsl:when>
                    <xsl:when test="child::region"> <!-- selecting for regions, to be followed by country -->
                        <xsl:value-of select="region"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="country"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="country"/> <!-- catching simple references to countries -->
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:variable name="idPlace"> 
                    <xsl:value-of select="parent::place/@xml:id"/>
                </xsl:variable>
                <xsl:text> : </xsl:text>
                <xsl:for-each select="ancestor::TEI//body//placeName[replace(@ref, '#','')=$idPlace]">
                    <xsl:text> Lettre </xsl:text>
                    <xsl:value-of select="ancestor::div[@type = 'letter']/@n"/> 
                    <xsl:if test="position()!= last()">, </xsl:if>
                    <xsl:if test="position() = last()">.</xsl:if> 
                </xsl:for-each>
            </li>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
