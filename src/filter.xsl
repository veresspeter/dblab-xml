<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:functx="http://www.functx.com"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  version="2.0">

  <xsl:output method="xml" indent="yes" />

  <xsl:template match="legi1">  
    <xsl:copy>
        <xsl:copy-of select="@*"/>
	    <xsl:apply-templates select="jarat"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="/legi1/jarat">
	<xsl:copy>
		<xsl:copy-of select="@*"/>
		<xsl:apply-templates select="record"/>
	</xsl:copy>
  </xsl:template>
  
  <xsl:template match="/legi1/jarat/record">
	<xsl:if test="honnan='BUD'">
		<xsl:copy-of select="."/>
	</xsl:if>
  </xsl:template>
  
</xsl:stylesheet>
