<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/2000/svg" version="3.0">
    <xsl:output method="xml" indent="yes"/>
    
    <!--<xsl:template name="xsl:initial-template">
        <text>
            <xsl:apply-templates select="$corpus"/>
        </text>
    </xsl:template>-->    
    
    <xsl:variable name="corpus" as="document-node()+" select="collection('../corpus?select=*.xml')"/>    
    
<xsl:template name="xsl:initial-template" match="$corpus">
    <xsl:variable name="all-P-Role" as="xs:decimal" select="count($corpus//power/@role)"/>
    <xsl:variable name="all-Matriarch" as="xs:decimal" select="count($corpus//power[@role eq 'matriarch'])"/>
    <xsl:variable name="all-Patriarch" as="xs:decimal" select="count($corpus//power[@role eq 'patriarch'])"/>
    
    <xsl:variable name="totalCount" as="xs:decimal" select="$all-Patriarch + $all-Matriarch"/>
    
    <xsl:variable name="radius" as="xs:double" select="1"/>
    
    <xsl:variable name="MatrDeg" as="xs:decimal" select="$all-Matriarch div $totalCount * 360"/>
    <xsl:variable name="y_matr" as="xs:double" select="-math:sin($MatrDeg)"/>
    <xsl:variable name="x_matr" as="xs:double" select="-math:cos($MatrDeg)"/>
    
    <xsl:variable name="PatrDeg" as="xs:decimal" select="$all-Patriarch div $totalCount * 360"/>
    <xsl:variable name="y_patr" as="xs:double" select="-math:sin($PatrDeg)"/>
    <xsl:variable name="x_patr" as="xs:double" select="-math:cos($PatrDeg)"/>
    
    
    <svg viewBox="-1 -1 2 2" style="transform: rotate(-0.25turn)">
        <circle r="{$radius}" fill="purple"/>
        <path d="M {$radius} 0 A {$radius} {$radius} 0 0 1 {$x_matr} {$y_matr} L 0 0" fill="orange"/>
    </svg>
</xsl:template>
</xsl:stylesheet>