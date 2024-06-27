<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="simple" page-height="29.7cm" page-width="21cm" margin-top="2cm" margin-bottom="1cm" margin-left="2cm" margin-right="2cm">
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
                            <fo:external-graphic src="url('src/src/main/resources/HDFC-Bank-Logo.png')" content-width="100px" content-height="100px" scaling="uniform"/>
                        </fo:block>
                    </fo:block-container>

<!--                    customer photo adding section-->
                    <fo:block-container absolute-position="absolute" top="1.9cm" right="0cm" height="60%" width="70%" margin-left="-29pt">
                        <fo:block>
                            <fo:table>
                                <fo:table-body>
                                    <fo:table-row>
                                        <fo:table-cell display-align="right" width="40%"  padding-left="90%" padding-top="20%">
                                            <fo:block text-align="center" border="1pt solid black" padding="20%">
                                                <fo:inline>Customer Photo</fo:inline>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </fo:table-body>
                            </fo:table>
                        </fo:block>
                    </fo:block-container>

                    <!--Header of the pdf-->
                    <fo:block text-align="center" font-family="Times New Roman" font-size="10pt" font-weight="bold" margin-bottom="1cm" margin-top="-0.8cm">
                        JLG/SHG/IL – LOAN CARD CUM FACT SHEET
                    </fo:block>

                    <!-- Branch Details -->
                    <fo:block font-family="Times New Roman" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                    </fo:block>
                    <fo:table width="70%" border="1pt solid black">
                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="10pt">
                                        Branch Code &amp; Name:
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-size="8pt">
                                        <xsl:value-of select="concat(LoanCardFactSheet/BranchDetails/BranchCode, ' ', LoanCardFactSheet/BranchDetails/BranchName)"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="10pt">
                                        Branch Address:
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="8pt">
                                        <xsl:value-of select="LoanCardFactSheet/BranchDetails/BranchAddress"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="10pt">
                                        Regd.office:
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="8pt">
                                        <xsl:value-of select="LoanCardFactSheet/BranchDetails/RegisteredOffice"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="10pt">
                                        GST Regn:
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="8pt" margin-top="1pt" margin-left="-5pt">
                                        <xsl:value-of select="LoanCardFactSheet/BranchDetails/GSTRegn"/>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="10pt" margin-left="10pt" >
                                        CIN:
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="8pt" margin-left="-20pt" margin-top="1pt">
                                        <xsl:value-of select="LoanCardFactSheet/BranchDetails/CIN"/>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="10pt" margin-left="20pt">
                                        PAN:
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="8pt" margin-left="-8pt" margin-top="1pt">
                                        <xsl:value-of select="LoanCardFactSheet/BranchDetails/PAN"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>


                    <fo:block space-after="0.5cm"/>

                    <!-- Customer Details -->

                    <fo:table width="100%" border="1pt solid black" border-collapse="collapse">
                        <fo:table-body>
                            <!-- Loop through the first set of customer details -->
                            <xsl:for-each select="LoanCardFactSheet/CustomerDetails">
                                <!-- First set of details -->
                                <fo:table-row>
                                    <fo:table-cell padding="4pt" border="1pt solid black">
                                        <fo:block font-size="10pt">
                                            <xsl:for-each select="*[self::CustomerName or self::CustomerID or self::LoanAccountNo or self::GroupName or self::Product or self::HusbandName or self::CustomerAddress or self::DisbursedDate or self::LoanAmount or self::TotalInterestCharge or self::OtherUpfrontCharges or self::ProcessingFees or self::InsuranceAmount or self::OtherCharges or self::NetDisbursedAmount or self::TotalAmountToBePaid or self::AnnualizedInterestRate or self::RateOfInterest]">
                                                <fo:block>
                                                    <xsl:value-of select="name()"/>: <xsl:value-of select="."/>
                                                </fo:block>
                                            </xsl:for-each>
                                        </fo:block>
                                    </fo:table-cell>
                                    <!-- Second set of details -->
                                    <fo:table-cell padding="4pt" border="1pt solid black">
                                        <fo:block font-size="10pt">
                                            <xsl:for-each select="*[not(self::CustomerName or self::CustomerID or self::LoanAccountNo or self::GroupName or self::Product or self::HusbandName or self::CustomerAddress or self::DisbursedDate or self::LoanAmount or self::TotalInterestCharge or self::OtherUpfrontCharges or self::ProcessingFees or self::InsuranceAmount or self::OtherCharges or self::NetDisbursedAmount or self::TotalAmountToBePaid or self::AnnualizedInterestRate or self::RateOfInterest)]">
                                                <fo:block>
                                                    <xsl:value-of select="name()"/>: <xsl:value-of select="."/>
                                                </fo:block>
                                            </xsl:for-each>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>

                    <fo:block space-after="0.2cm"/>

                    <!-- Installment details-->
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
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="6pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="6pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="6pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="6pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="6pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="6pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="6pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="6pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="6pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="6pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="6pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="6pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="6pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="6pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="6pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <!-- Combined first two columns into one with "Total" -->
                                    <fo:table-cell border="1pt solid black" padding="15pt" number-columns-spanned="2">
                                        <fo:block text-align="center" font-size="6pt">Total</fo:block>
                                    </fo:table-cell>

                                    <!-- Remaining columns -->
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="6pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>


                        </fo:table-body>
                    </fo:table>

                    <fo:block space-after="0.5cm"/>

                    <!-- Processing Fee and Stamp Duty Charges, Insurance Details -->
                    <fo:table width="100%" border="1pt solid black">
                        <fo:table-header>
                            <fo:table-row border="1pt solid black">
                                <fo:table-cell border="1pt solid black">
                                    <fo:block font-family="Times New Roman" font-size="12pt" font-weight="bold" text-align="center">
                                        Processing Fee &amp; Stamp Duty Charges
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black">
                                    <fo:block font-family="Times New Roman" font-size="12pt" font-weight="bold" text-align="center">
                                        Insurance Details
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>
                        <fo:table-body>
                            <fo:table-row height="50mm">
                                <fo:table-cell border="1pt solid black">
                                    <xsl:apply-templates select="LoanCardFactSheet/ProcessingFeeAndStampDuty/*"/>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black">
                                    <xsl:apply-templates select="LoanCardFactSheet/InsuranceDetails/*"/>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>


                    <!-- Key Terms and Conditions -->
                    <fo:block font-family="Times New Roman" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                        Key Terms and Conditions
                    </fo:block>
                    <fo:block font-family="Times New Roman" font-size="10pt">
                        <xsl:for-each select="LoanCardFactSheet/KeyTermsAndConditions/Condition">
                            <fo:block>
                                <xsl:number value="position()" format="1. "/><xsl:value-of select="."/>
                            </fo:block>
                        </xsl:for-each>
                    </fo:block>

                    <!-- Grievance Redressal -->
                    <fo:block font-family="Times New Roman" font-size="12pt" font-weight="bold" margin-top="1cm" margin-bottom="0.5cm">
                        Grievance Redressal
                    </fo:block>
                    <fo:block font-size="10pt">
                        <xsl:text> For Any queries, Please Contact our Nodal Officer</xsl:text>
                    </fo:block>
                    <fo:table width="100%" border="1pt solid black">
                        <fo:table-header>
                            <fo:table-row>
                                <fo:table-cell border="1pt solid black">
                                    <fo:block font-size="12pt">Nodal Officer Name</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black">
                                    <fo:block font-size="12pt">Nodal Officer Contact No</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>
                        <fo:table-body>
                            <fo:table-row height="20mm"> <!-- Increase the height of the row -->
                                <fo:table-cell border="1pt solid black">
                                    <fo:block><xsl:value-of select="LoanCardFactSheet/GrievanceRedressal/NodalOfficerName"/></fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black">
                                    <fo:block><xsl:value-of select="LoanCardFactSheet/GrievanceRedressal/NodalOfficerContactNo"/></fo:block>
                                </fo:table-cell>
                            </fo:table-row>
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
            <fo:table-cell padding="4pt" border-right="1pt solid black">
                <fo:block><xsl:value-of select="name()"/></fo:block>
            </fo:table-cell>
            <fo:table-cell padding="4pt">
                <fo:block><xsl:value-of select="."/></fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>


    <xsl:template match="ProcessingFeeAndStampDuty/*">
        <fo:block font-size="8pt" padding="4pt">
            <xsl:choose>
                <xsl:when test="name() = 'ContingentCharges'">
                    <fo:block font-weight="bold">
                        <xsl:value-of select="name()"/>: <xsl:value-of select="."/>
                    </fo:block>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="name()"/>: <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </fo:block>
    </xsl:template>

    <xsl:template match="InsuranceDetails/*">
        <fo:block font-size="8pt" padding="4pt">
            <xsl:value-of select="name()"/>: <xsl:value-of select="."/>
        </fo:block>
    </xsl:template>

    <xsl:template match="GrievanceRedressal/*">
        <fo:table-row>
            <fo:table-cell border="1pt solid black" padding="4pt">
                <fo:block></fo:block>
            </fo:table-cell>
            <fo:table-cell border="1pt solid black" padding="4pt">
                <fo:block></fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>
</xsl:stylesheet>
