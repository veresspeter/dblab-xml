<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:functx="http://www.functx.com"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  version="2.0">

  <xsl:output method="html" indent="yes" version="5.0" />

  <xsl:template match="/">
    <xsl:apply-templates select="legi1/jarat" />
  </xsl:template>

  <xsl:template match="jarat[@element-type='recordset']">
    <table>
		<thead>
			<tr>
			  <th>Járaszám</th>
			  <th>Indulási reptér</th>
			  <th>Érkezési reptér</th>
			  <th>Indulás ideje</th>
			  <th>Érkezés ideje</th>
			</tr>
		</thead>
		<tbody>
			<xsl:apply-templates />
		</tbody>
    </table>
  </xsl:template>

  <xsl:template match="jarat[@element-type='recordset']/record">
    <tr>
      <xsl:apply-templates select="szam" />
      <xsl:apply-templates select="honnan" />
      <xsl:apply-templates select="hova" />
      <xsl:apply-templates select="ind" />
      <xsl:apply-templates select="erk" />
    </tr>
  </xsl:template>
  
  <xsl:template match="record/ind | record/erk" priority="0.6">
    <td><xsl:value-of select="concat(substring(string(.), 0, string-length(.)-1), ':', substring(string(.), string-length(.)-1, 2))"/></td>
  </xsl:template>

  <!-- process an empty field -->
  <xsl:template match="record/*[@is-null='True']" priority="0.8">
    <td/>
  </xsl:template>

  <!-- process a non-empty field -->
  <xsl:template match="record/*" priority="0.4">
    <td>
      <xsl:value-of select="." />
    </td>
  </xsl:template>
</xsl:stylesheet>
