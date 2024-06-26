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
                    <!--hdfc logo added-->
                    <fo:block-container absolute-position="absolute" top="-1cm" left="0cm">
                        <fo:block>
                            <fo:external-graphic src="url('/home/varun/Documents/Git_Repo/apachefop/src/src/main/resources/HDFC-Bank-Logo.png')" content-width="100px" content-height="100px" scaling="uniform"/>
                        </fo:block>
                    </fo:block-container>
                    <!--Header of the pdf-->
                    <fo:block text-align="center" font-family="Arial" font-size="10pt" font-weight="bold" margin-bottom="1cm" margin-top="-0.8cm">
                        JLG/SHG/IL – LOAN CARD CUM FACT SHEET
                    </fo:block>

                    <!-- Customer Details -->
                    <fo:block font-family="Arial" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                    </fo:block>
                    <fo:table width="70%" border="1pt solid black">
                        <fo:table-body>
                            <fo:table-row >
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Arial" font-size="10pt">
                                        Branch Code &amp; Name:
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Arial" font-size="10pt">
                                        <xsl:value-of select="LoanCardFactSheet/BranchDetails/BranchCode"/>
                                        <xsl:value-of select="LoanCardFactSheet/BranchDetails/BranchName"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Arial" font-size="10pt">
                                        Branch Address:
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Arial" font-size="10pt">
                                        <xsl:value-of select="LoanCardFactSheet/BranchDetails/BranchAddress"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Arial" font-size="10pt">
                                        Regd.office:
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Arial" font-size="10pt">
                                        <xsl:value-of select="LoanCardFactSheet/BranchDetails/RegisteredOffice"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Arial" font-size="10pt">
                                        GST Regn:
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Arial" font-size="10pt">
                                        <xsl:value-of select="LoanCardFactSheet/BranchDetails/GSTRegn"/>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Arial" font-size="10pt">
                                        CIN:
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Arial" font-size="10pt">
                                        <xsl:value-of select="LoanCardFactSheet/BranchDetails/CIN"/>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Arial" font-size="10pt">
                                        PAN:
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Arial" font-size="10pt">
                                        <xsl:value-of select="LoanCardFactSheet/BranchDetails/PAN"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>


                    <!-- Customer Details -->
                    <fo:block font-family="Arial" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                        Customer Details
                    </fo:block>
                    <fo:table width="100%" border="1pt solid black">
                        <fo:table-body>
                            <xsl:apply-templates select="LoanCardFactSheet/CustomerDetails/*"/>
                        </fo:table-body>
                    </fo:table>
                    <!--customer photo adding section-->
                    <fo:block-container absolute-position="absolute" top="1.7cm" right="0cm" height="55%" width="75%">
                        <fo:block>
                            <fo:table>
                                <fo:table-body>
                                    <fo:table-row>
                                        <fo:table-cell display-align="right" width="30%"  padding-left="90%" padding-top="20%">
                                            <fo:block text-align="center" border="1pt solid black" padding="20%">
                                                <fo:inline>Customer Photo</fo:inline>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </fo:table-body>
                            </fo:table>
                        </fo:block>
                    </fo:block-container>

                    <!-- Loan Details -->
                    <fo:block font-family="Arial" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                        Loan Details
                    </fo:block>
                    <fo:table width="100%" border="1pt solid black">
                        <fo:table-body>
                            <xsl:apply-templates select="LoanCardFactSheet/LoanDetails/*"/>
                        </fo:table-body>
                    </fo:table>

                    <!-- Repayment Details -->
                    <fo:block font-family="Arial" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                        Repayment Details
                    </fo:block>
                    <fo:table width="100%" border="1pt solid black">
                        <fo:table-body>
                            <xsl:apply-templates select="LoanCardFactSheet/RepaymentDetails/*"/>
                        </fo:table-body>
                    </fo:table>

                    <!-- Installments -->
                    <fo:block font-family="Arial" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                        Installments
                    </fo:block>
                    <fo:table width="100%" border="1pt solid black">
                        <fo:table-header>
                            <fo:table-row>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="7">Inst No.</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="7">Repayment Date</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="7">Outstanding Principal</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="7">Principal</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="7">Interest</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="7">Inst Amount</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="7">Paid Status</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="7">Amount Collected</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="7">Amount Collected On</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="7">Emp Code</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="7">Emp Signature</fo:block>
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


                    <!-- Processing Fee and Stamp Duty -->
                    <fo:block font-family="Arial" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                        Processing Fee and Stamp Duty
                    </fo:block>
                    <fo:table width="100%" border="1pt solid black">
                        <fo:table-body>
                            <xsl:apply-templates select="LoanCardFactSheet/ProcessingFeeAndStampDuty/*"/>
                        </fo:table-body>
                    </fo:table>

                    <!-- Insurance Details -->
                    <fo:block font-family="Arial" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                        Insurance Details
                    </fo:block>
                    <fo:table width="100%" border="1pt solid black">
                        <fo:table-body>
                            <xsl:apply-templates select="LoanCardFactSheet/InsuranceDetails/*"/>
                        </fo:table-body>
                    </fo:table>

                    <!-- Key Terms and Conditions -->
                    <fo:block font-family="Arial" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                        Key Terms and Conditions
                    </fo:block>
                    <fo:block font-family="Arial" font-size="10pt">
                        <xsl:for-each select="LoanCardFactSheet/KeyTermsAndConditions/Condition">
                            <fo:block>
                                <xsl:number value="position()" format="1. "/><xsl:value-of select="."/>
                            </fo:block>
                        </xsl:for-each>
                    </fo:block>

                    <!-- Grievance Redressal -->
                    <fo:block font-family="Arial" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                        Grievance Redressal
                    </fo:block>
                    <fo:table width="100%" border="1pt solid black">
                        <fo:table-body>
                            <xsl:apply-templates select="LoanCardFactSheet/GrievanceRedressal/*"/>
                        </fo:table-body>
                    </fo:table>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="BranchDetails/*">
        <fo:table-row>
            <fo:table-cell border="1pt solid black" padding="4pt">
                <fo:block><xsl:value-of select="name()"/></fo:block>
            </fo:table-cell>
            <fo:table-cell border="1pt solid black" padding="4pt">
                <fo:block><xsl:value-of select="."/></fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>

    <xsl:template match="CustomerDetails/*">
        <fo:table-row>
            <fo:table-cell border="1pt solid black" padding="4pt">
                <fo:block><xsl:value-of select="name()"/></fo:block>
            </fo:table-cell>
            <fo:table-cell border="1pt solid black" padding="4pt">
                <fo:block><xsl:value-of select="."/></fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>

    <xsl:template match="LoanDetails/*">
        <fo:table-row>
            <fo:table-cell border="1pt solid black" padding="4pt">
                <fo:block><xsl:value-of select="name()"/></fo:block>
            </fo:table-cell>
            <fo:table-cell border="1pt solid black" padding="4pt">
                <fo:block><xsl:value-of select="."/></fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>

    <xsl:template match="RepaymentDetails/*">
        <fo:table-row>
            <fo:table-cell border="1pt solid black" padding="4pt">
                <fo:block><xsl:value-of select="name()"/></fo:block>
            </fo:table-cell>
            <fo:table-cell border="1pt solid black" padding="4pt">
                <fo:block><xsl:value-of select="."/></fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>

    <xsl:template match="ProcessingFeeAndStampDuty/*">
        <fo:table-row>
            <fo:table-cell border="1pt solid black" padding="4pt">
                <fo:block><xsl:value-of select="name()"/></fo:block>
            </fo:table-cell>
            <fo:table-cell border="1pt solid black" padding="4pt">
                <fo:block><xsl:value-of select="."/></fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>

    <xsl:template match="InsuranceDetails/*">
        <fo:table-row>
            <fo:table-cell border="1pt solid black" padding="4pt">
                <fo:block><xsl:value-of select="name()"/></fo:block>
            </fo:table-cell>
            <fo:table-cell border="1pt solid black" padding="4pt">
                <fo:block><xsl:value-of select="."/></fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>

    <!--    GrievanceRedressal-->
    <xsl:template match="GrievanceRedressal/*">
        <fo:table-row>
            <fo:table-cell border="1pt solid black" padding="4pt">
                <fo:block>
                    <xsl:choose>
                        <xsl:when test="name() = 'NodalOfficerName'">
                            <xsl:text>Nodal officer Name</xsl:text>
                        </xsl:when>
                        <xsl:when test="name() = 'NodalOfficerContactNo'">
                            <xsl:text>Nodal officer contact no</xsl:text>
                        </xsl:when>
                    </xsl:choose>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell border="1pt solid black" padding="4pt">
                <fo:block><xsl:value-of select="."/></fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>



</xsl:stylesheet>
