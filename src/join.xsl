<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:functx="http://www.functx.com"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  version="2.0">

  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/legi1" >
    <jarat-lista>
      <xsl:apply-templates select="jarat/record" />
    </jarat-lista>
  </xsl:template>

  <xsl:template match="jarat[@element-type='recordset']/record">
    <jarat>
      <xsl:attribute name="id">
        <xsl:value-of select="@jarat_id" />
      </xsl:attribute>
	  
	  <xsl:apply-templates select="szam | honnan | hova"/>
      
	  <menetrend>
        <xsl:variable name="jaratid" select="@jarat_id" />
		<xsl:apply-templates select="/legi1/menetrend/record[jarat_id=$jaratid]"/>
      </menetrend>
    </jarat>
  </xsl:template>
  
  <xsl:template match="jarat[@element-type='recordset']/record/*">
	<xsl:copy>
	  <xsl:copy-of select="node() except @*"/>
	</xsl:copy>
  </xsl:template>
  
  <xsl:template match="menetrend[@element-type='recordset']/record">
	<repul>
	  <xsl:attribute name="gep">
		<xsl:value-of select="gep_id" />
	  </xsl:attribute>
	  
	  <xsl:attribute name="pilota">
		<xsl:value-of select="pilota" />
	  </xsl:attribute>
	</repul>
  </xsl:template>
</xsl:stylesheet>
