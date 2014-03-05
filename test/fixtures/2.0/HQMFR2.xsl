<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:n1="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="html" indent="yes" version="4.01" encoding="ISO-8859-1" doctype-system="http://www.w3.org/TR/html4/strict.dtd" doctype-public="-//W3C//DTD HTML 4.01//EN"/>
	<!-- global variable title -->
	<xsl:variable name="title">
		<xsl:choose>
			<xsl:when test="string-length(/n1:QualityMeasureDocument/n1:title/@value)  &gt;= 1">
				<xsl:value-of select="/n1:QualityMeasureDocument/n1:title/@value"/>
			</xsl:when>
			<xsl:when test="/n1:QualityMeasureDocument/n1:code/n1:displayName/@value">
				<xsl:value-of select="/n1:QualityMeasureDocument/n1:code/n1:displayName/@value"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>eMeasure</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="short_title">
      <xsl:if test="string-length($title)>0">
         <xsl:choose>
              <xsl:when test="contains($title, '(NQF)')">
                  <xsl:value-of select="substring-before($title,'(NQF')"/>
              </xsl:when>
              <xsl:otherwise><xsl:value-of select="$title"/></xsl:otherwise>
         </xsl:choose>
      </xsl:if>
   </xsl:variable>
	<xsl:preserve-space elements="n1:content"/>
	<!-- Main -->
	<xsl:template match="/">
		<xsl:apply-templates select="n1:QualityMeasureDocument"/>
	</xsl:template>
	<!-- produce browser rendered, human readable clinical document	-->
	<xsl:template match="n1:QualityMeasureDocument">
		<html>
			<head>
				<title>
					<xsl:value-of select="$title"/>
				</title>
				<xsl:call-template name="addCSS"/>
			</head>
			<body>
				<table class="header_table">
					<tbody>
						<!-- START display top portion of clinical document -->
						<xsl:call-template name="documentGeneral"/>
						<xsl:call-template name="relatedDocument"/>
						<xsl:call-template name="emeasureBrief"/>
						<xsl:call-template name="subjectOf"/>
					</tbody>
				</table>
				<!-- END display top portion of clinical document -->
				<!-- produce table of contents -->
				<xsl:call-template name="make-tableofcontents"/>
				<hr align="left" color="teal" size="2" width="80%"/>
				<!-- produce human readable document content -->
				<xsl:for-each select="/n1:QualityMeasureDocument/n1:component">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
				<br/>
				<hr align="left" color="teal" size="2" width="80%"/>
				<br/>
				<!-- START display bottom portion of clinical document -->
				<xsl:call-template name="componentof"/>
				<!-- END display bottom portion of clinical document -->
			</body>
		</html>
	</xsl:template>
	<!-- generate table of contents -->
	<xsl:template name="make-tableofcontents">
		<h2>
			<a name="toc">Table of Contents</a>
		</h2>
		<ul>
			<xsl:for-each select="n1:component/n1:*/n1:title/@value">
				<li>
					<a href="#{generate-id(.)}">
						<xsl:value-of select="."/>
					</a>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	<!-- header elements -->
	<xsl:template name="documentGeneral">
		<!-- eMeasure name -->
		<tr>			
			<td width="20%" bgcolor="#656565" style="background-color:#656565">
				<span class="td_label">
					<xsl:text>eMeasure Title</xsl:text>
				</span>
			</td>
			<td width="80%" colspan="3">
				<xsl:value-of select="$short_title"/>
			</td>
		</tr>
		<!-- eMeasure Identifier, eMeasure version -->
		<tr>
			<td width="20%" bgcolor="#656565" style="background-color:#656565">
				<span class="td_label">
					<xsl:text>eMeasure Identifier</xsl:text> 
					<br/>
					<xsl:text>(Measure Authoring Tool)</xsl:text>
				</span>
			</td>
			<td width="30%">
				<xsl:choose>
					<xsl:when test="string-length(n1:subjectOf/n1:measureAttribute[n1:code[n1:originalText[@value='eMeasure Identifier']]]/n1:value/@value)>0">
						<xsl:value-of select="n1:subjectOf/n1:measureAttribute[n1:code[n1:originalText[@value='eMeasure Identifier']]]/n1:value/@value"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text></xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			
			<td width="20%" bgcolor="#656565" style="background-color:#656565">
				<span class="td_label">
					<xsl:text>eMeasure Version number</xsl:text>
				</span>
			</td>
			<td width="30%">
				<xsl:value-of select="n1:versionNumber/@value"/>
			</td>
		</tr>
		<!-- nqf id number, GUID -->
		<tr>
			<td width="20%" bgcolor="#656565" style="background-color:#656565">
				<span class="td_label">
					<xsl:text>NQF Number</xsl:text>
				</span>
			</td>
			<td width="30%">
				<xsl:choose>
					<xsl:when test="n1:subjectOf/n1:measureAttribute[n1:code[n1:originalText[@value='NQF ID Number']]]/n1:value/@extension">
							<xsl:value-of select="n1:subjectOf/n1:measureAttribute[n1:code[n1:originalText[@value='NQF ID Number']]]/n1:value/@extension"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>None</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td width="20%" bgcolor="#656565" style="background-color:#656565">
				<span class="td_label">
					<xsl:text>GUID</xsl:text>
				</span>
			</td>
			<td>
				<xsl:call-template name="show-id">
					<xsl:with-param name="id" select="n1:setId"/>
				</xsl:call-template>
			</td>
		</tr>
		<!-- Measurement Period -->
		<tr>
			<td width="20%" bgcolor="#656565" style="background-color:#656565">
				<span class="td_label">
					<xsl:text>Measurement Period</xsl:text>
				</span>
			</td>
			<td width="80%" colspan="3">
				<xsl:choose>
					<xsl:when test="n1:controlVariable/n1:measurePeriod[n1:code[@code='MSRTP']]">
						<xsl:value-of select="n1:controlVariable/n1:measurePeriod[n1:code[@code='MSRTP']]/n1:value/n1:low/@value"/>
						<xsl:text> through </xsl:text> 
						<xsl:value-of select="n1:controlVariable/n1:measurePeriod[n1:code[@code='MSRTP']]/n1:value/n1:high/@value"/>
					</xsl:when>
				</xsl:choose>
			</td>
		</tr>
		<!-- Measure Steward -->
		<xsl:for-each select="n1:custodian">
			<xsl:call-template name="assignedPerson">
				<xsl:with-param name="label" select="string('Measure Steward')"/>
				<xsl:with-param name="particpt" select="."/>
			</xsl:call-template>
		</xsl:for-each>
		<!-- Measure Author - Measure Developer -->
		<xsl:for-each select="n1:author">
			<xsl:call-template name="assignedPerson">
				<xsl:with-param name="label" select="string('Measure Developer')"/>
				<xsl:with-param name="particpt" select="."/>
			</xsl:call-template>
		</xsl:for-each>
		<!-- Endorsed by -->
		<xsl:for-each select="n1:verifier">
			<xsl:call-template name="assignedPerson">
				<xsl:with-param name="label" select="string('Endorsed By')"/>
				<xsl:with-param name="particpt" select="."/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	<!-- Measure set -->
	<xsl:template name="componentof">
		<xsl:if test="n1:componentOf">
			<table class="header_table">
				<tbody>
					<xsl:for-each select="n1:componentOf/n1:qualityMeasureSet">
						<tr>
							<td width="20%" bgcolor="#656565" style="background-color:#656565">
								<span class="td_label">
									<xsl:text>Measure Set</xsl:text>
								</span>
							</td>
							<td colspan="3" width="80%">
								<div style="width:660px;overflow-x:hidden;overflow-y:auto;word-wrap:break-word">
									<xsl:choose>
										<xsl:when test="n1:title">
											<xsl:value-of select="n1:title"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="n1:id">
												<xsl:text>id: </xsl:text>
												<xsl:for-each select="n1:id">
													<xsl:call-template name="show-id">
														<xsl:with-param name="id" select="."/>
													</xsl:call-template>
												</xsl:for-each>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!--Template: assignedPerson -->
	<xsl:template name="assignedPerson">
		<xsl:param name="label"/>
		<xsl:param name="particpt"/>
		<tr>
			<td width="20%" bgcolor="#656565" style="background-color:#656565">
				<span class="td_label">
					<xsl:value-of select="$label"/>
				</span>
			</td>
			<td width="80%" colspan="3">
				<xsl:choose>
					<xsl:when test="$particpt/n1:responsibleParty/n1:representedResponsibleOrganization/n1:name/n1:item/n1:part">
						<xsl:value-of select="$particpt/n1:responsibleParty/n1:representedResponsibleOrganization/n1:name/n1:item/n1:part/@value"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$particpt/n1:responsibleParty/n1:representedResponsibleOrganization/n1:id/n1:item/@root"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
		<xsl:if test="$particpt/n1:addr | $particpt/n1:telecom">
			<tr>
				<td bgcolor="#656565" style="background-color:#656565">
					<span class="td_label">
						<xsl:text>Contact info</xsl:text>
					</span>
				</td>
				<td colspan="3">
					<xsl:call-template name="show-contactInfo">
						<xsl:with-param name="contact" select="."/>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	<!-- Related document -->
	<xsl:template name="relatedDocument">
		<xsl:if test="n1:relatedDocument">
			<xsl:for-each select="n1:relatedDocument">
				<tr>
					<td width="20%" bgcolor="#656565" style="background-color:#656565">
						<span class="td_label">
							<xsl:text>Related document</xsl:text>
						</span>
					</td>
					<td colspan="3">
						<xsl:for-each select="n1:parentDocument">
							<xsl:for-each select="n1:id">
								<xsl:call-template name="show-id"/>
								<br/>
							</xsl:for-each>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Description-->
	<xsl:template name="emeasureBrief">
		<tr>
			<td width="20%" bgcolor="#656565" style="background-color:#656565">
				<span class="td_label">
					<xsl:text>Description</xsl:text>
				</span>
			</td>
			<td width="80%" colspan="3">
				<div style="width:660px;overflow-x:hidden;overflow-y:auto">
					<pre>
						<xsl:value-of select="n1:text/@value"/>
					</pre>
				</div>
			</td>
		</tr>
	</xsl:template>
	<!-- emeasureAttributes -->
	<xsl:template name="subjectOf">
		<!-- copyRight -->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/@code='COPY']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>
		<!-- Disclaimer -->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/@code='DISC']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>		
		<!-- Measure scoring -->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/@code='MSRSCORE']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>
		<!-- Measure type -->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/@code='MSRTYPE']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>		
		<!-- Stratification -->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/@code='STRAT']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>						
		<!-- Risk Adjustment -->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/@code='MSRADJ']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>
		<!-- Data Aggregation - Rate Aggregation -->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/@code='MSRAGG']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>
	    <!-- Rationale -->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/@code='RAT']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>							    
	    <!-- Clinical Recommendation Statement-->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/@code='CRS']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>							    		
	    <!-- Improvement notation-->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/@code='IDUR']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>							    				
	    <!-- Reference-->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/@code='REF']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>
		<!-- Definition -->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/@code='DEF']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>					    								
	    <!-- Guidance-->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/@code='GUIDE']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>
		<!-- Transmission format -->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/n1:originalText/@value='Transmission Format']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>
		<!-- Initial Patient Population -->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/@code='IPP']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>
		<!-- Denominator -->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/@code='DENOM']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>		
		<!-- Denominator Exclusions -->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/n1:originalText/@value='Denominator Exclusions']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>
		<!-- Numerator -->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/@code='NUMER']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>
		<!-- Numerator Exclusions -->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/n1:originalText/@value='Numerator Exclusions']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>				
		<!-- Denominator Exceptions -->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/@code='DENEXCEP']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>	
		<!-- Measure Population -->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/@code='MSRPOPL']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>		
		<!-- Measure Observations -->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/n1:originalText/@value='Measure Observations']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>
		<!-- Supplemental Data Elements -->
		<xsl:for-each select="n1:subjectOf/n1:measureAttribute[n1:code/n1:originalText/@value='Supplemental Data Elements']">
			<xsl:call-template name="show-subjectOf"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="show-subjectOf">
		<xsl:if test="not (n1:code[@code='MSRSD' or @code='MSRED'])">
			<tr>
				<td width="20%" bgcolor="#656565" style="background-color:#656565">
					<span class="td_label">
						<xsl:choose>
							<xsl:when test="n1:code[@code='MSRTP']">
								<xsl:text>Measurement duration 1</xsl:text>
							</xsl:when>
							<xsl:when test="n1:code[not(@code='MSRTP')]">
								<xsl:call-template name="show-code">
									<xsl:with-param name="code" select="n1:code"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise> EMeasure Attribute </xsl:otherwise>
						</xsl:choose>
					</span>
				</td>
				<td width="80%" colspan="3">
					<xsl:choose>
						<xsl:when test="n1:value[@xsi:type='ED'][@mediaType='text/plain']">
						<div style="width:660px;overflow-x:hidden;overflow-y:auto">
								<pre>
									<xsl:choose>
										<xsl:when test="n1:value/@nullFlavor">
											<xsl:call-template name="show-nullFlavor">
												<xsl:with-param name="nf" select="n1:value/@nullFlavor"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="n1:value/@value"/>
										</xsl:otherwise>
									</xsl:choose>
								</pre>
							</div>
						</xsl:when>
						<xsl:when test="n1:value[@xsi:type='ED'][not(@mediaType='text/plain')]">
							<xsl:value-of select="n1:value/@value"/>
						</xsl:when>
						<xsl:when test="n1:value[@xsi:type='CD']">
							<xsl:call-template name="show-code">
								<xsl:with-param name="code" select="n1:value"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="n1:value[@xsi:type='PQ' or @xsi:type='EXPR_PQ']">
							<xsl:call-template name="show-value">
								<xsl:with-param name="value" select="n1:value"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="n1:value[@xsi:type='TS']">
							<xsl:call-template name="show-value">
								<xsl:with-param name="value" select="n1:value"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="n1:value"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>

	<!-- show StructuredBody -->
	<xsl:template match="n1:component">
		<xsl:for-each select="n1:*">
			<xsl:call-template name="section"/>
		</xsl:for-each>
	</xsl:template>
	<!-- top level component/section: display title and text,
     and process any nested component/sections
	 -->
	<xsl:template name="section">
		<xsl:call-template name="section-title">
			<xsl:with-param name="title" select="n1:title"/>
		</xsl:call-template>
		<xsl:call-template name="section-text"/>
		<xsl:for-each select="n1:component/n1:section">
			<xsl:call-template name="nestedSection">
				<xsl:with-param name="margin" select="2"/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	<!-- top level section title -->
	<xsl:template name="section-title">
		<xsl:param name="title"/>
		<h3>
			<a name="{generate-id($title/@value)}" href="#toc">
				<xsl:value-of select="$title/@value"/>
			</a>
		</h3>
	</xsl:template>
	<!-- section author -->
	<xsl:template name="section-author">
		<xsl:if test="count(n1:author)&gt;0">
			<div style="margin-left : 2em;">
				<b>
					<xsl:text>Section Author: </xsl:text>
				</b>
				<xsl:for-each select="n1:author/n1:assignedAuthor">
					<xsl:choose>
						<xsl:when test="n1:assignedPerson/n1:name">
							<xsl:call-template name="show-name">
								<xsl:with-param name="name" select="n1:assignedPerson/n1:name"/>
							</xsl:call-template>
							<xsl:if test="n1:representedOrganization">
								<xsl:text>, </xsl:text>
								<xsl:call-template name="show-name">
									<xsl:with-param name="name" select="n1:representedOrganization/n1:name"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:when>
						<xsl:when test="n1:assignedAuthoringDevice/n1:softwareName">
							<xsl:value-of select="n1:assignedAuthoringDevice/n1:softwareName"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="n1:id">
								<xsl:call-template name="show-id"/>
								<br/>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<br/>
			</div>
		</xsl:if>
	</xsl:template>
	<!-- top-level section Text   -->
	<xsl:template name="section-text">
		<div>
			<xsl:apply-templates select="n1:text"/>
		</div>
	</xsl:template>
	<!-- nested component/section -->
	<xsl:template name="nestedSection">
		<xsl:param name="margin"/>
		<h4 style="margin-left : {$margin}em;">
			<xsl:value-of select="n1:title"/>
		</h4>
		<div style="margin-left : {$margin}em;">
			<xsl:apply-templates select="n1:text"/>
		</div>
		<xsl:for-each select="n1:component/n1:section">
			<xsl:call-template name="nestedSection">
				<xsl:with-param name="margin" select="2*$margin"/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	<!--   paragraph  -->
	<xsl:template match="n1:paragraph">
		<p>
			<xsl:choose>
				<xsl:when test="n1:caption">
					<xsl:variable name="popcrit">
						<xsl:value-of select="current()/n1:caption"/>
					</xsl:variable>
					<xsl:if test="starts-with($popcrit,'Population Criteria')">
						<span style="font-weight:bold; ">
							<xsl:text>&#160;&#160;&#160;&#160;&#160;&#160;------ </xsl:text>
							<xsl:apply-templates/>
							<xsl:text> ------</xsl:text>
						</span>
					</xsl:if>
					<xsl:if test="not (starts-with($popcrit,'Population Criteria'))">
						<xsl:apply-templates/>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates/>
				</xsl:otherwise>
			</xsl:choose>
		</p>
	</xsl:template>
	<!--   pre format  -->
	<xsl:template match="n1:pre">
		<pre>
			<xsl:apply-templates/>
		</pre>
	</xsl:template>
	<!--   Content w/ deleted text is hidden -->
	<xsl:template match="n1:content[@revised='delete']"/>
	<!--   content  -->
	<xsl:template match="n1:content">
		<xsl:apply-templates/>
	</xsl:template>
	<!-- line break -->
	<xsl:template match="n1:br">
		<xsl:element name='br'>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<!--   list  -->
	<xsl:template match="n1:list">
		<xsl:if test="n1:caption">
			<p>
				<b>
					<xsl:apply-templates select="n1:caption"/>
				</b>
			</p>
		</xsl:if>
		<ul>
			<xsl:for-each select="n1:item">
				<li>
					<xsl:apply-templates/>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	<xsl:template match="n1:list[@listType='ordered']">
		<xsl:if test="n1:caption">
			<span style="font-weight:bold; ">
				<xsl:apply-templates select="n1:caption"/>
			</span>
		</xsl:if>
		<ol>
			<xsl:for-each select="n1:item">
				<li>
					<xsl:apply-templates/>
				</li>
			</xsl:for-each>
		</ol>
	</xsl:template>
	<!--   caption  
   <xsl:template match="n1:caption">
      <xsl:apply-templates/>
      <xsl:text>: </xsl:text>
   </xsl:template>
-->
	<!--  Tables   -->
	<xsl:template match="n1:table/@*|n1:thead/@*|n1:tfoot/@*|n1:tbody/@*|n1:colgroup/@*|n1:col/@*|n1:tr/@*|n1:th/@*|n1:td/@*">
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="n1:table">
		<table class="narr_table">
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</table>
	</xsl:template>
	<xsl:template match="n1:thead">
		<thead>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</thead>
	</xsl:template>
	<xsl:template match="n1:tfoot">
		<tfoot>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</tfoot>
	</xsl:template>
	<xsl:template match="n1:tbody">
		<tbody>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</tbody>
	</xsl:template>
	<xsl:template match="n1:colgroup">
		<colgroup>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</colgroup>
	</xsl:template>
	<xsl:template match="n1:col">
		<col>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</col>
	</xsl:template>
	<xsl:template match="n1:tr">
		<tr class="narr_tr">
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</tr>
	</xsl:template>
	<xsl:template match="n1:th">
		<th class="narr_th">
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</th>
	</xsl:template>
	<xsl:template match="n1:td">
		<td>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</td>
	</xsl:template>
	<xsl:template match="n1:table/n1:caption">
		<span style="font-weight:bold; ">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<!--   RenderMultiMedia 
    this currently only handles GIF's and JPEG's.  It could, however,
    be extended by including other image MIME types in the predicate
    and/or by generating <object> or <applet> tag with the correct
    params depending on the media type  @ID  =$imageRef  referencedObject
    -->
	<xsl:template match="n1:renderMultiMedia">
		<xsl:variable name="imageRef" select="@referencedObject"/>
		<xsl:choose>
			<xsl:when test="//n1:regionOfInterest[@ID=$imageRef]">
				<!-- Here is where the Region of Interest image referencing goes -->
				<xsl:if test="//n1:regionOfInterest[@ID=$imageRef]//n1:observationMedia/n1:value[@mediaType='image/gif'           or
          @mediaType='image/jpeg']">
					<br clear="all"/>
					<xsl:element name="img">
						<xsl:attribute name="src"><xsl:value-of select="//n1:regionOfInterest[@ID=$imageRef]//n1:observationMedia/n1:value/n1:reference/@value"/></xsl:attribute>
					</xsl:element>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<!-- Here is where the direct MultiMedia image referencing goes -->
				<xsl:if test="//n1:observationMedia[@ID=$imageRef]/n1:value[@mediaType='image/gif' or @mediaType='image/jpeg']">
					<br clear="all"/>
					<xsl:element name="img">
						<xsl:attribute name="src"><xsl:value-of select="//n1:observationMedia[@ID=$imageRef]/n1:value/n1:reference/@value"/></xsl:attribute>
					</xsl:element>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--    Stylecode processing   
    Supports Bold, Underline and Italics display
    -->
	<xsl:template match="//n1:*[@styleCode]">
		<xsl:if test="@styleCode='Bold'">
			<xsl:element name="b">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:if>
		<xsl:if test="@styleCode='Italics'">
			<xsl:element name="i">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:if>
		<xsl:if test="@styleCode='Underline'">
			<xsl:element name="u">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:if>
		<xsl:if test="contains(@styleCode,'Bold') and contains(@styleCode,'Italics') and not (contains(@styleCode, 'Underline'))">
			<xsl:element name="b">
				<xsl:element name="i">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:element>
		</xsl:if>
		<xsl:if test="contains(@styleCode,'Bold') and contains(@styleCode,'Underline') and not (contains(@styleCode, 'Italics'))">
			<xsl:element name="b">
				<xsl:element name="u">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:element>
		</xsl:if>
		<xsl:if test="contains(@styleCode,'Italics') and contains(@styleCode,'Underline') and not (contains(@styleCode, 'Bold'))">
			<xsl:element name="i">
				<xsl:element name="u">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:element>
		</xsl:if>
		<xsl:if test="contains(@styleCode,'Italics') and contains(@styleCode,'Underline') and contains(@styleCode, 'Bold')">
			<xsl:element name="b">
				<xsl:element name="i">
					<xsl:element name="u">
						<xsl:apply-templates/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:if>
		<xsl:if test="not (contains(@styleCode,'Italics') or contains(@styleCode,'Underline') or contains(@styleCode, 'Bold'))">
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<!--    Superscript or Subscript   -->
	<xsl:template match="n1:sup">
		<xsl:element name="sup">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="n1:sub">
		<xsl:element name="sub">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<!-- show nonXMLBody -->
	<xsl:template match='n1:component/n1:nonXMLBody'>
		<xsl:choose>
			<!-- if there is a reference, use that in an IFRAME -->
			<xsl:when test='n1:text/n1:reference'>
				<IFRAME name='nonXMLBody' id='nonXMLBody' WIDTH='80%' HEIGHT='66%' src='{n1:text/n1:reference/@value}'/>
			</xsl:when>
			<xsl:when test='n1:text/@mediaType="text/plain"'>
				<pre>
					<xsl:value-of select='n1:text/text()'/>
				</pre>
			</xsl:when>
			<xsl:otherwise>
				<CENTER>Cannot display the text</CENTER>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- show-signature -->
	<xsl:template name="show-sig">
		<xsl:param name="sig"/>
		<xsl:choose>
			<xsl:when test="$sig/@code =&apos;S&apos;">
				<xsl:text>signed</xsl:text>
			</xsl:when>
			<xsl:when test="$sig/@code=&apos;I&apos;">
				<xsl:text>intended</xsl:text>
			</xsl:when>
			<xsl:when test="$sig/@code=&apos;X&apos;">
				<xsl:text>signature required</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!--	show-id	-->
	<xsl:template name="show-id">
		<xsl:param name="id"/>
		<xsl:choose>
			<xsl:when test="$id/@nullFlavor">
				<xsl:call-template name="show-nullFlavor">
					<xsl:with-param name="nf" select="$id/@nullFlavor"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="$id/@extension">
					<xsl:value-of select="$id/@extension"/>
				</xsl:if>
				<xsl:text> </xsl:text>
				<xsl:value-of select="$id/@root"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- show-name	-->
	<xsl:template name="show-name">
		<xsl:param name="name"/>
		<xsl:choose>
			<xsl:when test="$name/n1:family">
				<xsl:if test="$name/n1:prefix">
					<xsl:value-of select="$name/n1:prefix"/>
					<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:value-of select="$name/n1:given"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="$name/n1:family"/>
				<xsl:if test="$name/n1:suffix">
					<xsl:text>, </xsl:text>
					<xsl:value-of select="$name/n1:suffix"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$name/@value"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- show-gender	-->
	<xsl:template name="show-gender">
		<xsl:choose>
			<xsl:when test="@code   = &apos;M&apos;">
				<xsl:text>Male</xsl:text>
			</xsl:when>
			<xsl:when test="@code  = &apos;F&apos;">
				<xsl:text>Female</xsl:text>
			</xsl:when>
			<xsl:when test="@code  = &apos;U&apos;">
				<xsl:text>Undifferentiated</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- show-contactInfo -->
	<xsl:template name="show-contactInfo">
		<xsl:param name="contact"/>
		<xsl:call-template name="show-address">
			<xsl:with-param name="address" select="$contact/n1:addr"/>
		</xsl:call-template>
		<xsl:call-template name="show-telecom">
			<xsl:with-param name="telecom" select="$contact/n1:telecom"/>
		</xsl:call-template>
	</xsl:template>
	<!-- show-address	-->
	<xsl:template name="show-address">
		<xsl:param name="address"/>
		<xsl:choose>
			<xsl:when test="$address">
				<xsl:if test="$address/@use">
					<xsl:text> </xsl:text>
					<xsl:call-template name="translateTelecomCode">
						<xsl:with-param name="code" select="$address/@use"/>
					</xsl:call-template>
					<xsl:text>:</xsl:text>
					<br/>
				</xsl:if>
				<xsl:for-each select="$address/n1:streetAddressLine">
					<xsl:value-of select="."/>
					<br/>
				</xsl:for-each>
				<xsl:if test="$address/n1:streetName">
					<xsl:value-of select="$address/n1:streetName"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="$address/n1:houseNumber"/>
					<br/>
				</xsl:if>
				<xsl:if test="string-length($address/n1:city)>0">
					<xsl:value-of select="$address/n1:city"/>
				</xsl:if>
				<xsl:if test="string-length($address/n1:state)>0">
					<xsl:text>,&#160;</xsl:text>
					<xsl:value-of select="$address/n1:state"/>
				</xsl:if>
				<xsl:if test="string-length($address/n1:postalCode)>0">
					<xsl:text>&#160;</xsl:text>
					<xsl:value-of select="$address/n1:postalCode"/>
				</xsl:if>
				<xsl:if test="string-length($address/n1:country)>0">
					<xsl:text>,&#160;</xsl:text>
					<xsl:value-of select="$address/n1:country"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>address not available</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<br/>
	</xsl:template>
	<!-- show-telecom	-->
	<xsl:template name="show-telecom">
		<xsl:param name="telecom"/>
		<xsl:choose>
			<xsl:when test="$telecom">
				<xsl:variable name="type" select="substring-before($telecom/@value, ':')"/>
				<xsl:variable name="value" select="substring-after($telecom/@value, ':')"/>
				<xsl:if test="$type">
					<xsl:call-template name="translateTelecomCode">
						<xsl:with-param name="code" select="$type"/>
					</xsl:call-template>
					<xsl:if test="@use">
						<xsl:text> (</xsl:text>
						<xsl:call-template name="translateTelecomCode">
							<xsl:with-param name="code" select="@use"/>
						</xsl:call-template>
						<xsl:text>)</xsl:text>
					</xsl:if>
					<xsl:text>: </xsl:text>
					<xsl:text> </xsl:text>
					<xsl:value-of select="$value"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>Telecom information not available</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<br/>
	</xsl:template>
	<!-- show-recipientType -->
	<xsl:template name="show-recipientType">
		<xsl:param name="typeCode"/>
		<xsl:choose>
			<xsl:when test="$typeCode='PRCP'">Primary Recipient:</xsl:when>
			<xsl:when test="$typeCode='TRC'">Secondary Recipient:</xsl:when>
			<xsl:otherwise>Recipient:</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Convert Telecom URL to display text -->
	<xsl:template name="translateTelecomCode">
		<xsl:param name="code"/>
		<!--xsl:value-of select="document('voc.xml')/systems/system[@root=$code/@codeSystem]/code[@value=$code/@code]/@displayName"/-->
		<!--xsl:value-of select="document('codes.xml')/*/code[@code=$code]/@display"/-->
		<xsl:choose>
			<!-- lookup table Telecom URI -->
			<xsl:when test="$code='tel'">
				<xsl:text>Tel</xsl:text>
			</xsl:when>
			<xsl:when test="$code='fax'">
				<xsl:text>Fax</xsl:text>
			</xsl:when>
			<xsl:when test="$code='http'">
				<xsl:text>Web</xsl:text>
			</xsl:when>
			<xsl:when test="$code='mailto'">
				<xsl:text>Mail</xsl:text>
			</xsl:when>
			<xsl:when test="$code='H'">
				<xsl:text>Home</xsl:text>
			</xsl:when>
			<xsl:when test="$code='HV'">
				<xsl:text>Vacation Home</xsl:text>
			</xsl:when>
			<xsl:when test="$code='HP'">
				<xsl:text>Pirmary Home</xsl:text>
			</xsl:when>
			<xsl:when test="$code='WP'">
				<xsl:text>Work Place</xsl:text>
			</xsl:when>
			<xsl:when test="$code='PUB'">
				<xsl:text>Pub</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>{$code='</xsl:text>
				<xsl:value-of select="$code"/>
				<xsl:text>'?}</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- convert RoleClassAssociative code to display text -->
	<xsl:template name="translateRoleAssoCode">
		<xsl:param name="code"/>
		<xsl:choose>
			<xsl:when test="$code='AFFL'">
				<xsl:text>affiliate</xsl:text>
			</xsl:when>
			<xsl:when test="$code='AGNT'">
				<xsl:text>agent</xsl:text>
			</xsl:when>
			<xsl:when test="$code='ASSIGNED'">
				<xsl:text>assigned entity</xsl:text>
			</xsl:when>
			<xsl:when test="$code='COMPAR'">
				<xsl:text>commissioning party</xsl:text>
			</xsl:when>
			<xsl:when test="$code='CON'">
				<xsl:text>contact</xsl:text>
			</xsl:when>
			<xsl:when test="$code='ECON'">
				<xsl:text>emergency contact</xsl:text>
			</xsl:when>
			<xsl:when test="$code='NOK'">
				<xsl:text>next of kin</xsl:text>
			</xsl:when>
			<xsl:when test="$code='SGNOFF'">
				<xsl:text>signing authority</xsl:text>
			</xsl:when>
			<xsl:when test="$code='GUARD'">
				<xsl:text>guardian</xsl:text>
			</xsl:when>
			<xsl:when test="$code='GUAR'">
				<xsl:text>guardian</xsl:text>
			</xsl:when>
			<xsl:when test="$code='CIT'">
				<xsl:text>citizen</xsl:text>
			</xsl:when>
			<xsl:when test="$code='COVPTY'">
				<xsl:text>covered party</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>{$code='</xsl:text>
				<xsl:value-of select="$code"/>
				<xsl:text>'?}</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- show time -->
	<xsl:template name="show-time">
		<xsl:param name="datetime"/>
		<xsl:choose>
			<xsl:when test="not($datetime)">
				<xsl:call-template name="formatDateTime">
					<xsl:with-param name="date" select="@value"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="formatDateTime">
					<xsl:with-param name="date" select="$datetime/@value"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- show assignedEntity -->
	<xsl:template name="show-assignedEntity">
		<xsl:param name="asgnEntity"/>
		<xsl:choose>
			<xsl:when test="$asgnEntity/n1:assignedPerson/n1:name">
				<xsl:call-template name="show-name">
					<xsl:with-param name="name" select="$asgnEntity/n1:assignedPerson/n1:name"/>
				</xsl:call-template>
				<xsl:if test="$asgnEntity/n1:representedOrganization/n1:name">
					<xsl:text> of </xsl:text>
					<xsl:value-of select="$asgnEntity/n1:representedOrganization/n1:name"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$asgnEntity/n1:representedOrganization">
				<xsl:value-of select="$asgnEntity/n1:representedOrganization/n1:name"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="$asgnEntity/n1:id">
					<xsl:call-template name="show-id"/>
					<xsl:choose>
						<xsl:when test="position()!=last()">
							<xsl:text>, </xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<br/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- show relatedEntity -->
	<xsl:template name="show-relatedEntity">
		<xsl:param name="relatedEntity"/>
		<xsl:choose>
			<xsl:when test="$relatedEntity/n1:relatedPerson/n1:name">
				<xsl:call-template name="show-name">
					<xsl:with-param name="name" select="$relatedEntity/n1:relatedPerson/n1:name"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- show associatedEntity -->
	<xsl:template name="show-associatedEntity">
		<xsl:param name="assoEntity"/>
		<xsl:choose>
			<xsl:when test="$assoEntity/n1:associatedPerson">
				<xsl:for-each select="$assoEntity/n1:associatedPerson/n1:name">
					<xsl:call-template name="show-name">
						<xsl:with-param name="name" select="."/>
					</xsl:call-template>
					<br/>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$assoEntity/n1:scopingOrganization">
				<xsl:for-each select="$assoEntity/n1:scopingOrganization">
					<xsl:if test="n1:name">
						<xsl:call-template name="show-name">
							<xsl:with-param name="name" select="n1:name"/>
						</xsl:call-template>
						<br/>
					</xsl:if>
					<xsl:if test="n1:standardIndustryClassCode">
						<xsl:value-of select="n1:standardIndustryClassCode/@displayName"/>
						<xsl:text> code:</xsl:text>
						<xsl:value-of select="n1:standardIndustryClassCode/@code"/>
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$assoEntity/n1:code">
				<xsl:call-template name="show-code">
					<xsl:with-param name="code" select="$assoEntity/n1:code"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$assoEntity/n1:id">
				<xsl:value-of select="$assoEntity/n1:id/@extension"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="$assoEntity/n1:id/@root"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- show code 
		if originalText present, return it, otherwise, check and return attribute: display name
    -->
	<xsl:template name="show-code">
		<xsl:param name="code"/>
		<xsl:variable name="this-codeSystem">
			<xsl:value-of select="$code/@codeSystem"/>
		</xsl:variable>
		<xsl:variable name="this-code">
			<xsl:value-of select="$code/@code"/>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$code/n1:originalText">
				<xsl:value-of select="$code/n1:originalText/@value"/>
			</xsl:when>
			<xsl:when test="$code/n1:displayName/@value">
				<xsl:value-of select="$code/n1:displayName/@value"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$this-code"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- show code: code is a value -->
	<xsl:template name="show-code-value">
		<xsl:param name="code"/>
		<xsl:choose>
			<xsl:when test="$code='a'">
				<xsl:text>year</xsl:text>
			</xsl:when>
			<xsl:when test="$code='m'">
				<xsl:text>month</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- show-value -->
	<xsl:template name="show-value">
		<xsl:param name="value"/>
		<xsl:choose>
			<xsl:when test="$value/@xsi:type='CD'">
				<xsl:variable name="dispValue">
					<xsl:call-template name="show-code">
						<xsl:with-param name="code" select="$value"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="nf">
					<xsl:call-template name="show-nullFlavor">
						<xsl:with-param name="nf" select="$value/@nullFlavor"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="string-length($dispValue)&gt;0">
						<xsl:value-of select="$dispValue"/>
					</xsl:when>
					<xsl:when test="string-length($nf)&gt;0">
						<xsl:value-of select="$nf"/>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$value[@xsi:type='PQ' or @xsi:type='EXPR_PQ']">
				<xsl:variable name="dispUnit">
					<xsl:call-template name="show-code-value">
						<xsl:with-param name="code" select="$value/@unit"/>
					</xsl:call-template>
					<xsl:if test="$value/@unit='a' or $value/@unit='m'">
						<xsl:text>(s)</xsl:text>
					</xsl:if>
				</xsl:variable>
				<xsl:variable name="nf">
					<xsl:call-template name="show-nullFlavor">
						<xsl:with-param name="nf" select="$value/@nullFlavor"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:if test="$value/@value">
					<xsl:value-of select="$value/@value"/>
					<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="string-length($dispUnit)&gt;0">
						<xsl:value-of select="$dispUnit"/>
					</xsl:when>
					<xsl:when test="string-length($nf)&gt;0">
						<xsl:value-of select="$nf"/>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$value/@xsi:type='IVL_PQ' or $value/@xsi:type='URG_PQ'">
				<xsl:variable name="dispUnit">
					<xsl:choose>
						<xsl:when test="$value/n1:low[@unit]">
							<xsl:call-template name="show-code-value">
								<xsl:with-param name="code" select="$value/n1:*/@unit"/>
							</xsl:call-template>
							<xsl:if test="$value/n1:low/@unit='a' or  $value/n1:low/@unit='m'">
								<xsl:text>(s)</xsl:text>
							</xsl:if>
							<xsl:for-each select="$value/n1:low/n1:translation">
								<xsl:text>, or </xsl:text>
								<xsl:value-of select="@displayName"/>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="$value/n1:high[@unit]">
								<xsl:call-template name="show-code-value">
									<xsl:with-param name="code" select="$value/n1:*/@unit"/>
								</xsl:call-template>
								<xsl:if test="$value/n1:high/@unit='a' or $value/n1:high/@unit='m'">
									<xsl:text>(s)</xsl:text>
								</xsl:if>
							</xsl:if>
							<xsl:for-each select="$value/n1:high/n1:translation">
								<xsl:text>, or </xsl:text>
								<xsl:value-of select="@displayName"/>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="lowVal">
					<xsl:if test="$value/n1:low/@value">
						<xsl:choose>
							<xsl:when test="$value/n1:low/@inclusive='false'">
								<xsl:text> &gt; </xsl:text>
								<xsl:value-of select="$value/n1:low/@value"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text> &gt;= </xsl:text>
								<xsl:value-of select="$value/n1:low/@value"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</xsl:variable>
				<xsl:variable name="highVal">
					<xsl:if test="$value/n1:high/@value">
						<xsl:choose>
							<xsl:when test="$value/n1:low/@inclusive='false'">
								<xsl:text> &lt; </xsl:text>
								<xsl:value-of select="$value/n1:high/@value"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text> &lt;= </xsl:text>
								<xsl:value-of select="$value/n1:high/@value"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="(string-length($lowVal)&gt;0) and (string-length($highVal)&lt;1)">
						<xsl:value-of select="$lowVal"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="$dispUnit"/>
					</xsl:when>
					<xsl:when test="(string-length($lowVal)&gt;0) and (string-length($highVal)&gt;0)">
						<xsl:value-of select="$lowVal"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="$dispUnit"/>
						<xsl:text> and </xsl:text>
						<xsl:value-of select="$highVal"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="$dispUnit"/>
					</xsl:when>
					<xsl:when test="(string-length($lowVal)&lt;1) and (string-length($highVal)&gt;0)">
						<xsl:value-of select="$highVal"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="$dispUnit"/>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$value/@xsi:type='TS'">
				<xsl:variable name="timeStamp">
					<xsl:choose>
						<xsl:when test="$value/@nullFlavor">
							<xsl:call-template name="show-nullFlavor">
								<xsl:with-param name="nf" select="$value/@nullFlavor"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="show-time">
								<xsl:with-param name="datetime" select="$value"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:if test="string-length($timeStamp)>0">
					<xsl:value-of select="$timeStamp"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$value/@xsi:type='II'">
				<xsl:call-template name="show-id">
					<xsl:with-param name="id" select="$value"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- show classCode -->
	<xsl:template name="show-actClassCode">
		<xsl:param name="clsCode"/>
		<xsl:choose>
			<xsl:when test=" $clsCode = 'ACT' ">
				<xsl:text>healthcare service</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'ACCM' ">
				<xsl:text>accommodation</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'ACCT' ">
				<xsl:text>account</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'ACSN' ">
				<xsl:text>accession</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'ADJUD' ">
				<xsl:text>financial adjudication</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'CONS' ">
				<xsl:text>consent</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'CONTREG' ">
				<xsl:text>container registration</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'CTTEVENT' ">
				<xsl:text>clinical trial timepoint event</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'DISPACT' ">
				<xsl:text>disciplinary action</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'ENC' ">
				<xsl:text>encounter</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'INC' ">
				<xsl:text>incident</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'INFRM' ">
				<xsl:text>inform</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'INVE' ">
				<xsl:text>invoice element</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'LIST' ">
				<xsl:text>working list</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'MPROT' ">
				<xsl:text>monitoring program</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'PCPR' ">
				<xsl:text>care provision</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'PROC' ">
				<xsl:text>procedure</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'REG' ">
				<xsl:text>registration</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'REV' ">
				<xsl:text>review</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'SBADM' ">
				<xsl:text>substance administration</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'SPCTRT' ">
				<xsl:text>speciment treatment</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'SUBST' ">
				<xsl:text>substitution</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'TRNS' ">
				<xsl:text>transportation</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'VERIF' ">
				<xsl:text>verification</xsl:text>
			</xsl:when>
			<xsl:when test=" $clsCode = 'XACT' ">
				<xsl:text>financial transaction</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- show participationType -->
	<xsl:template name="show-participationType">
		<xsl:param name="ptype"/>
		<xsl:choose>
			<xsl:when test=" $ptype='PPRF' ">
				<xsl:text>primary performer</xsl:text>
			</xsl:when>
			<xsl:when test=" $ptype='PRF' ">
				<xsl:text>performer</xsl:text>
			</xsl:when>
			<xsl:when test=" $ptype='VRF' ">
				<xsl:text>verifier</xsl:text>
			</xsl:when>
			<xsl:when test=" $ptype='SPRF' ">
				<xsl:text>secondary performer</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- show participationFunction -->
	<xsl:template name="show-participationFunction">
		<xsl:param name="pFunction"/>
		<xsl:choose>
			<xsl:when test=" $pFunction = 'ADMPHYS' ">
				<xsl:text>admitting physician</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'ANEST' ">
				<xsl:text>anesthesist</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'ANRS' ">
				<xsl:text>anesthesia nurse</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'ATTPHYS' ">
				<xsl:text>attending physician</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'DISPHYS' ">
				<xsl:text>discharging physician</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'FASST' ">
				<xsl:text>first assistant surgeon</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'MDWF' ">
				<xsl:text>midwife</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'NASST' ">
				<xsl:text>nurse assistant</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'PCP' ">
				<xsl:text>primary care physician</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'PRISURG' ">
				<xsl:text>primary surgeon</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'RNDPHYS' ">
				<xsl:text>rounding physician</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'SASST' ">
				<xsl:text>second assistant surgeon</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'SNRS' ">
				<xsl:text>scrub nurse</xsl:text>
			</xsl:when>
			<xsl:when test=" $pFunction = 'TASST' ">
				<xsl:text>third assistant</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="formatDateTime">
		<xsl:param name="date"/>
		<!-- month -->
		<xsl:variable name="month" select="substring ($date, 5, 2)"/>
		<xsl:choose>
			<xsl:when test="$month='01'">
				<xsl:text>January </xsl:text>
			</xsl:when>
			<xsl:when test="$month='02'">
				<xsl:text>February </xsl:text>
			</xsl:when>
			<xsl:when test="$month='03'">
				<xsl:text>March </xsl:text>
			</xsl:when>
			<xsl:when test="$month='04'">
				<xsl:text>April </xsl:text>
			</xsl:when>
			<xsl:when test="$month='05'">
				<xsl:text>May </xsl:text>
			</xsl:when>
			<xsl:when test="$month='06'">
				<xsl:text>June </xsl:text>
			</xsl:when>
			<xsl:when test="$month='07'">
				<xsl:text>July </xsl:text>
			</xsl:when>
			<xsl:when test="$month='08'">
				<xsl:text>August </xsl:text>
			</xsl:when>
			<xsl:when test="$month='09'">
				<xsl:text>September </xsl:text>
			</xsl:when>
			<xsl:when test="$month='10'">
				<xsl:text>October </xsl:text>
			</xsl:when>
			<xsl:when test="$month='11'">
				<xsl:text>November </xsl:text>
			</xsl:when>
			<xsl:when test="$month='12'">
				<xsl:text>December </xsl:text>
			</xsl:when>
		</xsl:choose>
		<!-- day -->
		<xsl:choose>
			<xsl:when test='substring ($date, 7, 1)="0"'>
				<xsl:value-of select="substring ($date, 8, 1)"/>
				<xsl:text>, </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="substring ($date, 7, 2)"/>
				<xsl:text>, </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<!-- year -->
		<xsl:choose>
			<xsl:when test="substring ($date, 1, 4)='0000'">
				<xsl:text>20xx</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="substring ($date, 1, 4)"/>
			</xsl:otherwise>
		</xsl:choose>
		<!-- time and US timezone -->
		<xsl:if test="string-length($date) > 8">
			<xsl:text>, </xsl:text>
			<!-- time -->
			<xsl:variable name="time">
				<xsl:value-of select="substring($date,9,6)"/>
			</xsl:variable>
			<xsl:variable name="hh">
				<xsl:value-of select="substring($time,1,2)"/>
			</xsl:variable>
			<xsl:variable name="mm">
				<xsl:value-of select="substring($time,3,2)"/>
			</xsl:variable>
			<xsl:variable name="ss">
				<xsl:value-of select="substring($time,5,2)"/>
			</xsl:variable>
			<xsl:if test="string-length($hh)&gt;1">
				<xsl:value-of select="$hh"/>
				<xsl:if test="string-length($mm)&gt;1 and not(contains($mm,'-')) and not (contains($mm,'+'))">
					<xsl:text>:</xsl:text>
					<xsl:value-of select="$mm"/>
					<xsl:if test="string-length($ss)&gt;1 and not(contains($ss,'-')) and not (contains($ss,'+'))">
						<xsl:text>:</xsl:text>
						<xsl:value-of select="$ss"/>
					</xsl:if>
				</xsl:if>
			</xsl:if>
			<!-- time zone -->
			<xsl:variable name="tzon">
				<xsl:choose>
					<xsl:when test="contains($date,'+')">
						<xsl:text>+</xsl:text>
						<xsl:value-of select="substring-after($date, '+')"/>
					</xsl:when>
					<xsl:when test="contains($date,'-')">
						<xsl:text>-</xsl:text>
						<xsl:value-of select="substring-after($date, '-')"/>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<xsl:choose>
				<!-- reference: http://www.timeanddate.com/library/abbreviations/timezones/na/ -->
				<xsl:when test="$tzon = '-0500' ">
					<xsl:text>, EST</xsl:text>
				</xsl:when>
				<xsl:when test="$tzon = '-0600' ">
					<xsl:text>, CST</xsl:text>
				</xsl:when>
				<xsl:when test="$tzon = '-0700' ">
					<xsl:text>, MST</xsl:text>
				</xsl:when>
				<xsl:when test="$tzon = '-0800' ">
					<xsl:text>, PST</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text> </xsl:text>
					<xsl:value-of select="$tzon"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<!-- convert to lower case -->
	<xsl:template name="caseDown">
		<xsl:param name="data"/>
		<xsl:if test="$data">
			<xsl:value-of select="translate($data, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
		</xsl:if>
	</xsl:template>
	<!-- convert to upper case -->
	<xsl:template name="caseUp">
		<xsl:param name="data"/>
		<xsl:if test="$data">
			<xsl:value-of select="translate($data,'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
		</xsl:if>
	</xsl:template>
	<!-- convert first character to upper case -->
	<xsl:template name="firstCharCaseUp">
		<xsl:param name="data"/>
		<xsl:if test="$data">
			<xsl:call-template name="caseUp">
				<xsl:with-param name="data" select="substring($data,1,1)"/>
			</xsl:call-template>
			<xsl:value-of select="substring($data,2)"/>
		</xsl:if>
	</xsl:template>
	<!-- show-nullFlavor -->
	<xsl:template name="show-nullFlavor">
		<xsl:param name="nf"/>
		<xsl:choose>
			<xsl:when test=" $nf = 'NI' ">
				<xsl:text>No information</xsl:text>
			</xsl:when>
			<xsl:when test=" $nf = 'INV' ">
				<xsl:text>Invalid</xsl:text>
			</xsl:when>
			<xsl:when test=" $nf = 'MSK' ">
				<xsl:text>Masked</xsl:text>
			</xsl:when>
			<xsl:when test=" $nf = 'NA' ">
				<xsl:text>Not applicable</xsl:text>
			</xsl:when>
			<xsl:when test=" $nf = 'UNK' ">
				<xsl:text>Unknown</xsl:text>
			</xsl:when>
			<xsl:when test=" $nf = 'OTH' ">
				<xsl:text>Other</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="addCSS">
		<style type="text/css">
			<xsl:text>
body {
	color: rgb(26, 26, 26);
	background-color: rgb(255,255,255);
	font-family: Verdana, Tahoma, sans-serif;
	font-size: 11px;
}

a {
	color: rgb(0, 0, 255);
	background-color: rgb(255,255,255);
}

h1 {
	font-size: 12pt;
	font-weight: bold;
}

h2 {
	font-size: 11pt;
	font-weight: bold;
}

h3 {
	font-size: 10pt;
	font-weight: bold;
}

h4 {
	font-size: 8pt;
	font-weight: bold;
}

div {
	width: 80%;
}

table {
	line-height: 10pt;
	width: 80%;
}

tr {
	background-color: rgb(224,224,224);
}

td {
	padding: 0.1cm 0.2cm;
	vertical-align: top;
}

.h1center {
	font-size: 12pt;
	font-weight: bold;
	text-align: center;
	width: 80%;
}

.header_table{
	border: 1pt inset rgb(0,0,0);
}

.narr_table {
	width: 100%;
}

.narr_tr {
	background-color: rgb(225,225,225);
}
pre {
 overflow: auto; /* Use horizontal scroller if needed; for Firefox 2, not needed in Firefox 3 */
 white-space: pre-wrap; /* css-3 */
 white-space: -moz-pre-wrap !important; /* Mozilla, since 1999 */
 white-space: -pre-wrap; /* Opera 4-6 */
 white-space: -o-pre-wrap; /* Opera 7 */
 word-wrap: break-word; /* Internet Explorer 5.5+ */
 font-family: Verdana, Tahoma, sans-serif;
 font-size: 11px;
 text-align:left;
 margin: 0px 0px 0px 0px;
 padding:0px 0px 0px 0px;
}
.narr_th {
	background-color: rgb(201,201,201);
}

.td_label{
	font-weight: bold;
	color: white;
}
	</xsl:text>
		</style>
	</xsl:template>
</xsl:stylesheet>