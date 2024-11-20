<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="#all"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" 
        include-content-type="no" indent="yes"/>
    
    <xsl:variable name="corpus" as="document-node()+" select="collection('../plays?select=*.xml')"/>
    
    <xsl:template name="xsl:initial-template">
        <text>
            <xsl:apply-templates select="$corpus"/>
        </text>
    </xsl:template>
    
    <xsl:variable name="max_height" as="xs:double" select="500"/>
    <xsl:variable name="spacing" as="xs:double" select="50"/>
    <xsl:variable name="max_width" as="xs:double" select="($spacing) * count(//depiction/@role => distinct-values())"/>
    
    <xsl:template match="/">
        <svg height="{$max_height + 200}" width="{$max_width + 250}"
            viewBox="-100 -{$max_height + 100} {$max_width + 200} {$max_height + 200}">
    
            
            
            <xsl:variable name="ruling_height" as="xs:double" select=". div 5 * $max_height"/>
            <line x1="0" x2="{$max_width}" y1="-{$ruling_height}" y2="-{$ruling_height}" style="stroke:black;stroke-width:1;"/>
            
        </svg>
    </xsl:template>
    
    <xsl:template match="election">
        <xsl:variable name="xpos" as="xs:double" select="((position() -1) * $spacing) + ($spacing div 2)"/>        
        <line x1="{$xpos}" x2="{$xpos}" y1="15" y2="-{$max_height}" style="stroke:black;stroke-width:1;"/>
    </xsl:template>
</xsl:stylesheet>