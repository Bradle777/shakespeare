<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/2000/svg" version="3.0">
    <xsl:output method="xml" indent="yes"/>
   
    <xsl:variable name="corpus" as="document-node()+" select="collection('../corpus?select=*.xml')"/>
    
    <xsl:template name="xsl:initial-template" match="$corpus">
        
    
        <xsl:variable name="allRoles" as="attribute(role)+" select="$corpus/descendant::depiction/@role"/>
        <xsl:variable name="MaleRoles" as="attribute(role)+" select="$corpus//depiction[@gender='male']/@role"/>
        <xsl:variable name="FemaleRoles" as="attribute(role)+" select="$corpus//depiction[@gender='female']/@role"/>
        <xsl:variable name="distinctRoles" as="xs:string+" select="distinct-values($allRoles)"/>
        
        <xsl:variable name="max_height" as="xs:decimal" select="320"/>
        <xsl:variable name="spacing" as="xs:decimal" select="68"/>
        <xsl:variable name="max_width" as="xs:decimal" select="($spacing) * count($distinctRoles)"/>
        
        <svg>
            <svg height="{$max_height + 200}" width="{$max_width + 250}"
                viewBox="-100 -{$max_height + 100} {$max_width + 200} {$max_height + 200}">
            
                <!--MAIN TITLE--><text x="{-100 + ($max_width div 2.6)}" y="-{$max_height + 50}" style="font-size:25;font-weight:bolder;">Depiction as Associated with Gender</text>
                <xsl:for-each select="0 to 4">
                    <xsl:variable name="ruling_height" as="xs:double" select=". div 4 * $max_height"/>
                    <!--HORIZONTAL LINES--><line x1="0" x2="{$max_width}" y1="-{$ruling_height}" y2="-{$ruling_height}" style="stroke:black;stroke-width:1;"/>
                    
                    <!--Y_AXIS LABEL--><text y="-{$ruling_height}" x="-50"><xsl:value-of select="0.25 * $ruling_height"/></text>
                    <!--Y_AXIS LABEL--><text x="-100" y="-{$max_height div 2}" transform="rotate(270 -60,-{$max_height div 2.5})" style="font-size:20;font-weight:bold;"># of Appearances</text>
                    <!--X_AXIS LABEL--><text x="{$max_width div 2.5}" y="70" style="font-size:20;font-weight:bold;">Attribute Values</text>
                </xsl:for-each>  
                
            </svg>
            
                        
            <xsl:for-each select="$distinctRoles">
                <xsl:variable name="position-of" as="xs:integer" select="position()"/>
                
                <xsl:variable name="xpos" as="xs:decimal" select="(($position-of -1) * $spacing) + ($spacing div 2)"/>
                <xsl:variable name="bar-loc" as="xs:decimal" select="$xpos + ($spacing * 1.5)"/>
                <xsl:variable name="ypos-male" as="xs:decimal" select="4 * count($MaleRoles[. eq current()])"/>
                <xsl:variable name="ypos-female" as="xs:decimal" select="4 * count($FemaleRoles[. eq current()])"/>
                                
               
                <!--X_AXIS LABEL--><text x="{$bar-loc}" y="{1.4 * $max_height}" style="font-size:12;">
                    <xsl:value-of select="."/>
                </text>
                <!-- You need to use current() instead of the dot after the 'eq' in the predicate below -->
                
              
                <!--Male Bar: Color Orange-->
                <rect width="{$spacing div 3}" height="{$ypos-male}" x="{$bar-loc}" y="-{$max_height * 1.3125}" 
                    transform="scale(1,-1)" style="fill:orange;opacity:0.5;"/>
                <!--Female Bar: Color Green-->
                <rect width="{$spacing div 3}" height="{$ypos-female}" x="{$bar-loc + ($spacing div 3)}" y="-{$max_height * 1.3125}" 
                    transform="scale(1,-1)" style="fill:purple;opacity:0.5;"/>
                
                <!--This is extra code for me to see in the text what the count is outputting -->
                <count>
                    <xsl:value-of select="count($allRoles[. eq current()])"/>
                </count>
            </xsl:for-each>
        </svg>
    </xsl:template>
</xsl:stylesheet>