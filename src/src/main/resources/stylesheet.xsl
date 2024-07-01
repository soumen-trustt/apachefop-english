<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="xml" version="1.0" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="simple" page-height="30cm" page-width="21cm" margin-top="1cm" margin-bottom="1cm" margin-left="1cm" margin-right="1cm">
                    <fo:region-body/>
                    <fo:region-before extent="2cm"/>
                    <fo:region-after extent="2cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="simple">
                <fo:flow flow-name="xsl-region-body">
                    <!--hdfc logo added-->
                    <fo:block-container absolute-position="absolute" top="-0.9cm" left="0cm">
                        <fo:block>
                            <fo:external-graphic src="url('src/src/main/resources/hdfclogo.png')" content-width="100px" content-height="100px" scaling="uniform"/>
                        </fo:block>
                    </fo:block-container>

                    <!--customer photo adding section-->

                    <fo:block-container absolute-position="absolute" left="82.5%" height="100pt" width="80pt" padding="5pt">
                        <fo:block text-align="center" border="1pt solid black" padding="5pt" height="100%" width="100%">
                            <fo:block>
                                <xsl:with-param name="CustomerPhoto">Customer Photo</xsl:with-param>
                                <fo:external-graphic src="url('src/src/main/resources/passport.jpeg')" content-width="80pt" content-height="70pt" scaling="uniform"/>
                            </fo:block>
                        </fo:block>
                    </fo:block-container>




                    <!--Header of the pdf-->
                    <fo:block text-align="center" font-family="Times New Roman" font-size="8pt" font-weight="bold" margin-bottom="1cm" margin-top="-0.8cm">
                        जेएलजी/एसएचजी/आईएल - ऋण कार्ड सह तथ्य पत्रक
                    </fo:block>

                    <!-- Branch Details -->
                    <fo:table height="150%" width="80%" border="1pt solid black">
                        <fo:table-body>
                            <fo:table-row height="14pt" margin-left="2pt" >
                                <fo:table-cell padding="1pt" number-columns-spanned="2">
                                    <fo:block font-family="Times New Roman" font-size="8pt">
                                        <fo:inline keep-together.within-line="always">
                                            शाखा कोड और नाम:
                                            <xsl:value-of select="LoanCardFactSheet/BranchDetails/BranchCode"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="LoanCardFactSheet/BranchDetails/BranchName"/>
                                        </fo:inline>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>

                            <fo:table-row height="14pt" margin-left="2pt">
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="8pt">
                                        शाखा पता:
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="8pt">
                                        <fo:inline keep-together.within-line="always">
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="LoanCardFactSheet/BranchDetails/BranchAddress"/>
                                        </fo:inline>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>


                            <fo:table-row height="14pt" margin-left="2pt">
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="8pt">
                                        पंजीकृत कार्यालय:
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="8pt">
                                        <fo:inline keep-together.within-line="always">
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="LoanCardFactSheet/BranchDetails/RegisteredOffice"/>
                                        </fo:inline>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row height="14pt" margin-left="2pt">
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="8pt">
                                        जीएसटी पंजीकरण:
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="8pt" margin-left="-5pt">
                                        <xsl:value-of select="LoanCardFactSheet/BranchDetails/GSTRegn"/>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="8pt" margin-left="8pt">
                                        सीआईएन:
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="8pt" margin-left="-20pt">
                                        <xsl:value-of select="LoanCardFactSheet/BranchDetails/CIN"/>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="8pt" margin-left="20pt">
                                        पैन
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1pt">
                                    <fo:block font-family="Times New Roman" font-size="8pt" margin-left="-8pt">
                                        <xsl:value-of select="LoanCardFactSheet/BranchDetails/PAN"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>





                    <fo:block space-after="0.3cm"/>

                    <!-- Customer Details -->

                    <fo:table width="100%" border="1pt solid black" border-collapse="collapse">
                        <fo:table-body>
                            <!-- Loop through the first set of customer details -->
                            <xsl:for-each select="LoanCardFactSheet/CustomerDetails">
                                <!-- First set of details -->
                                <fo:table-row height="11pt">
                                    <fo:table-cell padding="4pt" border="1pt solid black">
                                        <fo:block font-size="8pt" font-family="Times New Roman">
                                            <fo:inline>
                                                <!-- Concatenate Customer Name and Customer ID -->
                                                ग्राहक का नाम और amp; पहचान:<xsl:value-of select="CustomerName"/> &amp; <xsl:value-of select="CustomerID"/>
                                            </fo:inline>

                                            <!-- Other fields -->
                                            <fo:block>
                                                <xsl:for-each select="*[self::LoanAccount or self::GroupName or self::Product or self::HusbandName or self::CustomerAddress or self::DisbursedDate or self::LoanAmount or self::TotalInterestCharge or self::OtherUpfrontCharges or self::ProcessingFees or self::InsuranceAmount or self::OtherCharges or self::NetDisbursedAmount or self::TotalAmountToBePaid or self::AnnualizedInterestRate or self::RateOfInterest]">
                                                    <xsl:choose>
                                                        <!-- Special handling for LoanAccountNo -->
                                                        <xsl:when test="name() = 'LoanAccount'">
                                                            <fo:block>
                                                                <xsl:value-of select="name()"/> <xsl:text> </xsl:text>No:<xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <!-- Special handling for other fields -->
                                                        <xsl:when test="name() = 'GroupName'">
                                                            <fo:block>
                                                                समूह नाम: <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <xsl:when test="name() = 'Product'">
                                                            <fo:block>
                                                                उत्पाद: <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <xsl:when test="name() = 'HusbandName'">
                                                            <fo:block>
                                                                पति का नाम: <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <xsl:when test="name() = 'CustomerAddress'">
                                                            <fo:block>
                                                                ग्राहक का पता: <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <xsl:when test="name() = 'DisbursedDate'">
                                                            <fo:block>
                                                                संवितरित तिथि: <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <xsl:when test="name() = 'LoanAmount'">
                                                            <fo:block>
                                                                उधार की राशि: <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <xsl:when test="name() = 'TotalInterestCharge'">
                                                            <fo:block>
                                                                कुल ब्याज शुल्क: <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <xsl:when test="name() = 'OtherUpfrontCharges'">
                                                            <fo:block>
                                                                अन्य अग्रिम शुल्क: <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <xsl:when test="name() = 'ProcessingFees'">
                                                            <fo:block>
                                                                प्रक्रमण फीस:
                                                                <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <xsl:when test="name() = 'InsuranceAmount'">
                                                            <fo:block>
                                                                बीमा राशि:
                                                                <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <xsl:when test="name() = 'OtherCharges'">
                                                            <fo:block>
                                                                अन्य शुल्क:
                                                                <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <xsl:when test="name() = 'NetDisbursedAmount'">
                                                            <fo:block>
                                                                शुद्ध संवितरित राशि: <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <xsl:when test="name() = 'TotalAmountToBePaid'">
                                                            <fo:block>
                                                                भुगतान की जाने वाली कुल राशि:
                                                                <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <xsl:when test="name() = 'AnnualizedInterestRate'">
                                                            <fo:block>
                                                                वार्षिक ब्याज दर: <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <xsl:when test="name() = 'RateOfInterest'">
                                                            <fo:block>
                                                                ब्याज की दर:
                                                                <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <!-- Default behavior for other fields -->
                                                        <xsl:otherwise>
                                                            <fo:block>
                                                                <xsl:value-of select="name()"/>: <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:for-each>
                                            </fo:block>
                                        </fo:block>
                                    </fo:table-cell>

                                    <!-- Second set of details -->
                                    <fo:table-cell padding="4pt" border="1pt solid black">
                                        <fo:block font-size="8pt" font-family="Times New Roman">
                                            <fo:block>
                                                <xsl:for-each select="*[self::MobileNo or self::FatherName or self::CoApplicantName or self::CentrePlace or self::LoanTerm or self::RepaymentFrequency or self::NumberOfInstallments or self::RepaymentDate or self::RepaymentAmount or self::LendingType or self::LoanCycle or self::BankAccountNo or self::Purpose or self::BeneficiaryAccountName or self::BankName or self::NetoffAccountAmount]">
                                                    <xsl:choose>
                                                        <!-- Special handling for MobileNo -->
                                                        <xsl:when test="name() = 'MobileNo'">
                                                            <fo:block>
                                                                मोबाइल नंबर:
                                                                <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <!-- Special handling for FatherName -->
                                                        <xsl:when test="name() = 'FatherName'">
                                                            <fo:block>
                                                                पिता का नाम: <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <!-- Special handling for CoApplicantName -->
                                                        <xsl:when test="name() = 'CoApplicantName'">
                                                            <fo:block>
                                                                सह-आवेदक का नाम: <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <!-- Special handling for CentrePlace -->
                                                        <xsl:when test="name() = 'CentrePlace'">
                                                            <fo:block>
                                                                केंद्र स्थान: <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <!-- Special handling for LoanTerm -->
                                                        <xsl:when test="name() = 'LoanTerm'">
                                                            <fo:block>
                                                                ऋण की अवधि: <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <!-- Special handling for RepaymentFrequency -->
                                                        <xsl:when test="name() = 'RepaymentFrequency'">
                                                            <fo:block>
                                                                चुकौती आवृत्ति: <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <!-- Special handling for NumberOfInstallments -->
                                                        <xsl:when test="name() = 'NumberOfInstallments'">
                                                            <fo:block>
                                                                किश्तों की संख्या: <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <!-- Special handling for RepaymentDate -->
                                                        <xsl:when test="name() = 'RepaymentDate'">
                                                            <fo:block>
                                                                चुकौती तिथि: <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <!-- Special handling for RepaymentAmount -->
                                                        <xsl:when test="name() = 'RepaymentAmount'">
                                                            <fo:block>
                                                                चुकौती राशि:
                                                                <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <!-- Special handling for LendingType -->
                                                        <xsl:when test="name() = 'LendingType'">
                                                            <fo:block>
                                                                उधार का प्रकार:
                                                                <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <!-- Special handling for LoanCycle -->
                                                        <xsl:when test="name() = 'LoanCycle'">
                                                            <fo:block>
                                                                ऋण चक्र:
                                                                <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <!-- Special handling for BankAccountNo -->
                                                        <xsl:when test="name() = 'BankAccountNo'">
                                                            <fo:block>
                                                                बैंक खाता नम्बर:
                                                                <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <!-- Special handling for Purpose -->
                                                        <xsl:when test="name() = 'Purpose'">
                                                            <fo:block>
                                                                उद्देश्य:
                                                                <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <!-- Special handling for BeneficiaryAccountName -->
                                                        <xsl:when test="name() = 'BeneficiaryAccountName'">
                                                            <fo:block>
                                                                लाभार्थी के खाते में नाम:
                                                                <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <!-- Special handling for BankName -->
                                                        <xsl:when test="name() = 'BankName'">
                                                            <fo:block>
                                                                बैंक का नाम:
                                                                <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <!-- Special handling for NetoffAccountAmount -->
                                                        <xsl:when test="name() = 'NetoffAccountAmount'">
                                                            <fo:block>
                                                                नेटऑफ खाता राशि:
                                                                <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <!-- Default behavior for other fields -->
                                                        <xsl:otherwise>
                                                            <fo-block>
                                                                <xsl:value-of select="name()"/>: <xsl:value-of select="."/>
                                                            </fo-block>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:for-each>
                                            </fo:block>
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
                                    <fo:block font-size="8" text-align="center">उदाहरण संख्या
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="8" text-align="center">चुकौती तिथि
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="8" text-align="center">बेहतरीन सिद्धांत
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="8" text-align="center">प्रधानाचार्य
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="8" text-align="center">दिलचस्पी
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="8" text-align="center">उदाहरण राशि
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="8" text-align="center">भुगतान की स्थिति
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="8" text-align="center">एकत्रित की गई राशि
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="8" text-align="center">पर एकत्रित राशि
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="8" text-align="center">एम्प कोड
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black" padding="2pt">
                                    <fo:block font-size="8" text-align="center">कर्मचारी हस्ताक्षर
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>
                        <fo:table-body>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="8pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="8pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="8pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="8pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="8pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="8pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="8pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="8pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="8pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="8pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="8pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="8pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="8pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="8pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstNo"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="RepaymentDate"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block  text-align="center" font-size="8pt"><xsl:value-of select="EmpSignature"/></fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                            <xsl:for-each select="LoanCardFactSheet/Installments/*">
                                <fo:table-row>
                                    <!-- Combined first two columns into one with "Total" -->
                                    <fo:table-cell border="1pt solid black" padding="15pt" number-columns-spanned="2">
                                        <fo:block text-align="center" font-size="8pt">Total</fo:block>
                                    </fo:table-cell>

                                    <!-- Remaining columns -->
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="OutstandingPrincipal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Principal"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="Interest"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="InstAmount"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="PaidStatus"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollected"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="AmountCollectedOn"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="EmpCode"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid black" padding="15pt">
                                        <fo:block text-align="center" font-size="8pt"><xsl:value-of select="EmpSignature"/></fo:block>
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
                                    <fo:block font-family="Times New Roman" font-size="8pt" font-weight="bold" text-align="center">
                                        प्रोसेसिंग शुल्क और स्टांप शुल्क शुल्क
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black">
                                    <fo:block font-family="Times New Roman" font-size="8pt" font-weight="bold" text-align="center">
                                        बीमा विवरण
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>
                        <fo:table-body>
                            <fo:table-row height="50mm" margin-left="8pt">
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
                    <fo:block font-family="Times New Roman" font-size="8pt" font-weight="bold" margin-top="0.5cm" margin-bottom="0.2cm">
                        मुख्य नियम एवं शर्तें
                    </fo:block>
                    <fo:block font-family="Times New Roman" font-size="8pt">
                        <xsl:for-each select="LoanCardFactSheet/KeyTermsAndConditions/Condition">
                            <fo:block font-size="8pt">
                                <xsl:number value="position()" format="1. "/><xsl:value-of select="."/>
                            </fo:block>
                        </xsl:for-each>
                    </fo:block>

                    <!-- Grievance Redressal -->
                    <fo:block font-family="Times New Roman" font-size="8pt" font-weight="bold" margin-top="0.5cm" margin-bottom="0.2cm">
                        शिकायत निवारण
                    </fo:block>
                    <fo:block font-size="8pt" font-family="Times New Roman">
                        <xsl:text> किसी भी प्रश्न के लिए, कृपया हमारे नोडल अधिकारी से संपर्क करें
                        </xsl:text>
                    </fo:block>
                    <fo:table width="100%" border="1pt solid black">
                        <fo:table-header>
                            <fo:table-row>
                                <fo:table-cell border="1pt solid black">
                                    <fo:block text-align="center" font-size="8pt" font-family="Times New Roman">नोडल अधिकारी का नाम
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black">
                                    <fo:block text-align="center" font-size="8pt" font-family="Times New Roman">नोडल अधिकारी संपर्क नंबर
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>
                        <fo:table-body>
                            <fo:table-row height="10mm">
                                <fo:table-cell border="1pt solid black">
                                    <fo:block font-family="Times New Roman"  font-size="8pt" text-align="center"><xsl:value-of select="LoanCardFactSheet/GrievanceRedressal/NodalOfficerName"/></fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid black">
                                    <fo:block font-family="Times New Roman" font-size="8pt" text-align="center"><xsl:value-of select="LoanCardFactSheet/GrievanceRedressal/NodalOfficerContactNo"/></fo:block>
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
                <fo:block font-size="8pt" font-family="Times New Roman">
                    <xsl:value-of select="name()"/>: <xsl:value-of select="."/>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>

    <xsl:template match="CustomerDetails/*">
        <fo:table-row>
            <fo:table-cell padding="4pt" border-right="1pt solid black">
                <fo:block font-size="8pt"><xsl:value-of select="name()"/></fo:block>
            </fo:table-cell>
            <fo:table-cell padding="4pt">
                <fo:block font-size="8pt"><xsl:value-of select="."/></fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>


    <xsl:template match="ProcessingFeeAndStampDuty/*">
        <fo:block font-size="8pt" padding="4pt" font-family="Times New Roman">
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
        <fo:block font-size="8pt" padding="4pt" font-family="Times New Roman">
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