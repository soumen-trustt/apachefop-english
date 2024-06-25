<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="simple" page-height="29.7cm" page-width="21cm" margin-top="2cm" margin-bottom="2cm" margin-left="2cm" margin-right="2cm">
                    <fo:region-body/>
                    <fo:region-before extent="2cm"/>
                    <fo:region-after extent="2cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="simple">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block text-align="left">
                        <fo:external-graphic src="url('/home/soumenmanna/Desktop/apachefop/src/src/main/resources/HDFC-Bank-Logo.png')" content-width="50%" content-height="50%" padding="5mm 5mm 5mm 5mm"/>
                    </fo:block>
                    <fo:block text-align="center" font-family="Arial" font-size="14pt" font-weight="bold" margin-bottom="1cm">
                        JLG Loan Card Cum Fact Sheet
                    </fo:block>
                    <fo:block font-family="Arial" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                        Branch Details
                    </fo:block>
                    <fo:table width="100%" border="1pt solid black" border-collapse="collapse">
                        <fo:table-body>
                            <xsl:apply-templates select="LoanCardFactSheet/BranchDetails/*"/>
                        </fo:table-body>
                    </fo:table>
                    <fo:block font-family="Arial" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                        Customer Details
                    </fo:block>
                    <fo:table width="100%" border="1pt solid black" border-collapse="collapse">
                        <fo:table-body>
                            <xsl:apply-templates select="LoanCardFactSheet/CustomerDetails/*"/>
                        </fo:table-body>
                    </fo:table>
                    <fo:block font-family="Arial" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                        Loan Details
                    </fo:block>
                    <fo:table width="100%" border="1pt solid black" border-collapse="collapse">
                        <fo:table-body>
                            <xsl:apply-templates select="LoanCardFactSheet/LoanDetails/*"/>
                        </fo:table-body>
                    </fo:table>
                    <fo:block font-family="Arial" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                        Repayment Details
                    </fo:block>
                    <fo:table width="100%" border="1pt solid black" border-collapse="collapse">
                        <fo:table-body>
                            <xsl:apply-templates select="LoanCardFactSheet/RepaymentDetails/*"/>
                        </fo:table-body>
                    </fo:table>
                    <fo:block font-family="Arial" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                        Installments
                    </fo:block>
                    <fo:table width="100%" border="1pt solid black" border-collapse="collapse">
                        <fo:table-header>
                            <fo:table-row>
                                <fo:table-cell border="1pt solid black" padding="4pt">
                                    <fo:block>Inst No.</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="4pt">
                                    <fo:block>Repayment Date</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="4pt">
                                    <fo:block>Outstanding Principal</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="4pt">
                                    <fo:block>Principal</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="4pt">
                                    <fo:block>Interest</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="4pt">
                                    <fo:block>Inst Amount</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="4pt">
                                    <fo:block>Paid Status</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="4pt">
                                    <fo:block>Amount Collected</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="4pt">
                                    <fo:block>Amount Collected On</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="4pt">
                                    <fo:block>Emp Code</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="4pt">
                                    <fo:block>Emp Signature</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>
                        <fo:table-body>
                            <xsl:for-each select="LoanCardFactSheet/Installments/Installment">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="4pt">
                                        <fo:block><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="4pt">
                                        <fo:block><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="4pt">
                                        <fo:block><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="4pt">
                                        <fo:block><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="4pt">
                                        <fo:block><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="4pt">
                                        <fo:block><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="4pt">
                                        <fo:block><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="4pt">
                                        <fo:block><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="4pt">
                                        <fo:block><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="4pt">
                                        <fo:block><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="4pt">
                                        <fo:block><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>
                    <fo:block font-family="Arial" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                        Processing Fee and Stamp Duty
                    </fo:block>
                    <fo:table width="100%" border="1pt solid black" border-collapse="collapse">
                        <fo:table-body>
                            <xsl:apply-templates select="LoanCardFactSheet/ProcessingFeeAndStampDuty/*"/>
                        </fo:table-body>
                    </fo:table>
                    <fo:block font-family="Arial" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                        Insurance Details
                    </fo:block>
                    <fo:table width="100%" border="1pt solid black" border-collapse="collapse">
                        <fo:table-body>
                            <xsl:apply-templates select="LoanCardFactSheet/InsuranceDetails/*"/>
                        </fo:table-body>
                    </fo:table>
                    <fo:block font-family="Arial" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                        Key Terms and Conditions
                    </fo:block>
                    <fo:list-block>
                        <xsl:for-each select="LoanCardFactSheet/KeyTermsAndConditions/Condition">
                            <fo:list-item>
                                <fo:list-item-label end-indent="label-end()">
                                    <fo:block>-</fo:block>
                                </fo:list-item-label>
                                <fo:list-item-body start-indent="body-start()">
                                    <fo:block><xsl:value-of select="."/></fo:block>
                                </fo:list-item-body>
                            </fo:list-item>
                        </xsl:for-each>
                    </fo:list-block>
                    <fo:block font-family="Arial" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                        Grievance Redressal
                    </fo:block>
                    <fo:table width="100%" border="1pt solid black" border-collapse="collapse">
                        <fo:table-body>
                            <xsl:apply-templates select="LoanCardFactSheet/GrievanceRedressal/*"/>
                        </fo:table-body>
                    </fo:table>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="LoanCardFactSheet/BranchDetails/* | LoanCardFactSheet/CustomerDetails/* | LoanCardFactSheet/LoanDetails/* | LoanCardFactSheet/RepaymentDetails/* | LoanCardFactSheet/ProcessingFeeAndStampDuty/* | LoanCardFactSheet/InsuranceDetails/* | LoanCardFactSheet/GrievanceRedressal/*">
        <fo:table-row>
            <fo:table-cell border="1pt solid black" padding="4pt">
                <fo:block font-weight="bold"><xsl:value-of select="name()"/></fo:block>
            </fo:table-cell>
            <fo:table-cell border="1pt solid black" padding="4pt">
                <fo:block><xsl:value-of select="."/></fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>
</xsl:stylesheet>
