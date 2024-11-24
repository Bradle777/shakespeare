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
    
    <!--NOTICE: The key for this pie chart will be done manually within the analysis html-->
    
    <xsl:variable name="corpus" as="document-node()+" select="collection('../corpus?select=*.xml')"/>    
    
<xsl:template name="xsl:initial-template" match="$corpus">
    <xsl:variable name="all-P-Role" as="xs:decimal" select="count($corpus//power/@role)"/>
    <xsl:variable name="all-Matriarch" as="xs:decimal" select="count($corpus//power[@role eq 'matriarch'])"/>
    <xsl:variable name="all-Patriarch" as="xs:decimal" select="count($corpus//power[@role eq 'patriarch'])"/>
    <xsl:variable name="all-other" as="xs:decimal" select="$all-P-Role - $all-Matriarch - $all-Patriarch"/>
        
    <xsl:variable name="radius" as="xs:double" select="1"/>
    
    <!-- First Pie: Order matters as for the trig fcns I have to add degrees in pie order -->
    <xsl:variable name="MatrDeg" as="xs:double" select="$all-Matriarch div $all-P-Role * (2 * math:pi())"/>
    <xsl:variable name="y_matr" as="xs:double" select="math:sin($MatrDeg)"/>
    <xsl:variable name="x_matr" as="xs:double" select="math:cos($MatrDeg)"/>
    <!-- Second Pie -->
    <xsl:variable name="PatrDeg" as="xs:double" select="$all-Patriarch div $all-P-Role * (2 * math:pi())"/>
    <xsl:variable name="PatrCalcDeg" as="xs:double" select="$PatrDeg +$MatrDeg"/>
    <xsl:variable name="y_patr" as="xs:double" select="math:sin($PatrCalcDeg)"/>
    <xsl:variable name="x_patr" as="xs:double" select="math:cos($PatrCalcDeg)"/>
    <!-- Third Pie -->
    <xsl:variable name="OtherDeg" as="xs:double" select="$all-other div $all-P-Role * (2 * math:pi())"/>
    <xsl:variable name="OtherCalcDeg" as="xs:double" select="$OtherDeg + $PatrDeg +$MatrDeg"/>
    <xsl:variable name="y_other" as="xs:double" select="math:sin($OtherCalcDeg)"/>
    <xsl:variable name="x_other" as="xs:double" select="math:cos($OtherCalcDeg)"/>
    
    <svg viewBox="-1 -1 2 2"> <!--style="transform: rotate(-0.25turn)"-->
        <!--Order the paths and circle in largest area to smallest area -->
        <circle r="{$radius}" fill="white"/>
        <count><xsl:value-of select="$OtherDeg div (2 * math:pi()) * 360"/></count>
        <count><xsl:value-of select="$x_other"/></count>
        <count><xsl:value-of select="$y_other"/></count>
        <!--Matr Path  71deg--><path d="M {$radius} 0 A {$radius} {$radius} 0 0 1 {$x_matr} {$y_matr} L 0 0" fill="red"/>
        <!--Patr Path 202deg--><path d="M {$x_matr} {$y_matr}  A {$radius} {$radius} 0 1 1 {$x_patr} {$y_patr} L 0 0" fill="blue"/>
        <!--Other Path 86deg--><path d="M {$x_patr} {$y_patr} A {$radius} {$radius} 0 0 1 {$x_other} {$y_other} L 0 0" fill="yellow"/>
        <!--Matr %--><text x="{$x_matr * .5}" y="{$y_matr * .5}" width="0.2" style="font-size:0.1;color:black;">
            <xsl:value-of select="$all-Matriarch div $all-P-Role * 100"/>%</text>
        
        <!--Patr %--><text x="{$x_patr -1}" y="{$y_patr * 0}" style="font-size:0.1;color:black;">
            <xsl:value-of select="$all-Patriarch div $all-P-Role * 100"/>%</text>
        <!--Other %--><text x="{$x_other * 0.5}" y="{$y_other - 0.5}" style="font-size:0.1;color:black;">
            <xsl:value-of select="$all-other div $all-P-Role * 100"/>%</text>
    </svg>
</xsl:template>
</xsl:stylesheet>