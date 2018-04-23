<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:functx="http://www.functx.com"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  version="2.0">

  <xsl:output method="xml" indent="yes" />

  <xsl:template match="/ship">
    <xsl:copy>
      <!-- see xsl:attribute to copy attributes of the element -->
      <xsl:apply-templates select="ships" />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="ships">
    <xsl:copy>
      <!-- deep-copy all the records that are of type sailing boat -->
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
