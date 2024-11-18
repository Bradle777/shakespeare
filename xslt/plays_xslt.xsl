<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="#all"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" 
        include-content-type="no" indent="yes"/>
    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title><xsl:value-of select="//main_title"/></title>
                <link rel="stylesheet" href="shakespeare-website-css.css"/>
            </head>
            <body>
                <!--START Basic html structure for every text page====================-->
                <div class="navbar"> <!-- Creates nav bar on top -->
                    <a href="homepage.xhtml">Home</a>
                    <a href="methodology.xhtml">Methodologies</a>
                    <a href="texts.xhtml">Texts</a>
                    <a href="analysis.xhtml">Analysis</a>
                    <a href="conclusion.xhtml">Conclusion</a>
                </div>
                <h1>Our Corpus</h1>
                <div class="text_navbar">
                    <a href="titus-andronicus-html.xhtml">Titus Andronicus</a>
                    <a href="othello-html.xhtml">Othello</a>
                    <a href="sonnet18-html.xhtml">Sonnet 18</a>
                    <a href="sonnet127-html.xhtml">Sonnet 127</a>
                    <a href="sonnet130-html.xhtml">Sonnet 130</a>
                    <a href="sonnet131-html.xhtml">Sonnet 131</a>
                    <a href="sonnet132-html.xhtml">Sonnet 132</a>
                    <a href="sonnet144-html.xhtml">Sonnet 144</a>
                </div>
                <!--END Basic html structure for every text page=======================-->
                
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
   
    <xsl:template match="play">
        <div class="text">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
   
    <!--=======Creates all the cover matter, toc, charas, author, setting, etc.========= -->
    <xsl:template match="meta">
        <div class="meta">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="main_title">
        <h2><xsl:apply-templates/></h2>
    </xsl:template >
    <xsl:template match="author">
        <h5><xsl:apply-templates/></h5>
    </xsl:template>
    <xsl:template match="setting">
        <h5><xsl:apply-templates/></h5>
    </xsl:template>
    
    <!--==========Creates text tag and specific scene and title tags========-->
    <xsl:template match="scene">
        <div class="scene">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="scene/title">
        <h5><xsl:apply-templates/></h5><br/>
    </xsl:template>
    <xsl:template match="//sp">
        <br/><sp><xsl:apply-templates/></sp>
    </xsl:template>
    <xsl:template match="//stage">
        <span class="stage"><xsl:apply-templates/></span>
    </xsl:template>
    
    <!-- ============Transoformation for sonnets==========-->
    <xsl:template match="poem">
        <div class="text"><xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="number-title">
        <h5><xsl:apply-templates/></h5>
    </xsl:template>
    <xsl:template match="body">
        <div class="scene"><!-- Though scene may not be the right name in context of the sonnets, it has the right css stlying and structure -->
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    
    
</xsl:stylesheet>