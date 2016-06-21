<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<!--

THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL LANTANA CONSULTING GROUP LLC, OR ANY OF THEIR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
Schematron generated from Trifolia on 2/22/2016

2/22/2016
Replaced the messed up cda:sdtc: namespace with just sdtc:

Removed the extension from the context when the rule checks extension as it keeps the rule group from firing if extension is missing
regexp
(context="\w+:\w+\[cda:templateId\[@root='\d+\.\d+\.\d+\.\d+\.\d+\.\d+\.\d+\.\d+\.\d+\.\d+')(\sand\s@extension\s=\s'\w+-\w+-\w+')

Edited the following rules to remove the code system check from the count of code. The code SHALL have only 1
but the code system is a SHOULD and is checked as such in later rules
a-1098-30784, a-1198-7133, a-1140-28026

Manually added the missing rules for Care Goal entryRelationship
a-2228-13876, a-2228-11647, a-2228-11648, a-2228-11649, a-2228-28041, a-2228-11650, a-2228-28042,
a-2228-28038

Manually added the missing rules for Encounter Performed entryRelationship
a-2228-28600, a-2228-28598, a-2228-28601, a-2228-28602, a-2228-28599, a-2228-28603, a-2228-28604,
a-2228-28605, a-2228-28606

Manually added the missing rules for Procedure Performed entryRelationship
a-2228-11372, a-2228-11500, a-2228-27303, a-2228-27316, a-2228-27365, a-2228-28608, a-2228-28613,
a-2228-28617, a-2228-28615, a-2228-28618, a-2228-28619, a-2228-28616, a-2228-28620, a-2228-28621,
a-2228-28624, a-2228-28625, a-2228-27317

Manually added the missing rules for Intervention Performed entryRelationship
a-2228-27357, a-2228-27358

Manually added the missing entry rules for Patient Data Section QDM
a-2228-16601, a-2228-27378, a-2228-16602, a-2228-13135, a-2228-16603, a-2228-13136, a-2228-16604,
a-2228-28460, a-2228-16605, a-2228-28461, a-2228-28434, a-2228-27145, a-2228-27832, a-2228-28466,
a-2228-27833, a-2228-28465, a-2228-16612, a-2228-28494, a-2228-16613, a-2228-28495, a-2228-16649,
a-2228-28496, a-2228-16606, a-2228-28549, a-2228-16625, a-2228-28550, a-2228-16644, a-2228-28570,
a-2228-28595, a-2228-28596, a-2228-28649, a-2228-28650, a-2228-16609, a-2228-13142, a-2228-16610,
a-2228-13143, a-2228-16611, a-2228-27007, a-2228-16614, a-2228-13149, a-2228-16615, a-2228-27139,
a-2228-16616, a-2228-27073, a-2228-16617, a-2228-27076, a-2228-16618, a-2228-27156, a-2228-16620,
a-2228-27084, a-2228-16621, a-2228-27130, a-2228-16622, a-2228-27087, a-2228-16624, a-2228-27295,
a-2228-16628, a-2228-27296, a-2228-16630, a-2228-27136, a-2228-16631, a-2228-27379, a-2228-16632,
a-2228-27380, a-2228-16633, a-2228-13267, a-2228-16634, a-2228-27133, a-2228-16636, a-2228-13273,
a-2228-16638, a-2228-13295, a-2228-16639, a-2228-27300, a-2228-16642, a-2228-27090, a-2228-16643,
a-2228-27040, a-2228-16645, a-2228-27042, a-2228-16646, a-2228-27043, a-2228-16647, a-2228-27044,
a-2228-16653, a-2228-13948, a-2228-16654, a-2228-27142, a-2228-16655, a-2228-13952, a-2228-16657,
a-2228-27046, a-2228-16659, a-2228-27047, a-2228-16660, a-2228-27048, a-2228-16661, a-2228-27049,
a-2228-16662, a-2228-27050, a-2228-16663, a-2228-27051, a-2228-16665, a-2228-27153, a-2228-16666,
a-2228-14431, a-2228-16667, a-2228-27052, a-2228-16668, a-2228-27053, a-2228-16669, a-2228-27063,
a-2228-16670, a-2228-27055, a-2228-16674, a-2228-16549, a-2228-16675, a-2228-27062, a-2228-16676,
a-2228-27068, a-2228-16708, a-2228-27057, a-2228-16648, a-2228-27061, a-2228-27080, a-2228-27081,
a-2228-28215, a-2228-28216

Changed the rules for checking the presence of translation to not(tested_here) as the ecqm rules do not require that
a-1198-32847, a-1198-32848
-->
<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
  <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
  <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
  <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
  <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
  <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
  <sch:phase id="errors">
    <sch:active pattern="p-DOCUMENT-TEMPLATE" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.17.3.8-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.17.2.1-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.17.2.4-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.5.1-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.5.2-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.24-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.31-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.32-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.37-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.47-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.53-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.5.1.1-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.5.4-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.89-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.93-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.55-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.2.2-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.2.3-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.98-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.97-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.100-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.69-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.86-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.16-2014-06-09-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.123-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.113-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.9-2014-06-09-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.12-2014-06-09-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.14-2014-06-09-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.13-2014-06-09-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.121-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.7-2014-06-09-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.52-2014-06-09-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.39-2014-06-09-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.40-2014-06-09-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.41-2014-06-09-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.43-2014-06-09-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.42-2014-06-09-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.19-2014-06-09-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.28-2014-06-09-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.8-2014-06-09-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.17-2014-06-09-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.23-2014-06-09-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.18-2014-06-09-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.6-2014-06-09-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.143-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.20-2014-06-09-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.119-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.122-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.118-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.54-2014-06-09-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.25-2014-06-09-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.115-2014-06-09-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.129-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.120-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.85-2014-12-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.88-2014-12-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.91-2014-12-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.119-2014-12-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.99-2015-04-05-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.126-2014-12-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.2-2015-08-01-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.147-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.147-CLOSEDTEMPLATE" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.46-2015-08-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.4-2015-08-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.79-2015-08-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.80-2015-08-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.45-2015-08-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.3-2015-08-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.1.1-2015-08-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.49-2015-08-01-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.145-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.1-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.2-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.3-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.4-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.5-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.15-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.16-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.18-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.29-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.32-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.87-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.33-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.35-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.38-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.36-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.61-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.62-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.39-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.37-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.58-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.60-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.59-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.63-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.65-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.69-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.81-2016-02-01-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.141-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.142-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.82-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.1.1-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.1.2-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.30-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.31-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.103-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.114-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.48-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.67-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.51-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.54-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.17-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.19-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.26-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.25-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.27-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.6-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.8-2016-02-01-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.130-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.9-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.7-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.10-2016-02-01-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.131-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.21-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.22-2016-02-01-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.132-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.23-2016-02-01-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.133-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.24-2016-02-01-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.134-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.125-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.14-2016-02-16-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.123-2016-02-01-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.135-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.11-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.121-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.13-2016-02-01-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.136-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.76-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.120-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.127-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.122-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.124-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.77-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.79-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.78-2016-02-01-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.137-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.138-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.42-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.43-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.44-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.105-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.45-2016-02-01-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.139-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.46-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.47-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.75-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.112-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.12-2016-02-01-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.140-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.84-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.83-2016-02-01-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.143-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.41-2016-02-01-errors" />
  </sch:phase>
  <sch:phase id="warnings">
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.17.3.8-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.17.2.1-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.17.2.4-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.5.1-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.5.2-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.24-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.31-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.32-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.37-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.47-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.53-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.5.1.1-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.5.4-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.89-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.93-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.55-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.2.2-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.2.3-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.98-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.97-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.100-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.69-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.86-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.16-2014-06-09-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.123-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.113-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.9-2014-06-09-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.12-2014-06-09-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.14-2014-06-09-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.13-2014-06-09-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.121-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.7-2014-06-09-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.52-2014-06-09-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.39-2014-06-09-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.40-2014-06-09-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.41-2014-06-09-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.43-2014-06-09-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.42-2014-06-09-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.19-2014-06-09-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.28-2014-06-09-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.8-2014-06-09-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.17-2014-06-09-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.23-2014-06-09-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.18-2014-06-09-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.6-2014-06-09-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.143-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.20-2014-06-09-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.119-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.122-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.118-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.54-2014-06-09-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.25-2014-06-09-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.115-2014-06-09-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.129-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.120-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.85-2014-12-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.88-2014-12-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.91-2014-12-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.119-2014-12-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.99-2015-04-05-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.126-2014-12-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.2-2015-08-01-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.147-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.46-2015-08-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.4-2015-08-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.79-2015-08-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.80-2015-08-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.45-2015-08-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.3-2015-08-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.1.1-2015-08-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.49-2015-08-01-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.22.4.145-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.1-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.2-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.3-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.4-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.5-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.15-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.16-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.18-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.29-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.32-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.87-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.33-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.35-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.38-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.36-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.61-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.62-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.39-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.37-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.58-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.60-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.59-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.63-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.65-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.69-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.81-2016-02-01-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.141-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.142-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.82-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.1.1-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.1.2-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.30-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.31-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.103-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.114-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.48-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.67-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.51-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.54-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.17-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.19-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.26-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.25-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.27-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.6-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.8-2016-02-01-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.130-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.9-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.7-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.10-2016-02-01-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.131-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.21-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.22-2016-02-01-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.132-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.23-2016-02-01-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.133-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.24-2016-02-01-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.134-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.125-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.14-2016-02-16-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.123-2016-02-01-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.135-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.11-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.121-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.13-2016-02-01-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.136-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.76-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.120-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.127-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.122-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.124-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.77-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.79-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.78-2016-02-01-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.137-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.138-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.42-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.43-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.44-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.105-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.45-2016-02-01-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.139-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.46-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.47-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.75-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.112-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.12-2016-02-01-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.140-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.84-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.83-2016-02-01-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.143-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.41-2016-02-01-warnings" />
  </sch:phase>
  <sch:pattern id="p-DOCUMENT-TEMPLATE">
    <sch:rule id="r-errors-DOC-abstract" abstract="true">
      <sch:assert id="a-IG-2228-DOC" test="cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1' and @extension = '2015-08-01'] or cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2' and @extension = '2016-02-01'] or cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1' and @extension = '2016-02-01']">The document must contain at least 1 of the document level templates for this schematron to be applicable.</sch:assert>
    </sch:rule>
    <sch:rule id="r-errors-DOC" context="cda:ClinicalDocument">
      <sch:extends rule="r-errors-DOC-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.17.3.8-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.3.8-errors-abstract" abstract="true">
      <sch:assert id="a-23-3269" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:23-3269).</sch:assert>
      <sch:assert id="a-23-3270" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:23-3270).</sch:assert>
      <sch:assert id="a-23-3272" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:23-3272).</sch:assert>
      <sch:assert id="a-23-3273" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:23-3273).</sch:assert>
      <sch:assert id="a-23-3274" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:23-3274).</sch:assert>
      <sch:assert id="a-23-3275" test="cda:effectiveTime[count(cda:high)=1]">This effectiveTime SHALL contain exactly one [1..1] high (CONF:23-3275).</sch:assert>
      <sch:assert id="a-23-18098-c" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:23-18098) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.17.3.8" (CONF:23-18099).</sch:assert>
      <sch:assert id="a-23-26549" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:23-26549).</sch:assert>
      <sch:assert id="a-23-26550" test="cda:code[@code='252116004']">This code SHALL contain exactly one [1..1] @code="252116004" Observation Parameters (CONF:23-26550).</sch:assert>
      <sch:assert id="a-23-26551" test="cda:code[@codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:23-26551).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.3.8-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.3.8-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.17.2.1-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-errors-abstract" abstract="true">
      <sch:assert id="a-23-3277" test="count(cda:entry[count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']])=1])=1">SHALL contain exactly one [1..1] entry (CONF:23-3277) such that it SHALL contain exactly one [1..1] Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:23-17496).</sch:assert>
      <sch:assert id="a-23-4142" test="count(cda:title[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='reporting parameters'])=1">SHALL contain exactly one [1..1] title="Reporting Parameters" (CONF:23-4142).</sch:assert>
      <sch:assert id="a-23-4143" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:23-4143).</sch:assert>
      <sch:assert id="a-23-14611-c" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:23-14611) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.17.2.1" (CONF:23-14612).</sch:assert>
      <sch:assert id="a-23-18191-c" test="count(cda:code[@code='55187-9'][@codeSystem='2.16.840.1.113883.6.1'])">SHALL contain exactly one [1..1] code (CONF:23-18191).</sch:assert>
      <sch:assert id="a-23-19229" test="cda:code[@code='55187-9']">This code SHALL contain exactly one [1..1] @code="55187-9" Reporting Parameters (CONF:23-19229).</sch:assert>
      <sch:assert id="a-23-26552" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:23-26552).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-3277-branch-3277-errors-abstract" abstract="true">
      <sch:assert id="a-23-3278-branch-3277" test="@typeCode='DRIV'">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:23-3278).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-3277-branch-3277-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']]/cda:entry[cda:act]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-3277-branch-3277-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.17.2.4-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.2.4-errors-abstract" abstract="true">
      <sch:assert id="a-67-3865-c" test="count(cda:code[@code='55188-7'][@codeSystem='2.16.840.1.113883.6.1'])">SHALL contain exactly one [1..1] code (CONF:67-3865).</sch:assert>
      <sch:assert id="a-67-3866" test="count(cda:title[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='patient data'])=1">SHALL contain exactly one [1..1] title="Patient Data" (CONF:67-3866).</sch:assert>
      <sch:assert id="a-67-3867" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:67-3867).</sch:assert>
      <sch:assert id="a-67-12794-c" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.17.2.4'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:67-12794) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.17.2.4" (CONF:67-12795).</sch:assert>
      <sch:assert id="a-67-14567" test="count(cda:entry) &gt; 0">SHALL contain at least one [1..*] entry (CONF:67-14567).</sch:assert>
      <sch:assert id="a-67-26548" test="cda:code[@code='55188-7']">This code SHALL contain exactly one [1..1] @code="55188-7" (CONF:67-26548).</sch:assert>
      <sch:assert id="a-67-27013" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:67-27013).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.2.4-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.4']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.2.4-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.5.1-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.5.1-errors-abstract" abstract="true">
      <sch:assert id="a-81-7157" test="count(cda:given[@xsi:type='ST']) &gt; 0">SHALL contain at least one [1..*] given (CONF:81-7157).</sch:assert>
      <sch:assert id="a-81-7159" test="count(cda:family[@xsi:type='ST'])=1">SHALL contain exactly one [1..1] family (CONF:81-7159).</sch:assert>
      <sch:assert id="a-81-7278-c" test="not(tested)">*SHALL NOT* have mixed content except for white space (CONF:81-7278).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.5.1-errors" context="cda:name[cda:templateId[@root='2.16.840.1.113883.10.20.22.5.1']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.5.1-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.5.2-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.5.2-errors-abstract" abstract="true">
      <sch:assert id="a-81-7291" test="count(cda:streetAddressLine)=1">SHALL contain exactly one [1..1] streetAddressLine (CONF:81-7291).</sch:assert>
      <sch:assert id="a-81-7292" test="count(cda:city)=1">SHALL contain exactly one [1..1] city (CONF:81-7292).</sch:assert>
      <sch:assert id="a-81-7296-c" test="not(tested)">*SHALL NOT* have mixed content except for white space (CONF:81-7296).</sch:assert>
      <sch:assert id="a-81-10024-c" test="(cda:country='US' and cda:state) or (cda:country!='US') or (not(cda:country) and cda:state) ">State is required if the country is US. If country is not specified, it's assumed to be US. If country is something other than US, the state MAY be present but MAY be bound to different vocabularies (CONF:81-10024).</sch:assert>
      <sch:assert id="a-81-10025-c" test="(cda:country='US' and cda:postalCode) or (cda:country!='US') or (not(cda:country) and cda:postalCode)">PostalCode is required if the country is US. If country is not specified, it's assumed to be US. If country is something other than US, the postalCode MAY be present but MAY be bound to different vocabularies (CONF:81-10025).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.5.2-errors" context="cda:addr[cda:templateId[@root='2.16.840.1.113883.10.20.22.5.2']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.5.2-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.24-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.24-errors-abstract" abstract="true">
      <sch:assert id="a-81-7490" test="@classCode='MANU'">SHALL contain exactly one [1..1] @classCode="MANU" (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:81-7490).</sch:assert>
      <sch:assert id="a-81-7492" test="count(cda:playingEntity)=1">SHALL contain exactly one [1..1] playingEntity (CONF:81-7492).</sch:assert>
      <sch:assert id="a-81-7493" test="cda:playingEntity[count(cda:code)=1]">This playingEntity SHALL contain exactly one [1..1] code (CONF:81-7493).</sch:assert>
      <sch:assert id="a-81-19137" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:81-19137).</sch:assert>
      <sch:assert id="a-81-19138" test="cda:code[@code='412307009']">This code SHALL contain exactly one [1..1] @code="412307009" Drug Vehicle (CONF:81-19138).</sch:assert>
      <sch:assert id="a-81-26502" test="cda:code[@codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:81-26502).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.24-errors" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.24']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.24-errors-abstract" />
      <sch:assert id="a-81-7495" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.24'])=1">SHALL contain exactly one [1..1] templateId (CONF:81-7495) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.24" (CONF:81-10493).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.31-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.31-errors-abstract" abstract="true">
      <sch:assert id="a-81-7613" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-7613).</sch:assert>
      <sch:assert id="a-81-7614" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-7614).</sch:assert>
      <sch:assert id="a-81-7615" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:81-7615).</sch:assert>
      <sch:assert id="a-81-7617" test="count(cda:value[@xsi:type='PQ'])=1">SHALL contain exactly one [1..1] value with @xsi:type="PQ" (CONF:81-7617).</sch:assert>
      <sch:assert id="a-81-7618" test="cda:value[@xsi:type='PQ'][@unit]">This value SHALL contain exactly one [1..1] @unit, which SHALL be selected from ValueSet AgePQ_UCUM urn:oid:2.16.840.1.113883.11.20.9.21 DYNAMIC (CONF:81-7618).</sch:assert>
      <sch:assert id="a-81-15965" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:81-15965).</sch:assert>
      <sch:assert id="a-81-15966" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:81-15966).</sch:assert>
      <sch:assert id="a-81-16776" test="cda:code[@code='445518008']">This code SHALL contain exactly one [1..1] @code="445518008" Age At Onset (CONF:81-16776).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.31-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.31']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.31-errors-abstract" />
      <sch:assert id="a-81-7899" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.31'])=1">SHALL contain exactly one [1..1] templateId (CONF:81-7899) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.31" (CONF:81-10487).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.32-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.32-errors-abstract" abstract="true">
      <sch:assert id="a-81-7758" test="@classCode='SDLOC'">SHALL contain exactly one [1..1] @classCode="SDLOC" (CodeSystem: RoleCode urn:oid:2.16.840.1.113883.5.111 STATIC) (CONF:81-7758).</sch:assert>
      <sch:assert id="a-81-7763" test="not(cda:playingEntity) or cda:playingEntity[@classCode='PLC']">The playingEntity, if present, SHALL contain exactly one [1..1] @classCode="PLC" (CodeSystem: EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:81-7763).</sch:assert>
      <sch:assert id="a-81-16850" test="count(cda:code[@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.1.11.20275']/voc:code/@value or @nullFlavor])=1">SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet HealthcareServiceLocation urn:oid:2.16.840.1.113883.1.11.20275 STATIC (CONF:81-16850).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.32-errors" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.32']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.32-errors-abstract" />
      <sch:assert id="a-81-7635" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.32'])=1">SHALL contain exactly one [1..1] templateId (CONF:81-7635) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.32" (CONF:81-10524).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.37-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.37-errors-abstract" abstract="true">
      <sch:assert id="a-81-7900" test="@classCode='MANU'">SHALL contain exactly one [1..1] @classCode="MANU" Manufactured Product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:81-7900).</sch:assert>
      <sch:assert id="a-81-7902" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:81-7902).</sch:assert>
      <sch:assert id="a-81-7903" test="count(cda:playingDevice)=1">SHALL contain exactly one [1..1] playingDevice (CONF:81-7903).</sch:assert>
      <sch:assert id="a-81-7905" test="count(cda:scopingEntity)=1">SHALL contain exactly one [1..1] scopingEntity (CONF:81-7905).</sch:assert>
      <sch:assert id="a-81-7908" test="cda:scopingEntity[count(cda:id) &gt; 0]">This scopingEntity SHALL contain at least one [1..*] id (CONF:81-7908).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.37-errors" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.37']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.37-errors-abstract" />
      <sch:assert id="a-81-7901" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.37'])=1">SHALL contain exactly one [1..1] templateId (CONF:81-7901) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.37" (CONF:81-10522).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.47-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.47-errors-abstract" abstract="true">
      <sch:assert id="a-81-8621" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-8621).</sch:assert>
      <sch:assert id="a-81-8622" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-8622).</sch:assert>
      <sch:assert id="a-81-8625" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:81-8625).</sch:assert>
      <sch:assert id="a-81-8626" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:81-8626).</sch:assert>
      <sch:assert id="a-81-19097" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:81-19097).</sch:assert>
      <sch:assert id="a-81-19141" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:81-19141).</sch:assert>
      <sch:assert id="a-81-19142" test="cda:code[@code='ASSERTION']">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:81-19142).</sch:assert>
      <sch:assert id="a-81-26470" test="cda:value[@xsi:type='CD'][@code='419099009']">This value SHALL contain exactly one [1..1] @code="419099009" Dead (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96 STATIC) (CONF:81-26470).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.47-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.47']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.47-errors-abstract" />
      <sch:assert id="a-81-8623" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.47'])=1">SHALL contain exactly one [1..1] templateId (CONF:81-8623) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.47" (CONF:81-10495).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.53-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.53-errors-abstract" abstract="true">
      <sch:assert id="a-81-8991" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-8991).</sch:assert>
      <sch:assert id="a-81-8992" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-8992).</sch:assert>
      <sch:assert id="a-81-8994" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:81-8994).</sch:assert>
      <sch:assert id="a-81-8995" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet No Immunization Reason Value Set urn:oid:2.16.840.1.113883.1.11.19717 DYNAMIC (CONF:81-8995).</sch:assert>
      <sch:assert id="a-81-8996" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:81-8996).</sch:assert>
      <sch:assert id="a-81-19104" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:81-19104).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.53-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.53']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.53-errors-abstract" />
      <sch:assert id="a-81-8993" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.53'])=1">SHALL contain exactly one [1..1] templateId (CONF:81-8993) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.53" (CONF:81-10500).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.5.1.1-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.5.1.1-errors-abstract" abstract="true">
      <sch:assert id="a-81-9368" test="count(cda:name)=1">SHALL contain exactly one [1..1] name (CONF:81-9368).</sch:assert>
      <sch:assert id="a-81-9371-c" test="(cda:name/cda:given and cda:name/cda:family) or (count(cda:name/*)=0 and string-length(normalize-space(string(cda:name)))!=0)">The content of name *SHALL* be either a conformant Patient Name (PTN.US.FIELDED), or a string (CONF:81-9371).</sch:assert>
      <sch:assert id="a-81-9372-c" test="(cda:name/cda:given and cda:name/cda:family) or (count(cda:name/*)=0)">The string *SHALL NOT* contain name parts (CONF:81-9372).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.5.1.1-errors" context="cda:name[cda:templateId[@root='2.16.840.1.113883.10.20.22.5.1.1']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.5.1.1-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.5.4-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.5.4-errors-abstract" abstract="true">
      <sch:assert id="a-81-10127-c" test="string-length(@value)&gt;=8">*SHALL* be precise to the day (CONF:81-10127).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.5.4-errors" context="cda:effectiveTime[cda:templateId[@root='2.16.840.1.113883.10.20.22.5.4']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.5.4-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.89-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.89-errors-abstract" abstract="true">
      <sch:assert id="a-67-11401" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-11401).</sch:assert>
      <sch:assert id="a-67-11402" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.89'])=1">SHALL contain exactly one [1..1] templateId (CONF:67-11402) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.89" (CONF:67-11403).</sch:assert>
      <sch:assert id="a-67-14559" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-14559).</sch:assert>
      <sch:assert id="a-67-14561" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:67-14561).</sch:assert>
      <sch:assert id="a-67-14562" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:67-14562).</sch:assert>
      <sch:assert id="a-67-26984" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:67-26984).</sch:assert>
      <sch:assert id="a-67-27014" test="cda:code[@codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:67-27014).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.89-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.89']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.89-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.93-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.93-errors-abstract" abstract="true">
      <sch:assert id="a-67-11879" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-11879).</sch:assert>
      <sch:assert id="a-67-11880" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-11880).</sch:assert>
      <sch:assert id="a-67-11881" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.93'])=1">SHALL contain exactly one [1..1] templateId (CONF:67-11881) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.93" (CONF:67-11882).</sch:assert>
      <sch:assert id="a-67-11884" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:67-11884).</sch:assert>
      <sch:assert id="a-67-11885" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:67-11885).</sch:assert>
      <sch:assert id="a-67-11886" test="cda:code[@code='33999-4']">This code SHALL contain exactly one [1..1] @code="33999-4" status (CONF:67-11886).</sch:assert>
      <sch:assert id="a-67-11887" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:67-11887).</sch:assert>
      <sch:assert id="a-67-27011" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:67-27011).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.93-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.93']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.93-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.55-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.55-errors-abstract" abstract="true">
      <sch:assert id="a-67-12561" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55'])=1">SHALL contain exactly one [1..1] templateId (CONF:67-12561) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.55" (CONF:67-12562).</sch:assert>
      <sch:assert id="a-67-12564" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:67-12564).</sch:assert>
      <sch:assert id="a-67-12565" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:67-12565).</sch:assert>
      <sch:assert id="a-67-14029" test="cda:code[@code='48768-6']">This code SHALL contain exactly one [1..1] @code="48768-6" Payment source (CONF:67-14029).</sch:assert>
      <sch:assert id="a-67-14213" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-14213).</sch:assert>
      <sch:assert id="a-67-14214" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-14214).</sch:assert>
      <sch:assert id="a-67-16710" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Payer urn:oid:2.16.840.1.114222.4.11.3591 DYNAMIC (CONF:67-16710).</sch:assert>
      <sch:assert id="a-67-26933" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:67-26933).</sch:assert>
      <sch:assert id="a-67-26934" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:67-26934).</sch:assert>
      <sch:assert id="a-67-27009" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:67-27009).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.55-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.55-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.2.2-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-errors-abstract" abstract="true">
      <sch:assert id="a-67-12798" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:67-12798).</sch:assert>
      <sch:assert id="a-67-12799" test="count(cda:title[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='measure section'])=1">SHALL contain exactly one [1..1] title="Measure Section" (CONF:67-12799).</sch:assert>
      <sch:assert id="a-67-12800" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:67-12800).</sch:assert>
      <sch:assert id="a-67-12801" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:67-12801) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.2.2" (CONF:67-12802).</sch:assert>
      <sch:assert id="a-67-13003" test="count(cda:entry) &gt; 0">SHALL contain at least one [1..*] entry (CONF:67-13003).</sch:assert>
      <sch:assert id="a-67-19230" test="cda:code[@code='55186-1']">This code SHALL contain exactly one [1..1] @code="55186-1" Measure Section (CONF:67-19230).</sch:assert>
      <sch:assert id="a-67-27012" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:67-27012).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.2.3-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.2.3-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-errors-abstract" />
      <sch:assert id="a-67-12803" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.2.3'])=1">SHALL contain exactly one [1..1] templateId (CONF:67-12803) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.2.3" (CONF:67-12804).</sch:assert>
      <sch:assert id="a-67-12978" test="count(cda:entry) &gt; 0">SHALL contain at least one [1..*] entry (CONF:67-12978).</sch:assert>
      <sch:assert id="a-67-13193" test="cda:entry[count(cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']])=1]">Such entries SHALL contain exactly one [1..1] eMeasure Reference QDM (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.97) (CONF:67-13193).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.2.3-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.3']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.2.3-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.98-errors">
    <!--Pattern is used in an implied relationship.-->
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-errors-abstract" abstract="true">
      <sch:assert id="a-67-12979" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" cluster (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-12979).</sch:assert>
      <sch:assert id="a-67-12980" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-12980).</sch:assert>
      <sch:assert id="a-67-12981" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:67-12981).</sch:assert>
      <sch:assert id="a-67-12982" test="count(cda:reference[@typeCode='REFR'][count(cda:externalDocument)=1])=1">SHALL contain exactly one [1..1] reference (CONF:67-12982) such that it SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:67-12983). SHALL contain exactly one [1..1] externalDocument (CONF:67-12984).</sch:assert>
      <sch:assert id="a-67-26992" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:67-26992).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-errors-abstract" />
      <sch:assert id="a-67-19532" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98'])=1">SHALL contain exactly one [1..1] templateId (CONF:67-19532) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.98" (CONF:67-19533).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-errors-abstract" abstract="true">
      <sch:assert id="a-67-12985-branch-12982" test="cda:externalDocument[count(cda:id[@root]) &gt; 0]">This externalDocument SHALL contain at least one [1..*] id (CONF:67-12985) such that it SHALL contain exactly one [1..1] @root (CONF:67-12986).</sch:assert>
      <sch:assert id="a-67-12998-branch-12982-c" test="not(testable)">This text is the title of the eMeasure (CONF:67-12998).</sch:assert>
      <sch:assert id="a-67-19534-branch-12982" test="cda:externalDocument[@classCode='DOC']">This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:67-19534).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]/cda:reference[@typeCode='REFR'][cda:externalDocument]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12985-branch-12985-errors-abstract" abstract="true">
      <sch:assert id="a-67-27008-branch-12985-c" test="not(testable)">This ID references an ID of the Quality Measure (CONF:67-27008).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12985-branch-12985-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]/cda:reference[@typeCode='REFR'][cda:externalDocument][cda:id[@root]]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12985-branch-12985-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.97-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.97-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-errors-abstract" />
      <sch:assert id="a-67-12805" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" cluster (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-12805).</sch:assert>
      <sch:assert id="a-67-12806" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-12806).</sch:assert>
      <sch:assert id="a-67-12807" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:67-12807).</sch:assert>
      <sch:assert id="a-67-12808" test="count(cda:reference[@typeCode='REFR'])=1">SHALL contain exactly one [1..1] reference (CONF:67-12808) such that it SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:67-12809).</sch:assert>
      <sch:assert id="a-67-12868-c" test="not(testable)">This setId SHALL equal the QualityMeasureDocument/setId which is the eMeasure version neutral id (CONF:67-12868).</sch:assert>
      <sch:assert id="a-67-16679" test="not(cda:component) or cda:component[count(cda:observation)=1]">The component, if present, SHALL contain exactly one [1..1] observation (CONF:67-16679).</sch:assert>
      <sch:assert id="a-67-16680" test="not(cda:component/cda:observation) or cda:component/cda:observation[@negationInd]">This observation SHALL contain exactly one [1..1] @negationInd (CONF:67-16680).</sch:assert>
      <sch:assert id="a-67-16681" test="not(cda:component/cda:observation) or cda:component/cda:observation[count(cda:code)=1]">This observation SHALL contain exactly one [1..1] code (CONF:67-16681).</sch:assert>
      <sch:assert id="a-67-16682" test="not(cda:component/cda:observation/cda:code) or cda:component/cda:observation/cda:code[@code='ASSERTION']">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:67-16682).</sch:assert>
      <sch:assert id="a-67-16683" test="not(cda:component/cda:observation) or cda:component/cda:observation[count(cda:value[@xsi:type='CD'])=1]">This observation SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:67-16683).</sch:assert>
      <sch:assert id="a-67-16684" test="not(cda:component/cda:observation) or cda:component/cda:observation[count(cda:reference)=1]">This observation SHALL contain exactly one [1..1] reference (CONF:67-16684).</sch:assert>
      <sch:assert id="a-67-16685" test="not(cda:component/cda:observation/cda:reference) or cda:component/cda:observation/cda:reference[@typeCode='REFR']">This reference SHALL contain exactly one [1..1] @typeCode="REFR" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:67-16685).</sch:assert>
      <sch:assert id="a-67-16686" test="not(cda:component/cda:observation/cda:reference) or cda:component/cda:observation/cda:reference[count(cda:externalObservation)=1]">This reference SHALL contain exactly one [1..1] externalObservation (CONF:67-16686).</sch:assert>
      <sch:assert id="a-67-16687" test="not(cda:component/cda:observation/cda:reference/cda:externalObservation) or cda:component/cda:observation/cda:reference/cda:externalObservation[count(cda:id)=1]">This externalObservation SHALL contain exactly one [1..1] id (CONF:67-16687).</sch:assert>
      <sch:assert id="a-67-16688-c" test="not(testable)">This identifier SHALL be equal to a population criterion identifier in the referenced eMeasure. (This is necessary because a referenced eMeasure can have multiple numerator populations) (CONF:67-16688).</sch:assert>
      <sch:assert id="a-67-16690" test="not(cda:component/cda:observation/cda:referenceRange) or cda:component/cda:observation/cda:referenceRange[count(cda:observationRange)=1]">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:67-16690).</sch:assert>
      <sch:assert id="a-67-16691" test="not(cda:component/cda:observation/cda:referenceRange/cda:observationRange) or cda:component/cda:observation/cda:referenceRange/cda:observationRange[count(cda:value[@xsi:type='REAL'])=1]">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:67-16691).</sch:assert>
      <sch:assert id="a-67-16693" test="not(cda:component/cda:observation/cda:reference/cda:externalObservation) or cda:component/cda:observation/cda:reference/cda:externalObservation[@classCode='OBS']">This externalObservation SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-16693).</sch:assert>
      <sch:assert id="a-67-16694" test="not(cda:component/cda:observation/cda:reference/cda:externalObservation) or cda:component/cda:observation/cda:reference/cda:externalObservation[@moodCode='EVN']">This externalObservation SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-16694).</sch:assert>
      <sch:assert id="a-67-27010" test="not(cda:component/cda:observation/cda:code) or cda:component/cda:observation/cda:code[@codeSystem='2.16.840.1.113883.5.4']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:67-27010).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.97-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.97-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.97-12808-branch-12808-errors-abstract" abstract="true">
      <sch:assert id="a-67-12810-branch-12808" test="count(cda:externalDocument)=1">SHALL contain exactly one [1..1] externalDocument (CONF:67-12810).</sch:assert>
      <sch:assert id="a-67-12811-branch-12808" test="cda:externalDocument[count(cda:id[@root='2.16.840.1.113883.4.738'][@extension])=1]">This externalDocument SHALL contain exactly one [1..1] id (CONF:67-12811) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.738" (CONF:67-12812). SHALL contain exactly one [1..1] @extension (CONF:67-12813).</sch:assert>
      <sch:assert id="a-67-12866-branch-12808-c" test="not(testable)">This text SHALL equal the title of the eMeasure (CONF:67-12866).</sch:assert>
      <sch:assert id="a-67-12870-branch-12808-c" test="not(testable)">The version number SHALL equal the sequential eMeasure Version number (CONF:67-12870).</sch:assert>
      <sch:assert id="a-67-27017-branch-12808" test="cda:externalDocument[@classCode='DOC']">This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:67-27017).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.97-12808-branch-12808-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:reference[@typeCode='REFR']">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.97-12808-branch-12808-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.100-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.100-errors-abstract" abstract="true">
      <sch:assert id="a-67-13371" test="count(cda:time)=1">SHALL contain exactly one [1..1] time (CONF:67-13371).</sch:assert>
      <sch:assert id="a-67-13372" test="count(cda:participantRole)=1">SHALL contain exactly one [1..1] participantRole (CONF:67-13372).</sch:assert>
      <sch:assert id="a-67-13373" test="cda:participantRole[@classCode='SDLOC']">This participantRole SHALL contain exactly one [1..1] @classCode="SDLOC" service delivery location (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:67-13373).</sch:assert>
      <sch:assert id="a-67-13374" test="@typeCode='LOC'">SHALL contain exactly one [1..1] @typeCode="LOC" location (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:67-13374).</sch:assert>
      <sch:assert id="a-67-13375" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.100'])=1">SHALL contain exactly one [1..1] templateId (CONF:67-13375) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.100" (CONF:67-13376).</sch:assert>
      <sch:assert id="a-67-13378" test="cda:participantRole[count(cda:code)=1]">This participantRole SHALL contain exactly one [1..1] code (CONF:67-13378).</sch:assert>
      <sch:assert id="a-67-13382" test="not(cda:participantRole/cda:playingEntity) or cda:participantRole/cda:playingEntity[@classCode='PLC']">The playingEntity, if present, SHALL contain exactly one [1..1] @classCode="PLC" place (CodeSystem: EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:67-13382).</sch:assert>
      <sch:assert id="a-67-13384" test="cda:time[count(cda:low)=1]">This time SHALL contain exactly one [1..1] low (CONF:67-13384).</sch:assert>
      <sch:assert id="a-67-13385" test="cda:time[count(cda:high)=1]">This time SHALL contain exactly one [1..1] high (CONF:67-13385).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.100-errors" context="cda:participant[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.100']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.100-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.69-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.69-errors-abstract" abstract="true">
      <sch:assert id="a-81-14434" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-14434).</sch:assert>
      <sch:assert id="a-81-14435" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-14435).</sch:assert>
      <sch:assert id="a-81-14436" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.69'])=1">SHALL contain exactly one [1..1] templateId (CONF:81-14436) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.69" (CONF:81-14437).</sch:assert>
      <sch:assert id="a-81-14438" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:81-14438).</sch:assert>
      <sch:assert id="a-81-14439" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:81-14439).</sch:assert>
      <sch:assert id="a-81-14444" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:81-14444).</sch:assert>
      <sch:assert id="a-81-14445" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:81-14445).</sch:assert>
      <sch:assert id="a-81-14450" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:81-14450).</sch:assert>
      <sch:assert id="a-81-16800" test="not(cda:referenceRange) or cda:referenceRange[count(cda:observationRange)=1]">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:81-16800).</sch:assert>
      <sch:assert id="a-81-16804-c" test="count(cda:referenceRange/cda:observationRange/cda:text/cda:reference[@value])=0 or starts-with(cda:referenceRange/cda:observationRange/cda:text/cda:reference/@value, '#')">This reference/@value SHALL begin with a '#' and SHALL point to its corresponding narrative (using the approach defined in CDA Release 2, section 4.3.5.1) (CONF:81-16804).</sch:assert>
      <sch:assert id="a-81-19088" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:81-19088).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.69-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.69']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.69-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.86-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.86-errors-abstract" abstract="true">
      <sch:assert id="a-81-16715" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-16715).</sch:assert>
      <sch:assert id="a-81-16716" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-16716).</sch:assert>
      <sch:assert id="a-81-16720" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:81-16720).</sch:assert>
      <sch:assert id="a-81-16724" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:81-16724).</sch:assert>
      <sch:assert id="a-81-16754" test="count(cda:value) &gt; 0">SHALL contain at least one [1..*] value (CONF:81-16754).</sch:assert>
      <sch:assert id="a-81-19089" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:81-19089).</sch:assert>
      <sch:assert id="a-81-19178" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:81-19178).</sch:assert>
      <sch:assert id="a-81-19179" test="cda:code[@code]">This code SHALL contain exactly one [1..1] @code (CONF:81-19179).</sch:assert>
      <sch:assert id="a-81-19180-c" test="count(cda:code[@codeSystem])=0 or cda:code[@codeSystem='2.16.840.1.113883.6.1'] or cda:code[@codeSystem='2.16.840.1.113883.6.96']">Such that the @code SHALL be from LOINC (CodeSystem: 2.16.840.1.113883.6.1) or SNOMED CT (CodeSystem: 2.16.840.1.113883.6.96) and represents components of the scale (CONF:81-19180).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.86-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.86']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.86-errors-abstract" />
      <sch:assert id="a-81-16722" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.86'])=1">SHALL contain exactly one [1..1] templateId (CONF:81-16722) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.86" (CONF:81-16723).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.16-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.16-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-7496" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7496).</sch:assert>
      <sch:assert id="a-1098-7497" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.18']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet MoodCodeEvnInt urn:oid:2.16.840.1.113883.11.20.9.18 STATIC 2011-04-03 (CONF:1098-7497).</sch:assert>
      <sch:assert id="a-1098-7499" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7499) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.16" (CONF:1098-10504). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32498).</sch:assert>
      <sch:assert id="a-1098-7500" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-7500).</sch:assert>
      <sch:assert id="a-1098-7507" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7507).</sch:assert>
      <sch:assert id="a-1098-7508-c" test="cda:effectiveTime[@xsi:type='IVL_TS']">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-7508) such that it</sch:assert>
      <sch:assert id="a-1098-9106-c" test="not(tested-here)">SHALL contain exactly one [1..1] @operator="A" (CONF:1098-9106).</sch:assert>
      <sch:assert id="a-1098-28499-c" test="not(tested-here)">*SHALL* contain exactly one [[]1..1[]] @xsi:type="PIVL_TS" or "EIVL_TS" (CONF:1098-28499).</sch:assert>
      <sch:assert id="a-1098-7516" test="count(cda:doseQuantity)=1">SHALL contain exactly one [1..1] doseQuantity (CONF:1098-7516).</sch:assert>
      <sch:assert id="a-1098-7525" test="not(cda:rateQuantity) or cda:rateQuantity[@unit]">The rateQuantity, if present, SHALL contain exactly one [1..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-7525).</sch:assert>
      <sch:assert id="a-1098-7520" test="count(cda:consumable)=1">SHALL contain exactly one [1..1] consumable (CONF:1098-7520).</sch:assert>
      <sch:assert id="a-1098-16085" test="cda:consumable[count(cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.23' and @extension = '2014-06-09']])=1]">This consumable SHALL contain exactly one [1..1] Medication Information (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.23:2014-06-09) (CONF:1098-16085).</sch:assert>
      <sch:assert id="a-1098-31882" test="not(cda:precondition) or cda:precondition[@typeCode='PRCN']">The precondition, if present, SHALL contain exactly one [1..1] @typeCode="PRCN" (CONF:1098-31882).</sch:assert>
      <sch:assert id="a-1098-31883" test="not(cda:precondition) or cda:precondition[count(cda:criterion[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.25' and @extension = '2014-06-09']])=1]">The precondition, if present, SHALL contain exactly one [1..1] Precondition for Substance Administration (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.25:2014-06-09) (CONF:1098-31883).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.16-2014-06-09-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.16-2014-06-09-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.16-2014-06-09-7508-branch-7508-errors-abstract" abstract="true">
      <sch:assert id="a-1098-32890-branch-7508-c" test="( cda:low or @value) and not( cda:low and @value)">This effectiveTime *SHALL* contain either a low or a @value but not both (CONF:1098-32890).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.16-2014-06-09-7508-branch-7508-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16']]/cda:effectiveTime[@xsi:type='IVL_TS']">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.16-2014-06-09-7508-branch-7508-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.123-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.123-errors-abstract" abstract="true">
      <sch:assert id="a-1098-28656" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" (CONF:1098-28656).</sch:assert>
      <sch:assert id="a-1098-28660" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-28660).</sch:assert>
      <sch:assert id="a-1098-28661" test="count(cda:participant) &gt; 0">SHALL contain at least one [1..*] participant (CONF:1098-28661) such that it</sch:assert>
      <sch:assert id="a-1098-30818" test="cda:code[@code='395170001']">This code SHALL contain exactly one [1..1] @code="395170001" medication monitoring (regime/therapy) (CONF:1098-30818).</sch:assert>
      <sch:assert id="a-1098-30819" test="cda:code[@codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:1098-30819).</sch:assert>
      <sch:assert id="a-1098-30823" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-30823).</sch:assert>
      <sch:assert id="a-1098-31920" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-31920).</sch:assert>
      <sch:assert id="a-1098-31921" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-31921).</sch:assert>
      <sch:assert id="a-1098-31922" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-31922).</sch:assert>
      <sch:assert id="a-1098-32358" test="cda:statusCode[@code]">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ActStatus urn:oid:2.16.840.1.113883.1.11.159331 DYNAMIC (CONF:1098-32358).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.123-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.123']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.123-errors-abstract" />
      <sch:assert id="a-1098-28657" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.123'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-28657) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.123" (CONF:1098-28658).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.123-28661-branch-28661-errors-abstract" abstract="true">
      <sch:assert id="a-1098-28662-branch-28661" test="count(cda:participantRole)=1">SHALL contain exactly one [1..1] participantRole (CONF:1098-28662). This participantRole SHALL contain exactly one [1..1] @classCode="ASSIGNED" (CONF:1098-28664).</sch:assert>
      <sch:assert id="a-1098-28663-branch-28661" test="@typeCode='RESP'">SHALL contain exactly one [1..1] @typeCode="RESP" (CONF:1098-28663).</sch:assert>
      <sch:assert id="a-1098-28665-branch-28661" test="cda:participantRole[count(cda:id) &gt; 0]">This participantRole SHALL contain at least one [1..*] id (CONF:1098-28665).</sch:assert>
      <sch:assert id="a-1098-28667-branch-28661" test="cda:participantRole[count(cda:playingEntity)=1]">This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:1098-28667).</sch:assert>
      <sch:assert id="a-1098-28668-branch-28661" test="cda:participantRole/cda:playingEntity[@classCode='PSN']">This playingEntity SHALL contain exactly one [1..1] @classCode="PSN" (CONF:1098-28668).</sch:assert>
      <sch:assert id="a-1098-28669-branch-28661-c" test="cda:participantRole/cda:playingEntity[count(cda:name)=1]">This playingEntity SHALL contain exactly one [1..1] US Realm Patient Name (PTN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1) (CONF:1098-28669).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.123-28661-branch-28661-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.123']]/cda:participant">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.123-28661-branch-28661-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.113-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.113-errors-abstract" abstract="true">
      <sch:assert id="a-1098-29035" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-29035).</sch:assert>
      <sch:assert id="a-1098-29036" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-29036).</sch:assert>
      <sch:assert id="a-1098-29039" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-29039).</sch:assert>
      <sch:assert id="a-1098-29469" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:1098-29469).</sch:assert>
      <sch:assert id="a-1098-31123" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-31123).</sch:assert>
      <sch:assert id="a-1098-31350" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-31350).</sch:assert>
      <sch:assert id="a-1098-31351" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31351).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.113-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.113']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.113-errors-abstract" />
      <sch:assert id="a-1098-29037" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.113'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-29037) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.113" (CONF:1098-29038).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.9-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.9-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-7325" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7325).</sch:assert>
      <sch:assert id="a-1098-7326" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7326).</sch:assert>
      <sch:assert id="a-1098-7323" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7323) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.9" (CONF:1098-10523). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32504).</sch:assert>
      <sch:assert id="a-1098-7329" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-7329).</sch:assert>
      <sch:assert id="a-1098-16851" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-16851).</sch:assert>
      <sch:assert id="a-1098-7328" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7328).</sch:assert>
      <sch:assert id="a-1098-19114" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19114).</sch:assert>
      <sch:assert id="a-1098-7335" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Problem urn:oid:2.16.840.1.113883.3.88.12.3221.7.4 DYNAMIC (CONF:1098-7335).</sch:assert>
      <sch:assert id="a-1098-31124" test="cda:code[@code='ASSERTION']">This code SHALL contain exactly one [1..1] @code="ASSERTION" (CONF:1098-31124).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.9-2014-06-09-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.9-2014-06-09-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.12-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.12-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-8289" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8289).</sch:assert>
      <sch:assert id="a-1098-8290" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-8290).</sch:assert>
      <sch:assert id="a-1098-8291" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-8291) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.12" (CONF:1098-10519). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32505).</sch:assert>
      <sch:assert id="a-1098-8292" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-8292).</sch:assert>
      <sch:assert id="a-1098-8293" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-8293).</sch:assert>
      <sch:assert id="a-1098-19189-c" test="count(cda:code/cda:originalText/cda:reference[@value])=0 or starts-with(cda:code/cda:originalText/cda:reference/@value, '#')">This reference/@value *SHALL* begin with a '#' and *SHALL* point to its corresponding narrative (using the approach defined in CDA Release 2, section 4.3.5.1) (CONF:1098-19189).</sch:assert>
      <sch:assert id="a-1098-8298" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-8298).</sch:assert>
      <sch:assert id="a-1098-8299" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-8299).</sch:assert>
      <sch:assert id="a-1098-8302" test="not(cda:performer) or cda:performer[count(cda:assignedEntity)=1]">The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1098-8302).</sch:assert>
      <sch:assert id="a-1098-8303" test="not(cda:performer/cda:assignedEntity) or cda:performer/cda:assignedEntity[count(cda:id) &gt; 0]">This assignedEntity SHALL contain at least one [1..*] id (CONF:1098-8303).</sch:assert>
      <sch:assert id="a-1098-8304" test="not(cda:performer/cda:assignedEntity) or cda:performer/cda:assignedEntity[count(cda:addr) &gt; 0]">This assignedEntity SHALL contain at least one [1..*] addr (CONF:1098-8304).</sch:assert>
      <sch:assert id="a-1098-8305" test="not(cda:performer/cda:assignedEntity) or cda:performer/cda:assignedEntity[count(cda:telecom) &gt; 0]">This assignedEntity SHALL contain at least one [1..*] telecom (CONF:1098-8305).</sch:assert>
      <sch:assert id="a-1098-8310" test="not(cda:performer/cda:assignedEntity/cda:representedOrganization) or cda:performer/cda:assignedEntity/cda:representedOrganization[count(cda:telecom) &gt; 0]">The representedOrganization, if present, SHALL contain at least one [1..*] telecom (CONF:1098-8310).</sch:assert>
      <sch:assert id="a-1098-8309" test="not(cda:performer/cda:assignedEntity/cda:representedOrganization) or cda:performer/cda:assignedEntity/cda:representedOrganization[count(cda:addr) &gt; 0]">The representedOrganization, if present, SHALL contain at least one [1..*] addr (CONF:1098-8309).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.12-2014-06-09-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.12-2014-06-09-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.14-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.14-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-7652" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7652).</sch:assert>
      <sch:assert id="a-1098-7653" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7653).</sch:assert>
      <sch:assert id="a-1098-7654" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7654) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.14" (CONF:1098-10521). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32506).</sch:assert>
      <sch:assert id="a-1098-7655" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-7655).</sch:assert>
      <sch:assert id="a-1098-7656" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-7656).</sch:assert>
      <sch:assert id="a-1098-19206-c" test="count(cda:code/cda:originalText/cda:reference[@value])=0 or starts-with(cda:code/cda:originalText/cda:reference/@value, '#')">This reference/@value *SHALL* begin with a '#' and *SHALL* point to its corresponding narrative (using the approach defined in CDA Release 2, section 4.3.5.1) (CONF:1098-19206).</sch:assert>
      <sch:assert id="a-1098-7661" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7661).</sch:assert>
      <sch:assert id="a-1098-7890-c" test="not(testable)">MethodCode *SHALL NOT* conflict with the method inherent in Procedure / code (CONF:1098-7890).</sch:assert>
      <sch:assert id="a-1098-16082" test="not(cda:targetSiteCode) or cda:targetSiteCode[@code]">The targetSiteCode, if present, SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Body Site urn:oid:2.16.840.1.113883.3.88.12.3221.8.9 DYNAMIC (CONF:1098-16082).</sch:assert>
      <sch:assert id="a-1098-7704" test="not(cda:specimen) or cda:specimen[count(cda:specimenRole)=1]">The specimen, if present, SHALL contain exactly one [1..1] specimenRole (CONF:1098-7704).</sch:assert>
      <sch:assert id="a-1098-16842-c" test="not(tested)">This specimen is for representing specimens obtained from a procedure (CONF:1098-16842).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.14-2014-06-09-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.14-2014-06-09-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.14-2014-06-09-7718-branch-7718-errors-abstract" abstract="true">
      <sch:assert id="a-1098-7737-branch-7718" test="not(cda:assignedEntity/cda:representedOrganization) or cda:assignedEntity/cda:representedOrganization[count(cda:telecom)=1]">The representedOrganization, if present, SHALL contain exactly one [1..1] telecom (CONF:1098-7737).</sch:assert>
      <sch:assert id="a-1098-7736-branch-7718" test="not(cda:assignedEntity/cda:representedOrganization) or cda:assignedEntity/cda:representedOrganization[count(cda:addr)=1]">The representedOrganization, if present, SHALL contain exactly one [1..1] addr (CONF:1098-7736).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.14-2014-06-09-7718-branch-7718-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]/cda:performer[cda:assignedEntity[cda:id][cda:addr][cda:telecom]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.14-2014-06-09-7718-branch-7718-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.13-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.13-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-8282" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8282).</sch:assert>
      <sch:assert id="a-1098-8237" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-8237).</sch:assert>
      <sch:assert id="a-1098-8238" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-8238) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.13" (CONF:1098-10520). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32507).</sch:assert>
      <sch:assert id="a-1098-8239" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-8239).</sch:assert>
      <sch:assert id="a-1098-19197" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-19197).</sch:assert>
      <sch:assert id="a-1098-19201-c" test="count(cda:code/cda:originalText/cda:reference[@value])=0 or starts-with(cda:code/cda:originalText/cda:reference/@value, '#')">This reference/@value *SHALL* begin with a '#' and *SHALL* point to its corresponding narrative (using the approach defined in CDA Release 2, section 4.3.5.1) (CONF:1098-19201).</sch:assert>
      <sch:assert id="a-1098-8245" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-8245).</sch:assert>
      <sch:assert id="a-1098-16846" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:1098-16846).</sch:assert>
      <sch:assert id="a-1098-8249-c" test="not(testable)">MethodCode *SHALL NOT* conflict with the method inherent in Observation / code (CONF:1098-8249).</sch:assert>
      <sch:assert id="a-1098-8252" test="not(cda:performer) or cda:performer[count(cda:assignedEntity)=1]">The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1098-8252).</sch:assert>
      <sch:assert id="a-1098-8253" test="not(cda:performer/cda:assignedEntity) or cda:performer/cda:assignedEntity[count(cda:id) &gt; 0]">This assignedEntity SHALL contain at least one [1..*] id (CONF:1098-8253).</sch:assert>
      <sch:assert id="a-1098-8254" test="not(cda:performer/cda:assignedEntity) or cda:performer/cda:assignedEntity[count(cda:addr) &gt; 0]">This assignedEntity SHALL contain at least one [1..*] addr (CONF:1098-8254).</sch:assert>
      <sch:assert id="a-1098-8255" test="not(cda:performer/cda:assignedEntity) or cda:performer/cda:assignedEntity[count(cda:telecom) &gt; 0]">This assignedEntity SHALL contain at least one [1..*] telecom (CONF:1098-8255).</sch:assert>
      <sch:assert id="a-1098-8260" test="not(cda:performer/cda:assignedEntity/cda:representedOrganization) or cda:performer/cda:assignedEntity/cda:representedOrganization[count(cda:telecom)=1]">The representedOrganization, if present, SHALL contain exactly one [1..1] telecom (CONF:1098-8260).</sch:assert>
      <sch:assert id="a-1098-8259" test="not(cda:performer/cda:assignedEntity/cda:representedOrganization) or cda:performer/cda:assignedEntity/cda:representedOrganization[count(cda:addr)=1]">The representedOrganization, if present, SHALL contain exactly one [1..1] addr (CONF:1098-8259).</sch:assert>
      <sch:assert id="a-1098-32365" test="cda:statusCode[@code and @code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.22']/voc:code/@value]">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ProcedureAct statusCode urn:oid:2.16.840.1.113883.11.20.9.22 STATIC 2014-04-23 (CONF:1098-32365).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.13-2014-06-09-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.13-2014-06-09-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.121-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.121-errors-abstract" abstract="true">
      <sch:assert id="a-1098-30418" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-30418).</sch:assert>
      <sch:assert id="a-1098-30419" test="@moodCode='GOL'">SHALL contain exactly one [1..1] @moodCode="GOL" Goal (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-30419).</sch:assert>
      <sch:assert id="a-1098-30784" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:1098-30784).</sch:assert>
      <sch:assert id="a-1098-30995" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">SHALL contain at least one [1..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-30995).</sch:assert>
      <sch:assert id="a-1098-32332" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-32332).</sch:assert>
      <sch:assert id="a-1098-32333" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-32333).</sch:assert>
      <sch:assert id="a-1098-32755" test="not(cda:reference) or cda:reference[@typeCode='REFR']">The reference, if present, SHALL contain exactly one [1..1] @typeCode="REFR" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32755).</sch:assert>
      <sch:assert id="a-1098-32756" test="not(cda:reference) or cda:reference[count(cda:externalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.115' and @extension = '2014-06-09']])=1]">The reference, if present, SHALL contain exactly one [1..1] External Document Reference (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.115:2014-06-09) (CONF:1098-32756).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.121-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.121']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.121-errors-abstract" />
      <sch:assert id="a-1098-8583" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.121'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-8583) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.121" (CONF:1098-10512).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-errors">
    <!--Pattern is used in an implied relationship.-->
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-16303" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-16303).</sch:assert>
      <sch:assert id="a-1098-16304" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-16304).</sch:assert>
      <sch:assert id="a-1098-16307" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-16307).</sch:assert>
      <sch:assert id="a-1098-16345" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-16345).</sch:assert>
      <sch:assert id="a-1098-16346" test="cda:code[@code='ASSERTION']">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:1098-16346).</sch:assert>
      <sch:assert id="a-1098-16308" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-16308).</sch:assert>
      <sch:assert id="a-1098-26354" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-26354).</sch:assert>
      <sch:assert id="a-1098-16309" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-16309).</sch:assert>
      <sch:assert id="a-1098-16312" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:1098-16312).</sch:assert>
      <sch:assert id="a-1098-16317-c" test="cda:value[@code]">This value SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Allergy and Intolerance Type urn:oid:2.16.840.1.113883.3.88.12.3221.6.2 DYNAMIC (CONF:1098-16317).</sch:assert>
      <sch:assert id="a-1098-31536" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:1098-31536).</sch:assert>
      <sch:assert id="a-1098-32171" test="cda:code[@codeSystem='2.16.840.1.113883.5.4']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-32171).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.90']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-errors-abstract" />
      <sch:assert id="a-1098-16305" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.90'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-16305) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.90" (CONF:1098-16306). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32527).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-16318-branch-16318-errors-abstract" abstract="true">
      <sch:assert id="a-1098-16320-branch-16318" test="count(cda:participantRole)=1">SHALL contain exactly one [1..1] participantRole (CONF:1098-16320).</sch:assert>
      <sch:assert id="a-1098-16321-branch-16318" test="not(cda:participantRole) or cda:participantRole[@classCode='MANU']">This participantRole SHALL contain exactly one [1..1] @classCode="MANU" Manufactured Product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:1098-16321).</sch:assert>
      <sch:assert id="a-1098-16322-branch-16318" test="not(cda:participantRole) or cda:participantRole[count(cda:playingEntity)=1]">This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:1098-16322).</sch:assert>
      <sch:assert id="a-1098-16323-branch-16318" test="not(cda:participantRole/cda:playingEntity) or cda:participantRole/cda:playingEntity[@classCode='MMAT']">This playingEntity SHALL contain exactly one [1..1] @classCode="MMAT" Manufactured Material (CodeSystem: EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:1098-16323).</sch:assert>
      <sch:assert id="a-1098-16324-branch-16318" test="not(cda:participantRole/cda:playingEntity) or cda:participantRole/cda:playingEntity[count(cda:code)=1]">This playingEntity SHALL contain exactly one [1..1] code, which MAY be selected from ValueSet Substance-Reactant for Intolerance urn:oid:2.16.840.1.113762.1.4.1010.1 DYNAMIC (CONF:1098-16324).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-16318-branch-16318-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.90']]/cda:participant[@typeCode='CSM']">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-16318-branch-16318-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.7-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.7-2014-06-09-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-errors-abstract" />
      <sch:assert id="a-1098-7379" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7379).</sch:assert>
      <sch:assert id="a-1098-7380" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7380).</sch:assert>
      <sch:assert id="a-1098-7381" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.7'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7381) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.7" (CONF:1098-10488). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32526).</sch:assert>
      <sch:assert id="a-1098-7382" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-7382).</sch:assert>
      <sch:assert id="a-1098-15947" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-15947).</sch:assert>
      <sch:assert id="a-1098-15948" test="cda:code[@code='ASSERTION']">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:1098-15948).</sch:assert>
      <sch:assert id="a-1098-19084" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-19084).</sch:assert>
      <sch:assert id="a-1098-19085" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19085).</sch:assert>
      <sch:assert id="a-1098-7387" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-7387).</sch:assert>
      <sch:assert id="a-1098-7390" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Allergy and Intolerance Type urn:oid:2.16.840.1.113883.3.88.12.3221.6.2 DYNAMIC (CONF:1098-7390).</sch:assert>
      <sch:assert id="a-1098-7402" test="count(cda:participant[@typeCode='CSM'][count(cda:participantRole[@classCode='MANU'][count(cda:playingEntity[@classCode='MMAT'][count(cda:code)=1])=1])=1])=1">SHALL contain exactly one [1..1] participant (CONF:1098-7402) such that it SHALL contain exactly one [1..1] @typeCode="CSM" Consumable (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1098-7403). SHALL contain exactly one [1..1] participantRole (CONF:1098-7404). This participantRole SHALL contain exactly one [1..1] @classCode="MANU" Manufactured Product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:1098-7405). This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:1098-7406). This playingEntity SHALL contain exactly one [1..1] @classCode="MMAT" Manufactured Material (CodeSystem: EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:1098-7407). This playingEntity SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet Substance-Reactant for Intolerance urn:oid:2.16.840.1.113762.1.4.1010.1 DYNAMIC (CONF:1098-7419).</sch:assert>
      <sch:assert id="a-1098-31538" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:1098-31538).</sch:assert>
      <sch:assert id="a-1098-32153" test="cda:code[@codeSystem='2.16.840.1.113883.5.4']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-32153).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.7-2014-06-09-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.7']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.7-2014-06-09-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.7-2014-06-09-32910-branch-32910-errors-abstract" abstract="true">
      <sch:assert id="a-1098-32912-branch-32910" test="@inversionInd='true'">SHALL contain zero or one [0..1] @inversionInd="true" True (CONF:1098-32912).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.7-2014-06-09-32910-branch-32910-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.7']]/cda:entryRelationship[@typeCode='SUBJ'][cda:observation]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.7-2014-06-09-32910-branch-32910-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.52-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.52-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-8826" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8826).</sch:assert>
      <sch:assert id="a-1098-8827" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.18']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet MoodCodeEvnInt urn:oid:2.16.840.1.113883.11.20.9.18 STATIC 2014-09-01 (CONF:1098-8827).</sch:assert>
      <sch:assert id="a-1098-8829" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-8829).</sch:assert>
      <sch:assert id="a-1098-8833" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-8833).</sch:assert>
      <sch:assert id="a-1098-8834" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-8834).</sch:assert>
      <sch:assert id="a-1098-8847" test="count(cda:consumable)=1">SHALL contain exactly one [1..1] consumable (CONF:1098-8847).</sch:assert>
      <sch:assert id="a-1098-15546" test="cda:consumable[count(cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54' and @extension = '2014-06-09']])=1]">This consumable SHALL contain exactly one [1..1] Immunization Medication Information (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.54:2014-06-09) (CONF:1098-15546).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.52-2014-06-09-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.52']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.52-2014-06-09-errors-abstract" />
      <sch:assert id="a-1098-8828" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.52'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-8828) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.52" (CONF:1098-10498). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32528).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.39-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.39-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-8538" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8538).</sch:assert>
      <sch:assert id="a-1098-8539" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.23']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (Act/Encounter/Procedure) urn:oid:2.16.840.1.113883.11.20.9.23 STATIC 2011-09-30 (CONF:1098-8539).</sch:assert>
      <sch:assert id="a-1098-30430" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.39'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-30430) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.39" (CONF:1098-30431). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32552).</sch:assert>
      <sch:assert id="a-1098-8546" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-8546).</sch:assert>
      <sch:assert id="a-1098-30432" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-30432).</sch:assert>
      <sch:assert id="a-1098-31687" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-31687).</sch:assert>
      <sch:assert id="a-1098-32019" test="cda:statusCode[@code='active']">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-32019).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.39-2014-06-09-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.39']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.39-2014-06-09-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.40-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.40-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-8564" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8564).</sch:assert>
      <sch:assert id="a-1098-8565" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.23']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (Act/Encounter/Procedure) urn:oid:2.16.840.1.113883.11.20.9.23 STATIC 2011-09-30 (CONF:1098-8565).</sch:assert>
      <sch:assert id="a-1098-30437" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.40'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-30437) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.40" (CONF:1098-30438). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32553).</sch:assert>
      <sch:assert id="a-1098-8567" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-8567).</sch:assert>
      <sch:assert id="a-1098-30439" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-30439).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.40-2014-06-09-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.40']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.40-2014-06-09-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.41-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.41-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-8568" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8568).</sch:assert>
      <sch:assert id="a-1098-8569" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.23']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (Act/Encounter/Procedure) urn:oid:2.16.840.1.113883.11.20.9.23 STATIC 2011-09-30 (CONF:1098-8569).</sch:assert>
      <sch:assert id="a-1098-30444" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.41'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-30444) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.41" (CONF:1098-30445). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32554).</sch:assert>
      <sch:assert id="a-1098-8571" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-8571).</sch:assert>
      <sch:assert id="a-1098-30446" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-30446).</sch:assert>
      <sch:assert id="a-1098-31976" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-31976).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.41-2014-06-09-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.41']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.41-2014-06-09-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-8581" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8581).</sch:assert>
      <sch:assert id="a-1098-8582" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.25']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (Observation) urn:oid:2.16.840.1.113883.11.20.9.25 STATIC 2011-09-30 (CONF:1098-8582).</sch:assert>
      <sch:assert id="a-1098-30451" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.44'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-30451) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.44" (CONF:1098-30452). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32555).</sch:assert>
      <sch:assert id="a-1098-8584" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-8584).</sch:assert>
      <sch:assert id="a-1098-30453" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-30453).</sch:assert>
      <sch:assert id="a-1098-31030-c" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:1098-31030).</sch:assert>
      <sch:assert id="a-1098-32032" test="cda:statusCode[@code='active']">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-32032).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.44']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.43-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.43-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-8577" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8577).</sch:assert>
      <sch:assert id="a-1098-8578" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.24']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (SubstanceAdministration/Supply) urn:oid:2.16.840.1.113883.11.20.9.24 STATIC 2011-09-30 (CONF:1098-8578).</sch:assert>
      <sch:assert id="a-1098-30463" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.43'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-30463) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.43" (CONF:1098-30464). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32556).</sch:assert>
      <sch:assert id="a-1098-8580" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-8580).</sch:assert>
      <sch:assert id="a-1098-30458" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-30458).</sch:assert>
      <sch:assert id="a-1098-32047" test="cda:statusCode[@code='active']">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-32047).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.43-2014-06-09-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.43']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.43-2014-06-09-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.42-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.42-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-8572" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8572).</sch:assert>
      <sch:assert id="a-1098-8573" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.24']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (SubstanceAdministration/Supply) urn:oid:2.16.840.1.113883.11.20.9.24 STATIC 2011-09-30 (CONF:1098-8573).</sch:assert>
      <sch:assert id="a-1098-30465" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-30465) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.42" (CONF:1098-30466). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32557).</sch:assert>
      <sch:assert id="a-1098-8575" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-8575).</sch:assert>
      <sch:assert id="a-1098-30468-c" test="count(cda:effectiveTime)&gt;=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-30468).</sch:assert>
      <sch:assert id="a-1098-32082" test="count(cda:consumable)=1">SHALL contain exactly one [1..1] consumable (CONF:1098-32082).</sch:assert>
      <sch:assert id="a-1098-32083" test="cda:consumable[count(cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.23' and @extension = '2014-06-09']])=1]">This consumable SHALL contain exactly one [1..1] Medication Information (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.23:2014-06-09) (CONF:1098-32083).</sch:assert>
      <sch:assert id="a-1098-32085" test="not(cda:precondition) or cda:precondition[@typeCode='PRCN']">The precondition, if present, SHALL contain exactly one [1..1] @typeCode="PRCN" Precondition (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32085).</sch:assert>
      <sch:assert id="a-1098-32086" test="not(cda:precondition) or cda:precondition[count(cda:criterion[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.25' and @extension = '2014-06-09']])=1]">The precondition, if present, SHALL contain exactly one [1..1] Precondition for Substance Administration (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.25:2014-06-09) (CONF:1098-32086).</sch:assert>
      <sch:assert id="a-1098-32087" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-32087).</sch:assert>
      <sch:assert id="a-1098-32088" test="cda:statusCode[@code='active']">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-32088).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.42-2014-06-09-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.42-2014-06-09-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.19-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.19-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-7480" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7480).</sch:assert>
      <sch:assert id="a-1098-7481" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7481).</sch:assert>
      <sch:assert id="a-1098-7482" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.19'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7482) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.19" (CONF:1098-10502). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32570).</sch:assert>
      <sch:assert id="a-1098-7483" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-7483).</sch:assert>
      <sch:assert id="a-1098-7487" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7487).</sch:assert>
      <sch:assert id="a-1098-19105" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19105).</sch:assert>
      <sch:assert id="a-1098-31229" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which MAY be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 STATIC 2014-09-02 (CONF:1098-31229).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.19-2014-06-09-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.19']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.19-2014-06-09-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.28-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.28-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-7318" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7318).</sch:assert>
      <sch:assert id="a-1098-7319" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7319).</sch:assert>
      <sch:assert id="a-1098-7320" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-7320).</sch:assert>
      <sch:assert id="a-1098-19131" test="cda:code[@code='33999-4']">This code SHALL contain exactly one [1..1] @code="33999-4" Status (CONF:1098-19131).</sch:assert>
      <sch:assert id="a-1098-7321" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7321).</sch:assert>
      <sch:assert id="a-1098-19087" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19087).</sch:assert>
      <sch:assert id="a-1098-7322" test="count(cda:value[@xsi:type='CE'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CE", where the code SHALL be selected from ValueSet Problem Status urn:oid:2.16.840.1.113883.3.88.12.80.68 DYNAMIC (CONF:1098-7322).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.28-2014-06-09-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.28']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.28-2014-06-09-errors-abstract" />
      <sch:assert id="a-1098-7317" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.28'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7317) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.28" (CONF:1098-10490).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.8-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.8-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-7345" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7345).</sch:assert>
      <sch:assert id="a-1098-7346" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7346).</sch:assert>
      <sch:assert id="a-1098-19168" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-19168).</sch:assert>
      <sch:assert id="a-1098-19169" test="cda:code[@code='SEV']">This code SHALL contain exactly one [1..1] @code="SEV" Severity (CONF:1098-19169).</sch:assert>
      <sch:assert id="a-1098-7352" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7352).</sch:assert>
      <sch:assert id="a-1098-19115" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19115).</sch:assert>
      <sch:assert id="a-1098-7356" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Problem Severity urn:oid:2.16.840.1.113883.3.88.12.3221.6.8 DYNAMIC (CONF:1098-7356).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.8-2014-06-09-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.8']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.8-2014-06-09-errors-abstract" />
      <sch:assert id="a-1098-7347" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.8'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7347) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.8" (CONF:1098-10525). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32577).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.17-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.17-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-7427" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7427).</sch:assert>
      <sch:assert id="a-1098-7428" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7428).</sch:assert>
      <sch:assert id="a-1098-7430" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-7430).</sch:assert>
      <sch:assert id="a-1098-7432" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7432).</sch:assert>
      <sch:assert id="a-1098-7444" test="not(cda:entryRelationship) or cda:entryRelationship[@typeCode='SUBJ']">The entryRelationship, if present, SHALL contain exactly one [1..1] @typeCode="SUBJ" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1098-7444).</sch:assert>
      <sch:assert id="a-1098-7445" test="not(cda:entryRelationship) or cda:entryRelationship[@inversionInd='true']">The entryRelationship, if present, SHALL contain exactly one [1..1] @inversionInd="true" True (CONF:1098-7445).</sch:assert>
      <sch:assert id="a-1098-31391" test="not(cda:entryRelationship) or cda:entryRelationship[count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.20' and @extension = '2014-06-09']])=1]">The entryRelationship, if present, SHALL contain exactly one [1..1] Instruction (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.20:2014-06-09) (CONF:1098-31391).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.17-2014-06-09-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.17']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.17-2014-06-09-errors-abstract" />
      <sch:assert id="a-1098-7429" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.17'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7429) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.17" (CONF:1098-10507). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32578).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.23-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.23-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-7408" test="@classCode='MANU'">SHALL contain exactly one [1..1] @classCode="MANU" (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:1098-7408).</sch:assert>
      <sch:assert id="a-1098-7411" test="count(cda:manufacturedMaterial)=1">SHALL contain exactly one [1..1] manufacturedMaterial (CONF:1098-7411).</sch:assert>
      <sch:assert id="a-1098-7412" test="cda:manufacturedMaterial[count(cda:code)=1]">This manufacturedMaterial SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet Medication Clinical Drug urn:oid:2.16.840.1.113762.1.4.1010.4 DYNAMIC (CONF:1098-7412).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.23-2014-06-09-errors" context="cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.23']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.23-2014-06-09-errors-abstract" />
      <sch:assert id="a-1098-7409" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.23'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7409) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.23" (CONF:1098-10506). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32579).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.18-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.18-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-7451" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7451).</sch:assert>
      <sch:assert id="a-1098-7452" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7452).</sch:assert>
      <sch:assert id="a-1098-7454" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-7454).</sch:assert>
      <sch:assert id="a-1098-7455" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7455).</sch:assert>
      <sch:assert id="a-1098-7467" test="not(cda:performer) or cda:performer[count(cda:assignedEntity)=1]">The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1098-7467).</sch:assert>
      <sch:assert id="a-1098-10565-c" test="not(tested)">The content of addr *SHALL* be a conformant US Realm Address (AD.US.FIELDED) (2.16.840.1.113883.10.20.22.5.2) (CONF:1098-10565).</sch:assert>
      <sch:assert id="a-1098-9333-c" test="cda:product/cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.23'][@extension='2014-06-09'] or cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54.2'][@extension='2014-06-09']]">A supply act  *SHALL* contain one product/Medication Information *OR* one product/Immunization Medication Information template (CONF:1098-9333).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.18-2014-06-09-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.18-2014-06-09-errors-abstract" />
      <sch:assert id="a-1098-7453" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7453) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.18" (CONF:1098-10505). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32580).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.6-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.6-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-7357" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7357).</sch:assert>
      <sch:assert id="a-1098-7358" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7358).</sch:assert>
      <sch:assert id="a-1098-19162" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-19162).</sch:assert>
      <sch:assert id="a-1098-19163" test="cda:code[@code='33999-4' and @codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @code="33999-4" Status (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:1098-19163).</sch:assert>
      <sch:assert id="a-1098-7364" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7364).</sch:assert>
      <sch:assert id="a-1098-19113" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19113).</sch:assert>
      <sch:assert id="a-1098-7365" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Problem Status urn:oid:2.16.840.1.113883.3.88.12.80.68 DYNAMIC (CONF:1098-7365).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.6-2014-06-09-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.6']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.6-2014-06-09-errors-abstract" />
      <sch:assert id="a-1098-7359" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.6'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7359) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.6" (CONF:1098-10518).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.143-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.143-errors-abstract" abstract="true">
      <sch:assert id="a-1098-30949" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-30949).</sch:assert>
      <sch:assert id="a-1098-30950" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-30950).</sch:assert>
      <sch:assert id="a-1098-30951" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.143'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-30951) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.143" (CONF:1098-30952).</sch:assert>
      <sch:assert id="a-1098-30953" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-30953).</sch:assert>
      <sch:assert id="a-1098-30954" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-30954).</sch:assert>
      <sch:assert id="a-1098-30955" test="cda:code[@code='225773000']">This code SHALL contain exactly one [1..1] @code="225773000" Preference (CONF:1098-30955).</sch:assert>
      <sch:assert id="a-1098-30956" test="cda:code[@codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:1098-30956).</sch:assert>
      <sch:assert id="a-1098-30957" test="count(cda:value[@xsi:type='CD' and @code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.60']/voc:code/@value or @nullFlavor])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Priority Level urn:oid:2.16.840.1.113883.11.20.9.60 STATIC 2014-06-11 (CONF:1098-30957).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.143-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.143']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.143-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.20-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.20-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-7391" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7391).</sch:assert>
      <sch:assert id="a-1098-7392" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7392).</sch:assert>
      <sch:assert id="a-1098-16884" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Patient Education urn:oid:2.16.840.1.113883.11.20.9.34 DYNAMIC (CONF:1098-16884).</sch:assert>
      <sch:assert id="a-1098-7396" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7396).</sch:assert>
      <sch:assert id="a-1098-19106" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19106).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.20-2014-06-09-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.20']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.20-2014-06-09-errors-abstract" />
      <sch:assert id="a-1098-7393" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.20'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7393) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.20" (CONF:1098-10503). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32598).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.119-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.119-errors-abstract" abstract="true">
      <sch:assert id="a-1098-31471" test="count(cda:time)=1">SHALL contain exactly one [1..1] time (CONF:1098-31471).</sch:assert>
      <sch:assert id="a-1098-31472" test="count(cda:assignedAuthor)=1">SHALL contain exactly one [1..1] assignedAuthor (CONF:1098-31472).</sch:assert>
      <sch:assert id="a-1098-31473" test="cda:assignedAuthor[count(cda:id) &gt; 0]">This assignedAuthor SHALL contain at least one [1..*] id (CONF:1098-31473).</sch:assert>
      <sch:assert id="a-1098-32017" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-32017) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.119" (CONF:1098-32018).</sch:assert>
      <sch:assert id="a-1098-32628-c" test="not(tested)">If the ID isn't referencing an author described elsewhere in the document, then the author components required in US Realm Header are required here as well (CONF:1098-32628).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.119-errors" context="cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.119-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.122-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.122-errors-abstract" abstract="true">
      <sch:assert id="a-1098-31485" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-31485).</sch:assert>
      <sch:assert id="a-1098-31486" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31486).</sch:assert>
      <sch:assert id="a-1098-31487" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.122'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-31487) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.122" (CONF:1098-31488).</sch:assert>
      <sch:assert id="a-1098-31489" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-31489).</sch:assert>
      <sch:assert id="a-1098-31490" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-31490).</sch:assert>
      <sch:assert id="a-1098-31491" test="cda:code[@nullFlavor='NP']">This code SHALL contain exactly one [1..1] @nullFlavor="NP" Not Present (CodeSystem: HL7NullFlavor urn:oid:2.16.840.1.113883.5.1008) (CONF:1098-31491).</sch:assert>
      <sch:assert id="a-1098-31498" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-31498).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.122-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.122']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.122-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.118-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.118-errors-abstract" abstract="true">
      <sch:assert id="a-1098-31500" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-31500).</sch:assert>
      <sch:assert id="a-1098-31501" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31501).</sch:assert>
      <sch:assert id="a-1098-31502" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.118'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-31502) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.118" (CONF:1098-31503).</sch:assert>
      <sch:assert id="a-1098-31504" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-31504).</sch:assert>
      <sch:assert id="a-1098-31505" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31505).</sch:assert>
      <sch:assert id="a-1098-31506" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-31506).</sch:assert>
      <sch:assert id="a-1098-31507" test="cda:code[@code='416118004']">This code SHALL contain exactly one [1..1] @code="416118004" Administration (CONF:1098-31507).</sch:assert>
      <sch:assert id="a-1098-31508" test="cda:code[@codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:1098-31508).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.118-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.118']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.118-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.54-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.54-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-9002" test="@classCode='MANU'">SHALL contain exactly one [1..1] @classCode="MANU" (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:1098-9002).</sch:assert>
      <sch:assert id="a-1098-9006" test="count(cda:manufacturedMaterial)=1">SHALL contain exactly one [1..1] manufacturedMaterial (CONF:1098-9006).</sch:assert>
      <sch:assert id="a-1098-9007" test="cda:manufacturedMaterial[count(cda:code)=1]">This manufacturedMaterial SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet CVX Vaccines Administered - Vaccine Set  urn:oid:2.16.840.1.113762.1.4.1010.6 DYNAMIC (CONF:1098-9007).</sch:assert>
      <sch:assert id="a-1098-9014" test="cda:manufacturedMaterial[count(cda:lotNumberText)=1]">This manufacturedMaterial SHALL contain exactly one [1..1] lotNumberText (CONF:1098-9014).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.54-2014-06-09-errors" context="cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.54-2014-06-09-errors-abstract" />
      <sch:assert id="a-1098-9004" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-9004) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.54" (CONF:1098-10499). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32602).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.25-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.25-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-7369" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Problem urn:oid:2.16.840.1.113883.3.88.12.3221.7.4 DYNAMIC (CONF:1098-7369).</sch:assert>
      <sch:assert id="a-1098-32396" test="count(cda:code)=1">SHALL contain exactly one [1..1] code with @xsi:type="CD" (CONF:1098-32396).</sch:assert>
      <sch:assert id="a-1098-32397" test="cda:code[@code='ASSERTION']">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:1098-32397).</sch:assert>
      <sch:assert id="a-1098-32398" test="cda:code[@codeSystem='2.16.840.1.113883.5.4']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-32398).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.25-2014-06-09-errors" context="cda:criterion[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.25']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.25-2014-06-09-errors-abstract" />
      <sch:assert id="a-1098-7372" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.25'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7372) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.25" (CONF:1098-10517). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32603).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.115-2014-06-09-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.115-2014-06-09-errors-abstract" abstract="true">
      <sch:assert id="a-1098-31931" test="@classCode='DOCCLIN'">SHALL contain exactly one [1..1] @classCode="DOCCLIN" Clinical Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-31931).</sch:assert>
      <sch:assert id="a-1098-31932" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31932).</sch:assert>
      <sch:assert id="a-1098-31933" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-31933).</sch:assert>
      <sch:assert id="a-1098-32748" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.115'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-32748) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.115" (CONF:1098-32750). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32749).</sch:assert>
      <sch:assert id="a-1098-32751" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:1098-32751).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.115-2014-06-09-errors" context="cda:externalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.115']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.115-2014-06-09-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.129-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.129-errors-abstract" abstract="true">
      <sch:assert id="a-1098-31945" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" act (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-31945).</sch:assert>
      <sch:assert id="a-1098-31946" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31946).</sch:assert>
      <sch:assert id="a-1098-31947" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.129'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-31947) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.129" (CONF:1098-31948).</sch:assert>
      <sch:assert id="a-1098-31950" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-31950).</sch:assert>
      <sch:assert id="a-1098-31951" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-31951).</sch:assert>
      <sch:assert id="a-1098-31954" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-31954).</sch:assert>
      <sch:assert id="a-1098-31967" test="count(cda:entryRelationship[@typeCode='COMP'])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:1098-31967) such that it SHALL contain exactly one [1..1] @typeCode="COMP" has component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-31968).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.129-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.129']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.129-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.129-31967-branch-31967-errors-abstract" abstract="true">
      <sch:assert id="a-1098-31969-branch-31967" test="count(cda:act)=1">SHALL contain exactly one [1..1] act (CONF:1098-31969). This act SHALL contain at least one [1..*] id (CONF:1098-31972). This act SHALL contain exactly one [1..1] statusCode (CONF:1098-31974). This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31975).</sch:assert>
      <sch:assert id="a-1098-31970-branch-31967" test="cda:act[@classCode='ACT']">This act SHALL contain exactly one [1..1] @classCode="ACT" ACT (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-31970).</sch:assert>
      <sch:assert id="a-1098-31971-branch-31967" test="cda:act[@moodCode='INT']">This act SHALL contain exactly one [1..1] @moodCode="INT" intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31971).</sch:assert>
      <sch:assert id="a-1098-31973-branch-31967" test="cda:act[count(cda:code)=1]">This act SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet Payer urn:oid:2.16.840.1.114222.4.11.3591 DYNAMIC (CONF:1098-31973).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.129-31967-branch-31967-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.129']]/cda:entryRelationship[@typeCode='COMP']">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.129-31967-branch-31967-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.120-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.120-errors-abstract" abstract="true">
      <sch:assert id="a-1098-32091" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CONF:1098-32091).</sch:assert>
      <sch:assert id="a-1098-32097" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.24']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (SubstanceAdministration/Supply) urn:oid:2.16.840.1.113883.11.20.9.24 STATIC 2014-09-01 (CONF:1098-32097).</sch:assert>
      <sch:assert id="a-1098-32098" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.120'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-32098) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.120" (CONF:1098-32099).</sch:assert>
      <sch:assert id="a-1098-32100" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-32100).</sch:assert>
      <sch:assert id="a-1098-32101" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-32101).</sch:assert>
      <sch:assert id="a-1098-32102" test="cda:statusCode[@code='active']">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-32102).</sch:assert>
      <sch:assert id="a-1098-32103" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-32103).</sch:assert>
      <sch:assert id="a-1098-32131" test="count(cda:consumable)=1">SHALL contain exactly one [1..1] consumable (CONF:1098-32131).</sch:assert>
      <sch:assert id="a-1098-32132" test="cda:consumable[count(cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54' and @extension = '2014-06-09']])=1]">This consumable SHALL contain exactly one [1..1] Immunization Medication Information (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.54:2014-06-09) (CONF:1098-32132).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.120-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.120']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.120-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.85-2014-12-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.85-2014-12-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.9-2014-06-09-errors-abstract" />
      <sch:assert id="a-1140-11332" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85'][@extension='2014-12-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1140-11332) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.85" (CONF:1140-11333). SHALL contain exactly one [1..1] @extension="2014-12-01" (CONF:1140-27008).</sch:assert>
      <sch:assert id="a-1140-11370" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1140-11370).</sch:assert>
      <sch:assert id="a-1140-27306" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:1140-27306).</sch:assert>
      <sch:assert id="a-1140-27307" test="cda:value[@xsi:type='CD'][@sdtc:valueSet]">This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:1140-27307).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.85-2014-12-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.85-2014-12-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.88-2014-12-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.88-2014-12-01-errors-abstract" abstract="true">
      <sch:assert id="a-1140-11359" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.88'][@extension='2014-12-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1140-11359) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.88" (CONF:1140-11360). SHALL contain exactly one [1..1] @extension="2014-12-01" (CONF:1140-27027).</sch:assert>
      <sch:assert id="a-1140-11361" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1140-11361).</sch:assert>
      <sch:assert id="a-1140-11364" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1140-11364).</sch:assert>
      <sch:assert id="a-1140-11357" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1140-11357).</sch:assert>
      <sch:assert id="a-1140-11358" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1140-11358).</sch:assert>
      <sch:assert id="a-1140-11362" test="cda:code[@code='77301-0']">This code SHALL contain exactly one [1..1] @code="77301-0" Reason care action performed or not (CONF:1140-11362).</sch:assert>
      <sch:assert id="a-1140-11365" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1140-11365).</sch:assert>
      <sch:assert id="a-1140-11366" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1140-11366).</sch:assert>
      <sch:assert id="a-1140-11367" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:1140-11367).</sch:assert>
      <sch:assert id="a-1140-26998" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1140-26998).</sch:assert>
      <sch:assert id="a-1140-27028" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1140-27028).</sch:assert>
      <sch:assert id="a-1140-27551" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:1140-27551).</sch:assert>
      <sch:assert id="a-1140-27657" test="cda:value[@xsi:type='CD'][@sdtc:valueSet]">This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:1140-27657).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.88-2014-12-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.88']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.88-2014-12-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.91-2014-12-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.91-2014-12-01-errors-abstract" abstract="true">
      <sch:assert id="a-1140-13278" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.91'][@extension='2014-12-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1140-13278) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.91" (CONF:1140-13279). SHALL contain exactly one [1..1] @extension="2014-12-01" (CONF:1140-27335).</sch:assert>
      <sch:assert id="a-1140-13284" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1140-13284).</sch:assert>
      <sch:assert id="a-1140-13276" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1140-13276).</sch:assert>
      <sch:assert id="a-1140-13277" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1140-13277).</sch:assert>
      <sch:assert id="a-1140-13281" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1140-13281).</sch:assert>
      <sch:assert id="a-1140-13282" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1140-13282).</sch:assert>
      <sch:assert id="a-1140-13285" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1140-13285).</sch:assert>
      <sch:assert id="a-1140-27319-c" test="cda:effectiveTime[cda:width] or (cda:effectiveTime[cda:low] and cda:effectiveTime[cda:high])or (cda:effectiveTime[cda:low] and cda:effectiveTime[cda:width])or (cda:effectiveTime[cda:width] and cda:effectiveTime[cda:high])">One of the following combinations *SHALL* be present: @width, @low and @high, @low and @width or @width and @high. @width by itself shall only be used when no start or end time is known. For example, when one knows that the duration of radiation needs to be 30 minutes, but one may not yet know when the start time will be eg. in a Procedure Order (CONF:1140-27319).</sch:assert>
      <sch:assert id="a-1140-27568" test="cda:code[@code='77304-4']">This code SHALL contain exactly one [1..1] @code="77304-4" Radiation dose (CONF:1140-27568).</sch:assert>
      <sch:assert id="a-1140-27569" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1140-27569).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.91-2014-12-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.91']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.91-2014-12-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.119-2014-12-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.119-2014-12-01-errors-abstract" abstract="true">
      <sch:assert id="a-1140-28025" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.119'][@extension='2014-12-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1140-28025) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.119" (CONF:1140-28028). SHALL contain exactly one [1..1] @extension="2014-12-01" (CONF:1140-28029).</sch:assert>
      <sch:assert id="a-1140-28026" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:1140-28026).</sch:assert>
      <sch:assert id="a-1140-28027" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:1140-28027).</sch:assert>
      <sch:assert id="a-1140-28033" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1140-28033).</sch:assert>
      <sch:assert id="a-1140-28034" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1140-28034).</sch:assert>
      <sch:assert id="a-1140-28035" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1140-28035).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.119-2014-12-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.119']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.119-2014-12-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.99-2015-04-05-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.99-2015-04-05-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.43-2014-06-09-errors-abstract" />
      <sch:assert id="a-1140-13821" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.99'][@extension='2014-12-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1140-13821) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.99" (CONF:1140-13822). SHALL contain exactly one [1..1] @extension="2014-12-09" (CONF:1140-28374).</sch:assert>
      <sch:assert id="a-1140-13820" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1140-13820).</sch:assert>
      <sch:assert id="a-1140-13829" test="count(cda:effectiveTime[@xsi:type='IVL_TS'])=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1140-13829).</sch:assert>
      <sch:assert id="a-1140-28373" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" Supply (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1140-28373).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.99-2015-04-05-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.99']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.99-2015-04-05-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.126-2014-12-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.126-2014-12-01-errors-abstract" abstract="true">
      <sch:assert id="a-1140-28379" test="count(sdtc:templateId[@root='2.16.840.1.113883.10.20.24.3.126'][@extension='2014-12-01'])=1">SHALL contain exactly one [1..1] sdtc:templateId (CONF:1140-28379) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.126" (CONF:1140-28382). SHALL contain exactly one [1..1] @extension="2014-12-01" (CONF:1140-28383).</sch:assert>
      <sch:assert id="a-1140-28380" test="count(sdtc:actReference)=1">SHALL contain exactly one [1..1] sdtc:actReference (CONF:1140-28380).</sch:assert>
      <sch:assert id="a-1140-28381" test="@typeCode='FLFS'">SHALL contain exactly one [1..1] @typeCode="FLFS" Fulfills (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1140-28381).</sch:assert>
      <sch:assert id="a-1140-28384" test="sdtc:actReference[@classCode]">This sdtc:actReference SHALL contain exactly one [1..1] @classCode (CONF:1140-28384).</sch:assert>
      <sch:assert id="a-1140-28385" test="sdtc:actReference[@moodCode]">This sdtc:actReference SHALL contain exactly one [1..1] @moodCode (CONF:1140-28385).</sch:assert>
      <sch:assert id="a-1140-28386" test="sdtc:actReference[count(sdtc:id) &gt; 0]">This sdtc:actReference SHALL contain at least one [1..*] sdtc:id (CONF:1140-28386).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.126-2014-12-01-errors" context="sdtc:inFulfillmentOf1[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.126']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.126-2014-12-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.2-2015-08-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.2-2015-08-01-errors-abstract" abstract="true">
      <sch:assert id="a-1198-7133" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:1198-7133).</sch:assert>
      <sch:assert id="a-1198-7134" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1198-7134).</sch:assert>
      <sch:assert id="a-1198-7143" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:1198-7143).</sch:assert>
      <sch:assert id="a-1198-7151" test="not(cda:referenceRange) or cda:referenceRange[count(cda:observationRange)=1]">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:1198-7151).</sch:assert>
      <sch:assert id="a-1198-7130" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-7130).</sch:assert>
      <sch:assert id="a-1198-7131" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-7131).</sch:assert>
      <sch:assert id="a-1198-7137" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1198-7137).</sch:assert>
      <sch:assert id="a-1198-14849" test="cda:statusCode[@code and @code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.39']/voc:code/@value]">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Result Status urn:oid:2.16.840.1.113883.11.20.9.39 STATIC (CONF:1198-14849).</sch:assert>
      <sch:assert id="a-1198-7140" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1198-7140).</sch:assert>
      <sch:assert id="a-1198-31484-c" test="not(tested)">If Observation/value is a physical quantity (*xsi:type*=*"PQ"*), the unit of measure *SHALL* be selected from ValueSet UnitsOfMeasureCaseSensitive 2.16.840.1.113883.1.11.12839 *DYNAMIC* (CONF:1198-31484).</sch:assert>
      <sch:assert id="a-1198-32476" test="not(cda:interpretationCode) or cda:interpretationCode[@code and @code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.1.11.78']/voc:code/@value]">The interpretationCode, if present, SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Observation Interpretation (HL7) urn:oid:2.16.840.1.113883.1.11.78 STATIC (CONF:1198-32476).</sch:assert>
      <sch:assert id="a-1198-7152-c" test="not(cda:referenceRange/cda:observationRange/cda:code)">This observationRange SHALL NOT contain [0..0] code (CONF:1198-7152).</sch:assert>
      <sch:assert id="a-1198-32175" test="not(cda:referenceRange/cda:observationRange) or cda:referenceRange/cda:observationRange[count(cda:value)=1]">This observationRange SHALL contain exactly one [1..1] value (CONF:1198-32175).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.2-2015-08-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.2']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.2-2015-08-01-errors-abstract" />
      <sch:assert id="a-1198-7136" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.2'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-7136) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.2" (CONF:1198-9138). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32575).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.147-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.147-errors-abstract" abstract="true">
      <sch:assert id="a-1198-32754" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:1198-32754).</sch:assert>
      <sch:assert id="a-1198-32755" test="cda:text[count(cda:reference)=1]">This text SHALL contain exactly one [1..1] reference (CONF:1198-32755).</sch:assert>
      <sch:assert id="a-1198-32770" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-32770).</sch:assert>
      <sch:assert id="a-1198-32771" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.18']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet MoodCodeEvnInt urn:oid:2.16.840.1.113883.11.20.9.18 STATIC 2011-04-03 (CONF:1198-32771).</sch:assert>
      <sch:assert id="a-1198-32774-c" test="count(cda:text/cda:reference[@value])=0 or starts-with(cda:text/cda:reference/@value, '#')">This reference/@value SHALL begin with a '#' and SHALL point to its corresponding narrative (using the approach defined in CDA Release 2, section 4.3.5.1) (CONF:1198-32774).</sch:assert>
      <sch:assert id="a-1198-32775" test="count(cda:code[@codeSystem='2.16.840.1.113883.6.1' or @nullFlavor])=1">SHALL contain exactly one [1..1] code (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32775).</sch:assert>
      <sch:assert id="a-1198-32776" test="count(cda:consumable)=1">SHALL contain exactly one [1..1] consumable (CONF:1198-32776).</sch:assert>
      <sch:assert id="a-1198-32777" test="cda:consumable[count(cda:manufacturedProduct)=1]">This consumable SHALL contain exactly one [1..1] manufacturedProduct (CONF:1198-32777).</sch:assert>
      <sch:assert id="a-1198-32778" test="cda:consumable/cda:manufacturedProduct[count(cda:manufacturedLabeledDrug)=1]">This manufacturedProduct SHALL contain exactly one [1..1] manufacturedLabeledDrug (CONF:1198-32778).</sch:assert>
      <sch:assert id="a-1198-32779" test="cda:consumable/cda:manufacturedProduct/cda:manufacturedLabeledDrug[@nullFlavor='NA']">This manufacturedLabeledDrug SHALL contain exactly one [1..1] @nullFlavor="NA" Not Applicable (CONF:1198-32779).</sch:assert>
      <sch:assert id="a-1198-32780" test="cda:code[@code='76662-6']">This code SHALL contain exactly one [1..1] @code="76662-6" Instructions Medication (CONF:1198-32780).</sch:assert>
      <sch:assert id="a-1198-32781" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:1198-32781).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.147-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.147-errors-abstract" />
      <sch:assert id="a-1198-32753" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-32753) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.147" (CONF:1198-32772).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.147-CLOSEDTEMPLATE">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.147-errors-CL-abstract" abstract="true">
      <sch:assert id="a-1198-5432-CL" test="count(.//cda:templateId[@root != '2.16.840.1.113883.10.20.22.4.147'])=0">'urn:oid:2.16.840.1.113883.10.20.22.4.147' is a closed template, only defined templates are allowed.</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.147-errors-CL" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.147-errors-CL-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.46-2015-08-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.46-2015-08-01-errors-abstract" abstract="true">
      <sch:assert id="a-1198-8590" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1198-8590).</sch:assert>
      <sch:assert id="a-1198-19098" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19098).</sch:assert>
      <sch:assert id="a-1198-8586" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-8586).</sch:assert>
      <sch:assert id="a-1198-8587" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-8587).</sch:assert>
      <sch:assert id="a-1198-32427" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 STATIC 2012-06-01 (CONF:1198-32427).</sch:assert>
      <sch:assert id="a-1198-8591" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Problem urn:oid:2.16.840.1.113883.3.88.12.3221.7.4 DYNAMIC (CONF:1198-8591).</sch:assert>
      <sch:assert id="a-1198-8592" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1198-8592).</sch:assert>
      <sch:assert id="a-1198-32847" test="not(tested_here)">This code SHALL contain at least one [1..*] translation, which SHOULD be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 STATIC 2014-09-02 (CONF:1198-32847).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.46-2015-08-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.46-2015-08-01-errors-abstract" />
      <sch:assert id="a-1198-8599" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-8599) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.46" (CONF:1198-10496). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32605).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.4-2015-08-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.4-2015-08-01-errors-abstract" abstract="true">
      <sch:assert id="a-1198-14926" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-14926) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.4" (CONF:1198-14927). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32508).</sch:assert>
      <sch:assert id="a-1198-9049" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1198-9049).</sch:assert>
      <sch:assert id="a-1198-9050" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1198-9050).</sch:assert>
      <sch:assert id="a-1198-9058-c" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHOULD be selected from ValueSet Problem urn:oid:2.16.840.1.113883.3.88.12.3221.7.4 DYNAMIC (CONF:1198-9058).</sch:assert>
      <sch:assert id="a-1198-9041" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-9041).</sch:assert>
      <sch:assert id="a-1198-9042" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-9042).</sch:assert>
      <sch:assert id="a-1198-9043" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1198-9043).</sch:assert>
      <sch:assert id="a-1198-9045" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 STATIC 2012-06-01 (CONF:1198-9045).</sch:assert>
      <sch:assert id="a-1198-19112" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19112).</sch:assert>
      <sch:assert id="a-1198-15603" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-15603).</sch:assert>
      <sch:assert id="a-1198-32848" test="not(tested_here)">This code SHALL contain at least one [1..*] translation, which SHOULD be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 2014-09-02 (CONF:1198-32848).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.4-2015-08-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.4-2015-08-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.79-2015-08-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.79-2015-08-01-errors-abstract" abstract="true">
      <sch:assert id="a-1198-14871" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.79'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-14871) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.79" (CONF:1198-14872). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32541).</sch:assert>
      <sch:assert id="a-1198-14853" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1198-14853).</sch:assert>
      <sch:assert id="a-1198-14854" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1198-14854).</sch:assert>
      <sch:assert id="a-1198-14855" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1198-14855).</sch:assert>
      <sch:assert id="a-1198-14857" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:1198-14857).</sch:assert>
      <sch:assert id="a-1198-14851" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-14851).</sch:assert>
      <sch:assert id="a-1198-14852" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-14852).</sch:assert>
      <sch:assert id="a-1198-14873" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1198-14873).</sch:assert>
      <sch:assert id="a-1198-19135" test="cda:code[@code='ASSERTION']">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:1198-19135).</sch:assert>
      <sch:assert id="a-1198-19095" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19095).</sch:assert>
      <sch:assert id="a-1198-14874" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-14874).</sch:assert>
      <sch:assert id="a-1198-15142" test="cda:value[@xsi:type='CD'][@code='419099009']">This value SHALL contain exactly one [1..1] @code="419099009" Dead (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96 STATIC) (CONF:1198-15142).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.79-2015-08-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.79']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.79-2015-08-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.80-2015-08-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.80-2015-08-01-errors-abstract" abstract="true">
      <sch:assert id="a-1198-14892" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4' and @extension = '2015-08-01']])=1]) &gt; 0">SHALL contain at least one [1..*] entryRelationship (CONF:1198-14892) such that it SHALL contain exactly one [1..1] Problem Observation (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:1198-14898). SHALL contain exactly one [1..1] @typeCode="SUBJ" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-14893).</sch:assert>
      <sch:assert id="a-1198-19182" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1198-19182).</sch:assert>
      <sch:assert id="a-1198-14889" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-14889).</sch:assert>
      <sch:assert id="a-1198-14890" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-14890).</sch:assert>
      <sch:assert id="a-1198-19183" test="cda:code[@code='29308-4']">This code SHALL contain exactly one [1..1] @code="29308-4" Diagnosis (CONF:1198-19183).</sch:assert>
      <sch:assert id="a-1198-32160" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32160).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.80-2015-08-01-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.80']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.80-2015-08-01-errors-abstract" />
      <sch:assert id="a-1198-14895" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.80'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-14895) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.80" (CONF:1198-14896). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32542).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.45-2015-08-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.45-2015-08-01-errors-abstract" abstract="true">
      <sch:assert id="a-1198-8602" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1198-8602).</sch:assert>
      <sch:assert id="a-1198-8604" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.45'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-8604) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.45" (CONF:1198-10497). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32606).</sch:assert>
      <sch:assert id="a-1198-8609" test="count(cda:subject)=1">SHALL contain exactly one [1..1] subject (CONF:1198-8609).</sch:assert>
      <sch:assert id="a-1198-15244" test="cda:subject[count(cda:relatedSubject)=1]">This subject SHALL contain exactly one [1..1] relatedSubject (CONF:1198-15244).</sch:assert>
      <sch:assert id="a-1198-15246" test="cda:subject/cda:relatedSubject[count(cda:code)=1]">This relatedSubject SHALL contain exactly one [1..1] code (CONF:1198-15246).</sch:assert>
      <sch:assert id="a-1198-15974" test="not(cda:subject/cda:relatedSubject/cda:subject) or cda:subject/cda:relatedSubject/cda:subject[count(cda:administrativeGenderCode)=1]">The subject, if present, SHALL contain exactly one [1..1] administrativeGenderCode (CONF:1198-15974).</sch:assert>
      <sch:assert id="a-1198-19099" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19099).</sch:assert>
      <sch:assert id="a-1198-15247" test="cda:subject/cda:relatedSubject/cda:code[@code]">This code SHALL contain exactly one [1..1] @code, which SHOULD be selected from ValueSet Family Member Value Set urn:oid:2.16.840.1.113883.1.11.19579 DYNAMIC (CONF:1198-15247).</sch:assert>
      <sch:assert id="a-1198-15975" test="not(cda:subject/cda:relatedSubject/cda:subject/cda:administrativeGenderCode) or cda:subject/cda:relatedSubject/cda:subject/cda:administrativeGenderCode[@code]">This administrativeGenderCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Administrative Gender (HL7 V3) urn:oid:2.16.840.1.113883.1.11.1 DYNAMIC (CONF:1198-15975).</sch:assert>
      <sch:assert id="a-1198-15245" test="cda:subject/cda:relatedSubject[@classCode='PRS']">This relatedSubject SHALL contain exactly one [1..1] @classCode="PRS" Person (CodeSystem: EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:1198-15245).</sch:assert>
      <sch:assert id="a-1198-8600" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" Cluster (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-8600).</sch:assert>
      <sch:assert id="a-1198-8601" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-8601).</sch:assert>
      <sch:assert id="a-1198-32485" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1198-32485).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.45-2015-08-01-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.45']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.45-2015-08-01-errors-abstract" />
      <sch:assert id="a-1198-32428" test="count(cda:component) &gt; 0">SHALL contain at least one [1..*] component (CONF:1198-32428).</sch:assert>
      <sch:assert id="a-1198-32429" test="cda:component[count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46' and @extension = '2015-08-01']])=1]">Such components SHALL contain exactly one [1..1] Family History Observation (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.46:2015-08-01) (CONF:1198-32429).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.3-2015-08-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.3-2015-08-01-errors-abstract" abstract="true">
      <sch:assert id="a-1198-9034" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4' and @extension = '2015-08-01']])=1]) &gt; 0">SHALL contain at least one [1..*] entryRelationship (CONF:1198-9034) such that it SHALL contain exactly one [1..1] Problem Observation (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:1198-15980). SHALL contain exactly one [1..1] @typeCode="SUBJ" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-9035).</sch:assert>
      <sch:assert id="a-1198-9027" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1198-9027).</sch:assert>
      <sch:assert id="a-1198-9029" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1198-9029).</sch:assert>
      <sch:assert id="a-1198-9030" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1198-9030).</sch:assert>
      <sch:assert id="a-1198-9024" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-9024).</sch:assert>
      <sch:assert id="a-1198-9025" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-9025).</sch:assert>
      <sch:assert id="a-1198-9026" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1198-9026).</sch:assert>
      <sch:assert id="a-1198-19184" test="cda:code[@code='CONC']">This code SHALL contain exactly one [1..1] @code="CONC" Concern (CONF:1198-19184).</sch:assert>
      <sch:assert id="a-1198-9032" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-9032).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.3-2015-08-01-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.3']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.3-2015-08-01-errors-abstract" />
      <sch:assert id="a-1198-16772" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.3'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-16772) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.3" (CONF:1198-16773). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32509).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.1.1-2015-08-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.1.1-2015-08-01-errors-abstract" abstract="true">
      <sch:assert id="a-1198-5361" test="count(cda:typeId)=1">SHALL contain exactly one [1..1] typeId (CONF:1198-5361).</sch:assert>
      <sch:assert id="a-1198-5363" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:1198-5363).</sch:assert>
      <sch:assert id="a-1198-5253" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1198-5253).</sch:assert>
      <sch:assert id="a-1198-5266" test="count(cda:recordTarget) &gt; 0">SHALL contain at least one [1..*] recordTarget (CONF:1198-5266).</sch:assert>
      <sch:assert id="a-1198-5267" test="cda:recordTarget[count(cda:patientRole)=1]">Such recordTargets SHALL contain exactly one [1..1] patientRole (CONF:1198-5267).</sch:assert>
      <sch:assert id="a-1198-5280" test="cda:recordTarget/cda:patientRole[count(cda:telecom) &gt; 0]">This patientRole SHALL contain at least one [1..*] telecom (CONF:1198-5280).</sch:assert>
      <sch:assert id="a-1198-5283" test="cda:recordTarget/cda:patientRole[count(cda:patient)=1]">This patientRole SHALL contain exactly one [1..1] patient (CONF:1198-5283).</sch:assert>
      <sch:assert id="a-1198-5298" test="cda:recordTarget/cda:patientRole/cda:patient[count(cda:birthTime)=1]">This patient SHALL contain exactly one [1..1] birthTime (CONF:1198-5298).</sch:assert>
      <sch:assert id="a-1198-5385" test="not(cda:recordTarget/cda:patientRole/cda:patient/cda:guardian) or cda:recordTarget/cda:patientRole/cda:patient/cda:guardian[count(cda:guardianPerson)=1]">The guardian, if present, SHALL contain exactly one [1..1] guardianPerson (CONF:1198-5385).</sch:assert>
      <sch:assert id="a-1198-5396" test="not(cda:recordTarget/cda:patientRole/cda:patient/cda:birthplace) or cda:recordTarget/cda:patientRole/cda:patient/cda:birthplace[count(cda:place)=1]">The birthplace, if present, SHALL contain exactly one [1..1] place (CONF:1198-5396).</sch:assert>
      <sch:assert id="a-1198-5397" test="not(cda:recordTarget/cda:patientRole/cda:patient/cda:birthplace/cda:place) or cda:recordTarget/cda:patientRole/cda:patient/cda:birthplace/cda:place[count(cda:addr)=1]">This place SHALL contain exactly one [1..1] addr (CONF:1198-5397).</sch:assert>
      <sch:assert id="a-1198-5417" test="not(cda:recordTarget/cda:patientRole/cda:providerOrganization) or cda:recordTarget/cda:patientRole/cda:providerOrganization[count(cda:id) &gt; 0]">The providerOrganization, if present, SHALL contain at least one [1..*] id (CONF:1198-5417).</sch:assert>
      <sch:assert id="a-1198-5420" test="not(cda:recordTarget/cda:patientRole/cda:providerOrganization) or cda:recordTarget/cda:patientRole/cda:providerOrganization[count(cda:telecom) &gt; 0]">The providerOrganization, if present, SHALL contain at least one [1..*] telecom (CONF:1198-5420).</sch:assert>
      <sch:assert id="a-1198-5444" test="count(cda:author) &gt; 0">SHALL contain at least one [1..*] author (CONF:1198-5444).</sch:assert>
      <sch:assert id="a-1198-5448" test="cda:author[count(cda:assignedAuthor)=1]">Such authors SHALL contain exactly one [1..1] assignedAuthor (CONF:1198-5448).</sch:assert>
      <sch:assert id="a-1198-5428" test="cda:author/cda:assignedAuthor[count(cda:telecom) &gt; 0]">This assignedAuthor SHALL contain at least one [1..*] telecom (CONF:1198-5428).</sch:assert>
      <sch:assert id="a-1198-5442" test="not(cda:dataEnterer) or cda:dataEnterer[count(cda:assignedEntity)=1]">The dataEnterer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-5442).</sch:assert>
      <sch:assert id="a-1198-5443" test="not(cda:dataEnterer/cda:assignedEntity) or cda:dataEnterer/cda:assignedEntity[count(cda:id) &gt; 0]">This assignedEntity SHALL contain at least one [1..*] id (CONF:1198-5443).</sch:assert>
      <sch:assert id="a-1198-5466" test="not(cda:dataEnterer/cda:assignedEntity) or cda:dataEnterer/cda:assignedEntity[count(cda:telecom) &gt; 0]">This assignedEntity SHALL contain at least one [1..*] telecom (CONF:1198-5466).</sch:assert>
      <sch:assert id="a-1198-5469" test="not(cda:dataEnterer/cda:assignedEntity) or cda:dataEnterer/cda:assignedEntity[count(cda:assignedPerson)=1]">This assignedEntity SHALL contain exactly one [1..1] assignedPerson (CONF:1198-5469).</sch:assert>
      <sch:assert id="a-1198-5519" test="count(cda:custodian)=1">SHALL contain exactly one [1..1] custodian (CONF:1198-5519).</sch:assert>
      <sch:assert id="a-1198-5520" test="cda:custodian[count(cda:assignedCustodian)=1]">This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:1198-5520).</sch:assert>
      <sch:assert id="a-1198-5521" test="cda:custodian/cda:assignedCustodian[count(cda:representedCustodianOrganization)=1]">This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:1198-5521).</sch:assert>
      <sch:assert id="a-1198-5522" test="cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization[count(cda:id) &gt; 0]">This representedCustodianOrganization SHALL contain at least one [1..*] id (CONF:1198-5522).</sch:assert>
      <sch:assert id="a-1198-5525" test="cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization[count(cda:telecom)=1]">This representedCustodianOrganization SHALL contain exactly one [1..1] telecom (CONF:1198-5525).</sch:assert>
      <sch:assert id="a-1198-5566" test="not(cda:informationRecipient) or cda:informationRecipient[count(cda:intendedRecipient)=1]">The informationRecipient, if present, SHALL contain exactly one [1..1] intendedRecipient (CONF:1198-5566).</sch:assert>
      <sch:assert id="a-1198-5583" test="not(cda:legalAuthenticator) or cda:legalAuthenticator[count(cda:signatureCode)=1]">The legalAuthenticator, if present, SHALL contain exactly one [1..1] signatureCode (CONF:1198-5583).</sch:assert>
      <sch:assert id="a-1198-5585" test="not(cda:legalAuthenticator) or cda:legalAuthenticator[count(cda:assignedEntity)=1]">The legalAuthenticator, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-5585).</sch:assert>
      <sch:assert id="a-1198-5586" test="not(cda:legalAuthenticator/cda:assignedEntity) or cda:legalAuthenticator/cda:assignedEntity[count(cda:id) &gt; 0]">This assignedEntity SHALL contain at least one [1..*] id (CONF:1198-5586).</sch:assert>
      <sch:assert id="a-1198-5595" test="not(cda:legalAuthenticator/cda:assignedEntity) or cda:legalAuthenticator/cda:assignedEntity[count(cda:telecom) &gt; 0]">This assignedEntity SHALL contain at least one [1..*] telecom (CONF:1198-5595).</sch:assert>
      <sch:assert id="a-1198-5597" test="not(cda:legalAuthenticator/cda:assignedEntity) or cda:legalAuthenticator/cda:assignedEntity[count(cda:assignedPerson)=1]">This assignedEntity SHALL contain exactly one [1..1] assignedPerson (CONF:1198-5597).</sch:assert>
      <sch:assert id="a-1198-9953" test="not(cda:inFulfillmentOf) or cda:inFulfillmentOf[count(cda:order)=1]">The inFulfillmentOf, if present, SHALL contain exactly one [1..1] order (CONF:1198-9953).</sch:assert>
      <sch:assert id="a-1198-14836" test="not(cda:documentationOf) or cda:documentationOf[count(cda:serviceEvent)=1]">The documentationOf, if present, SHALL contain exactly one [1..1] serviceEvent (CONF:1198-14836).</sch:assert>
      <sch:assert id="a-1198-14837" test="not(cda:documentationOf/cda:serviceEvent) or cda:documentationOf/cda:serviceEvent[count(cda:effectiveTime)=1]">This serviceEvent SHALL contain exactly one [1..1] effectiveTime (CONF:1198-14837).</sch:assert>
      <sch:assert id="a-1198-14841" test="not(cda:documentationOf/cda:serviceEvent/cda:performer) or cda:documentationOf/cda:serviceEvent/cda:performer[count(cda:assignedEntity)=1]">The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-14841).</sch:assert>
      <sch:assert id="a-1198-14846" test="not(cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity) or cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity[count(cda:id) &gt; 0]">This assignedEntity SHALL contain at least one [1..*] id (CONF:1198-14846).</sch:assert>
      <sch:assert id="a-1198-9956" test="not(cda:componentOf) or cda:componentOf[count(cda:encompassingEncounter)=1]">The componentOf, if present, SHALL contain exactly one [1..1] encompassingEncounter (CONF:1198-9956).</sch:assert>
      <sch:assert id="a-1198-5256-c" test="not(existence_schema_tested)">SHALL contain exactly one [1..1] US Realm Date and Time (DTM.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.4) (CONF:1198-5256).</sch:assert>
      <sch:assert id="a-1198-16791" test="count(cda:realmCode[@code='US'])=1">SHALL contain exactly one [1..1] realmCode="US" (CONF:1198-16791).</sch:assert>
      <sch:assert id="a-1198-5250" test="cda:typeId[@root='2.16.840.1.113883.1.3']">This typeId SHALL contain exactly one [1..1] @root="2.16.840.1.113883.1.3" (CONF:1198-5250).</sch:assert>
      <sch:assert id="a-1198-5251" test="cda:typeId[@extension='POCD_HD000040']">This typeId SHALL contain exactly one [1..1] @extension="POCD_HD000040" (CONF:1198-5251).</sch:assert>
      <sch:assert id="a-1198-9992-c" test=".">This code *SHALL* specify the particular kind of document (e.g., History and Physical, Discharge Summary, Progress Note) (CONF:1198-9992).</sch:assert>
      <sch:assert id="a-1198-5254" test="count(cda:title)=1">SHALL contain exactly one [1..1] title (CONF:1198-5254).</sch:assert>
      <sch:assert id="a-1198-5259" test="count(cda:confidentialityCode)=1">SHALL contain exactly one [1..1] confidentialityCode, which SHOULD be selected from ValueSet HL7 BasicConfidentialityKind urn:oid:2.16.840.1.113883.1.11.16926 STATIC (CONF:1198-5259).</sch:assert>
      <sch:assert id="a-1198-5372" test="count(cda:languageCode)=1">SHALL contain exactly one [1..1] languageCode, which SHALL be selected from ValueSet Language urn:oid:2.16.840.1.113883.1.11.11526 DYNAMIC (CONF:1198-5372).</sch:assert>
      <sch:assert id="a-1198-5268" test="cda:recordTarget/cda:patientRole[count(cda:id) &gt; 0]">This patientRole SHALL contain at least one [1..*] id (CONF:1198-5268).</sch:assert>
      <sch:assert id="a-1198-5271-c" test="cda:recordTarget/cda:patientRole[count(cda:addr) &gt; 0]">This patientRole SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5271).</sch:assert>
      <sch:assert id="a-1198-5284-c" test="count(cda:recordTarget/cda:patientRole/cda:patient) &lt;= count(cda:recordTarget/cda:patientRole/cda:patient/cda:name)">This patient SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-5284).</sch:assert>
      <sch:assert id="a-1198-6394" test="cda:recordTarget/cda:patientRole/cda:patient[count(cda:administrativeGenderCode)=1]">This patient SHALL contain exactly one [1..1] administrativeGenderCode, which SHALL be selected from ValueSet Administrative Gender (HL7 V3) urn:oid:2.16.840.1.113883.1.11.1 DYNAMIC (CONF:1198-6394).</sch:assert>
      <sch:assert id="a-1198-5299-c" test="string-length(cda:recordTarget/cda:patientRole/cda:patient/cda:birthTime/@value) &gt;= 4">*SHALL* be precise to year (CONF:1198-5299).</sch:assert>
      <sch:assert id="a-1198-5322" test="cda:recordTarget/cda:patientRole/cda:patient[count(cda:raceCode)=1]">This patient SHALL contain exactly one [1..1] raceCode, which SHALL be selected from ValueSet Race Category Excluding Nulls urn:oid:2.16.840.1.113883.3.2074.1.1.3 DYNAMIC (CONF:1198-5322).</sch:assert>
      <sch:assert id="a-1198-5323" test="cda:recordTarget/cda:patientRole/cda:patient[count(cda:ethnicGroupCode)=1]">This patient SHALL contain exactly one [1..1] ethnicGroupCode, which SHALL be selected from ValueSet Ethnicity urn:oid:2.16.840.1.114222.4.11.837 DYNAMIC (CONF:1198-5323).</sch:assert>
      <sch:assert id="a-1198-5386-c" test="not(tested_here)">This guardianPerson SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-5386).</sch:assert>
      <sch:assert id="a-1198-5407" test="not(cda:recordTarget/cda:patientRole/cda:patient/cda:languageCommunication) or cda:recordTarget/cda:patientRole/cda:patient/cda:languageCommunication[count(cda:languageCode)=1]">The languageCommunication, if present, SHALL contain exactly one [1..1] languageCode, which SHALL be selected from ValueSet Language urn:oid:2.16.840.1.113883.1.11.11526 DYNAMIC (CONF:1198-5407).</sch:assert>
      <sch:assert id="a-1198-31347-c" test="not(cda:recordTarget/cda:patientRole/cda:patient/sdtc:raceCode) or cda:recordTarget/cda:patientRole/cda:patient/cda:raceCode">If sdtc:raceCode is present, then the patient *SHALL* contain [[]1..1[]] raceCode (CONF:1198-31347).</sch:assert>
      <sch:assert id="a-1198-5419" test="not(cda:recordTarget/cda:patientRole/cda:providerOrganization) or cda:recordTarget/cda:patientRole/cda:providerOrganization[count(cda:name) &gt; 0]">The providerOrganization, if present, SHALL contain at least one [1..*] name (CONF:1198-5419).</sch:assert>
      <sch:assert id="a-1198-5422-c" test="not(cda:recordTarget/cda:patientRole/cda:providerOrganization) or cda:recordTarget/cda:patientRole/cda:providerOrganization[count(cda:addr) &gt; 0]">The providerOrganization, if present, SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5422).</sch:assert>
      <sch:assert id="a-1198-5445-c" test="not(existence_schema_tested)">Such authors SHALL contain exactly one [1..1] US Realm Date and Time (DTM.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.4) (CONF:1198-5445).</sch:assert>
      <sch:assert id="a-1198-5449" test="cda:author/cda:assignedAuthor[count(cda:id) &gt; 0]">This assignedAuthor SHALL contain at least one [1..*] id (CONF:1198-5449).</sch:assert>
      <sch:assert id="a-1198-16788" test="not(cda:author/cda:assignedAuthor/cda:code) or cda:author/cda:assignedAuthor/cda:code[@code]">The code, if present, SHALL contain exactly one [1..1] @code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy (HIPAA) urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1198-16788).</sch:assert>
      <sch:assert id="a-1198-5452-c" test="count(cda:author/cda:assignedAuthor) &lt;= count(cda:author/cda:assignedAuthor/cda:addr)">This assignedAuthor SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5452).</sch:assert>
      <sch:assert id="a-1198-16789-c" test="not(tested_here)">The assignedPerson, if present, SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-16789).</sch:assert>
      <sch:assert id="a-1198-16784" test="not(cda:author/cda:assignedAuthor/cda:assignedAuthoringDevice) or cda:author/cda:assignedAuthor/cda:assignedAuthoringDevice[count(cda:manufacturerModelName)=1]">The assignedAuthoringDevice, if present, SHALL contain exactly one [1..1] manufacturerModelName (CONF:1198-16784).</sch:assert>
      <sch:assert id="a-1198-16785" test="not(cda:author/cda:assignedAuthor/cda:assignedAuthoringDevice) or cda:author/cda:assignedAuthor/cda:assignedAuthoringDevice[count(cda:softwareName)=1]">The assignedAuthoringDevice, if present, SHALL contain exactly one [1..1] softwareName (CONF:1198-16785).</sch:assert>
      <sch:assert id="a-1198-16790-c" test="cda:author/cda:assignedAuthor[count(cda:assignedPerson |cda:assignedAuthoringDevice)=1] and not(cda:author/cda:assignedAuthor[count(cda:assignedPerson |cda:assignedAuthoringDevice)!=1] )">There *SHALL* be exactly one assignedAuthor/assignedPerson or exactly one assignedAuthor/assignedAuthoringDevice (CONF:1198-16790).</sch:assert>
      <sch:assert id="a-1198-5460-c" test="count(cda:dataEnterer/cda:assignedEntity) &lt;= count(cda:dataEnterer/cda:assignedEntity/cda:addr)">This assignedEntity SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5460).</sch:assert>
      <sch:assert id="a-1198-5470-c" test="count(cda:dataEnterer/cda:assignedEntity/cda:assignedPerson) &lt;= count(cda:dataEnterer/cda:assignedEntity/cda:assignedPerson/cda:name)">This assignedPerson SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-5470).</sch:assert>
      <sch:assert id="a-1198-5524" test="cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization[count(cda:name)=1]">This representedCustodianOrganization SHALL contain exactly one [1..1] name (CONF:1198-5524).</sch:assert>
      <sch:assert id="a-1198-5559-c" test="cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization[count(cda:addr)=1]">This representedCustodianOrganization SHALL contain exactly one [1..1] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5559).</sch:assert>
      <sch:assert id="a-1198-5568-c" test="count(cda:informationRecipient/cda:intendedRecipient/cda:informationRecipient) &lt;= count(cda:informationRecipient/cda:intendedRecipient/cda:informationRecipient/cda:name)">The informationRecipient, if present, SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-5568).</sch:assert>
      <sch:assert id="a-1198-5578" test="not(cda:informationRecipient/cda:intendedRecipient/cda:receivedOrganization) or cda:informationRecipient/cda:intendedRecipient/cda:receivedOrganization[count(cda:name)=1]">The receivedOrganization, if present, SHALL contain exactly one [1..1] name (CONF:1198-5578).</sch:assert>
      <sch:assert id="a-1198-5580-c" test="not(existence_schema_tested)">The legalAuthenticator, if present, SHALL contain exactly one [1..1] US Realm Date and Time (DTM.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.4) (CONF:1198-5580).</sch:assert>
      <sch:assert id="a-1198-5584" test="not(cda:legalAuthenticator/cda:signatureCode) or cda:legalAuthenticator/cda:signatureCode[@code='S']">This signatureCode SHALL contain exactly one [1..1] @code="S" (CodeSystem: Participationsignature urn:oid:2.16.840.1.113883.5.89 STATIC) (CONF:1198-5584).</sch:assert>
      <sch:assert id="a-1198-5589-c" test="not(cda:legalAuthenticator) or cda:legalAuthenticator/cda:assignedEntity[count(cda:addr) &gt; 0]">This assignedEntity SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5589).</sch:assert>
      <sch:assert id="a-1198-5598-c" test="not(tested_here)">This assignedPerson SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-5598).</sch:assert>
      <sch:assert id="a-1198-10006-c" test="count(cda:participant) = count( cda:participant/cda:associatedEntity[cda:associatedPerson | cda:scopingOrganization])">*SHALL* contain associatedEntity/associatedPerson *AND/OR* associatedEntity/scopingOrganization (CONF:1198-10006).</sch:assert>
      <sch:assert id="a-1198-9954" test="not(cda:inFulfillmentOf/cda:order) or cda:inFulfillmentOf/cda:order[count(cda:id) &gt; 0]">This order SHALL contain at least one [1..*] id (CONF:1198-9954).</sch:assert>
      <sch:assert id="a-1198-14838" test="not(cda:documentationOf/cda:serviceEvent/cda:effectiveTime) or cda:documentationOf/cda:serviceEvent/cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-14838).</sch:assert>
      <sch:assert id="a-1198-14840" test="not(cda:documentationOf/cda:serviceEvent/cda:performer) or cda:documentationOf/cda:serviceEvent/cda:performer[@typeCode and @typeCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.1.11.19601']/voc:code/@value]">The performer, if present, SHALL contain exactly one [1..1] @typeCode, which SHALL be selected from ValueSet x_ServiceEventPerformer urn:oid:2.16.840.1.113883.1.11.19601 STATIC (CONF:1198-14840).</sch:assert>
      <sch:assert id="a-1198-9959" test="not(cda:componentOf/cda:encompassingEncounter) or cda:componentOf/cda:encompassingEncounter[count(cda:id) &gt; 0]">This encompassingEncounter SHALL contain at least one [1..*] id (CONF:1198-9959).</sch:assert>
      <sch:assert id="a-1198-9958" test="not(cda:componentOf/cda:encompassingEncounter) or cda:componentOf/cda:encompassingEncounter[count(cda:effectiveTime)=1]">This encompassingEncounter SHALL contain exactly one [1..1] effectiveTime (CONF:1198-9958).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.1.1-2015-08-01-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.1.1-2015-08-01-errors-abstract" />
      <sch:assert id="a-1198-5252" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-5252) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.1.1" (CONF:1198-10036). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32503).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.49-2015-08-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.49-2015-08-01-errors-abstract" abstract="true">
      <sch:assert id="a-1198-8712" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-8712) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.49" (CONF:1198-26353). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32546).</sch:assert>
      <sch:assert id="a-1198-8714" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet EncounterTypeCode urn:oid:2.16.840.1.113883.3.88.12.80.32 DYNAMIC (CONF:1198-8714).</sch:assert>
      <sch:assert id="a-1198-8726" test="not(cda:performer) or cda:performer[count(cda:assignedEntity)=1]">The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-8726).</sch:assert>
      <sch:assert id="a-1198-8710" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-8710).</sch:assert>
      <sch:assert id="a-1198-8711" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-8711).</sch:assert>
      <sch:assert id="a-1198-8713" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1198-8713).</sch:assert>
      <sch:assert id="a-1198-15972-c" test="count(cda:code/cda:originalText/cda:reference[@value])=0 or starts-with(cda:code/cda:originalText/cda:reference/@value, '#')">This reference/@value *SHALL* begin with a '#' and *SHALL* point to its corresponding narrative (using the approach defined in CDA Release 2, section 4.3.5.1) (CONF:1198-15972).</sch:assert>
      <sch:assert id="a-1198-8715" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1198-8715).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.49-2015-08-01-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.49-2015-08-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.145-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.145-errors-abstract" abstract="true">
      <sch:assert id="a-1198-32919" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1198-32919).</sch:assert>
      <sch:assert id="a-1198-32920" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1198-32920).</sch:assert>
      <sch:assert id="a-1198-32921" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-32921).</sch:assert>
      <sch:assert id="a-1198-32922" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-32922).</sch:assert>
      <sch:assert id="a-1198-32925" test="cda:code[@code='NEW-LOINC-CRITICALITY']">This code SHALL contain exactly one [1..1] @code="NEW-LOINC-CRITICALITY" Criticality (CONF:1198-32925).</sch:assert>
      <sch:assert id="a-1198-32927" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-32927).</sch:assert>
      <sch:assert id="a-1198-32928" test="count(cda:value[@xsi:type='CD' and @code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.1.11.20549']/voc:code/@value or @nullFlavor])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Criticality Observation urn:oid:2.16.840.1.113883.1.11.20549 STATIC 2015-08-01 (CONF:1198-32928).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.145-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.145']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.145-errors-abstract" />
      <sch:assert id="a-1198-32918" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.145'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-32918) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.145" (CONF:1198-32923).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.1-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.1-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.121-errors-abstract" />
      <sch:assert id="a-2228-11247" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.1'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11247) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.1" (CONF:2228-11248). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27067).</sch:assert>
      <sch:assert id="a-2228-11255" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-11255).</sch:assert>
      <sch:assert id="a-2228-27576" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27576).</sch:assert>
      <sch:assert id="a-2228-11245" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-11245).</sch:assert>
      <sch:assert id="a-2228-11246" test="@moodCode='GOL'">SHALL contain exactly one [1..1] @moodCode="GOL" goal (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11246).</sch:assert>
      <sch:assert id="a-2228-27557" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-27557).</sch:assert>
      <sch:assert id="a-2228-27577" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27577).</sch:assert>
      <sch:assert id="a-2228-28040" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28040).</sch:assert>
      <sch:assert id="a-2228-13876" test="not(cda:entryRelationship) or cda:entryRelationship[@typeCode='REFR']">SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-13876)</sch:assert>
      <sch:assert id="a-2228-11647" test="not(cda:entryRelationship) or cda:entryRelationship[count(cda:observation)=1]">SHALL contain exactly one [1..1] observation (CONF:2228-11647)</sch:assert>
      <sch:assert id="a-2228-11648" test="not(cda:entryRelationship) or cda:entryRelationship/cda:observation[@classCode='OBS']">This observation SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-11648)</sch:assert>
      <sch:assert id="a-2228-11649" test="not(cda:entryRelationship) or cda:entryRelationship/cda:observation[@moodCode='EVN']">This observation SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11649)</sch:assert>
      <sch:assert id="a-2228-28041" test="not(cda:entryRelationship) or cda:entryRelationship/cda:observation[count(cda:code)=1]">This observation SHALL contain exactly one [1..1] code (CONF:2228-28041)</sch:assert>
      <sch:assert id="a-2228-11650" test="not(cda:entryRelationship) or cda:entryRelationship/cda:observation[count(cda:value[@xsi:type='CD'])=1]">This observation SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-11650)</sch:assert>
      <sch:assert id="a-2228-28042" test="not(cda:entryRelationship) or cda:entryRelationship/cda:observation/cda:value[@sdtc:valueSet]">This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-28042)</sch:assert>
      <sch:assert id="a-2228-28038" test="not(cda:entryRelationship) or cda:entryRelationship/cda:observation/cda:templateId[@root='2.16.840.1.113883.10.20.24.3.119'][@extension='2014-12-01']">SHALL contain exactly one [1..1] Target Outcome (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.119:2014-12-01) (CONF:2228-28038)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.1-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.1']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.1-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.2-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.2-2016-02-01-errors-abstract" abstract="true">
      <sch:assert id="a-2228-11486" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11486) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.2" (CONF:2228-11487). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27275).</sch:assert>
      <sch:assert id="a-2228-11631" test="count(cda:participant[@typeCode='IRCP'][count(cda:participantRole[@classCode='ASSIGNED'][count(cda:code[@code='158965000'][@codeSystem='2.16.840.1.113883.6.96'])=1])=1])=1">SHALL contain exactly one [1..1] participant (CONF:2228-11631) such that it SHALL contain exactly one [1..1] participantRole (CONF:2228-11633). This participantRole SHALL contain exactly one [1..1] code (CONF:2228-11651). This code SHALL contain exactly one [1..1] @code="158965000" Medical practitioner (CONF:2228-27272). This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-26945). This participantRole SHALL contain exactly one [1..1] @classCode="ASSIGNED" assigned entity (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12098). SHALL contain exactly one [1..1] @typeCode="IRCP" information recipient (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-11632).</sch:assert>
      <sch:assert id="a-2228-11835" test="count(cda:participant[@typeCode='AUT'][count(cda:participantRole[@classCode='PAT'])=1])=1">SHALL contain exactly one [1..1] participant (CONF:2228-11835) such that it SHALL contain exactly one [1..1] participantRole (CONF:2228-11836). This participantRole SHALL contain exactly one [1..1] @classCode="PAT" patient (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12100). SHALL contain exactly one [1..1] @typeCode="AUT" author (originator) (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12099).</sch:assert>
      <sch:assert id="a-2228-11622" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-11622).</sch:assert>
      <sch:assert id="a-2228-26946" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-26946).</sch:assert>
      <sch:assert id="a-2228-11484" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-11484).</sch:assert>
      <sch:assert id="a-2228-11485" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11485).</sch:assert>
      <sch:assert id="a-2228-11619" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-11619).</sch:assert>
      <sch:assert id="a-2228-11620" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed", which SHALL be selected from CodeSystem ActStatus (urn:oid:2.16.840.1.113883.5.14) (CONF:2228-11620).</sch:assert>
      <sch:assert id="a-2228-27543" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-27543).</sch:assert>
      <sch:assert id="a-2228-27578" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27578).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.2-2016-02-01-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.2-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.3-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.3-2016-02-01-errors-abstract" abstract="true">
      <sch:assert id="a-2228-11842" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.3'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11842) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.3" (CONF:2228-11843). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27280).</sch:assert>
      <sch:assert id="a-2228-11850" test="count(cda:participant[@typeCode='AUT'][count(cda:participantRole[@classCode='ASSIGNED'][count(cda:code[@code='158965000'][@codeSystem='2.16.840.1.113883.6.96'])=1])=1])=1">SHALL contain exactly one [1..1] participant (CONF:2228-11850) such that it SHALL contain exactly one [1..1] participantRole (CONF:2228-11852). This participantRole SHALL contain exactly one [1..1] code (CONF:2228-11853). This code SHALL contain exactly one [1..1] @code="158965000" Medical practitioner (CONF:2228-26948). This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CONF:2228-26949). This participantRole SHALL contain exactly one [1..1] @classCode="ASSIGNED" assigned entity (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12101). SHALL contain exactly one [1..1] @typeCode="AUT" author (originator) (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-11851).</sch:assert>
      <sch:assert id="a-2228-11856" test="count(cda:participant[@typeCode='IRCP'][count(cda:participantRole[@classCode='PAT'])=1])=1">SHALL contain exactly one [1..1] participant (CONF:2228-11856) such that it SHALL contain exactly one [1..1] participantRole (CONF:2228-11858). This participantRole SHALL contain exactly one [1..1] @classCode="PAT" patient (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12102). SHALL contain exactly one [1..1] @typeCode="IRCP" information recipient  (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-11857).</sch:assert>
      <sch:assert id="a-2228-11847" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-11847).</sch:assert>
      <sch:assert id="a-2228-26947" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-26947).</sch:assert>
      <sch:assert id="a-2228-11840" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-11840).</sch:assert>
      <sch:assert id="a-2228-11841" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11841).</sch:assert>
      <sch:assert id="a-2228-11845" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-11845).</sch:assert>
      <sch:assert id="a-2228-11846" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-11846).</sch:assert>
      <sch:assert id="a-2228-27545" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-27545).</sch:assert>
      <sch:assert id="a-2228-27579" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27579).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.3-2016-02-01-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.3']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.3-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.4-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.4-2016-02-01-errors-abstract" abstract="true">
      <sch:assert id="a-2228-11818" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11818) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.4" (CONF:2228-11819). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27285).</sch:assert>
      <sch:assert id="a-2228-11827" test="count(cda:participant[@typeCode='IRCP'][count(cda:participantRole[@classCode='ASSIGNED'][count(cda:code[@code='158965000'][@codeSystem='2.16.840.1.113883.6.96'])=1])=1])=1">SHALL contain exactly one [1..1] participant (CONF:2228-11827) such that it SHALL contain exactly one [1..1] participantRole (CONF:2228-11829). This participantRole SHALL contain exactly one [1..1] code (CONF:2228-11830). This code SHALL contain exactly one [1..1] @code="158965000" Medical practictioner (CONF:2228-26951). This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-26952). This participantRole SHALL contain exactly one [1..1] @classCode="ASSIGNED" assigned entity (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12096). SHALL contain exactly one [1..1] @typeCode="IRCP" information recipient (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-11828).</sch:assert>
      <sch:assert id="a-2228-11837" test="count(cda:participant[@typeCode='AUT'][count(cda:participantRole[@classCode='ASSIGNED'][count(cda:code[@code='158965000'][@codeSystem='2.16.840.1.113883.6.96'])=1])=1])=1">SHALL contain exactly one [1..1] participant (CONF:2228-11837) such that it SHALL contain exactly one [1..1] participantRole (CONF:2228-11839). This participantRole SHALL contain exactly one [1..1] code (CONF:2228-12103). This code SHALL contain exactly one [1..1] @code="158965000" Medical practitioner (CONF:2228-26953). This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-26954). This participantRole SHALL contain exactly one [1..1] @classCode="ASSIGNED" assigned entity (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12097). SHALL contain exactly one [1..1] @typeCode="AUT" author (originator) (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-11838).</sch:assert>
      <sch:assert id="a-2228-11823" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-11823).</sch:assert>
      <sch:assert id="a-2228-26950" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-26950).</sch:assert>
      <sch:assert id="a-2228-11816" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-11816).</sch:assert>
      <sch:assert id="a-2228-11817" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11817).</sch:assert>
      <sch:assert id="a-2228-11821" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-11821).</sch:assert>
      <sch:assert id="a-2228-11822" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-11822).</sch:assert>
      <sch:assert id="a-2228-27547" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-27547).</sch:assert>
      <sch:assert id="a-2228-27581" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27581).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.4-2016-02-01-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.4-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.5-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.5-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-12119" test="count(cda:entryRelationship[@typeCode='MFST'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85' and @extension = '2014-12-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-12119) such that it SHALL contain exactly one [1..1] Reaction (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.85:2014-12-01) (CONF:2228-27123). SHALL contain exactly one [1..1] @typeCode="MFST" is manifestation of (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-12122). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-12123).</sch:assert>
      <sch:assert id="a-2228-12111" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-12111).</sch:assert>
      <sch:assert id="a-2228-12112" test="count(cda:participant[@typeCode='PRD'][count(cda:participantRole[@classCode='MANU'][count(cda:playingDevice[@classCode][count(cda:code)=1])=1])=1])=1">SHALL contain exactly one [1..1] participant (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:2228-12112) such that it SHALL contain exactly one [1..1] participantRole (CONF:2228-12114). This participantRole SHALL contain exactly one [1..1] playingDevice (CONF:2228-12116). This playingDevice SHALL contain exactly one [1..1] code (CONF:2228-12118). This playingDevice SHALL contain exactly one [1..1] @classCode (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:2228-12117). This participantRole SHALL contain exactly one [1..1] @classCode="MANU" manufactured product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12115). SHALL contain exactly one [1..1] @typeCode="PRD" product (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12113).</sch:assert>
      <sch:assert id="a-2228-12189" test="cda:value[@xsi:type='CD'][@code='420134006']">This value SHALL contain exactly one [1..1] @code="420134006" propensity to adverse reactions, which SHALL be selected from CodeSystem SNOMED CT (urn:oid:2.16.840.1.113883.6.96) (CONF:2228-12189).</sch:assert>
      <sch:assert id="a-2228-28047" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28047).</sch:assert>
      <sch:assert id="a-2228-28048" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28048).</sch:assert>
      <sch:assert id="a-2228-28049" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28049).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.5-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.5']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.5-2016-02-01-errors-abstract" />
      <sch:assert id="a-2228-12106" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.5'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12106) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.5" (CONF:2228-26942). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27029).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.5-2016-02-01-12112-branch-12112-errors-abstract" abstract="true">
      <sch:assert id="a-2228-27582-branch-12112" test="cda:participantRole/cda:playingDevice/cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27582).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.5-2016-02-01-12112-branch-12112-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.5']]/cda:participant[cda:participantRole[cda:playingDevice[cda:code][@classCode]][@classCode='MANU']][@typeCode='PRD']">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.5-2016-02-01-12112-branch-12112-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.2.4-errors-abstract" />
      <sch:assert id="a-2228-12796" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.2.1'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12796) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.2.1" (CONF:2228-12797). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-28405).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.1']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-communication-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16601" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16601)</sch:assert>
      <sch:assert id="a-2228-27378" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Communication from Patient to Provider (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.2:2016-02-01) (CONF:2228-27378)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-communication-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-communication-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-device-ae-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16602" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16602)</sch:assert>
      <sch:assert id="a-2228-13135" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.5'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Device Adverse Event (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.5:2016-02-01) (CONF:2228-13135)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-device-ae-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.5']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-device-ae-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-device-intolerance-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16603" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16603)</sch:assert>
      <sch:assert id="a-2228-13136" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.8'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Device Intolerance (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.8:2016-02-01) (CONF:2228-13136)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-device-intolerance-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.8']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-device-intolerance-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-device-order-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16604" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16604)</sch:assert>
      <sch:assert id="a-2228-28460" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.130'])=1]">SHALL contain exactly one [1..1] Device Order Act (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.130) (CONF:2228-28460)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-device-order-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.130']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-device-order-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-device-recommend-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16605" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16605)</sch:assert>
      <sch:assert id="a-2228-28461" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.131'])=1]">SHALL contain exactly one [1..1] Device Recommended Act (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.131) (CONF:2228-28461)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-device-recommend-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.131']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-device-recommend-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-diagnosis-study-ae-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16609" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16609)</sch:assert>
      <sch:assert id="a-2228-13142" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.15'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Diagnostic Study Adverse Event (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.15:2016-02-01) (CONF:2228-13142)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-diagnosis-study-ae-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.15']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-diagnosis-study-ae-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-diagnosis-study-intolerance-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16610" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16610)</sch:assert>
      <sch:assert id="a-2228-13143" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.16'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Diagnostic Study Intolerance (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.16:2016-02-01) (CONF:2228-13143)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-diagnosis-study-intolerance-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.16']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-diagnosis-study-intolerance-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-encounter-active-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16611" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16611)</sch:assert>
      <sch:assert id="a-2228-27007" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.21'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Encounter Active (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.21:2016-02-01) (CONF:2228-27007)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-encounter-active-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.21']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-encounter-active-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-intervention-performed-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28434" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28434)</sch:assert>
      <sch:assert id="a-2228-27145" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.32'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Intervention Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.32:2016-02-01) (CONF:2228-27145)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-intervention-performed-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.32']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-intervention-performed-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-transfer-from-errors-abstract" abstract="true">
      <sch:assert id="a-2228-27832" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-27832)</sch:assert>
      <sch:assert id="a-2228-28466" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.141'])=1]">SHALL contain exactly one [1..1] Transfer From Act (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.141) (CONF:2228-28466)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-transfer-from-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.141']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-transfer-from-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-transfer-to-errors-abstract" abstract="true">
      <sch:assert id="a-2228-27833" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-27833)</sch:assert>
      <sch:assert id="a-2228-28465" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.142'])=1]">SHALL contain exactly one [1..1] Transfer To Act (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.142) (CONF:2228-28465)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-transfer-to-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.142']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-transfer-to-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-encounter-order-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16612" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16612)</sch:assert>
      <sch:assert id="a-2228-28494" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.132'])=1]">SHALL contain exactly one [1..1] Encounter Order Act (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.132) (CONF:2228-28494)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-encounter-order-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.132']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-encounter-order-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-encounter-recommend-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16613" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16613)</sch:assert>
      <sch:assert id="a-2228-28495" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.134'])=1]">SHALL contain exactly one [1..1] Encounter Recommended Act (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.134) (CONF:2228-28495)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-encounter-recommend-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.134']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-encounter-recommend-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-functional-status-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16614" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16614)</sch:assert>
      <sch:assert id="a-2228-13149" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.25'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Functional Status Order (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.25:2016-02-01) (CONF:2228-13149)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-functional-status-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.25']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-functional-status-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-functional-status-performed-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16615" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16615)</sch:assert>
      <sch:assert id="a-2228-27139" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.26'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Functional Status Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.26:2016-02-01) (CONF:2228-27139)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-functional-status-performed-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.26']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-functional-status-performed-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-functional-status-recommended-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16616" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16616)</sch:assert>
      <sch:assert id="a-2228-27073" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.27'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Functional Status Recommended (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.27:2016-02-01) (CONF:2228-27073)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-functional-status-recommended-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.27']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-functional-status-recommended-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-lab-test-order-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16617" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16617)</sch:assert>
      <sch:assert id="a-2228-27076" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.37'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Laboratory Test Order (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.37:2016-02-01) (CONF:2228-27076)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-lab-test-order-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.37']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-lab-test-order-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-lab-test-perform-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16618" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16618)</sch:assert>
      <sch:assert id="a-2228-27156" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Laboratory Test Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.38:2016-02-01) (CONF:2228-27156)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-lab-test-perform-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-lab-test-perform-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-procedure-order-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16620" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16620)</sch:assert>
      <sch:assert id="a-2228-27084" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Procedure Order (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.63:2016-02-01) (CONF:2228-27084)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-procedure-order-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-procedure-order-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-procedure-performed-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16621" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16621)</sch:assert>
      <sch:assert id="a-2228-27130" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Procedure Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.64:2016-02-01) (CONF:2228-27130)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-procedure-performed-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-procedure-performed-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-procedure-recommend-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16622" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16622)</sch:assert>
      <sch:assert id="a-2228-27087" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Procedure Recommended (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.65:2016-02-01) (CONF:2228-27087)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-procedure-recommend-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-procedure-recommend-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-provider-care-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16624" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16624)</sch:assert>
      <sch:assert id="a-2228-27295" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.67'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Provider Care Experience (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.67:2016-02-01) (CONF:2228-27295)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-provider-care-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.67']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-provider-care-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-patient-care-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16628" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16628)</sch:assert>
      <sch:assert id="a-2228-27296" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.48'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Patient Care Experience (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.48:2016-02-01) (CONF:2228-27296)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-patient-care-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.48']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-patient-care-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-physical-exam-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16630" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16630)</sch:assert>
      <sch:assert id="a-2228-27136" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.59'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Physical Exam Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.59:2016-02-01) (CONF:2228-27136)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-physical-exam-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.59']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-physical-exam-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-communication-from-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16631" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16631)</sch:assert>
      <sch:assert id="a-2228-27379" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.3'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Communication from Provider to Patient (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.3:2016-02-01) (CONF:2228-27379)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-communication-from-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.3']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-communication-from-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-communication-from2-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16632" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16632)</sch:assert>
      <sch:assert id="a-2228-27380" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Communication from Provider to Provider (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.4:2016-02-01) (CONF:2228-27380)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-communication-from2-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-communication-from2-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-device-allergy-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16633" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16633)</sch:assert>
      <sch:assert id="a-2228-13267" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.6'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Device Allergy (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.6:2016-02-01) (CONF:2228-13267)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-device-allergy-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.6']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-device-allergy-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-device-applied-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16634" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16634)</sch:assert>
      <sch:assert id="a-2228-27133" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Device Applied (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.7:2016-02-01) (CONF:2228-27133)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-device-applied-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-device-applied-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-lab-test-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16636" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16636)</sch:assert>
      <sch:assert id="a-2228-13273" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.39'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Laboratory Test Recommended (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.39:2016-02-01) (CONF:2228-13273)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-lab-test-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.39']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-lab-test-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-physical-exam-recommend-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16638" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16638)</sch:assert>
      <sch:assert id="a-2228-13295" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Physical Exam Recommended (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.60:2016-02-01) (CONF:2228-13295)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-physical-exam-recommend-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-physical-exam-recommend-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-risk-category-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16639" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16639)</sch:assert>
      <sch:assert id="a-2228-27300" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.69'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Risk Category Assessment (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.69:2016-02-01) (CONF:2228-27300)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-risk-category-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.69']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-risk-category-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-order-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16642" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16642)</sch:assert>
      <sch:assert id="a-2228-27090" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.47'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Medication Order (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.47:2016-02-01) (CONF:2228-27090)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-order-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.47']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-order-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-active-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16643" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16643)</sch:assert>
      <sch:assert id="a-2228-27040" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.41'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Medication Active (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.41:2016-02-01) (CONF:2228-27040)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-active-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.41']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-active-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-intervention-recommend-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16645" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16645)</sch:assert>
      <sch:assert id="a-2228-27042" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.33'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Intervention Recommended (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.33:2016-02-01) (CONF:2228-27042)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-intervention-recommend-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.33']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-intervention-recommend-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-intervention-order-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16646" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16646)</sch:assert>
      <sch:assert id="a-2228-27043" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.31'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Intervention Order (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.31:2016-02-01) (CONF:2228-27043)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-intervention-order-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.31']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-intervention-order-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-intervention-intolerance-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16647" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16647)</sch:assert>
      <sch:assert id="a-2228-27044" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.30'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Intervention Intolerance (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.30:2016-02-01) (CONF:2228-27044)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-intervention-intolerance-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.30']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-intervention-intolerance-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-encounter-performed-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16649" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16649)</sch:assert>
      <sch:assert id="a-2228-28496" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.133'])=1]">SHALL contain exactly one [1..1] Encounter Performed Act (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.133) (CONF:2228-28496)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-encounter-performed-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.133']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-encounter-performed-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-diagnostic-study-recommend-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16653" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16653)</sch:assert>
      <sch:assert id="a-2228-13948" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.19'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Diagnostic Study Recommended (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.19:2016-02-01) (CONF:2228-13948)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-diagnostic-study-recommend-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.19']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-diagnostic-study-recommend-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-diagnostic-study-performed-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16654" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16654)</sch:assert>
      <sch:assert id="a-2228-27142" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Diagnostic Study Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.18:2016-02-01) (CONF:2228-27142)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-diagnostic-study-performed-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-diagnostic-study-performed-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-diagnostic-study-order-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16655" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16655)</sch:assert>
      <sch:assert id="a-2228-13952" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.17'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Diagnostic Study Order (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.17:2016-02-01) (CONF:2228-13952)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-diagnostic-study-order-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.17']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-diagnostic-study-order-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-procedure-ae-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16657" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16657)</sch:assert>
      <sch:assert id="a-2228-27046" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.61'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Procedure Adverse Event (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.61:2016-02-01) (CONF:2228-27046)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-procedure-ae-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.61']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-procedure-ae-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-procedure-intolerance-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16659" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16659)</sch:assert>
      <sch:assert id="a-2228-27047" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.62'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Procedure Intolerance (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.62:2016-02-01) (CONF:2228-27047)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-procedure-intolerance-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.62']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-procedure-intolerance-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-patient-character-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16660" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16660)</sch:assert>
      <sch:assert id="a-2228-27048" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.51'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Patient Characteristic Clinical Trial Participant (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.51:2016-02-01) (CONF:2228-27048)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-patient-character-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.51']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-patient-character-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-intolerance-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16661" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16661)</sch:assert>
      <sch:assert id="a-2228-27049" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.46'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Medication Intolerance (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.46:2016-02-01) (CONF:2228-27049)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-intolerance-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.46']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-intolerance-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-lab-test-intolerance-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16662" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16662)</sch:assert>
      <sch:assert id="a-2228-27050" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.36'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Laboratory Test Intolerance (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.36:2016-02-01) (CONF:2228-27050)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-lab-test-intolerance-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.36']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-lab-test-intolerance-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-lab-test-ae-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16663" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16663)</sch:assert>
      <sch:assert id="a-2228-27051" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.35'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Laboratory Test Adverse Event (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.35:2016-02-01) (CONF:2228-27051)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-lab-test-ae-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.35']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-lab-test-ae-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-substance-recommend-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16665" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16665)</sch:assert>
      <sch:assert id="a-2228-27153" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.75'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Substance Recommended (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.75:2016-02-01) (CONF:2228-27153)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-substance-recommend-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.75']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-substance-recommend-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-patient-character-payer-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16666" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16666)</sch:assert>
      <sch:assert id="a-2228-14431" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55'])=1]">SHALL contain exactly one [1..1] Patient Characteristic Payer (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.55) (CONF:2228-14431)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-patient-character-payer-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-patient-character-payer-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-patient-character-expired-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16667" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16667)</sch:assert>
      <sch:assert id="a-2228-27052" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.54'])=1]">SHALL contain exactly one [1..1] Patient Characteristic Expired (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.54:2016-02-01) (CONF:2228-27052)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-patient-character-expired-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.54']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-patient-character-expired-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-allergy-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16668" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16668)</sch:assert>
      <sch:assert id="a-2228-27053" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.44'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Medication Allergy (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.44:2016-02-01) (CONF:2228-27053)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-allergy-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.44']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-allergy-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-ae-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16669" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16669)</sch:assert>
      <sch:assert id="a-2228-27063" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.43'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Medication Adverse Effect (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.43:2016-02-01) (CONF:2228-27063)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-ae-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.43']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-ae-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-family-history-org-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16670" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16670)</sch:assert>
      <sch:assert id="a-2228-27055" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.12'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Family History Organizer QDM (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.12:2016-02-01) (CONF:2228-27055)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-family-history-org-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.12']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-family-history-org-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-patient-coa-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16674" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16674)</sch:assert>
      <sch:assert id="a-2228-16549" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.103'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Patient Characteristic Observation Assertion (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.103:2016-02-01) (CONF:2228-16549)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-patient-coa-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.103']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-patient-coa-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-discharge-medication-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16675" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16675)</sch:assert>
      <sch:assert id="a-2228-27062" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.105'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Discharge Medication (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.105:2016-02-01) (CONF:2228-27062)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-discharge-medication-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.105']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-discharge-medication-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-care-goal-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16676" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16676)</sch:assert>
      <sch:assert id="a-2228-27068" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.1'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Care Goal (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.1:2016-02-01) (CONF:2228-27068)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-care-goal-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.1']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-care-goal-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-admin-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16708" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16708)</sch:assert>
      <sch:assert id="a-2228-27057" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.42'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Medication Administered (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.42:2016-02-01) (CONF:2228-27057)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-admin-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.42']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-admin-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-intervention-ae-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16648" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16648)</sch:assert>
      <sch:assert id="a-2228-27061" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.29'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Intervention Adverse Event (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.29:2016-02-01) (CONF:2228-27061)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-intervention-ae-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.29']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-intervention-ae-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-physical-order-errors-abstract" abstract="true">
      <sch:assert id="a-2228-27080" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-27080)</sch:assert>
      <sch:assert id="a-2228-27081" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.58'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Physical Exam Order (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.58:2016-02-01) (CONF:2228-27081)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-physical-order-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.58']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-physical-order-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-provider-care-exp-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28215" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28215)</sch:assert>
      <sch:assert id="a-2228-28216" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.67'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Provider Care Experience (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.67:2016-02-01) (CONF:2228-28216)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-provider-care-exp-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.67']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-provider-care-exp-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-diagnosis-concern-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16606" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16606)</sch:assert>
      <sch:assert id="a-2228-28549" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137'])=1]">SHALL contain exactly one [1..1] Diagnosis Concern Act (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.137) (CONF:2228-28549)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-diagnosis-concern-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-diagnosis-concern-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-symptom-concern-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16625" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16625)</sch:assert>
      <sch:assert id="a-2228-28550" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.138'])=1]">SHALL contain exactly one [1..1] Symptom Concern Act (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.138) (CONF:2228-28550)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-symptom-concern-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.138']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-symptom-concern-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-dispensed-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16644" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16644)</sch:assert>
      <sch:assert id="a-2228-28570" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.139'])=1]">SHALL contain exactly one [1..1] Medication Dispensed Act (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.139) (CONF:2228-28570)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-dispensed-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.139']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-medication-dispensed-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-immunization-admin-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28595" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28595)</sch:assert>
      <sch:assert id="a-2228-28596" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.140'])=1]">SHALL contain exactly one [1..1] Immunization Administered (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.140) (CONF:2228-28596)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-immunization-admin-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.140']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-immunization-admin-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-immunization-order-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28649" test="cda:entry[@typeCode='DRIV']">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28649)</sch:assert>
      <sch:assert id="a-2228-28650" test="cda:entry[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.143'])=1]">SHALL contain exactly one [1..1] Immunization Order (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.143) (CONF:2228-28650)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-immunization-order-errors" context="cda:section[cda:entry[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.143']]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-immunization-order-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16381" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.104'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-16381) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.104" (CONF:2228-16382). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27010).</sch:assert>
      <sch:assert id="a-2228-16385" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-16385).</sch:assert>
      <sch:assert id="a-2228-16387" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-16387).</sch:assert>
      <sch:assert id="a-2228-16389" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-16389).</sch:assert>
      <sch:assert id="a-2228-16392" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-16392) such that it SHALL contain exactly one [1..1] @typeCode="CAUS" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16393). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-16394).</sch:assert>
      <sch:assert id="a-2228-16406" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-16406).</sch:assert>
      <sch:assert id="a-2228-16386" test="cda:code[@code='ASSERTION']">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:2228-16386).</sch:assert>
      <sch:assert id="a-2228-27575" test="cda:code[@codeSystem='2.16.840.1.113883.5.4']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:2228-27575).</sch:assert>
      <sch:assert id="a-2228-16388" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-16388).</sch:assert>
      <sch:assert id="a-2228-16390" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-16390).</sch:assert>
      <sch:assert id="a-2228-16407" test="cda:value[@xsi:type='CD'][@code]">This value SHALL contain exactly one [1..1] @code, which MAY be selected from ValueSet Allergy and Intolerance Type urn:oid:2.16.840.1.113883.3.88.12.3221.6.2 DYNAMIC (CONF:2228-16407).</sch:assert>
      <sch:assert id="a-2228-16379" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-16379).</sch:assert>
      <sch:assert id="a-2228-16380" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-16380).</sch:assert>
      <sch:assert id="a-2228-16384" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-16384).</sch:assert>
      <sch:assert id="a-2228-28039" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28039).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.104']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.15-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.15-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-errors-abstract" />
      <sch:assert id="a-2228-11779" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18' and @extension = '2016-02-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-11779) such that it SHALL contain exactly one [1..1] Diagnostic Study Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.18:2016-02-01) (CONF:2228-27149). SHALL contain exactly one [1..1] @typeCode="CAUS" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-11780). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-11781).</sch:assert>
      <sch:assert id="a-2228-11769" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.15'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11769) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.15" (CONF:2228-11770). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27012).</sch:assert>
      <sch:assert id="a-2228-16408" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-16408).</sch:assert>
      <sch:assert id="a-2228-26938" test="cda:value[@xsi:type='CD'][@code='281647001']">This value SHALL contain exactly one [1..1] @code="281647001" Adverse reaction (CONF:2228-26938).</sch:assert>
      <sch:assert id="a-2228-26939" test="cda:value[@xsi:type='CD'][@codeSystem='2.16.840.1.113883.6.96']">This value SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CONF:2228-26939).</sch:assert>
      <sch:assert id="a-2228-11767" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-11767).</sch:assert>
      <sch:assert id="a-2228-11768" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11768).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.15-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.15']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.15-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.16-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.16-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-errors-abstract" />
      <sch:assert id="a-2228-11745" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18' and @extension = '2016-02-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-11745) such that it SHALL contain exactly one [1..1] Diagnostic Study Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.18:2016-02-01) (CONF:2228-27150). SHALL contain exactly one [1..1] @typeCode="CAUS" (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-11746). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-11747).</sch:assert>
      <sch:assert id="a-2228-11735" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.16'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11735) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.16" (CONF:2228-11736). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27015).</sch:assert>
      <sch:assert id="a-2228-14572" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-14572).</sch:assert>
      <sch:assert id="a-2228-16411" test="cda:value[@xsi:type='CD'][@code='102460003']">This value SHALL contain exactly one [1..1] @code="102460003" Decreased tolerance (CONF:2228-16411).</sch:assert>
      <sch:assert id="a-2228-11733" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-11733).</sch:assert>
      <sch:assert id="a-2228-11734" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11734).</sch:assert>
      <sch:assert id="a-2228-11737" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:2228-11737).</sch:assert>
      <sch:assert id="a-2228-28406" test="cda:value[@xsi:type='CD'][@codeSystem]">This value SHALL contain exactly one [1..1] @codeSystem (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-28406).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.16-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.16']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.16-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.18-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.18-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.13-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-12951" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12951) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.18" (CONF:2228-12952). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27141).</sch:assert>
      <sch:assert id="a-2228-12956" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-12956).</sch:assert>
      <sch:assert id="a-2228-12958" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-12958).</sch:assert>
      <sch:assert id="a-2228-27617" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27617).</sch:assert>
      <sch:assert id="a-2228-12957" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-12957).</sch:assert>
      <sch:assert id="a-2228-12959" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-12959).</sch:assert>
      <sch:assert id="a-2228-12960" test="cda:effectiveTime[count(cda:high)=1]">This effectiveTime SHALL contain exactly one [1..1] high (CONF:2228-12960).</sch:assert>
      <sch:assert id="a-2228-12950" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12950).</sch:assert>
      <sch:assert id="a-2228-27369" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27369).</sch:assert>
      <sch:assert id="a-2228-27618" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27618).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.18-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.18-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.29-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.29-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-errors-abstract" />
      <sch:assert id="a-2228-13549" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'][count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.32' and @extension = '2016-02-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-13549) such that it SHALL contain exactly one [1..1] Intervention Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.32:2016-02-01) (CONF:2228-27151). SHALL contain exactly one [1..1] @typeCode="CAUS" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-13550). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-13551).</sch:assert>
      <sch:assert id="a-2228-13540" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.29'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-13540) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.29" (CONF:2228-13541). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27016).</sch:assert>
      <sch:assert id="a-2228-16412" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-16412).</sch:assert>
      <sch:assert id="a-2228-16413" test="cda:value[@xsi:type='CD'][@code='281647001']">This value SHALL contain exactly one [1..1] @code="281647001" Adverse reaction (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-16413).</sch:assert>
      <sch:assert id="a-2228-13538" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-13538).</sch:assert>
      <sch:assert id="a-2228-13539" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-13539).</sch:assert>
      <sch:assert id="a-2228-13542" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:2228-13542).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.29-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.29']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.29-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.32-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.32-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.12-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-13591" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.32'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-13591) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.32" (CONF:2228-13592). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27144).</sch:assert>
      <sch:assert id="a-2228-13611" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-13611).</sch:assert>
      <sch:assert id="a-2228-27362" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-27362).</sch:assert>
      <sch:assert id="a-2228-27633" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27633).</sch:assert>
      <sch:assert id="a-2228-13612" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-13612).</sch:assert>
      <sch:assert id="a-2228-13590" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-13590).</sch:assert>
      <sch:assert id="a-2228-27354" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27354).</sch:assert>
      <sch:assert id="a-2228-27363" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-27363).</sch:assert>
      <sch:assert id="a-2228-27634" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27634).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.32-2016-02-01-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.32']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.32-2016-02-01-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.32-2016-02-01-entryRelationship-errors-abstract" abstract="true">
      <sch:assert id="a-2228-27357" test="@typeCode='REFR'">SHALL contain exactly one [1..1] @typeCode="REFR" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-27357)</sch:assert>
      <sch:assert id="a-2228-27358" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.87'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] Result (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.87:2016-02-01) (CONF:2228-27358)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.32-2016-02-01-entryRelationship-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.32'][cda:entryRelationship[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.87']]]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.32-2016-02-01-entryRelationship-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.87-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.87-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.2-2015-08-01-errors-abstract" />
      <sch:assert id="a-2228-11672" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.87'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11672) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.87" (CONF:2228-11673). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27035).</sch:assert>
      <sch:assert id="a-2228-16701" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:2228-16701).</sch:assert>
      <sch:assert id="a-2228-27658" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27658).</sch:assert>
      <sch:assert id="a-2228-16702-c" test="count(cda:value[@xsi:type='PQ'])=0 or count(cda:value[@xsi:type='PQ'][@unit])=1">If xsi:type=PQ, then @units shall be drawn from Unified Code for Units of Measure (UCUM) 2.16.840.1.113883.6.8 code system. Additional constraint is dependent on criteria in the corresponding eMeasure (CONF:2228-16702).</sch:assert>
      <sch:assert id="a-2228-27659" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27659).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.87-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.87']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.87-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.33-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.33-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.39-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-13764" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.33'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-13764) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.33" (CONF:2228-13765). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-26557).</sch:assert>
      <sch:assert id="a-2228-13767" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-13767).</sch:assert>
      <sch:assert id="a-2228-27349" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27349).</sch:assert>
      <sch:assert id="a-2228-13763" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-13763).</sch:assert>
      <sch:assert id="a-2228-27635" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27635).</sch:assert>
      <sch:assert id="a-2228-27355" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27355).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.33-2016-02-01-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.33']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.33-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.35-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.35-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-errors-abstract" />
      <sch:assert id="a-2228-14072" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38' and @extension = '2016-02-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-14072) such that it SHALL contain exactly one [1..1] Laboratory Test Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.38:2016-02-01) (CONF:2228-27154). SHALL contain exactly one [1..1] @typeCode="CAUS" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-14073). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-14074).</sch:assert>
      <sch:assert id="a-2228-14062" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.35'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-14062) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.35" (CONF:2228-14063). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27018).</sch:assert>
      <sch:assert id="a-2228-16416" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-16416).</sch:assert>
      <sch:assert id="a-2228-16417" test="cda:value[@xsi:type='CD'][@code='281647001']">This value SHALL contain exactly one [1..1] @code="281647001" Adverse reaction (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-16417).</sch:assert>
      <sch:assert id="a-2228-14060" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-14060).</sch:assert>
      <sch:assert id="a-2228-14061" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-14061).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.35-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.35']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.35-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.38-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.38-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.2-2015-08-01-errors-abstract" />
      <sch:assert id="a-2228-11709" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-11709).</sch:assert>
      <sch:assert id="a-2228-11711" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-11711).</sch:assert>
      <sch:assert id="a-2228-11721" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11721) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.38" (CONF:2228-11722). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27021).</sch:assert>
      <sch:assert id="a-2228-27637" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27637).</sch:assert>
      <sch:assert id="a-2228-11710" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-11710).</sch:assert>
      <sch:assert id="a-2228-11712" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-11712).</sch:assert>
      <sch:assert id="a-2228-11713" test="cda:effectiveTime[count(cda:high)=1]">This effectiveTime SHALL contain exactly one [1..1] high (CONF:2228-11713).</sch:assert>
      <sch:assert id="a-2228-11705" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-11705).</sch:assert>
      <sch:assert id="a-2228-11706" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11706).</sch:assert>
      <sch:assert id="a-2228-11707" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-11707).</sch:assert>
      <sch:assert id="a-2228-27638" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27638).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.38-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.38-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.36-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.36-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-errors-abstract" />
      <sch:assert id="a-2228-13973" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38' and @extension = '2016-02-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-13973) such that it SHALL contain exactly one [1..1] Laboratory Test Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.38:2016-02-01) (CONF:2228-27155). SHALL contain exactly one [1..1] @typeCode="CAUS" (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-13974). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-13975).</sch:assert>
      <sch:assert id="a-2228-13963" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.36'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-13963) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.36" (CONF:2228-13964). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27019).</sch:assert>
      <sch:assert id="a-2228-14573" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-14573).</sch:assert>
      <sch:assert id="a-2228-16418" test="cda:value[@xsi:type='CD'][@code='102460003']">This value SHALL contain exactly one [1..1] @code="102460003" Decreased tolerance (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-16418).</sch:assert>
      <sch:assert id="a-2228-13961" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-13961).</sch:assert>
      <sch:assert id="a-2228-13962" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-13962).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.36-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.36']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.36-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.61-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.61-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-errors-abstract" />
      <sch:assert id="a-2228-11385" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'][count(cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64' and @extension = '2016-02-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-11385) such that it SHALL contain exactly one [1..1] Procedure Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.64:2016-02-01) (CONF:2228-27147). SHALL contain exactly one [1..1] @typeCode="CAUS" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-11386). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-11387).</sch:assert>
      <sch:assert id="a-2228-11375" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.61'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11375) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.61" (CONF:2228-11376). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27009).</sch:assert>
      <sch:assert id="a-2228-16419" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-16419).</sch:assert>
      <sch:assert id="a-2228-16420" test="cda:value[@xsi:type='CD'][@code='281647001']">This value SHALL contain exactly one [1..1] @code="281647001" Adverse reaction (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-16420).</sch:assert>
      <sch:assert id="a-2228-11373" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-11373).</sch:assert>
      <sch:assert id="a-2228-11374" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11374).</sch:assert>
      <sch:assert id="a-2228-11377" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:2228-11377).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.61-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.61']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.61-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.14-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-11262" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11262) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.64" (CONF:2228-11263). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27129).</sch:assert>
      <sch:assert id="a-2228-11669" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-11669).</sch:assert>
      <sch:assert id="a-2228-27305" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-27305).</sch:assert>
      <sch:assert id="a-2228-27309" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27309).</sch:assert>
      <sch:assert id="a-2228-11670" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-11670).</sch:assert>
      <sch:assert id="a-2228-11671" test="cda:effectiveTime[count(cda:high)=1]">This effectiveTime SHALL contain exactly one [1..1] high (CONF:2228-11671).</sch:assert>
      <sch:assert id="a-2228-11261" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11261).</sch:assert>
      <sch:assert id="a-2228-27367" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-27367).</sch:assert>
      <sch:assert id="a-2228-27308" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27308).</sch:assert>
      <sch:assert id="a-2228-27310" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27310).</sch:assert>
      <sch:assert id="a-2228-27313" test="not(cda:approachSiteCode) or cda:approachSiteCode[@sdtc:valueSet]">The approachSiteCode, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27313).</sch:assert>
      <sch:assert id="a-2228-27766" test="not(cda:targetSiteCode/cda:translation) or cda:targetSiteCode/cda:translation[@sdtc:valueSet]">The translation, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27766).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-reason-errors-abstract" abstract="true">
      <sch:assert id="a-2228-11372" test="cda:entryRelationship[@typeCode='RSON']">SHALL contain exactly one [1..1] @typeCode="RSON" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-11372)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-reason-errors" context="cda:procedure[cda:entryRelationship[cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.88']]]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-reason-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-incision-errors-abstract" abstract="true">
      <sch:assert id="a-2228-11500" test="cda:entryRelationship[@typeCode='REFR']">SHALL contain exactly one [1..1] @typeCode="REFR" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-11500)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-incision-errors" context="cda:procedure[cda:entryRelationship[cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.89']]]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-incision-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-radiation-errors-abstract" abstract="true">
      <sch:assert id="a-2228-27303" test="cda:entryRelationship[@typeCode='REFR']">SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-27303)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-radiation-errors" context="cda:procedure[cda:entryRelationship[cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.91']]]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-radiation-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-result-errors-abstract" abstract="true">
      <sch:assert id="a-2228-27316" test="cda:entryRelationship[@typeCode='REFR']">SHALL contain exactly one [1..1] @typeCode="REFR" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-27316)</sch:assert>
      <sch:assert id="a-2228-27317" test="cda:entryRelationship/cda:observation[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.87'][@extension='2016-02-01'])=1]">SHALL contain exactly one [1..1] Result (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.87:2016-02-01) (CONF:2228-27317)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-result-errors" context="cda:procedure[cda:entryRelationship[cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.87']]]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-result-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-status-errors-abstract" abstract="true">
      <sch:assert id="a-2228-27365" test="cda:entryRelationship[@typeCode='REFR']">SHALL contain exactly one [1..1] @typeCode="REFR" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-27365)</sch:assert>
      <sch:assert id="a-2228-28608" test="cda:entryRelationship/cda:observation[count(cda:value[@xsi:type='CD'])=1]">This observation SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-28608)</sch:assert>
      <sch:assert id="a-2228-28613" test="cda:entryRelationship/cda:observation/cda:value[@sdtc:valueSet]">This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-28613)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-status-errors" context="cda:procedure[cda:entryRelationship[cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.93']]]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-status-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-ordinality-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28617" test="cda:entryRelationship[@typeCode='REFR']">SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CONF:2228-28617)</sch:assert>
      <sch:assert id="a-2228-28615" test="cda:entryRelationship[count(cda:observation)=1]">SHALL contain exactly one [1..1] observation (CONF:2228-28615)</sch:assert>
      <sch:assert id="a-2228-28618" test="cda:entryRelationship/cda:observation[@classCode='OBS']">This observation SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28618)</sch:assert>
      <sch:assert id="a-2228-28619" test="cda:entryRelationship/cda:observation[@moodCode='EVN']">This observation SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28619)</sch:assert>
      <sch:assert id="a-2228-28616" test="cda:entryRelationship/cda:observation[count(cda:code)=1]">This observation SHALL contain exactly one [1..1] code (CONF:2228-28616)</sch:assert>
      <sch:assert id="a-2228-28620" test="cda:entryRelationship/cda:observation/cda:code[@code='260870009']">This code SHALL contain exactly one [1..1] @code="260870009" Priority (CONF:2228-28620)</sch:assert>
      <sch:assert id="a-2228-28621" test="cda:entryRelationship/cda:observation/cda:code[@codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-28621)</sch:assert>
      <sch:assert id="a-2228-28624" test="cda:entryRelationship/cda:observation[count(cda:value[@xsi:type='CD'])=1]">This observation SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-28624)</sch:assert>
      <sch:assert id="a-2228-28625" test="cda:entryRelationship/cda:observation/cda:value[@sdtc:valueSet]">This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-28625)</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-ordinality-errors" context="cda:procedure[cda:entryRelationship[cda:observation[count(cda:templateId)=0]]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-ordinality-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.62-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.62-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-errors-abstract" />
      <sch:assert id="a-2228-11435" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.62'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11435) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.62" (CONF:2228-11436). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27020).</sch:assert>
      <sch:assert id="a-2228-11601" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'][count(cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64' and @extension = '2016-02-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-11601) such that it SHALL contain exactly one [1..1] @typeCode="CAUS" (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-11602). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-11603). SHALL contain exactly one [1..1] Procedure Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.64:2016-02-01) (CONF:2228-27148).</sch:assert>
      <sch:assert id="a-2228-14574" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-14574).</sch:assert>
      <sch:assert id="a-2228-16421" test="cda:value[@xsi:type='CD'][@code='102460003']">This value SHALL contain exactly one [1..1] @code="102460003" Decreased tolerance (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-16421).</sch:assert>
      <sch:assert id="a-2228-11433" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-11433).</sch:assert>
      <sch:assert id="a-2228-11434" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11434).</sch:assert>
      <sch:assert id="a-2228-11437" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:2228-11437).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.62-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.62']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.62-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.39-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.39-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-11794" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.39'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11794) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.39" (CONF:2228-11795). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27077).</sch:assert>
      <sch:assert id="a-2228-27639" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27639).</sch:assert>
      <sch:assert id="a-2228-27350" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27350).</sch:assert>
      <sch:assert id="a-2228-11793" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11793).</sch:assert>
      <sch:assert id="a-2228-27416" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27416).</sch:assert>
      <sch:assert id="a-2228-27640" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27640).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.39-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.39']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.39-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.37-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.37-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-11954" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.37'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11954) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.37" (CONF:2228-11955). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27075).</sch:assert>
      <sch:assert id="a-2228-11957" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-11957).</sch:assert>
      <sch:assert id="a-2228-27344" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27344).</sch:assert>
      <sch:assert id="a-2228-11953" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11953).</sch:assert>
      <sch:assert id="a-2228-27636" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27636).</sch:assert>
      <sch:assert id="a-2228-27417" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27417).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.37-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.37']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.37-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.58-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.58-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-12686" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.58'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12686) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.58" (CONF:2228-12687). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27078).</sch:assert>
      <sch:assert id="a-2228-12689" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-12689).</sch:assert>
      <sch:assert id="a-2228-13254" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-13254).</sch:assert>
      <sch:assert id="a-2228-13242" test="cda:code[@code='29545-1' and @codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @code="29545-1" physical examination (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2228-13242).</sch:assert>
      <sch:assert id="a-2228-27345" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27345).</sch:assert>
      <sch:assert id="a-2228-12685" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12685).</sch:assert>
      <sch:assert id="a-2228-27650" test="cda:value[@xsi:type='CD'][@sdtc:valueSet]">This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27650).</sch:assert>
      <sch:assert id="a-2228-27550" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27550).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.58-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.58']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.58-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.60-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.60-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-12666" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12666) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.60" (CONF:2228-12667). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27082).</sch:assert>
      <sch:assert id="a-2228-12669" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-12669).</sch:assert>
      <sch:assert id="a-2228-13275" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-13275).</sch:assert>
      <sch:assert id="a-2228-13274" test="cda:code[@code='29545-1']">This code SHALL contain exactly one [1..1] @code="29545-1" physical examination (CONF:2228-13274).</sch:assert>
      <sch:assert id="a-2228-28132" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2228-28132).</sch:assert>
      <sch:assert id="a-2228-27351" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27351).</sch:assert>
      <sch:assert id="a-2228-12665" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12665).</sch:assert>
      <sch:assert id="a-2228-27653" test="cda:value[@xsi:type='CD'][@sdtc:valueSet]">This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27653).</sch:assert>
      <sch:assert id="a-2228-27556" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27556).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.60-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.60-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.59-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.59-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.13-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-12644" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.59'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12644) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.59" (CONF:2228-12645). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27135).</sch:assert>
      <sch:assert id="a-2228-12649" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-12649).</sch:assert>
      <sch:assert id="a-2228-12651" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-12651).</sch:assert>
      <sch:assert id="a-2228-27651" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27651).</sch:assert>
      <sch:assert id="a-2228-12650" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-12650).</sch:assert>
      <sch:assert id="a-2228-12652" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-12652).</sch:assert>
      <sch:assert id="a-2228-12653" test="cda:effectiveTime[count(cda:high)=1]">This effectiveTime SHALL contain exactly one [1..1] high (CONF:2228-12653).</sch:assert>
      <sch:assert id="a-2228-12643" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12643).</sch:assert>
      <sch:assert id="a-2228-27559" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27559).</sch:assert>
      <sch:assert id="a-2228-27652" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27652).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.59-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.59']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.59-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.63-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.63-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.41-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-11098" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11098) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.63" (CONF:2228-11099). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27083).</sch:assert>
      <sch:assert id="a-2228-27324" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27324).</sch:assert>
      <sch:assert id="a-2228-27346" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27346).</sch:assert>
      <sch:assert id="a-2228-11097" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11097).</sch:assert>
      <sch:assert id="a-2228-27326" test="not(cda:methodCode) or cda:methodCode[@sdtc:valueSet]">The methodCode, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27326).</sch:assert>
      <sch:assert id="a-2228-27325" test="not(cda:priorityCode) or cda:priorityCode[@sdtc:valueSet]">The priorityCode, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27325).</sch:assert>
      <sch:assert id="a-2228-27323" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27323).</sch:assert>
      <sch:assert id="a-2228-27330" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27330).</sch:assert>
      <sch:assert id="a-2228-27331" test="not(cda:approachSiteCode) or cda:approachSiteCode[@sdtc:valueSet]">The approachSiteCode, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27331).</sch:assert>
      <sch:assert id="a-2228-27733" test="not(cda:targetSiteCode/cda:translation) or cda:targetSiteCode/cda:translation[@sdtc:valueSet]">The translation, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27733).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.63-2016-02-01-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.63-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.65-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.65-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.41-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-11104" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11104) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.65" (CONF:2228-11105). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27086).</sch:assert>
      <sch:assert id="a-2228-11107" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-11107).</sch:assert>
      <sch:assert id="a-2228-27352" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27352).</sch:assert>
      <sch:assert id="a-2228-11103" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11103).</sch:assert>
      <sch:assert id="a-2228-27654" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27654).</sch:assert>
      <sch:assert id="a-2228-27337" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27337).</sch:assert>
      <sch:assert id="a-2228-27729" test="not(cda:targetSiteCode/cda:translation) or cda:targetSiteCode/cda:translation[@sdtc:valueSet]">The translation, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27729).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.65-2016-02-01-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.65-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.69-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.69-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.69-errors-abstract" />
      <sch:assert id="a-2228-12496" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.69'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12496) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.69" (CONF:2228-12497). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27299).</sch:assert>
      <sch:assert id="a-2228-27660" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27660).</sch:assert>
      <sch:assert id="a-2228-27661" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27661).</sch:assert>
      <sch:assert id="a-2228-28104" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28104).</sch:assert>
      <sch:assert id="a-2228-28105" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28105).</sch:assert>
      <sch:assert id="a-2228-28407" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-28407).</sch:assert>
      <sch:assert id="a-2228-28408" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-28408).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.69-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.69']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.69-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.81-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.81-2016-02-01-errors-abstract" abstract="true">
      <sch:assert id="a-2228-13189" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.81'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-13189) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.81" (CONF:2228-13190). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-28308).</sch:assert>
      <sch:assert id="a-2228-28302" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-28302).</sch:assert>
      <sch:assert id="a-2228-28303" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-28303).</sch:assert>
      <sch:assert id="a-2228-28304" test="count(cda:participant[@typeCode='ORG'])=1">SHALL contain exactly one [1..1] participant (CONF:2228-28304) such that it SHALL contain exactly one [1..1] @typeCode="ORG" Origin (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-28313).</sch:assert>
      <sch:assert id="a-2228-28310" test="cda:code[@code='77305-1']">This code SHALL contain exactly one [1..1] @code="77305-1" Transferred from (CONF:2228-28310).</sch:assert>
      <sch:assert id="a-2228-28311" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2228-28311).</sch:assert>
      <sch:assert id="a-2228-28312" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-28312).</sch:assert>
      <sch:assert id="a-2228-28306" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" Encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28306).</sch:assert>
      <sch:assert id="a-2228-28307" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28307).</sch:assert>
      <sch:assert id="a-2228-28309" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-28309).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.81-2016-02-01-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.81']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.81-2016-02-01-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.81-2016-02-01-28304-branch-28304-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28305-branch-28304" test="count(cda:time)=1">SHALL contain exactly one [1..1] time (CONF:2228-28305).</sch:assert>
      <sch:assert id="a-2228-28316-branch-28304" test="count(cda:participantRole)=1">SHALL contain exactly one [1..1] participantRole (CONF:2228-28316).</sch:assert>
      <sch:assert id="a-2228-28317-branch-28304" test="cda:participantRole[count(cda:code)=1]">This participantRole SHALL contain exactly one [1..1] code (CONF:2228-28317).</sch:assert>
      <sch:assert id="a-2228-28314-branch-28304" test="cda:time[count(cda:low)=1]">This time SHALL contain exactly one [1..1] low (CONF:2228-28314).</sch:assert>
      <sch:assert id="a-2228-28321-branch-28304" test="cda:participantRole/cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-28321).</sch:assert>
      <sch:assert id="a-2228-28320-branch-28304" test="cda:participantRole[@classCode='LOCE']">This participantRole SHALL contain exactly one [1..1] @classCode="LOCE" Located entity (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-28320).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.81-2016-02-01-28304-branch-28304-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.81']]/cda:participant[@typeCode='ORG']">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.81-2016-02-01-28304-branch-28304-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.141-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.141-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28410" test="count(cda:templateId)=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28410).</sch:assert>
      <sch:assert id="a-2228-28411" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-28411).</sch:assert>
      <sch:assert id="a-2228-28412" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28412).</sch:assert>
      <sch:assert id="a-2228-28413" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28413).</sch:assert>
      <sch:assert id="a-2228-28414" test="cda:templateId[@root='2.16.840.1.113883.10.20.24.3.141']">This templateId SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.141" (CONF:2228-28414).</sch:assert>
      <sch:assert id="a-2228-28415" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-28415).</sch:assert>
      <sch:assert id="a-2228-28416" test="cda:code[@code='ENC' and @codeSystem='2.16.840.1.113883.5.6']">This code SHALL contain exactly one [1..1] @code="ENC" encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28416).</sch:assert>
      <sch:assert id="a-2228-28417" test="count(cda:entryRelationship)=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-28417) such that it</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.141-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.141']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.141-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.141-28417-branch-28417-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28418-branch-28417" test="@typeCode='SUBJ'">SHALL contain exactly one [1..1] @typeCode="SUBJ" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28418).</sch:assert>
      <sch:assert id="a-2228-28419-branch-28417" test="count(cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.81' and @extension = '2016-02-01']])=1">SHALL contain exactly one [1..1] Transfer From (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.81:2016-02-01) (CONF:2228-28419).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.141-28417-branch-28417-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.141']]/cda:entryRelationship">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.141-28417-branch-28417-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.142-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.142-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28420" test="count(cda:entryRelationship)=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-28420) such that it</sch:assert>
      <sch:assert id="a-2228-28421" test="count(cda:templateId)=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28421).</sch:assert>
      <sch:assert id="a-2228-28422" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-28422).</sch:assert>
      <sch:assert id="a-2228-28424" test="cda:templateId[@root='2.16.840.1.113883.10.20.24.3.142']">This templateId SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.142" (CONF:2228-28424).</sch:assert>
      <sch:assert id="a-2228-28425" test="cda:code[@code='ENC' and @codeSystem='2.16.840.1.113883.5.6']">This code SHALL contain exactly one [1..1] @code="ENC" encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28425).</sch:assert>
      <sch:assert id="a-2228-28426" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28426).</sch:assert>
      <sch:assert id="a-2228-28427" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28427).</sch:assert>
      <sch:assert id="a-2228-28428" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-28428).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.142-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.142']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.142-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.142-28420-branch-28420-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28423-branch-28420" test="count(cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.82' and @extension = '2016-02-01']])=1">SHALL contain exactly one [1..1] Transfer To (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.82:2016-02-01) (CONF:2228-28423).</sch:assert>
      <sch:assert id="a-2228-28429-branch-28420" test="@typeCode='SUBJ'">SHALL contain exactly one [1..1] @typeCode="SUBJ" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28429).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.142-28420-branch-28420-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.142']]/cda:entryRelationship">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.142-28420-branch-28420-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.82-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.82-2016-02-01-errors-abstract" abstract="true">
      <sch:assert id="a-2228-13182" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.82'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-13182) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.82" (CONF:2228-13183).</sch:assert>
      <sch:assert id="a-2228-28352" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-28352).</sch:assert>
      <sch:assert id="a-2228-28353" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-28353).</sch:assert>
      <sch:assert id="a-2228-28354" test="count(cda:participant[@typeCode='DST'])=1">SHALL contain exactly one [1..1] participant (CONF:2228-28354) such that it SHALL contain exactly one [1..1] @typeCode="DST" Destination (CONF:2228-28364).</sch:assert>
      <sch:assert id="a-2228-28361" test="cda:code[@code='77306-9']">This code SHALL contain exactly one [1..1] @code="77306-9" Discharge disposition (CONF:2228-28361).</sch:assert>
      <sch:assert id="a-2228-28358" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" Encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28358).</sch:assert>
      <sch:assert id="a-2228-28360" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-28360).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.82-2016-02-01-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.82']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.82-2016-02-01-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.82-2016-02-01-28354-branch-28354-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28355-branch-28354" test="count(cda:time)=1">SHALL contain exactly one [1..1] time (CONF:2228-28355).</sch:assert>
      <sch:assert id="a-2228-28365-branch-28354" test="cda:time[count(cda:low)=1]">This time SHALL contain exactly one [1..1] low (CONF:2228-28365).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.82-2016-02-01-28354-branch-28354-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.82']]/cda:participant[@typeCode='DST']">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.82-2016-02-01-28354-branch-28354-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.1.1-2016-02-01-errors">
    <!--Pattern is used in an implied relationship.-->
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.1.1-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.1.1-2015-08-01-errors-abstract" />
      <sch:assert id="a-2228-12910" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12910) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.1.1" (CONF:2228-14613). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27005).</sch:assert>
      <sch:assert id="a-2228-12914" test="count(cda:custodian)=1">SHALL contain exactly one [1..1] custodian (CONF:2228-12914).</sch:assert>
      <sch:assert id="a-2228-12915" test="cda:custodian[count(cda:assignedCustodian)=1]">This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:2228-12915).</sch:assert>
      <sch:assert id="a-2228-12916" test="cda:custodian/cda:assignedCustodian[count(cda:representedCustodianOrganization)=1]">This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:2228-12916).</sch:assert>
      <sch:assert id="a-2228-12918" test="count(cda:component)=1">SHALL contain exactly one [1..1] component (CONF:2228-12918).</sch:assert>
      <sch:assert id="a-2228-12919" test="cda:component[count(cda:structuredBody)=1]">This component SHALL contain exactly one [1..1] structuredBody (CONF:2228-12919).</sch:assert>
      <sch:assert id="a-2228-12920" test="cda:component/cda:structuredBody[count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']])=1])=1]">This structuredBody SHALL contain exactly one [1..1] component (CONF:2228-12920) such that it SHALL contain exactly one [1..1] Measure Section (identifier: urn:oid:2.16.840.1.113883.10.20.24.2.2) (CONF:2228-17078).</sch:assert>
      <sch:assert id="a-2228-12923" test="cda:component/cda:structuredBody[count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']])=1])=1]">This structuredBody SHALL contain exactly one [1..1] component (CONF:2228-12923) such that it SHALL contain exactly one [1..1] Reporting Parameters Section (identifier: urn:oid:2.16.840.1.113883.10.20.17.2.1) (CONF:2228-17079).</sch:assert>
      <sch:assert id="a-2228-12924" test="cda:component/cda:structuredBody[count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.4']])=1])=1]">This structuredBody SHALL contain exactly one [1..1] component (CONF:2228-12924) such that it SHALL contain exactly one [1..1] Patient Data Section (identifier: urn:oid:2.16.840.1.113883.10.20.17.2.4) (CONF:2228-17080).</sch:assert>
      <sch:assert id="a-2228-12911" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-12911).</sch:assert>
      <sch:assert id="a-2228-12913" test="count(cda:recordTarget)=1">SHALL contain exactly one [1..1] recordTarget (CONF:2228-12913).</sch:assert>
      <sch:assert id="a-2228-28387" test="cda:recordTarget[count(cda:patientRole)=1]">This recordTarget SHALL contain exactly one [1..1] patientRole (CONF:2228-28387).</sch:assert>
      <sch:assert id="a-2228-12917-c" test="count(cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization) = 1">This assignedCustodian SHALL represent the organization that owns and reports the data (CONF:2228-12917).</sch:assert>
      <sch:assert id="a-2228-28137" test="cda:code[@code='55182-0']">This code SHALL contain exactly one [1..1] @code="55182-0" Quality Measure Report (CONF:2228-28137).</sch:assert>
      <sch:assert id="a-2228-28138" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2228-28138).</sch:assert>
      <sch:assert id="a-2228-12912" test="count(cda:title)=1">SHALL contain exactly one [1..1] title (CONF:2228-12912).</sch:assert>
      <sch:assert id="a-2228-13817" test="count(cda:legalAuthenticator)=1">SHALL contain exactly one [1..1] legalAuthenticator (CONF:2228-13817).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.1.1-2016-02-01-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.1.1-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.1.2-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.1.2-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.1.1-2016-02-01-errors-abstract" />
      <sch:assert id="a-2228-12972" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12972) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.1.2" (CONF:2228-26943). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-26944).</sch:assert>
      <sch:assert id="a-2228-12973" test="count(cda:component[count(cda:structuredBody[count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.3']])=1])=1][count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']])=1])=1][count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.1' and @extension = '2016-02-01']])=1])=1])=1])=1">SHALL contain exactly one [1..1] component (CONF:2228-12973) such that it SHALL contain exactly one [1..1] structuredBody (CONF:2228-17081). This structuredBody SHALL contain exactly one [1..1] component (CONF:2228-17082). This component SHALL contain exactly one [1..1] Measure Section QDM (identifier: urn:oid:2.16.840.1.113883.10.20.24.2.3) (CONF:2228-17083). This structuredBody SHALL contain exactly one [1..1] component (CONF:2228-17090). This component SHALL contain exactly one [1..1] Reporting Parameters Section (identifier: urn:oid:2.16.840.1.113883.10.20.17.2.1) (CONF:2228-17092). This structuredBody SHALL contain exactly one [1..1] component (CONF:2228-17091). This component SHALL contain exactly one [1..1] Patient Data Section QDM (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.2.1:2016-02-01) (CONF:2228-17093).</sch:assert>
      <sch:assert id="a-2228-16598" test="count(cda:recordTarget)=1">SHALL contain exactly one [1..1] recordTarget (CONF:2228-16598).</sch:assert>
      <sch:assert id="a-2228-16856" test="cda:recordTarget[count(cda:patientRole)=1]">This recordTarget SHALL contain exactly one [1..1] patientRole (CONF:2228-16856).</sch:assert>
      <sch:assert id="a-2228-27570" test="cda:recordTarget/cda:patientRole[count(cda:patient)=1]">This patientRole SHALL contain exactly one [1..1] patient (CONF:2228-27570).</sch:assert>
      <sch:assert id="a-2228-16704" test="not(cda:informationRecipient) or cda:informationRecipient[count(cda:intendedRecipient)=1]">The informationRecipient, if present, SHALL contain exactly one [1..1] intendedRecipient (CONF:2228-16704).</sch:assert>
      <sch:assert id="a-2228-16705" test="not(cda:informationRecipient/cda:intendedRecipient) or cda:informationRecipient/cda:intendedRecipient[count(cda:id) &gt; 0]">This intendedRecipient SHALL contain at least one [1..*] id (CONF:2228-16705).</sch:assert>
      <sch:assert id="a-2228-16600" test="count(cda:custodian)=1">SHALL contain exactly one [1..1] custodian (CONF:2228-16600).</sch:assert>
      <sch:assert id="a-2228-28239" test="cda:custodian[count(cda:assignedCustodian)=1]">This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:2228-28239).</sch:assert>
      <sch:assert id="a-2228-28240" test="cda:custodian/cda:assignedCustodian[count(cda:representedCustodianOrganization)=1]">This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:2228-28240).</sch:assert>
      <sch:assert id="a-2228-27571" test="cda:recordTarget/cda:patientRole/cda:patient[count(cda:birthTime)=1]">This patient SHALL contain exactly one [1..1] birthTime (CONF:2228-27571).</sch:assert>
      <sch:assert id="a-2228-27572" test="cda:recordTarget/cda:patientRole/cda:patient[count(cda:administrativeGenderCode)=1]">This patient SHALL contain exactly one [1..1] administrativeGenderCode (CONF:2228-27572).</sch:assert>
      <sch:assert id="a-2228-27573" test="cda:recordTarget/cda:patientRole/cda:patient[count(cda:raceCode)=1]">This patient SHALL contain exactly one [1..1] raceCode (CONF:2228-27573).</sch:assert>
      <sch:assert id="a-2228-27574" test="cda:recordTarget/cda:patientRole/cda:patient[count(cda:ethnicGroupCode)=1]">This patient SHALL contain exactly one [1..1] ethnicGroupCode (CONF:2228-27574).</sch:assert>
      <sch:assert id="a-2228-16859-c" test="not(testable)">Coded fields MAY contain the @sdtc:valueSet extension to reference the value set from which the supplied code was drawn. (See Appendix for more details on the use of this extension) (CONF:2228-16859).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.1.2-2016-02-01-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.1.2-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.30-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.30-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-errors-abstract" />
      <sch:assert id="a-2228-13659" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.30'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-13659) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.30" (CONF:2228-13660). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27017).</sch:assert>
      <sch:assert id="a-2228-13679" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'][count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.32' and @extension = '2016-02-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-13679) such that it SHALL contain exactly one [1..1] @typeCode="CAUS" (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-13680). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-13681). SHALL contain exactly one [1..1] Intervention Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.32:2016-02-01) (CONF:2228-13683).</sch:assert>
      <sch:assert id="a-2228-16414" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-16414).</sch:assert>
      <sch:assert id="a-2228-16415" test="cda:value[@xsi:type='CD'][@code='102460003']">This value SHALL contain exactly one [1..1] @code="102460003" Decreased tolerance (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-16415).</sch:assert>
      <sch:assert id="a-2228-13657" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-13657).</sch:assert>
      <sch:assert id="a-2228-13658" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-13658).</sch:assert>
      <sch:assert id="a-2228-13661" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:2228-13661).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.30-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.30']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.30-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.31-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.31-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.39-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-13743" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.31'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-13743) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.31" (CONF:2228-13744). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-26556).</sch:assert>
      <sch:assert id="a-2228-13746" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-13746).</sch:assert>
      <sch:assert id="a-2228-27343" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27343).</sch:assert>
      <sch:assert id="a-2228-13742" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-13742).</sch:assert>
      <sch:assert id="a-2228-27632" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27632).</sch:assert>
      <sch:assert id="a-2228-27353" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27353).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.31-2016-02-01-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.31']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.31-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.103-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.103-2016-02-01-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16544" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-16544).</sch:assert>
      <sch:assert id="a-2228-26962" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.103'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-26962) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.103" (CONF:2228-26963). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27781).</sch:assert>
      <sch:assert id="a-2228-16540" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-16540).</sch:assert>
      <sch:assert id="a-2228-16541" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-16541).</sch:assert>
      <sch:assert id="a-2228-16545" test="cda:code[@code='ASSERTION']">This code SHALL contain exactly one [1..1] @code="ASSERTION" (CONF:2228-16545).</sch:assert>
      <sch:assert id="a-2228-28135" test="cda:code[@codeSystem='2.16.840.1.113883.5.4']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:2228-28135).</sch:assert>
      <sch:assert id="a-2228-16536" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CONF:2228-16536).</sch:assert>
      <sch:assert id="a-2228-16537" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-16537).</sch:assert>
      <sch:assert id="a-2228-16538" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-16538).</sch:assert>
      <sch:assert id="a-2228-16539" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" Completed (CONF:2228-16539).</sch:assert>
      <sch:assert id="a-2228-27670" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-27670).</sch:assert>
      <sch:assert id="a-2228-27672" test="cda:value[@xsi:type='CD'][@sdtc:valueSet]">This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27672).</sch:assert>
      <sch:assert id="a-2228-28623" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28623).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.103-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.103']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.103-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.114-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.114-2016-02-01-errors-abstract" abstract="true">
      <sch:assert id="a-2228-27767" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27767).</sch:assert>
      <sch:assert id="a-2228-27768" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.114'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-27768) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.114" (CONF:2228-27772). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27780).</sch:assert>
      <sch:assert id="a-2228-27769" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-27769).</sch:assert>
      <sch:assert id="a-2228-27770" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-27770).</sch:assert>
      <sch:assert id="a-2228-28218" test="not(cda:participant) or cda:participant[count(cda:participantRole)=1]">The participant, if present, SHALL contain exactly one [1..1] participantRole (CONF:2228-28218).</sch:assert>
      <sch:assert id="a-2228-27771" test="cda:code[@code='ASSERTION']">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:2228-27771).</sch:assert>
      <sch:assert id="a-2228-28136" test="cda:code[@codeSystem='2.16.840.1.113883.5.4']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:2228-28136).</sch:assert>
      <sch:assert id="a-2228-27777" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-27777).</sch:assert>
      <sch:assert id="a-2228-27779" test="cda:value[@xsi:type='CD'][@sdtc:valueSet]">This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27779).</sch:assert>
      <sch:assert id="a-2228-27773" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CONF:2228-27773).</sch:assert>
      <sch:assert id="a-2228-27774" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27774).</sch:assert>
      <sch:assert id="a-2228-27775" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-27775).</sch:assert>
      <sch:assert id="a-2228-27776" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" Completed (CONF:2228-27776).</sch:assert>
      <sch:assert id="a-2228-28101" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28101).</sch:assert>
      <sch:assert id="a-2228-28219" test="not(cda:participant) or cda:participant[@typeCode='IND']">The participant, if present, SHALL contain exactly one [1..1] @typeCode="IND" individual (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-28219).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.114-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.114']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.114-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.48-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.48-2016-02-01-errors-abstract" abstract="true">
      <sch:assert id="a-2228-12466" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.48'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12466) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.48" (CONF:2228-12467). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27290).</sch:assert>
      <sch:assert id="a-2228-12470" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-12470).</sch:assert>
      <sch:assert id="a-2228-12472" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-12472).</sch:assert>
      <sch:assert id="a-2228-13038" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-13038).</sch:assert>
      <sch:assert id="a-2228-13037" test="cda:code[@code='77218-6']">This code SHALL contain exactly one [1..1] @code="77218-6" Patient satisfaction with healthcare delivery (CONF:2228-13037).</sch:assert>
      <sch:assert id="a-2228-27555" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2228-27555).</sch:assert>
      <sch:assert id="a-2228-12464" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" observation, which SHALL be selected from CodeSystem HL7ActClass (urn:oid:2.16.840.1.113883.5.6) (CONF:2228-12464).</sch:assert>
      <sch:assert id="a-2228-12465" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" event, which SHALL be selected from CodeSystem ActMood (urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12465).</sch:assert>
      <sch:assert id="a-2228-12469" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-12469).</sch:assert>
      <sch:assert id="a-2228-12471" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed", which SHALL be selected from CodeSystem ActStatus (urn:oid:2.16.840.1.113883.5.14) (CONF:2228-12471).</sch:assert>
      <sch:assert id="a-2228-27553" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-27553).</sch:assert>
      <sch:assert id="a-2228-27647" test="cda:value[@xsi:type='CD'][@sdtc:valueSet]">This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27647).</sch:assert>
      <sch:assert id="a-2228-28085" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28085).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.48-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.48']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.48-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.67-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.67-2016-02-01-errors-abstract" abstract="true">
      <sch:assert id="a-2228-12481" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.67'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12481) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.67" (CONF:2228-12482). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27293).</sch:assert>
      <sch:assert id="a-2228-12485" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-12485).</sch:assert>
      <sch:assert id="a-2228-12572" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-12572).</sch:assert>
      <sch:assert id="a-2228-12479" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" observation, which SHALL be selected from CodeSystem HL7ActClass (urn:oid:2.16.840.1.113883.5.6) (CONF:2228-12479).</sch:assert>
      <sch:assert id="a-2228-12480" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" event, which SHALL be selected from CodeSystem ActMood (urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12480).</sch:assert>
      <sch:assert id="a-2228-12484" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-12484).</sch:assert>
      <sch:assert id="a-2228-27562" test="cda:code[@code='77219-4']">This code SHALL contain exactly one [1..1] @code="77219-4" Provider satisfaction with healthcare delivery (CONF:2228-27562).</sch:assert>
      <sch:assert id="a-2228-27563" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2228-27563).</sch:assert>
      <sch:assert id="a-2228-12486" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed", which SHALL be selected from CodeSystem ActStatus (urn:oid:2.16.840.1.113883.5.14) (CONF:2228-12486).</sch:assert>
      <sch:assert id="a-2228-12487" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-12487).</sch:assert>
      <sch:assert id="a-2228-27655" test="cda:value[@xsi:type='CD'][@sdtc:valueSet]">This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27655).</sch:assert>
      <sch:assert id="a-2228-28100" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28100).</sch:assert>
      <sch:assert id="a-2228-28435" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-28435).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.67-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.67']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.67-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.51-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.51-2016-02-01-errors-abstract" abstract="true">
      <sch:assert id="a-2228-12537" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.51'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12537) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.51" (CONF:2228-12538). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27026).</sch:assert>
      <sch:assert id="a-2228-16712" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-16712).</sch:assert>
      <sch:assert id="a-2228-12536" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-12536).</sch:assert>
      <sch:assert id="a-2228-13041" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-13041).</sch:assert>
      <sch:assert id="a-2228-27648" test="cda:value[@xsi:type='CD'][@sdtc:valueSet]">This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27648).</sch:assert>
      <sch:assert id="a-2228-12526" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" event, which SHALL be selected from CodeSystem ActMood (urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12526).</sch:assert>
      <sch:assert id="a-2228-27668" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-27668).</sch:assert>
      <sch:assert id="a-2228-28130" test="cda:code[@code='ASSERTION']">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:2228-28130).</sch:assert>
      <sch:assert id="a-2228-28131" test="cda:code[@codeSystem='2.16.840.1.113883.5.4']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:2228-28131).</sch:assert>
      <sch:assert id="a-2228-13042" test="count(cda:statusCode[@code='active'])=1">SHALL contain exactly one [1..1] statusCode="active" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-13042).</sch:assert>
      <sch:assert id="a-2228-16711" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-16711).</sch:assert>
      <sch:assert id="a-2228-26996" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-26996).</sch:assert>
      <sch:assert id="a-2228-28086" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28086).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.51-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.51']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.51-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.54-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.54-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.79-2015-08-01-errors-abstract" />
      <sch:assert id="a-2228-12540" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.54'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12540) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.54" (CONF:2228-12541). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27014).</sch:assert>
      <sch:assert id="a-2228-28087" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28087).</sch:assert>
      <sch:assert id="a-2228-28088" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28088).</sch:assert>
      <sch:assert id="a-2228-28089" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28089).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.54-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.54']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.54-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.17-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.17-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-13412" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.17'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-13412) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.17" (CONF:2228-13413). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27069).</sch:assert>
      <sch:assert id="a-2228-27615" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27615).</sch:assert>
      <sch:assert id="a-2228-27340" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27340).</sch:assert>
      <sch:assert id="a-2228-13411" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-13411).</sch:assert>
      <sch:assert id="a-2228-27408" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27408).</sch:assert>
      <sch:assert id="a-2228-27616" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27616).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.17-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.17']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.17-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.19-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.19-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-13393" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.19'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-13393) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.19" (CONF:2228-13394). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27070).</sch:assert>
      <sch:assert id="a-2228-27619" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27619).</sch:assert>
      <sch:assert id="a-2228-13400" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-13400).</sch:assert>
      <sch:assert id="a-2228-13392" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-13392).</sch:assert>
      <sch:assert id="a-2228-27406" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27406).</sch:assert>
      <sch:assert id="a-2228-27620" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27620).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.19-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.19']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.19-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.26-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.26-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.13-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-12753" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.26'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12753) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.26" (CONF:2228-12754). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27138).</sch:assert>
      <sch:assert id="a-2228-12758" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-12758).</sch:assert>
      <sch:assert id="a-2228-12760" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-12760).</sch:assert>
      <sch:assert id="a-2228-27628" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27628).</sch:assert>
      <sch:assert id="a-2228-12759" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-12759).</sch:assert>
      <sch:assert id="a-2228-12752" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12752).</sch:assert>
      <sch:assert id="a-2228-27560" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-27560).</sch:assert>
      <sch:assert id="a-2228-27372" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27372).</sch:assert>
      <sch:assert id="a-2228-27629" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27629).</sch:assert>
      <sch:assert id="a-2228-27718" test="not(cda:methodCode) or cda:methodCode[@sdtc:valueSet]">The methodCode, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27718).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.26-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.26']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.26-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.25-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.25-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-12775" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.25'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12775) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.25" (CONF:2228-12776). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27071).</sch:assert>
      <sch:assert id="a-2228-12778" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-12778).</sch:assert>
      <sch:assert id="a-2228-27342" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27342).</sch:assert>
      <sch:assert id="a-2228-12774" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12774).</sch:assert>
      <sch:assert id="a-2228-27627" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27627).</sch:assert>
      <sch:assert id="a-2228-27725" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27725).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.25-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.25']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.25-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.27-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.27-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-12815" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.27'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12815) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.27" (CONF:2228-12816). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27072).</sch:assert>
      <sch:assert id="a-2228-27630" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27630).</sch:assert>
      <sch:assert id="a-2228-27348" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27348).</sch:assert>
      <sch:assert id="a-2228-12814" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12814).</sch:assert>
      <sch:assert id="a-2228-27631" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27631).</sch:assert>
      <sch:assert id="a-2228-27724" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27724).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.27-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.27']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.27-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.6-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.6-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-12148" test="count(cda:entryRelationship[@typeCode='MFST'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85' and @extension = '2014-12-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-12148) such that it SHALL contain exactly one [1..1] Reaction (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.85:2014-12-01) (CONF:2228-27127). SHALL contain exactly one [1..1] @typeCode="MFST" is manifestation of (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-12149). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-12150).</sch:assert>
      <sch:assert id="a-2228-12140" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-12140).</sch:assert>
      <sch:assert id="a-2228-12141" test="count(cda:participant[@typeCode='PRD'][count(cda:participantRole[@classCode='MANU'][count(cda:playingDevice[@classCode='DEV'][count(cda:code)=1])=1])=1])=1">SHALL contain exactly one [1..1] participant (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:2228-12141) such that it SHALL contain exactly one [1..1] participantRole (CONF:2228-12143). This participantRole SHALL contain exactly one [1..1] playingDevice (CONF:2228-12145). This playingDevice SHALL contain exactly one [1..1] code (CONF:2228-12147). This playingDevice SHALL contain exactly one [1..1] @classCode="DEV" device (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12146). This participantRole SHALL contain exactly one [1..1] @classCode="MANU" manufactured product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12144). SHALL contain exactly one [1..1] @typeCode="PRD" product (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12142).</sch:assert>
      <sch:assert id="a-2228-12188" test="cda:value[@xsi:type='CD'][@code='419199007']">This value SHALL contain exactly one [1..1] @code="419199007" allergy to substance (CONF:2228-12188).</sch:assert>
      <sch:assert id="a-2228-28437" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28437).</sch:assert>
      <sch:assert id="a-2228-28438" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28438).</sch:assert>
      <sch:assert id="a-2228-28439" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28439).</sch:assert>
      <sch:assert id="a-2228-28440" test="cda:value[@xsi:type='CD'][@codeSystem]">This value SHALL contain exactly one [1..1] @codeSystem (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-28440).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.6-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.6']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.6-2016-02-01-errors-abstract" />
      <sch:assert id="a-2228-12134" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.6'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12134) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.6" (CONF:2228-26941). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27033).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.6-2016-02-01-12141-branch-12141-errors-abstract" abstract="true">
      <sch:assert id="a-2228-27583-branch-12141" test="cda:participantRole/cda:playingDevice/cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27583).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.6-2016-02-01-12141-branch-12141-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.6']]/cda:participant[cda:participantRole[cda:playingDevice[cda:code][@classCode='DEV']][@classCode='MANU']][@typeCode='PRD']">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.6-2016-02-01-12141-branch-12141-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.8-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.8-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-12170" test="count(cda:participant[@typeCode='PRD'][count(cda:participantRole[@classCode='MANU'][count(cda:playingDevice[@classCode='DEV'][count(cda:code)=1])=1])=1])=1">SHALL contain exactly one [1..1] participant (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:2228-12170) such that it SHALL contain exactly one [1..1] participantRole (CONF:2228-12172). This participantRole SHALL contain exactly one [1..1] playingDevice (CONF:2228-12174). This playingDevice SHALL contain exactly one [1..1] code (CONF:2228-12176). This playingDevice SHALL contain exactly one [1..1] @classCode="DEV" device (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12175). This participantRole SHALL contain exactly one [1..1] @classCode="MANU" manufactured product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12173). SHALL contain exactly one [1..1] @typeCode="PRD" product (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12171).</sch:assert>
      <sch:assert id="a-2228-12342" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-12342).</sch:assert>
      <sch:assert id="a-2228-26936" test="cda:value[@xsi:type='CD'][@code='420134006']">This value SHALL contain exactly one [1..1] @code="420134006" propensity to adverse reactions (CONF:2228-26936).</sch:assert>
      <sch:assert id="a-2228-26937" test="cda:value[@xsi:type='CD'][@codeSystem='2.16.840.1.113883.6.96']">This value SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-26937).</sch:assert>
      <sch:assert id="a-2228-28053" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28053).</sch:assert>
      <sch:assert id="a-2228-28054" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28054).</sch:assert>
      <sch:assert id="a-2228-28055" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28055).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.8-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.8']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.8-2016-02-01-errors-abstract" />
      <sch:assert id="a-2228-12162" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.8'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12162) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.8" (CONF:2228-26940). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27034).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.8-2016-02-01-12170-branch-12170-errors-abstract" abstract="true">
      <sch:assert id="a-2228-27585-branch-12170" test="cda:participantRole/cda:playingDevice/cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27585).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.8-2016-02-01-12170-branch-12170-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.8']]/cda:participant[cda:participantRole[cda:playingDevice[cda:code][@classCode='DEV']][@classCode='MANU']][@typeCode='PRD']">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.8-2016-02-01-12170-branch-12170-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.130-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.130-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28441" test="count(cda:templateId) &gt; 0">SHALL contain at least one [1..*] templateId (CONF:2228-28441) such that it</sch:assert>
      <sch:assert id="a-2228-28442" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-28442).</sch:assert>
      <sch:assert id="a-2228-28443" test="count(cda:entryRelationship)=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-28443) such that it</sch:assert>
      <sch:assert id="a-2228-28444" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28444).</sch:assert>
      <sch:assert id="a-2228-28445" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28445).</sch:assert>
      <sch:assert id="a-2228-28448" test="cda:code[@code='SPLY']">This code SHALL contain exactly one [1..1] @code="SPLY" Supply (CONF:2228-28448).</sch:assert>
      <sch:assert id="a-2228-28449" test="cda:code[@codeSystem]">This code SHALL contain exactly one [1..1] @codeSystem (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28449).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.130-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.130']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.130-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.130-28441-branch-28441-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28447-branch-28441" test="@root='2.16.840.1.113883.10.20.24.3.130'">SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.130" (CONF:2228-28447).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.130-28441-branch-28441-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.130']]/cda:templateId">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.130-28441-branch-28441-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.130-28443-branch-28443-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28450-branch-28443" test="@typeCode='SUBJ'">SHALL contain exactly one [1..1] @typeCode="SUBJ" Has subject  (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28450).</sch:assert>
      <sch:assert id="a-2228-28451-branch-28443" test="count(cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9' and @extension = '2016-02-01']])=1">SHALL contain exactly one [1..1] Device Order (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.9:2016-02-01) (CONF:2228-28451).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.130-28443-branch-28443-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.130']]/cda:entryRelationship">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.130-28443-branch-28443-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.9-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.9-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.43-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-12344" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12344) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.9" (CONF:2228-12345). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27091).</sch:assert>
      <sch:assert id="a-2228-12349" test="count(cda:participant[@typeCode='DEV'][count(cda:participantRole[@classCode='MANU'][count(cda:playingDevice[@classCode='DEV'][count(cda:code)=1])=1])=1])=1">SHALL contain exactly one [1..1] participant (CONF:2228-12349) such that it SHALL contain exactly one [1..1] participantRole (CONF:2228-12351). This participantRole SHALL contain exactly one [1..1] playingDevice (CONF:2228-12353). This playingDevice SHALL contain exactly one [1..1] code (CONF:2228-12355). This playingDevice SHALL contain exactly one [1..1] @classCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12354). This participantRole SHALL contain exactly one [1..1] @classCode="MANU" manufactured product, which SHALL be selected from CodeSystem RoleClass (urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12352). SHALL contain exactly one [1..1] @typeCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12350).</sch:assert>
      <sch:assert id="a-2228-12343" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request, which SHALL be selected from CodeSystem ActMood (urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12343).</sch:assert>
      <sch:assert id="a-2228-27721" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27721).</sch:assert>
      <sch:assert id="a-2228-27723" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" Supply (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27723).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.9-2016-02-01-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.9-2016-02-01-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.9-2016-02-01-12349-branch-12349-errors-abstract" abstract="true">
      <sch:assert id="a-2228-27586-branch-12349" test="cda:participantRole/cda:playingDevice/cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27586).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.9-2016-02-01-12349-branch-12349-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9']]/cda:participant[cda:participantRole[cda:playingDevice[cda:code][@classCode='DEV']][@classCode='MANU']][@typeCode='DEV']">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.9-2016-02-01-12349-branch-12349-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.7-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.7-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.14-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-12391" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12391) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.7" (CONF:2228-12392). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27132).</sch:assert>
      <sch:assert id="a-2228-12396" test="count(cda:participant[@typeCode='DEV'][count(cda:participantRole[@classCode='MANU'][count(cda:playingDevice[@classCode='DEV'][count(cda:code)=1])=1])=1])=1">SHALL contain exactly one [1..1] participant (CONF:2228-12396) such that it SHALL contain exactly one [1..1] participantRole (CONF:2228-12398). This participantRole SHALL contain exactly one [1..1] playingDevice (CONF:2228-12400). This playingDevice SHALL contain exactly one [1..1] code (CONF:2228-12402). This playingDevice SHALL contain exactly one [1..1] @classCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12401). This participantRole SHALL contain exactly one [1..1] @classCode="MANU" manufactured product, which SHALL be selected from CodeSystem RoleClass (urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12399). SHALL contain exactly one [1..1] @typeCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12397).</sch:assert>
      <sch:assert id="a-2228-12414" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-12414).</sch:assert>
      <sch:assert id="a-2228-12395" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-12395).</sch:assert>
      <sch:assert id="a-2228-12415" test="cda:code[@code='360030002']">This code SHALL contain exactly one [1..1] @code="360030002" application of device (CONF:2228-12415).</sch:assert>
      <sch:assert id="a-2228-27536" test="cda:code[@codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-27536).</sch:assert>
      <sch:assert id="a-2228-12394" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed", which SHALL be selected from CodeSystem ActStatus (urn:oid:2.16.840.1.113883.5.14) (CONF:2228-12394).</sch:assert>
      <sch:assert id="a-2228-27537" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-27537).</sch:assert>
      <sch:assert id="a-2228-27731" test="not(cda:targetSiteCode/cda:translation) or cda:targetSiteCode/cda:translation[@sdtc:valueSet]">The translation, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27731).</sch:assert>
      <sch:assert id="a-2228-28050" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28050).</sch:assert>
      <sch:assert id="a-2228-28051" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28051).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.7-2016-02-01-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.7-2016-02-01-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.7-2016-02-01-12396-branch-12396-errors-abstract" abstract="true">
      <sch:assert id="a-2228-27584-branch-12396" test="cda:participantRole/cda:playingDevice/cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27584).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.7-2016-02-01-12396-branch-12396-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7']]/cda:participant[cda:participantRole[cda:playingDevice[cda:code][@classCode='DEV']][@classCode='MANU']][@typeCode='DEV']">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.7-2016-02-01-12396-branch-12396-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.10-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.10-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.43-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-12369" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12369) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.10" (CONF:2228-12370). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27094).</sch:assert>
      <sch:assert id="a-2228-12374" test="count(cda:participant[@typeCode='DEV'][count(cda:participantRole[@classCode='MANU'][count(cda:playingDevice[@classCode='DEV'][count(cda:code)=1])=1])=1])=1">SHALL contain exactly one [1..1] participant (CONF:2228-12374) such that it SHALL contain exactly one [1..1] participantRole (CONF:2228-12376). This participantRole SHALL contain exactly one [1..1] playingDevice (CONF:2228-12378). This playingDevice SHALL contain exactly one [1..1] code (CONF:2228-12380). This playingDevice SHALL contain exactly one [1..1] @classCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12379). This participantRole SHALL contain exactly one [1..1] @classCode="MANU" manufactured product, which SHALL be selected from CodeSystem RoleClass (urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12377). SHALL contain exactly one [1..1] @typeCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12375).</sch:assert>
      <sch:assert id="a-2228-12368" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent, which SHALL be selected from CodeSystem ActMood (urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12368).</sch:assert>
      <sch:assert id="a-2228-27719" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27719).</sch:assert>
      <sch:assert id="a-2228-27722" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" Supply (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27722).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.10-2016-02-01-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.10-2016-02-01-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.10-2016-02-01-12374-branch-12374-errors-abstract" abstract="true">
      <sch:assert id="a-2228-27587-branch-12374" test="cda:participantRole/cda:playingDevice/cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27587).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.10-2016-02-01-12374-branch-12374-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10']]/cda:participant[cda:participantRole[cda:playingDevice[cda:code][@classCode='DEV']][@classCode='MANU']][@typeCode='DEV']">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.10-2016-02-01-12374-branch-12374-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.131-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.131-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28452" test="count(cda:templateId)=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28452) such that it</sch:assert>
      <sch:assert id="a-2228-28453" test="count(cda:entryRelationship)=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-28453) such that it</sch:assert>
      <sch:assert id="a-2228-28454" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28454).</sch:assert>
      <sch:assert id="a-2228-28455" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28455).</sch:assert>
      <sch:assert id="a-2228-28457" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-28457).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.131-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.131']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.131-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.131-28452-branch-28452-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28456-branch-28452" test="@root='2.16.840.1.113883.10.20.24.3.131'">SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.131" (CONF:2228-28456).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.131-28452-branch-28452-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.131']]/cda:templateId">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.131-28452-branch-28452-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.131-28453-branch-28453-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28458-branch-28453" test="@typeCode='SUBJ'">SHALL contain exactly one [1..1] @typeCode="SUBJ" has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28458).</sch:assert>
      <sch:assert id="a-2228-28459-branch-28453" test="count(cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10' and @extension = '2016-02-01']])=1">SHALL contain exactly one [1..1] Device Recommended (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.10:2016-02-01) (CONF:2228-28459).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.131-28453-branch-28453-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.131']]/cda:entryRelationship">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.131-28453-branch-28453-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.21-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.21-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.49-2015-08-01-errors-abstract" />
      <sch:assert id="a-2228-11888" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.21'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11888) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.21" (CONF:2228-11889). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-26551).</sch:assert>
      <sch:assert id="a-2228-11895" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-11895).</sch:assert>
      <sch:assert id="a-2228-11898" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-11898).</sch:assert>
      <sch:assert id="a-2228-27621" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27621).</sch:assert>
      <sch:assert id="a-2228-11896" test="cda:statusCode[@code='active']">This statusCode SHALL contain exactly one [1..1] @code="active" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-11896).</sch:assert>
      <sch:assert id="a-2228-26549" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-26549).</sch:assert>
      <sch:assert id="a-2228-27530" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27530).</sch:assert>
      <sch:assert id="a-2228-27531" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-27531).</sch:assert>
      <sch:assert id="a-2228-27622" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27622).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.21-2016-02-01-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.21']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.21-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.22-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.22-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.40-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-11933" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.22'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11933) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.22" (CONF:2228-11934). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27064).</sch:assert>
      <sch:assert id="a-2228-11936" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-11936).</sch:assert>
      <sch:assert id="a-2228-27341" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27341).</sch:assert>
      <sch:assert id="a-2228-11932" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11932).</sch:assert>
      <sch:assert id="a-2228-27623" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27623).</sch:assert>
      <sch:assert id="a-2228-27534" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" Encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27534).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.22-2016-02-01-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.22']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.22-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.132-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.132-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28467" test="count(cda:templateId)=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28467) such that it</sch:assert>
      <sch:assert id="a-2228-28468" test="count(cda:entryRelationship[count(cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.22' and @extension = '2016-02-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-28468) such that it SHALL contain exactly one [1..1] Encounter Order (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.22:2016-02-01) (CONF:2228-28474).</sch:assert>
      <sch:assert id="a-2228-28469" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28469).</sch:assert>
      <sch:assert id="a-2228-28470" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28470).</sch:assert>
      <sch:assert id="a-2228-28472" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-28472).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.132-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.132']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.132-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.132-28467-branch-28467-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28471-branch-28467" test="@root='2.16.840.1.113883.10.20.24.3.132'">SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.132" (CONF:2228-28471).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.132-28467-branch-28467-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.132']]/cda:templateId">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.132-28467-branch-28467-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.132-28468-branch-28468-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28473-branch-28468" test="@typeCode='SUBJ'">SHALL contain exactly one [1..1] @typeCode="SUBJ" has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28473).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.132-28468-branch-28468-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.132']]/cda:entryRelationship[cda:encounter]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.132-28468-branch-28468-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.23-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.23-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.49-2015-08-01-errors-abstract" />
      <sch:assert id="a-2228-11861" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11861) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.23" (CONF:2228-11862). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-26552).</sch:assert>
      <sch:assert id="a-2228-11874" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-11874).</sch:assert>
      <sch:assert id="a-2228-11876" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-11876).</sch:assert>
      <sch:assert id="a-2228-27624" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27624).</sch:assert>
      <sch:assert id="a-2228-11875" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-11875).</sch:assert>
      <sch:assert id="a-2228-11877" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-11877).</sch:assert>
      <sch:assert id="a-2228-11878" test="cda:effectiveTime[count(cda:high)=1]">This effectiveTime SHALL contain exactly one [1..1] high (CONF:2228-11878).</sch:assert>
      <sch:assert id="a-2228-27532" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27532).</sch:assert>
      <sch:assert id="a-2228-27533" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-27533).</sch:assert>
      <sch:assert id="a-2228-27625" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27625).</sch:assert>
      <!--sch:assert id="a-2228-28600" test="not(cda:entryRelationship) or cda:entryRelationship[@typeCode='REFR']">SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CONF:2228-28600)</sch:assert>
      <sch:assert id="a-2228-28598" test="not(cda:entryRelationship) or cda:entryRelationship[count(cda:observation)=1]">SHALL contain exactly one [1..1] observation (CONF:2228-28598)</sch:assert>
      <sch:assert id="a-2228-28601" test="not(cda:entryRelationship) or cda:entryRelationship/cda:observation[@classCode='OBS']">This observation SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28601)</sch:assert>
      <sch:assert id="a-2228-28602" test="not(cda:entryRelationship) or cda:entryRelationship/cda:observation[@moodCode='EVN']">This observation SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28602)</sch:assert>
      <sch:assert id="a-2228-28599" test="not(cda:entryRelationship) or cda:entryRelationship/cda:observation[count(cda:code)=1]">This observation SHALL contain exactly one [1..1] code (CONF:2228-28599)</sch:assert>
      <sch:assert id="a-2228-28603" test="not(cda:entryRelationship) or cda:entryRelationship/cda:observation/cda:code[@code='8319008']">This code SHALL contain exactly one [1..1] @code="8319008" Principal Diagnosis (CONF:2228-28603)</sch:assert>
      <sch:assert id="a-2228-28604" test="not(cda:entryRelationship) or cda:entryRelationship/cda:observation/cda:code[@codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-28604)</sch:assert>
      <sch:assert id="a-2228-28605" test="not(cda:entryRelationship) or cda:entryRelationship/cda:observation[count(cda:value[@xsi:type='CD'])=1]">This observation SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-28605)</sch:assert>
      <sch:assert id="a-2228-28606" test="not(cda:entryRelationship) or cda:entryRelationship/cda:observation/cda:value[@sdtc:valueSet]">This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-28606)</sch:assert-->
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.23-2016-02-01-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.23-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.133-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.133-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28475" test="count(cda:templateId)=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28475) such that it</sch:assert>
      <sch:assert id="a-2228-28476" test="count(cda:entryRelationship)=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-28476) such that it</sch:assert>
      <sch:assert id="a-2228-28477" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28477).</sch:assert>
      <sch:assert id="a-2228-28478" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28478).</sch:assert>
      <sch:assert id="a-2228-28480" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-28480).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.133-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.133']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.133-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.133-28475-branch-28475-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28479-branch-28475" test="@root='2.16.840.1.113883.10.20.24.3.133'">SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.133" (CONF:2228-28479).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.133-28475-branch-28475-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.133']]/cda:templateId">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.133-28475-branch-28475-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.133-28476-branch-28476-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28481-branch-28476" test="@typeCode='SUBJ'">SHALL contain exactly one [1..1] @typeCode="SUBJ" has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28481).</sch:assert>
      <sch:assert id="a-2228-28482-branch-28476" test="count(cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23' and @extension = '2016-02-01']])=1">SHALL contain exactly one [1..1] Encounter Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.23:2016-02-01) (CONF:2228-28482).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.133-28476-branch-28476-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.133']]/cda:entryRelationship">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.133-28476-branch-28476-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.24-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.24-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.40-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-11912" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.24'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11912) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.24" (CONF:2228-11913). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27066).</sch:assert>
      <sch:assert id="a-2228-11915" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-11915).</sch:assert>
      <sch:assert id="a-2228-27347" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27347).</sch:assert>
      <sch:assert id="a-2228-11911" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11911).</sch:assert>
      <sch:assert id="a-2228-27626" test="cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27626).</sch:assert>
      <sch:assert id="a-2228-27549" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" Encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27549).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.24-2016-02-01-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.24']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.24-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.134-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.134-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28485" test="count(cda:templateId)=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28485) such that it</sch:assert>
      <sch:assert id="a-2228-28486" test="count(cda:entryRelationship)=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-28486) such that it</sch:assert>
      <sch:assert id="a-2228-28487" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28487).</sch:assert>
      <sch:assert id="a-2228-28488" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28488).</sch:assert>
      <sch:assert id="a-2228-28491" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-28491).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.134-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.134']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.134-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.134-28485-branch-28485-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28490-branch-28485" test="@root='2.16.840.1.113883.10.20.24.3.134'">SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.134" (CONF:2228-28490).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.134-28485-branch-28485-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.134']]/cda:templateId">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.134-28485-branch-28485-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.134-28486-branch-28486-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28492-branch-28486" test="@typeCode='SUBJ'">SHALL contain exactly one [1..1] @typeCode="SUBJ" has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28492).</sch:assert>
      <sch:assert id="a-2228-28493-branch-28486" test="count(cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.24' and @extension = '2016-02-01']])=1">SHALL contain exactly one [1..1] Encounter Recommended (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.24:2016-02-01) (CONF:2228-28493).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.134-28486-branch-28486-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.134']]/cda:entryRelationship">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.134-28486-branch-28486-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.125-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.125-2016-02-01-errors-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.125-2016-02-01-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.125']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.125-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.14-2016-02-16-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.14-2016-02-16-errors-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.14-2016-02-16-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.14']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.14-2016-02-16-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.123-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.123-2016-02-01-errors-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.123-2016-02-01-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.123']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.123-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.135-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.135-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.4-2015-08-01-errors-abstract" />
      <sch:assert id="a-2228-28498" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28498) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.135" (CONF:2228-28503).</sch:assert>
      <sch:assert id="a-2228-28499" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-28499).</sch:assert>
      <sch:assert id="a-2228-28500" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-28500).</sch:assert>
      <sch:assert id="a-2228-28505" test="cda:code[@code='29308-4']">This code SHALL contain exactly one [1..1] @code="29308-4" diagnosis (CONF:2228-28505).</sch:assert>
      <sch:assert id="a-2228-28506" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2228-28506).</sch:assert>
      <sch:assert id="a-2228-28508" test="cda:value[@xsi:type='CD'][@sdtc:valueSet]">This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-28508).</sch:assert>
      <sch:assert id="a-2228-28510" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28510).</sch:assert>
      <sch:assert id="a-2228-28511" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28511).</sch:assert>
      <sch:assert id="a-2228-28512" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28512).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.135-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.135-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.11-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.11-2016-02-01-errors-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.11-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.11']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.11-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.121-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.121-2016-02-01-errors-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.121-2016-02-01-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.121']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.121-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.13-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.13-2016-02-01-errors-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.13-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.13']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.13-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.136-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.136-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.4-2015-08-01-errors-abstract" />
      <sch:assert id="a-2228-28514" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.136'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28514) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.136" (CONF:2228-28518).</sch:assert>
      <sch:assert id="a-2228-28515" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-28515).</sch:assert>
      <sch:assert id="a-2228-28516" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-28516).</sch:assert>
      <sch:assert id="a-2228-28520" test="cda:code[@code='75325-1']">This code SHALL contain exactly one [1..1] @code="75325-1" Symptom (CONF:2228-28520).</sch:assert>
      <sch:assert id="a-2228-28521" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2228-28521).</sch:assert>
      <sch:assert id="a-2228-28523" test="cda:value[@xsi:type='CD'][@sdtc:valueSet]">This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-28523).</sch:assert>
      <sch:assert id="a-2228-28524" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28524).</sch:assert>
      <sch:assert id="a-2228-28525" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28525).</sch:assert>
      <sch:assert id="a-2228-28526" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28526).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.136-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.136']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.136-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.76-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.76-2016-02-01-errors-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.76-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.76']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.76-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.120-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.120-2016-02-01-errors-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.120-2016-02-01-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.120']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.120-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.127-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.127-2016-02-01-errors-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.127-2016-02-01-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.127']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.127-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.122-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.122-2016-02-01-errors-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.122-2016-02-01-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.122']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.122-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.124-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.124-2016-02-01-errors-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.124-2016-02-01-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.124']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.124-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.77-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.77-2016-02-01-errors-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.77-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.77']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.77-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.79-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.79-2016-02-01-errors-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.79-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.79']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.79-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.78-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.78-2016-02-01-errors-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.78-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.78']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.78-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.137-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.137-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.3-2015-08-01-errors-abstract" />
      <sch:assert id="a-2228-28142" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-28142) such that it SHALL contain exactly one [1..1] Diagnosis (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.135) (CONF:2228-28145). SHALL contain exactly one [1..1] @typeCode="SUBJ" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28151).</sch:assert>
      <sch:assert id="a-2228-28143" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28143) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.137" (CONF:2228-28146).</sch:assert>
      <sch:assert id="a-2228-28144" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-28144).</sch:assert>
      <sch:assert id="a-2228-28210" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-28210).</sch:assert>
      <sch:assert id="a-2228-28150" test="cda:statusCode[@code='active']">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-28150).</sch:assert>
      <sch:assert id="a-2228-28148" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28148).</sch:assert>
      <sch:assert id="a-2228-28149" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28149).</sch:assert>
      <sch:assert id="a-2228-28211" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-28211).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.137-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.137-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.138-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.138-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.3-2015-08-01-errors-abstract" />
      <sch:assert id="a-2228-28538" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.136']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-28538) such that it SHALL contain exactly one [1..1] Symptom (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.136) (CONF:2228-28542). SHALL contain exactly one [1..1] @typeCode="SUBJ" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28543).</sch:assert>
      <sch:assert id="a-2228-28539" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.138'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28539) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.138" (CONF:2228-28544).</sch:assert>
      <sch:assert id="a-2228-28540" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-28540).</sch:assert>
      <sch:assert id="a-2228-28541" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-28541).</sch:assert>
      <sch:assert id="a-2228-28545" test="cda:statusCode[@code='active']">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-28545).</sch:assert>
      <sch:assert id="a-2228-28546" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-28546).</sch:assert>
      <sch:assert id="a-2228-28547" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28547).</sch:assert>
      <sch:assert id="a-2228-28548" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28548).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.138-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.138']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.138-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.42-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.42-2016-02-01-errors-abstract" abstract="true">
      <sch:assert id="a-2228-12454" test="count(cda:entryRelationship[@typeCode='COMP'][count(cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16' and @extension = '2014-06-09']][@moodCode='EVN'])=1]) &gt; 0">SHALL contain at least one [1..*] entryRelationship (CONF:2228-12454) such that it SHALL contain exactly one [1..1] Medication Activity (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.16:2014-06-09) (CONF:2228-12456). This substanceAdministration SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12457). SHALL contain exactly one [1..1] @typeCode="COMP" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-12455).</sch:assert>
      <sch:assert id="a-2228-12446" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.42'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12446) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.42" (CONF:2228-12447). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27023).</sch:assert>
      <sch:assert id="a-2228-12449" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-12449).</sch:assert>
      <sch:assert id="a-2228-12452" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-12452).</sch:assert>
      <sch:assert id="a-2228-12450" test="cda:code[@code='416118004']">This code SHALL contain exactly one [1..1] @code="416118004" administration (CONF:2228-12450).</sch:assert>
      <sch:assert id="a-2228-28129" test="cda:code[@codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-28129).</sch:assert>
      <sch:assert id="a-2228-13241" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-13241).</sch:assert>
      <sch:assert id="a-2228-12444" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-12444).</sch:assert>
      <sch:assert id="a-2228-12445" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12445).</sch:assert>
      <sch:assert id="a-2228-12448" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-12448).</sch:assert>
      <sch:assert id="a-2228-26714" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-26714).</sch:assert>
      <sch:assert id="a-2228-28552" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-28552).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.42-2016-02-01-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.42']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.42-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.43-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.43-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.7-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-14112" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.43'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-14112) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.43" (CONF:2228-14113). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27030).</sch:assert>
      <sch:assert id="a-2228-14134" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-14134).</sch:assert>
      <sch:assert id="a-2228-27964" test="count(cda:participant[@typeCode='CSM'][count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:2228-27964) such that it SHALL contain exactly one [1..1] participantRole (CONF:2228-27965). SHALL contain exactly one [1..1] @typeCode="CSM" Consumable (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-27968).</sch:assert>
      <sch:assert id="a-2228-14135" test="cda:value[@xsi:type='CD'][@code='419511003']">This value SHALL contain exactly one [1..1] @code="419511003" Propensity to adverse reactions to drug (disorder) (CONF:2228-14135).</sch:assert>
      <sch:assert id="a-2228-14110" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-14110).</sch:assert>
      <sch:assert id="a-2228-14111" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-14111).</sch:assert>
      <sch:assert id="a-2228-28081" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28081).</sch:assert>
      <sch:assert id="a-2228-28554" test="cda:value[@xsi:type='CD'][@codeSystem='2.16.840.1.113883.6.96']">This value SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-28554).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.43-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.43']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.43-2016-02-01-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.43-2016-02-01-27964-branch-27964-errors-abstract" abstract="true">
      <sch:assert id="a-2228-27966-branch-27964" test="cda:participantRole[count(cda:playingEntity)=1]">This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:2228-27966).</sch:assert>
      <sch:assert id="a-2228-27967-branch-27964" test="cda:participantRole/cda:playingEntity[count(cda:code)=1]">This playingEntity SHALL contain exactly one [1..1] code (CONF:2228-27967).</sch:assert>
      <sch:assert id="a-2228-27971-branch-27964" test="cda:participantRole/cda:playingEntity/cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27971).</sch:assert>
      <sch:assert id="a-2228-27970-branch-27964" test="cda:participantRole/cda:playingEntity[@classCode='MMAT']">This playingEntity SHALL contain exactly one [1..1] @classCode="MMAT" Manufactured material (CodeSystem: EntityClass urn:oid:2.16.840.1.113883.5.41) (CONF:2228-27970).</sch:assert>
      <sch:assert id="a-2228-27969-branch-27964" test="cda:participantRole[@classCode='MANU']">This participantRole SHALL contain exactly one [1..1] @classCode="MANU" Manufactured product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-27969).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.43-2016-02-01-27964-branch-27964-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.43']]/cda:participant[cda:participantRole][@typeCode='CSM']">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.43-2016-02-01-27964-branch-27964-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.44-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.44-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.7-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-14138" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.44'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-14138) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.44" (CONF:2228-14139). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27031).</sch:assert>
      <sch:assert id="a-2228-14159" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-14159).</sch:assert>
      <sch:assert id="a-2228-27972" test="count(cda:participant[@typeCode='CSM'][count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:2228-27972) such that it SHALL contain exactly one [1..1] participantRole (CONF:2228-27973). SHALL contain exactly one [1..1] @typeCode="CSM" Consumable (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-27976).</sch:assert>
      <sch:assert id="a-2228-14160" test="cda:value[@xsi:type='CD'][@code='416098002']">This value SHALL contain exactly one [1..1] @code="416098002" Drug allergy (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-14160).</sch:assert>
      <sch:assert id="a-2228-14136" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-14136).</sch:assert>
      <sch:assert id="a-2228-14137" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-14137).</sch:assert>
      <sch:assert id="a-2228-28082" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28082).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.44-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.44']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.44-2016-02-01-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.44-2016-02-01-27972-branch-27972-errors-abstract" abstract="true">
      <sch:assert id="a-2228-27974-branch-27972" test="cda:participantRole[count(cda:playingEntity)=1]">This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:2228-27974).</sch:assert>
      <sch:assert id="a-2228-27975-branch-27972" test="cda:participantRole/cda:playingEntity[count(cda:code)=1]">This playingEntity SHALL contain exactly one [1..1] code (CONF:2228-27975).</sch:assert>
      <sch:assert id="a-2228-27979-branch-27972" test="cda:participantRole/cda:playingEntity/cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27979).</sch:assert>
      <sch:assert id="a-2228-27978-branch-27972" test="cda:participantRole/cda:playingEntity[@classCode='MMAT']">This playingEntity SHALL contain exactly one [1..1] @classCode="MMAT" Manufactured material (CodeSystem: EntityClass urn:oid:2.16.840.1.113883.5.41) (CONF:2228-27978).</sch:assert>
      <sch:assert id="a-2228-27977-branch-27972" test="cda:participantRole[@classCode='MANU']">This participantRole SHALL contain exactly one [1..1] @classCode="MANU" Manufactured product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-27977).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.44-2016-02-01-27972-branch-27972-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.44']]/cda:participant[cda:participantRole][@typeCode='CSM']">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.44-2016-02-01-27972-branch-27972-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.105-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.105-2016-02-01-errors-abstract" abstract="true">
      <sch:assert id="a-2228-16553" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16' and @extension = '2014-06-09']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-16553) such that it SHALL contain exactly one [1..1] Medication Activity (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.16:2014-06-09) (CONF:2228-16555). SHALL contain exactly one [1..1] @typeCode="SUBJ" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16554).</sch:assert>
      <sch:assert id="a-2228-26956" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.105'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-26956) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.105" (CONF:2228-26957). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27037).</sch:assert>
      <sch:assert id="a-2228-16552" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-16552).</sch:assert>
      <sch:assert id="a-2228-16550" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-16550).</sch:assert>
      <sch:assert id="a-2228-16551" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-16551).</sch:assert>
      <sch:assert id="a-2228-28140" test="cda:code[@code='75311-1']">This code SHALL contain exactly one [1..1] @code="75311-1" Discharge medications (CONF:2228-28140).</sch:assert>
      <sch:assert id="a-2228-28141" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2228-28141).</sch:assert>
      <sch:assert id="a-2228-26955" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-26955).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.105-2016-02-01-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.105']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.105-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.45-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.45-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.18-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-13851" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-13851) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.45" (CONF:2228-13852). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-26555).</sch:assert>
      <sch:assert id="a-2228-19440" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-19440).</sch:assert>
      <sch:assert id="a-2228-19441" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-19441).</sch:assert>
      <sch:assert id="a-2228-13856" test="count(cda:effectiveTime[@xsi:type='IVL_TS'])=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-13856).</sch:assert>
      <sch:assert id="a-2228-27528" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27528).</sch:assert>
      <sch:assert id="a-2228-27529" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-27529).</sch:assert>
      <sch:assert id="a-2228-28555" test="cda:effectiveTime[@xsi:type='IVL_TS'][count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-28555).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.45-2016-02-01-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.45-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.139-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.139-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28557" test="count(cda:entryRelationship[count(cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45' and @extension = '2016-02-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-28557) such that it SHALL contain exactly one [1..1] Medication Dispensed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.45:2016-02-01) (CONF:2228-28566).</sch:assert>
      <sch:assert id="a-2228-28558" test="count(cda:templateId)=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28558) such that it</sch:assert>
      <sch:assert id="a-2228-28562" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28562).</sch:assert>
      <sch:assert id="a-2228-28563" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28563).</sch:assert>
      <sch:assert id="a-2228-28564" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-28564).</sch:assert>
      <sch:assert id="a-2228-28567" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-28567).</sch:assert>
      <sch:assert id="a-2228-28568" test="cda:code[@code='SPLY']">This code SHALL contain exactly one [1..1] @code="SPLY" supply (CONF:2228-28568).</sch:assert>
      <sch:assert id="a-2228-28569" test="cda:code[@codeSystem='2.16.840.1.113883.5.6']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.6" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28569).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.139-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.139']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.139-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.139-28558-branch-28558-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28560-branch-28558" test="@root='2.16.840.1.113883.10.20.24.3.139'">SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.139" (CONF:2228-28560).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.139-28558-branch-28558-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.139']]/cda:templateId">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.139-28558-branch-28558-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.139-28557-branch-28557-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28561-branch-28557" test="@typeCode='SUBJ'">SHALL contain exactly one [1..1] @typeCode="SUBJ" has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28561).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.139-28557-branch-28557-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.139']]/cda:entryRelationship[cda:supply]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.139-28557-branch-28557-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.46-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.46-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.7-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-14088" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.46'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-14088) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.46" (CONF:2228-27418). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27032).</sch:assert>
      <sch:assert id="a-2228-14162" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-14162).</sch:assert>
      <sch:assert id="a-2228-27980" test="count(cda:participant[@typeCode='CSM'][count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:2228-27980) such that it SHALL contain exactly one [1..1] participantRole (CONF:2228-27981). SHALL contain exactly one [1..1] @typeCode="CSM" Consumable (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-27984).</sch:assert>
      <sch:assert id="a-2228-27419" test="cda:value[@xsi:type='CD'][@code='59037007']">This value SHALL contain exactly one [1..1] @code="59037007" Drug intolerance (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-27419).</sch:assert>
      <sch:assert id="a-2228-14086" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-14086).</sch:assert>
      <sch:assert id="a-2228-14087" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-14087).</sch:assert>
      <sch:assert id="a-2228-28083" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28083).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.46-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.46']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.46-2016-02-01-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.46-2016-02-01-27980-branch-27980-errors-abstract" abstract="true">
      <sch:assert id="a-2228-27982-branch-27980" test="cda:participantRole[count(cda:playingEntity)=1]">This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:2228-27982).</sch:assert>
      <sch:assert id="a-2228-27983-branch-27980" test="cda:participantRole/cda:playingEntity[count(cda:code)=1]">This playingEntity SHALL contain exactly one [1..1] code (CONF:2228-27983).</sch:assert>
      <sch:assert id="a-2228-27987-branch-27980" test="cda:participantRole/cda:playingEntity/cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27987).</sch:assert>
      <sch:assert id="a-2228-27986-branch-27980" test="cda:participantRole/cda:playingEntity[@classCode='MMAT']">This playingEntity SHALL contain exactly one [1..1] @classCode="MMAT" Manufactured material (CodeSystem: EntityClass urn:oid:2.16.840.1.113883.5.41) (CONF:2228-27986).</sch:assert>
      <sch:assert id="a-2228-27985-branch-27980" test="cda:participantRole[@classCode='MANU']">This participantRole SHALL contain exactly one [1..1] @classCode="MANU" Manufactured product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-27985).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.46-2016-02-01-27980-branch-27980-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.46']]/cda:participant[cda:participantRole][@typeCode='CSM']">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.46-2016-02-01-27980-branch-27980-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.47-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.47-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.42-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-12585" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.47'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12585) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.47" (CONF:2228-12586). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27089).</sch:assert>
      <sch:assert id="a-2228-27740" test="count(cda:effectiveTime[count(cda:low)=1])=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-27740) such that it SHALL contain exactly one [1..1] low (CONF:2228-27742).</sch:assert>
      <sch:assert id="a-2228-27741" test="count(cda:effectiveTime[count(cda:period)=1])=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-27741) such that it SHALL contain exactly one [1..1] period (CONF:2228-27744).</sch:assert>
      <sch:assert id="a-2228-12639" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12639).</sch:assert>
      <sch:assert id="a-2228-27377" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27377).</sch:assert>
      <sch:assert id="a-2228-27737" test="not(cda:routeCode/cda:translation) or cda:routeCode/cda:translation[@sdtc:valueSet]">The translation, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27737).</sch:assert>
      <sch:assert id="a-2228-27745" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27745).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.47-2016-02-01-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.47']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.47-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.75-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.75-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.42-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-13785" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.75'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-13785) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.75" (CONF:2228-13786). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27152).</sch:assert>
      <sch:assert id="a-2228-27988" test="count(cda:consumable)=1">SHALL contain exactly one [1..1] consumable (CONF:2228-27988).</sch:assert>
      <sch:assert id="a-2228-27989" test="cda:consumable[count(cda:manufacturedProduct)=1]">This consumable SHALL contain exactly one [1..1] manufacturedProduct (CONF:2228-27989).</sch:assert>
      <sch:assert id="a-2228-27990" test="cda:consumable/cda:manufacturedProduct[count(cda:manufacturedMaterial)=1]">This manufacturedProduct SHALL contain exactly one [1..1] manufacturedMaterial (CONF:2228-27990).</sch:assert>
      <sch:assert id="a-2228-27991" test="cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial[count(cda:code)=1]">This manufacturedMaterial SHALL contain exactly one [1..1] code (CONF:2228-27991).</sch:assert>
      <sch:assert id="a-2228-13784" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-13784).</sch:assert>
      <sch:assert id="a-2228-27495" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27495).</sch:assert>
      <sch:assert id="a-2228-27720" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27720).</sch:assert>
      <sch:assert id="a-2228-27992" test="cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code[@sdtc:valueSet]">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27992).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.75-2016-02-01-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.75']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.75-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.112-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.112-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.46-2015-08-01-errors-abstract" />
      <sch:assert id="a-2228-27675" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.112'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-27675) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.112" (CONF:2228-27681). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27682).</sch:assert>
      <sch:assert id="a-2228-27688" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-27688).</sch:assert>
      <sch:assert id="a-2228-27685" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27685).</sch:assert>
      <sch:assert id="a-2228-27686" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-27686).</sch:assert>
      <sch:assert id="a-2228-27695" test="not(cda:value[@xsi:type='CD']/cda:translation) or cda:value[@xsi:type='CD']/cda:translation[@sdtc:valueSet]">The translation, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27695).</sch:assert>
      <sch:assert id="a-2228-28057" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28057).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.112-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.112']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.112-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.12-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.12-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.45-2015-08-01-errors-abstract" />
      <sch:assert id="a-2228-27715" test="count(cda:component[count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.112' and @extension = '2016-02-01']])=1]) &gt; 0">SHALL contain at least one [1..*] component (CONF:2228-27715) such that it SHALL contain exactly one [1..1] Family History Observation QDM (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.112:2016-02-01) (CONF:2228-27716).</sch:assert>
      <sch:assert id="a-2228-14175" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.12'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-14175) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.12" (CONF:2228-14176). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-26553).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.12-2016-02-01-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.12']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.12-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.140-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.140-errors-abstract" abstract="true">
      <sch:assert id="a-2228-28572" test="count(cda:entryRelationship[@typeCode='COMP'][count(cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.52' and @extension = '2014-06-09']][@moodCode='EVN'])=1]) &gt; 0">SHALL contain at least one [1..*] entryRelationship (CONF:2228-28572) such that it SHALL contain exactly one [1..1] Immunization Activity (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.52:2014-06-09) (CONF:2228-28573). This substanceAdministration SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28579). SHALL contain exactly one [1..1] @typeCode="COMP" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28580).</sch:assert>
      <sch:assert id="a-2228-28574" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.140'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28574) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.140" (CONF:2228-28581).</sch:assert>
      <sch:assert id="a-2228-28575" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-28575).</sch:assert>
      <sch:assert id="a-2228-28576" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-28576).</sch:assert>
      <sch:assert id="a-2228-28578" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-28578).</sch:assert>
      <sch:assert id="a-2228-28583" test="cda:code[@code='416118004']">This code SHALL contain exactly one [1..1] @code="416118004" administration (CONF:2228-28583).</sch:assert>
      <sch:assert id="a-2228-28584" test="cda:code[@codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-28584).</sch:assert>
      <sch:assert id="a-2228-28585" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-28585).</sch:assert>
      <sch:assert id="a-2228-28588" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28588).</sch:assert>
      <sch:assert id="a-2228-28589" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28589).</sch:assert>
      <sch:assert id="a-2228-28590" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-28590).</sch:assert>
      <sch:assert id="a-2228-28591" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-28591).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.140-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.140']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.140-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.84-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.84-2016-02-01-errors-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.84-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.84']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.84-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.83-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.83-2016-02-01-errors-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.83-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.83']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.83-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.143-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.143-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.120-errors-abstract" />
      <sch:assert id="a-2228-28627" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.143'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28627) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.143" (CONF:2228-28634).</sch:assert>
      <sch:assert id="a-2228-28636" test="not(cda:routeCode/cda:translation) or cda:routeCode/cda:translation[@sdtc:valueSet]">The translation, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-28636).</sch:assert>
      <sch:assert id="a-2228-28644" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28644).</sch:assert>
      <sch:assert id="a-2228-28645" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28645).</sch:assert>
      <sch:assert id="a-2228-28646" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-28646).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.143-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.143']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.143-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.41-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.41-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.16-2014-06-09-errors-abstract" />
      <sch:assert id="a-2228-28651" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.41'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28651) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.41" (CONF:2228-28653). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-28654).</sch:assert>
      <sch:assert id="a-2228-28652" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-28652).</sch:assert>
      <sch:assert id="a-2228-28655" test="cda:statusCode[@code='active']">This statusCode SHALL contain exactly one [1..1] @code="active" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-28655).</sch:assert>
      <sch:assert id="a-2228-28656" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28656).</sch:assert>
      <sch:assert id="a-2228-27645" test="not(cda:routeCode/cda:translation) or cda:routeCode/cda:translation[@sdtc:valueSet]">The translation, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27645).</sch:assert>
      <sch:assert id="a-2228-28079" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28079).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.41-2016-02-01-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.41']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.41-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.17.3.8-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.3.8-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.3.8-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.3.8-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.17.2.1-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-warnings" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.17.2.4-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.2.4-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.2.4-warnings" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.4']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.2.4-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.5.1-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.5.1-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.5.1-warnings" context="cda:name[cda:templateId[@root='2.16.840.1.113883.10.20.22.5.1']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.5.1-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.5.2-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.5.2-warnings-abstract" abstract="true">
      <sch:assert id="a-81-7290" test="@use">SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet PostalAddressUse urn:oid:2.16.840.1.113883.1.11.10637 STATIC 2005-05-01 (CONF:81-7290).</sch:assert>
      <sch:assert id="a-81-7293" test="count(cda:state)=1">SHOULD contain zero or one [0..1] state (ValueSet: StateValueSet urn:oid:2.16.840.1.113883.3.88.12.80.1 DYNAMIC) (CONF:81-7293).</sch:assert>
      <sch:assert id="a-81-7294-c" test="not(tested_here)">SHOULD contain zero or one [0..1] postalCode, which SHOULD be selected from ValueSet PostalCode urn:oid:2.16.840.1.113883.3.88.12.80.2 DYNAMIC (CONF:81-7294).</sch:assert>
      <sch:assert id="a-81-7295" test="count(cda:country)=1">SHOULD contain zero or one [0..1] country, which SHALL be selected from ValueSet Country urn:oid:2.16.840.1.113883.3.88.12.80.63 DYNAMIC (CONF:81-7295).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.5.2-warnings" context="cda:addr[cda:templateId[@root='2.16.840.1.113883.10.20.22.5.2']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.5.2-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.24-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.24-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.24-warnings" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.24']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.24-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.31-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.31-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.31-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.31']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.31-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.32-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.32-warnings-abstract" abstract="true">
      <sch:assert id="a-81-7760" test="count(cda:addr) &gt; 0">SHOULD contain zero or more [0..*] addr (CONF:81-7760).</sch:assert>
      <sch:assert id="a-81-7761" test="count(cda:telecom) &gt; 0">SHOULD contain zero or more [0..*] telecom (CONF:81-7761).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.32-warnings" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.32']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.32-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.37-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.37-warnings-abstract" abstract="true">
      <sch:assert id="a-81-16837" test="cda:playingDevice[count(cda:code)=1]">This playingDevice SHOULD contain zero or one [0..1] code (CONF:81-16837).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.37-warnings" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.37']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.37-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.47-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.47-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.47-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.47']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.47-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.53-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.53-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.53-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.53']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.53-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.5.1.1-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.5.1.1-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.5.1.1-warnings" context="cda:name[cda:templateId[@root='2.16.840.1.113883.10.20.22.5.1.1']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.5.1.1-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.5.4-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.5.4-warnings-abstract" abstract="true">
      <sch:assert id="a-81-10128-c" test="string-length(@value)&gt;=12">*SHOULD* be precise to the minute (CONF:81-10128).</sch:assert>
      <sch:assert id="a-81-10130-c" test="string-length(@value)&lt;10 or ( string-length(@value)&gt;=10 and (contains(@value,'+') or contains(@value,'-')))">If more precise than day, *SHOULD* include time-zone offset (CONF:81-10130).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.5.4-warnings" context="cda:effectiveTime[cda:templateId[@root='2.16.840.1.113883.10.20.22.5.4']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.5.4-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.89-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.89-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.89-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.89']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.89-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.93-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.93-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.93-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.93']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.93-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.55-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.55-warnings-abstract" abstract="true">
      <sch:assert id="a-67-26935" test="cda:effectiveTime[count(cda:high)=1]">This effectiveTime SHOULD contain zero or one [0..1] high (CONF:67-26935).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.55-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.55-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.2.2-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-warnings" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.2.3-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.2.3-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.2.3-warnings" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.3']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.2.3-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.98-warnings">
    <!--Pattern is used in an implied relationship.-->
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-warnings-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-warnings-abstract" abstract="true">
      <sch:assert id="a-67-12997-branch-12982" test="cda:externalDocument[count(cda:text)=1]">This externalDocument SHOULD contain zero or one [0..1] text (CONF:67-12997).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]/cda:reference[@typeCode='REFR'][cda:externalDocument]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.97-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.97-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-warnings-abstract" />
      <sch:assert id="a-67-16692-c" test="not(tested)">The referenceRange is used to indicate the probability that the patient would meet the corresponding population criteria. It is relevant for outcome measures, where predictive models allow for calculating the probability that a patient would meet the criteria of a given population (CONF:67-16692).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.97-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.97-warnings-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.97-12808-branch-12808-warnings-abstract" abstract="true">
      <sch:assert id="a-67-12864-branch-12808" test="cda:externalDocument[count(cda:code)=1]">This externalDocument SHOULD contain zero or one [0..1] code (CONF:67-12864).</sch:assert>
      <sch:assert id="a-67-12865-branch-12808" test="cda:externalDocument[count(cda:text)=1]">This externalDocument SHOULD contain zero or one [0..1] text (CONF:67-12865).</sch:assert>
      <sch:assert id="a-67-12867-branch-12808" test="cda:externalDocument[count(cda:setId)=1]">This externalDocument SHOULD contain zero or one [0..1] setId (CONF:67-12867).</sch:assert>
      <sch:assert id="a-67-12869-branch-12808" test="cda:externalDocument[count(cda:versionNumber)=1]">This externalDocument SHOULD contain zero or one [0..1] versionNumber (CONF:67-12869).</sch:assert>
      <sch:assert id="a-67-27015-branch-12808" test="not(cda:externalDocument/cda:code) or cda:externalDocument/cda:code[@code='57024-2']">The code, if present, SHOULD contain zero or one [0..1] @code="57024-2" Health Quality Measure Document (CONF:67-27015).</sch:assert>
      <sch:assert id="a-67-27016-branch-12808" test="not(cda:externalDocument/cda:code) or cda:externalDocument/cda:code[@codeSystem='2.16.840.1.113883.6.1']">The code, if present, SHOULD contain zero or one [0..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:67-27016).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.97-12808-branch-12808-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:reference[@typeCode='REFR']">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.97-12808-branch-12808-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.100-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.100-warnings-abstract" abstract="true">
      <sch:assert id="a-67-13379" test="cda:participantRole[count(cda:addr) &gt; 0]">This participantRole SHOULD contain zero or more [0..*] addr (CONF:67-13379).</sch:assert>
      <sch:assert id="a-67-13380" test="cda:participantRole[count(cda:telecom) &gt; 0]">This participantRole SHOULD contain zero or more [0..*] telecom (CONF:67-13380).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.100-warnings" context="cda:participant[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.100']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.100-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.69-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.69-warnings-abstract" abstract="true">
      <sch:assert id="a-81-14440-c" test="count(cda:code[@codeSystem])=0 or cda:code[@codeSystem='2.16.840.1.113883.6.1'] or cda:code[@codeSystem='2.16.840.1.113883.6.96']">SHOULD be from LOINC (CodeSystem: 2.16.840.1.113883.6.1) or SNOMED CT (CodeSystem: 2.16.840.1.113883.6.96) identifying the assessment scale (CONF:81-14440).</sch:assert>
      <sch:assert id="a-81-14451" test="count(cda:entryRelationship[@typeCode='COMP'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.86']])=1]) &gt; 0">SHOULD contain zero or more [0..*] entryRelationship (CONF:81-14451) such that it SHALL contain exactly one [1..1] @typeCode="COMP" has component (CONF:81-16741). SHALL contain exactly one [1..1] Assessment Scale Supporting Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.86) (CONF:81-16742).</sch:assert>
      <sch:assert id="a-81-16801" test="not(cda:referenceRange/cda:observationRange) or cda:referenceRange/cda:observationRange[count(cda:text)=1]">This observationRange SHOULD contain zero or one [0..1] text (CONF:81-16801).</sch:assert>
      <sch:assert id="a-81-16802" test="not(cda:referenceRange/cda:observationRange/cda:text) or cda:referenceRange/cda:observationRange/cda:text[count(cda:reference)=1]">The text, if present, SHOULD contain zero or one [0..1] reference (CONF:81-16802).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.69-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.69']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.69-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.86-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.86-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.86-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.86']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.86-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.16-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.16-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-7513-c" test="count(cda:effectiveTime) = 2 and cda:effectiveTime[@operator='A'][@xsi:type='PIVL_TS' or @xsi:type='EIVL_TS']">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-7513) such that it SHALL contain exactly one [1..1] @operator="A" (CONF:1098-9106).</sch:assert>
      <sch:assert id="a-1098-7514" test="count(cda:routeCode)=1">SHOULD contain zero or one [0..1] routeCode, which SHALL be selected from ValueSet Medication Route FDA urn:oid:2.16.840.1.113883.3.88.12.3221.8.7 DYNAMIC (CONF:1098-7514).</sch:assert>
      <sch:assert id="a-1098-7526" test="cda:doseQuantity[@unit]">This doseQuantity SHOULD contain zero or one [0..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-7526).</sch:assert>
      <sch:assert id="a-1098-30800-c" test="count(cda:doseQuantity)=1 or count(cda:rateQuantity)=1">Medication Activity *SHOULD* include doseQuantity *OR* rateQuantity (CONF:1098-30800).</sch:assert>
      <sch:assert id="a-1098-31150" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31150).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.16-2014-06-09-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.16-2014-06-09-warnings-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.16-2014-06-09-7508-branch-7508-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-32775-branch-7508" test="@value">SHOULD contain zero or one [0..1] @value (CONF:1098-32775).</sch:assert>
      <sch:assert id="a-1098-32776-branch-7508" test="count(cda:low)=1">SHOULD contain zero or one [0..1] low (CONF:1098-32776).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.16-2014-06-09-7508-branch-7508-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16']]/cda:effectiveTime[@xsi:type='IVL_TS']">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.16-2014-06-09-7508-branch-7508-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.123-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.123-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.123-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.123']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.123-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.113-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.113-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.113-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.113']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.113-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.9-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.9-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-7332" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-7332).</sch:assert>
      <sch:assert id="a-1098-7333" test="not(cda:effectiveTime) or cda:effectiveTime[count(cda:low)=1]">The effectiveTime, if present, SHOULD contain zero or one [0..1] low (CONF:1098-7333).</sch:assert>
      <sch:assert id="a-1098-7334" test="not(cda:effectiveTime) or cda:effectiveTime[count(cda:high)=1]">The effectiveTime, if present, SHOULD contain zero or one [0..1] high (CONF:1098-7334).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.9-2014-06-09-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.9-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.12-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.12-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-19186" test="cda:code[count(cda:originalText)=1]">This code SHOULD contain zero or one [0..1] originalText (CONF:1098-19186).</sch:assert>
      <sch:assert id="a-1098-19190-c" test="count(cda:code[@codeSystem])=0 or cda:code[@codeSystem='2.16.840.1.113883.6.1'] or cda:code[@codeSystem='2.16.840.1.113883.6.96'] or cda:code[@codeSystem='2.16.840.1.113883.6.12'] or cda:code[@codeSystem='2.16.840.1.113883.6.4'] or cda:code[@codeSystem='2.16.840.1.113883.6.13']">This @code *SHOULD* be selected from LOINC (CodeSystem: 2.16.840.1.113883.6.1) or SNOMED CT (CodeSystem: 2.16.840.1.113883.6.96), and *MAY* be selected from CPT-4 (CodeSystem: 2.16.840.1.113883.6.12) or ICD10 PCS (CodeSystem: 2.16.840.1.113883.6.4) or CDT-2 (Code System: 2.16.840.1.113883.6.13) (CONF:1098-19190).</sch:assert>
      <sch:assert id="a-1098-8301" test="count(cda:performer) &gt; 0">SHOULD contain zero or more [0..*] performer (CONF:1098-8301).</sch:assert>
      <sch:assert id="a-1098-8306" test="not(cda:performer/cda:assignedEntity) or cda:performer/cda:assignedEntity[count(cda:representedOrganization)=1]">This assignedEntity SHOULD contain zero or one [0..1] representedOrganization (CONF:1098-8306).</sch:assert>
      <sch:assert id="a-1098-8307" test="not(cda:performer/cda:assignedEntity/cda:representedOrganization) or cda:performer/cda:assignedEntity/cda:representedOrganization[count(cda:id) &gt; 0]">The representedOrganization, if present, SHOULD contain zero or more [0..*] id (CONF:1098-8307).</sch:assert>
      <sch:assert id="a-1098-32477" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">SHOULD contain at least one [1..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32477).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.12-2014-06-09-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.12-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.14-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.14-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-19203" test="cda:code[count(cda:originalText)=1]">This code SHOULD contain zero or one [0..1] originalText (CONF:1098-19203).</sch:assert>
      <sch:assert id="a-1098-19204" test="not(cda:code/cda:originalText) or cda:code/cda:originalText[count(cda:reference)=1]">The originalText, if present, SHOULD contain zero or one [0..1] reference (CONF:1098-19204).</sch:assert>
      <sch:assert id="a-1098-19205" test="not(cda:code/cda:originalText/cda:reference) or cda:code/cda:originalText/cda:reference[@value]">The reference, if present, SHOULD contain zero or one [0..1] @value (CONF:1098-19205).</sch:assert>
      <sch:assert id="a-1098-19207-c" test="count(cda:code[@codeSystem])=0 or cda:code[@codeSystem='2.16.840.1.113883.6.1'] or cda:code[@codeSystem='2.16.840.1.113883.6.96'] or cda:code[@codeSystem='2.16.840.1.113883.6.12'] or cda:code[@codeSystem='2.16.840.1.113883.6.104'] or cda:code[@codeSystem='2.16.840.1.113883.6.4'] or cda:code[@codeSystem='2.16.840.1.113883.6.13']">This @code *SHOULD* be selected from LOINC (CodeSystem: 2.16.840.1.113883.6.1) or SNOMED CT (CodeSystem: 2.16.840.1.113883.6.96), and *MAY* be selected from CPT-4 (CodeSystem: 2.16.840.1.113883.6.12) or ICD10 PCS (CodeSystem: 2.16.840.1.113883.6.4) or CDT-2 (Code System: 2.16.840.1.113883.6.13) (CONF:1098-19207).</sch:assert>
      <sch:assert id="a-1098-7662" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-7662).</sch:assert>
      <sch:assert id="a-1098-7683" test="count(cda:targetSiteCode) &gt; 0">SHOULD contain zero or more [0..*] targetSiteCode (CONF:1098-7683).</sch:assert>
      <sch:assert id="a-1098-7716" test="not(cda:specimen/cda:specimenRole) or cda:specimen/cda:specimenRole[count(cda:id) &gt; 0]">This specimenRole SHOULD contain zero or more [0..*] id (CONF:1098-7716).</sch:assert>
      <sch:assert id="a-1098-7718" test="count(cda:performer[count(cda:assignedEntity[count(cda:id) &gt; 0][count(cda:addr) &gt; 0][count(cda:telecom) &gt; 0])=1]) &gt; 0">SHOULD contain zero or more [0..*] performer (CONF:1098-7718) such that it SHALL contain exactly one [1..1] assignedEntity (CONF:1098-7720). This assignedEntity SHALL contain at least one [1..*] id (CONF:1098-7722). This assignedEntity SHALL contain at least one [1..*] addr (CONF:1098-7731). This assignedEntity SHALL contain at least one [1..*] telecom (CONF:1098-7732).</sch:assert>
      <sch:assert id="a-1098-32479" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">SHOULD contain at least one [1..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32479).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.14-2014-06-09-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.14-2014-06-09-warnings-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.14-2014-06-09-7718-branch-7718-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-7733-branch-7718" test="not(cda:assignedEntity) or cda:assignedEntity[count(cda:representedOrganization)=1]">This assignedEntity SHOULD contain zero or one [0..1] representedOrganization (CONF:1098-7733).</sch:assert>
      <sch:assert id="a-1098-7734-branch-7718" test="not(cda:assignedEntity/cda:representedOrganization) or cda:assignedEntity/cda:representedOrganization[count(cda:id) &gt; 0]">The representedOrganization, if present, SHOULD contain zero or more [0..*] id (CONF:1098-7734).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.14-2014-06-09-7718-branch-7718-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]/cda:performer[cda:assignedEntity[cda:id][cda:addr][cda:telecom]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.14-2014-06-09-7718-branch-7718-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.13-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.13-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-19198" test="cda:code[count(cda:originalText)=1]">This code SHOULD contain zero or one [0..1] originalText (CONF:1098-19198).</sch:assert>
      <sch:assert id="a-1098-19199" test="not(cda:code/cda:originalText) or cda:code/cda:originalText[count(cda:reference)=1]">The originalText, if present, SHOULD contain zero or one [0..1] reference (CONF:1098-19199).</sch:assert>
      <sch:assert id="a-1098-19200" test="not(cda:code/cda:originalText/cda:reference) or cda:code/cda:originalText/cda:reference[@value]">The reference, if present, SHOULD contain zero or one [0..1] @value (CONF:1098-19200).</sch:assert>
      <sch:assert id="a-1098-19202-c" test="count(cda:code[@codeSystem])=0 or cda:code[@codeSystem='2.16.840.1.113883.6.1'] or cda:code[@codeSystem='2.16.840.1.113883.6.96'] or cda:code[@codeSystem='2.16.840.1.113883.6.12'] or cda:code[@codeSystem='2.16.840.1.113883.6.4'] or cda:code[@codeSystem='2.16.840.1.113883.6.13']">This @code *SHOULD* be selected from LOINC (CodeSystem: 2.16.840.1.113883.6.1) or SNOMED CT (CodeSystem: 2.16.840.1.113883.6.96), and *MAY* be selected from CPT-4 (CodeSystem: 2.16.840.1.113883.6.12) or ICD10 PCS (CodeSystem: 2.16.840.1.113883.6.4) or CDT-2 (Code System: 2.16.840.1.113883.6.13) (CONF:1098-19202).</sch:assert>
      <sch:assert id="a-1098-8246" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-8246).</sch:assert>
      <sch:assert id="a-1098-8250" test="count(cda:targetSiteCode) &gt; 0">SHOULD contain zero or more [0..*] targetSiteCode, which SHALL be selected from ValueSet Body Site urn:oid:2.16.840.1.113883.3.88.12.3221.8.9 DYNAMIC (CONF:1098-8250).</sch:assert>
      <sch:assert id="a-1098-8251" test="count(cda:performer) &gt; 0">SHOULD contain zero or more [0..*] performer (CONF:1098-8251).</sch:assert>
      <sch:assert id="a-1098-8256" test="not(cda:performer/cda:assignedEntity) or cda:performer/cda:assignedEntity[count(cda:representedOrganization)=1]">This assignedEntity SHOULD contain zero or one [0..1] representedOrganization (CONF:1098-8256).</sch:assert>
      <sch:assert id="a-1098-8257" test="not(cda:performer/cda:assignedEntity/cda:representedOrganization) or cda:performer/cda:assignedEntity/cda:representedOrganization[count(cda:id) &gt; 0]">The representedOrganization, if present, SHOULD contain zero or more [0..*] id (CONF:1098-8257).</sch:assert>
      <sch:assert id="a-1098-32478" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">SHOULD contain at least one [1..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32478).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.13-2014-06-09-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.13-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.121-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.121-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-30785" test="count(cda:entryRelationship[@typeCode='REFR'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.143']])=1])=1">SHOULD contain zero or one [0..1] entryRelationship (CONF:1098-30785) such that it SHALL contain exactly one [1..1] @typeCode="REFR" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-30786). SHALL contain exactly one [1..1] Priority Preference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.143) (CONF:1098-30787).</sch:assert>
      <sch:assert id="a-1098-32335" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-32335).</sch:assert>
      <sch:assert id="a-1098-30784-v" test="count(cda:code[@codeSystem='2.16.840.1.113883.6.1' or @nullFlavor])=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:1098-30784).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.121-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.121']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.121-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-warnings">
    <!--Pattern is used in an implied relationship.-->
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-16318" test="count(cda:participant[@typeCode='CSM']) &gt; 0">SHOULD contain zero or more [0..*] participant (CONF:1098-16318) such that it SHALL contain exactly one [1..1] @typeCode="CSM" Consumable (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1098-16319).</sch:assert>
      <sch:assert id="a-1098-16337" test="count(cda:entryRelationship[@typeCode='MFST'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9' and @extension = '2014-06-09']])=1]) &gt; 0">SHOULD contain zero or more [0..*] entryRelationship (CONF:1098-16337) such that it SHALL contain exactly one [1..1] @typeCode="MFST" Is Manifestation of (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1098-16339). SHALL contain exactly one [1..1] @inversionInd="true" True (CONF:1098-16338). SHALL contain exactly one [1..1] Reaction Observation (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.9:2014-06-09) (CONF:1098-16340).</sch:assert>
      <sch:assert id="a-1098-31144" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31144).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.90']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.7-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.7-2014-06-09-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-warnings-abstract" />
      <sch:assert id="a-1098-7447" test="count(cda:entryRelationship[@typeCode='MFST'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9' and @extension = '2014-06-09']])=1]) &gt; 0">SHOULD contain zero or more [0..*] entryRelationship (CONF:1098-7447) such that it SHALL contain exactly one [1..1] @typeCode="MFST" Is Manifestation of (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1098-7907). SHALL contain exactly one [1..1] @inversionInd="true" True (CONF:1098-7449). SHALL contain exactly one [1..1] Reaction Observation (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.9:2014-06-09) (CONF:1098-15955).</sch:assert>
      <sch:assert id="a-1098-9961" test="not(count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.8' and @extension = '2014-06-09']])=1])=1)">SHOULD NOT contain zero or one [0..1] entryRelationship (CONF:1098-9961) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1098-9962). SHALL contain exactly one [1..1] @inversionInd="true" True (CONF:1098-9964). SHALL contain exactly one [1..1] Severity Observation (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.8:2014-06-09) (CONF:1098-15956).</sch:assert>
      <sch:assert id="a-1098-31143" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31143).</sch:assert>
      <sch:assert id="a-1098-32910" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.145']])=1])=1">SHOULD contain zero or one [0..1] entryRelationship (CONF:1098-32910) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32911). SHALL contain exactly one [1..1] Criticality Observation  (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.145) (CONF:1098-32913).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.7-2014-06-09-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.7']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.7-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.52-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.52-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-8841" test="count(cda:doseQuantity)=1">SHOULD contain zero or one [0..1] doseQuantity (CONF:1098-8841).</sch:assert>
      <sch:assert id="a-1098-8842" test="not(cda:doseQuantity) or cda:doseQuantity[@unit]">The doseQuantity, if present, SHOULD contain zero or one [0..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-8842).</sch:assert>
      <sch:assert id="a-1098-8849" test="count(cda:performer)=1">SHOULD contain zero or one [0..1] performer (CONF:1098-8849).</sch:assert>
      <sch:assert id="a-1098-31151" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31151).</sch:assert>
      <sch:assert id="a-1098-31510" test="count(cda:entryRelationship[@typeCode='COMP'][@inversionInd='true'][count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.118']])=1]) &gt; 0">SHOULD contain zero or more [0..*] entryRelationship (CONF:1098-31510) such that it SHALL contain exactly one [1..1] @typeCode="COMP" Component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-31511). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:1098-31512). SHALL contain exactly one [1..1] Substance Administered Act (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.118) (CONF:1098-31514).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.52-2014-06-09-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.52']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.52-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.39-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.39-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-30433" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-30433).</sch:assert>
      <sch:assert id="a-1098-32020" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHOULD contain zero or one [0..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32020).</sch:assert>
      <sch:assert id="a-1098-32030-c" test="count(cda:code[@codeSystem='2.16.840.1.113883.6.1' or @codeSystem='2.16.840.1.113883.6.96'])=1">This code in a Planned Act *SHOULD* be selected from LOINC (CodeSystem: 2.16.840.1.113883.6.1) *OR* SNOMED CT (CodeSystem: 2.16.840.1.113883.6.96) (CONF:1098-32030).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.39-2014-06-09-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.39']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.39-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.40-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.40-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-30440" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-30440).</sch:assert>
      <sch:assert id="a-1098-31032" test="count(cda:code)=1">SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Encounter Planned urn:oid:2.16.840.1.113883.11.20.9.52 DYNAMIC (CONF:1098-31032).</sch:assert>
      <sch:assert id="a-1098-32045" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32045).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.40-2014-06-09-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.40']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.40-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.41-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.41-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-30447" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-30447).</sch:assert>
      <sch:assert id="a-1098-31977-c" test="count(cda:code[@codeSystem])=0 or cda:code[@codeSystem='2.16.840.1.113883.6.1'] or cda:code[@codeSystem='2.16.840.1.113883.6.96'] or cda:code[@codeSystem='2.16.840.1.113883.6.12'] or cda:code[@codeSystem='2.16.840.1.113883.6.4']">The procedure/code in a planned procedure *SHOULD* be selected from LOINC (codeSystem 2.16.840.1.113883.6.1) *OR* SNOMED CT (CodeSystem: 2.16.840.1.113883.6.96), and *MAY* be selected from CPT-4 (CodeSystem: 2.16.840.1.113883.6.12) *OR* ICD10 PCS (CodeSystem: 2.16.840.1.113883.6.4) (CONF:1098-31977).</sch:assert>
      <sch:assert id="a-1098-31979" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHOULD contain zero or one [0..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31979).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.41-2014-06-09-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.41']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.41-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-30454" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-30454).</sch:assert>
      <sch:assert id="a-1098-32033" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32033).</sch:assert>
      <sch:assert id="a-1098-32044" test="count(cda:targetSiteCode) &gt; 0">SHOULD contain zero or more [0..*] targetSiteCode, which SHALL be selected from ValueSet Body Site urn:oid:2.16.840.1.113883.3.88.12.3221.8.9 DYNAMIC (CONF:1098-32044).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.44']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.43-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.43-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-30459" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-30459).</sch:assert>
      <sch:assert id="a-1098-31129" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHOULD contain zero or one [0..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31129).</sch:assert>
      <sch:assert id="a-1098-32325" test="count(cda:product)=1">SHOULD contain zero or one [0..1] product (CONF:1098-32325).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.43-2014-06-09-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.43']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.43-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.42-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.42-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-32046" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHOULD contain zero or one [0..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32046).</sch:assert>
      <sch:assert id="a-1098-32133" test="not(cda:doseQuantity) or cda:doseQuantity[@unit]">The doseQuantity, if present, SHOULD contain zero or one [0..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-32133).</sch:assert>
      <sch:assert id="a-1098-32134" test="not(cda:rateQuantity) or cda:rateQuantity[@unit]">The rateQuantity, if present, SHOULD contain zero or one [0..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-32134).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.42-2014-06-09-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.42-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.19-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.19-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-7488" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-7488).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.19-2014-06-09-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.19']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.19-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.28-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.28-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.28-2014-06-09-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.28']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.28-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.8-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.8-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.8-2014-06-09-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.8']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.8-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.17-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.17-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-15143" test="count(cda:effectiveTime[count(cda:high)=1])=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-15143) such that it SHALL contain exactly one [1..1] high (CONF:1098-15144).</sch:assert>
      <sch:assert id="a-1098-7434" test="count(cda:repeatNumber)=1">SHOULD contain zero or one [0..1] repeatNumber (CONF:1098-7434).</sch:assert>
      <sch:assert id="a-1098-7436" test="count(cda:quantity)=1">SHOULD contain zero or one [0..1] quantity (CONF:1098-7436).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.17-2014-06-09-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.17']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.17-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.23-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.23-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.23-2014-06-09-warnings" context="cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.23']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.23-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.18-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.18-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-7456" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-7456).</sch:assert>
      <sch:assert id="a-1098-7457" test="count(cda:repeatNumber)=1">SHOULD contain zero or one [0..1] repeatNumber (CONF:1098-7457).</sch:assert>
      <sch:assert id="a-1098-7458" test="count(cda:quantity)=1">SHOULD contain zero or one [0..1] quantity (CONF:1098-7458).</sch:assert>
      <sch:assert id="a-1098-7468-c" test="not(cda:performer/cda:assignedEntity) or cda:performer/cda:assignedEntity[count(cda:addr) &gt; 0]">This assignedEntity SHOULD contain zero or one [0..1] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1098-7468).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.18-2014-06-09-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.18-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.6-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.6-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.6-2014-06-09-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.6']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.6-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.143-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.143-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-30958" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-30958).</sch:assert>
      <sch:assert id="a-1098-32327" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-32327).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.143-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.143']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.143-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.20-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.20-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-16884-v" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Patient Education urn:oid:2.16.840.1.113883.11.20.9.34 DYNAMIC (CONF:1098-16884).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.20-2014-06-09-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.20']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.20-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.119-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.119-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-31671" test="cda:assignedAuthor[count(cda:code)=1]">This assignedAuthor SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy (HIPAA) urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1098-31671).</sch:assert>
      <sch:assert id="a-1098-32315-c" test="not(tested)">If the content is patient authored the code *SHOULD* be selected from Personal And Legal Relationship Role Type (2.16.840.1.113883.11.20.12.1) (CONF:1098-32315).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.119-warnings" context="cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.119-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.122-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.122-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.122-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.122']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.122-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.118-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.118-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.118-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.118']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.118-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.54-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.54-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-9012" test="count(cda:manufacturerOrganization)=1">SHOULD contain zero or one [0..1] manufacturerOrganization (CONF:1098-9012).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.54-2014-06-09-warnings" context="cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.54-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.25-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.25-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.25-2014-06-09-warnings" context="cda:criterion[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.25']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.25-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.115-2014-06-09-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.115-2014-06-09-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-32752" test="count(cda:setId)=1">SHOULD contain zero or one [0..1] setId (CONF:1098-32752).</sch:assert>
      <sch:assert id="a-1098-32753" test="count(cda:versionNumber)=1">SHOULD contain zero or one [0..1] versionNumber (CONF:1098-32753).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.115-2014-06-09-warnings" context="cda:externalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.115']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.115-2014-06-09-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.129-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.129-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.129-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.129']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.129-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.120-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.120-warnings-abstract" abstract="true">
      <sch:assert id="a-1098-32130" test="not(cda:doseQuantity) or cda:doseQuantity[@unit]">The doseQuantity, if present, SHOULD contain zero or one [0..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-32130).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.120-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.120']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.120-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.85-2014-12-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.85-2014-12-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.9-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.85-2014-12-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.85-2014-12-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.88-2014-12-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.88-2014-12-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.88-2014-12-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.88']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.88-2014-12-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.91-2014-12-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.91-2014-12-01-warnings-abstract" abstract="true">
      <sch:assert id="a-1140-13286" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1140-13286).</sch:assert>
      <sch:assert id="a-1140-13287" test="count(cda:value)=1">SHOULD contain zero or one [0..1] value (CONF:1140-13287).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.91-2014-12-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.91']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.91-2014-12-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.119-2014-12-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.119-2014-12-01-warnings-abstract" abstract="true">
      <sch:assert id="a-1140-28390" test="cda:code[@sdtc:valueSet]">This code SHOULD contain zero or one [0..1] @sdtc:valueSet (CONF:1140-28390).</sch:assert>
      <sch:assert id="a-1140-28026-v" test="count(cda:code[@codeSystem='2.16.840.1.113883.6.1' or @nullFlavor])=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:1140-28026).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.119-2014-12-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.119']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.119-2014-12-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.99-2015-04-05-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.99-2015-04-05-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.43-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.99-2015-04-05-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.99']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.99-2015-04-05-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.126-2014-12-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.126-2014-12-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.126-2014-12-01-warnings" context="sdtc:inFulfillmentOf1[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.126']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.126-2014-12-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.2-2015-08-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.2-2015-08-01-warnings-abstract" abstract="true">
      <sch:assert id="a-1198-7147" test="count(cda:interpretationCode) &gt; 0">SHOULD contain zero or more [0..*] interpretationCode (CONF:1198-7147).</sch:assert>
      <sch:assert id="a-1198-7150" test="count(cda:referenceRange) &gt; 0">SHOULD contain zero or more [0..*] referenceRange (CONF:1198-7150).</sch:assert>
      <sch:assert id="a-1198-7149" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-7149).</sch:assert>
      <sch:assert id="a-1198-32610-c" test="(cda:value[@xsi:type='CD'][@codeSystem='2.16.840.1.113883.6.96']) or not(cda:value[@xsi:type='CD'])">If Observation/value is a CD (*xsi:type*=*"CD"*) the value SHOULD be SNOMED-CT (CONF:1198-32610).</sch:assert>
      <sch:assert id="a-1198-7133-v" test="count(cda:code[@codeSystem='2.16.840.1.113883.6.1' or @nullFlavor])=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:1198-7133).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.2-2015-08-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.2']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.2-2015-08-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.147-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.147-warnings-abstract" abstract="true">
      <sch:assert id="a-1198-32756" test="cda:text/cda:reference[@value]">This reference SHOULD contain zero or one [0..1] @value (CONF:1198-32756).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.147-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.147-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.46-2015-08-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.46-2015-08-01-warnings-abstract" abstract="true">
      <sch:assert id="a-1198-8593" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1198-8593).</sch:assert>
      <sch:assert id="a-1198-32427-v" test="count(cda:code[@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.3.88.12.3221.7.2']/voc:code/@value or @nullFlavor])=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 STATIC 2012-06-01 (CONF:1198-32427).</sch:assert>
      <sch:assert id="a-1198-32847-v" test="cda:code[count(cda:translation) &gt; 0]">This code SHALL contain at least one [1..*] translation, which SHOULD be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 STATIC 2014-09-02 (CONF:1198-32847).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.46-2015-08-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.46-2015-08-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.4-2015-08-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.4-2015-08-01-warnings-abstract" abstract="true">
      <sch:assert id="a-1198-31147" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-31147).</sch:assert>
      <sch:assert id="a-1198-9045-v" test="count(cda:code[@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.3.88.12.3221.7.2']/voc:code/@value or @nullFlavor])=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 STATIC 2012-06-01 (CONF:1198-9045).</sch:assert>
      <sch:assert id="a-1198-32848-v" test="cda:code[count(cda:translation[@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.3.88.12.3221.7.2']/voc:code/@value]) &gt; 0]">This code SHALL contain at least one [1..*] translation, which SHOULD be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 2014-09-02 (CONF:1198-32848).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.4-2015-08-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.4-2015-08-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.79-2015-08-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.79-2015-08-01-warnings-abstract" abstract="true">
      <sch:assert id="a-1198-14868" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4' and @extension = '2015-08-01']])=1])=1">SHOULD contain zero or one [0..1] entryRelationship (CONF:1198-14868) such that it SHALL contain exactly one [1..1] Problem Observation (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:1198-14870). SHALL contain exactly one [1..1] @typeCode="CAUS" Is etiology for (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-14875). SHALL contain exactly one [1..1] @inversionInd="true" True (CONF:1198-32900).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.79-2015-08-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.79']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.79-2015-08-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.80-2015-08-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.80-2015-08-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.80-2015-08-01-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.80']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.80-2015-08-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.45-2015-08-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.45-2015-08-01-warnings-abstract" abstract="true">
      <sch:assert id="a-1198-15248" test="cda:subject/cda:relatedSubject[count(cda:subject)=1]">This relatedSubject SHOULD contain zero or one [0..1] subject (CONF:1198-15248).</sch:assert>
      <sch:assert id="a-1198-15249-c" test="count(cda:subject/cda:relatedSubject/cda:subject/sdtc:id)=1">The subject *SHOULD* contain zero or more [[]0..[*]] sdtc:id. The prefix sdtc: *SHALL* be bound to the namespace “urn:hl7-org:sdtc”. The use of the namespace provides a necessary extension to CDA R2 for the use of the id element (CONF:1198-15249).</sch:assert>
      <sch:assert id="a-1198-15976" test="not(cda:subject/cda:relatedSubject/cda:subject) or cda:subject/cda:relatedSubject/cda:subject[count(cda:birthTime)=1]">The subject, if present, SHOULD contain zero or one [0..1] birthTime (CONF:1198-15976).</sch:assert>
      <sch:assert id="a-1198-15247-v" test="cda:subject/cda:relatedSubject/cda:code[@code]">This code SHALL contain exactly one [1..1] @code, which SHOULD be selected from ValueSet Family Member Value Set urn:oid:2.16.840.1.113883.1.11.19579 DYNAMIC (CONF:1198-15247).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.45-2015-08-01-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.45']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.45-2015-08-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.3-2015-08-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.3-2015-08-01-warnings-abstract" abstract="true">
      <sch:assert id="a-1198-31146" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-31146).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.3-2015-08-01-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.3']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.3-2015-08-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.1.1-2015-08-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.1.1-2015-08-01-warnings-abstract" abstract="true">
      <sch:assert id="a-1198-5382" test="not(cda:recordTarget/cda:patientRole/cda:patient/cda:guardian) or cda:recordTarget/cda:patientRole/cda:patient/cda:guardian[count(cda:telecom) &gt; 0]">The guardian, if present, SHOULD contain zero or more [0..*] telecom (CONF:1198-5382).</sch:assert>
      <sch:assert id="a-1198-5406" test="cda:recordTarget/cda:patientRole/cda:patient[count(cda:languageCommunication) &gt; 0]">This patient SHOULD contain zero or more [0..*] languageCommunication (CONF:1198-5406).</sch:assert>
      <sch:assert id="a-1198-16787" test="cda:author/cda:assignedAuthor[count(cda:code)=1]">This assignedAuthor SHOULD contain zero or one [0..1] code (CONF:1198-16787).</sch:assert>
      <sch:assert id="a-1198-5430-c" test="not(tested-here)">This assignedAuthor SHOULD contain zero or one [0..1] assignedPerson (CONF:1198-5430).</sch:assert>
      <sch:assert id="a-1198-16783-c" test="not(tested-here)">This assignedAuthor SHOULD contain zero or one [0..1] assignedAuthoringDevice (CONF:1198-16783).</sch:assert>
      <sch:assert id="a-1198-32882-c" test="count(cda:author/cda:assignedAuthor[cda:assignedPerson]) = count(cda:author/cda:assignedAuthor[cda:assignedPerson and cda:id/@root='2.16.840.1.113883.4.6'])">This assignedAuthor SHOULD contain zero or one [0..1] id (CONF:1198-32882) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.6" National Provider Identifier (CONF:1198-32884).</sch:assert>
      <sch:assert id="a-1198-5579" test="count(cda:legalAuthenticator)=1">SHOULD contain zero or one [0..1] legalAuthenticator (CONF:1198-5579).</sch:assert>
      <sch:assert id="a-1198-14839" test="not(cda:documentationOf/cda:serviceEvent) or cda:documentationOf/cda:serviceEvent[count(cda:performer) &gt; 0]">This serviceEvent SHOULD contain zero or more [0..*] performer (CONF:1198-14839).</sch:assert>
      <sch:assert id="a-1198-5375" test="cda:recordTarget/cda:patientRole/cda:telecom[@use]">Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-5375).</sch:assert>
      <sch:assert id="a-1198-5300-c" test="string-length(cda:recordTarget/cda:patientRole/cda:patient/cda:birthTime/@value) &gt;= 8">*SHOULD* be precise to day (CONF:1198-5300).</sch:assert>
      <sch:assert id="a-1198-5303" test="cda:recordTarget/cda:patientRole/cda:patient[count(cda:maritalStatusCode)=1]">This patient SHOULD contain zero or one [0..1] maritalStatusCode, which SHALL be selected from ValueSet Marital Status urn:oid:2.16.840.1.113883.1.11.12212 DYNAMIC (CONF:1198-5303).</sch:assert>
      <sch:assert id="a-1198-5326" test="not(cda:recordTarget/cda:patientRole/cda:patient/cda:guardian) or cda:recordTarget/cda:patientRole/cda:patient/cda:guardian[count(cda:code)=1]">The guardian, if present, SHOULD contain zero or one [0..1] code, which SHALL be selected from ValueSet Personal And Legal Relationship Role Type urn:oid:2.16.840.1.113883.11.20.12.1 DYNAMIC (CONF:1198-5326).</sch:assert>
      <sch:assert id="a-1198-5359-c" test="count( cda:recordTarget/cda:patientRole/cda:patient/cda:guardian) &lt;= count(cda:recordTarget/cda:patientRole/cda:patient/cda:guardian/cda:addr)">The guardian, if present, SHOULD contain zero or more [0..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5359).</sch:assert>
      <sch:assert id="a-1198-7993" test="not(cda:recordTarget/cda:patientRole/cda:patient/cda:guardian/cda:telecom) or cda:recordTarget/cda:patientRole/cda:patient/cda:guardian/cda:telecom[@use]">The telecom, if present, SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-7993).</sch:assert>
      <sch:assert id="a-1198-5404" test="not(cda:recordTarget/cda:patientRole/cda:patient/cda:birthplace/cda:place/cda:addr) or cda:recordTarget/cda:patientRole/cda:patient/cda:birthplace/cda:place/cda:addr[count(cda:country)=1]">This addr SHOULD contain zero or one [0..1] country, which SHALL be selected from ValueSet Country urn:oid:2.16.840.1.113883.3.88.12.80.63 DYNAMIC (CONF:1198-5404).</sch:assert>
      <sch:assert id="a-1198-5402-c" test="count(cda:recordTarget/cda:patientRole/cda:patient/cda:birthplace/cda:place/cda:addr[cda:country='US' or cda:country='USA'][count(cda:state)!=1])=0">If country is US, this addr *SHALL* contain exactly one [[]1..1[]] state, which *SHALL* be selected from ValueSet StateValueSet 2.16.840.1.113883.3.88.12.80.1 *DYNAMIC* (CONF:1198-5402).</sch:assert>
      <sch:assert id="a-1198-9965" test="not(cda:recordTarget/cda:patientRole/cda:patient/cda:languageCommunication) or cda:recordTarget/cda:patientRole/cda:patient/cda:languageCommunication[count(cda:proficiencyLevelCode)=1]">The languageCommunication, if present, SHOULD contain zero or one [0..1] proficiencyLevelCode, which SHALL be selected from ValueSet LanguageAbilityProficiency urn:oid:2.16.840.1.113883.1.11.12199 DYNAMIC (CONF:1198-9965).</sch:assert>
      <sch:assert id="a-1198-5414" test="not(cda:recordTarget/cda:patientRole/cda:patient/cda:languageCommunication) or cda:recordTarget/cda:patientRole/cda:patient/cda:languageCommunication[count(cda:preferenceInd)=1]">The languageCommunication, if present, SHOULD contain zero or one [0..1] preferenceInd (CONF:1198-5414).</sch:assert>
      <sch:assert id="a-1198-16820" test="not(cda:recordTarget/cda:patientRole/cda:providerOrganization/cda:id) or cda:recordTarget/cda:patientRole/cda:providerOrganization/cda:id[@root='2.16.840.1.113883.4.6']">Such ids SHOULD contain zero or one [0..1] @root="2.16.840.1.113883.4.6" National Provider Identifier (CONF:1198-16820).</sch:assert>
      <sch:assert id="a-1198-7994" test="not(cda:recordTarget/cda:patientRole/cda:providerOrganization/cda:telecom) or cda:recordTarget/cda:patientRole/cda:providerOrganization/cda:telecom[@use]">Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-7994).</sch:assert>
      <sch:assert id="a-1198-7995" test="cda:author/cda:assignedAuthor/cda:telecom[@use]">Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-7995).</sch:assert>
      <sch:assert id="a-1198-16821" test="not(cda:dataEnterer/cda:assignedEntity/cda:id) or cda:dataEnterer/cda:assignedEntity/cda:id[@root='2.16.840.1.113883.4.6']">Such ids SHOULD contain zero or one [0..1] @root="2.16.840.1.113883.4.6" National Provider Identifier (CONF:1198-16821).</sch:assert>
      <sch:assert id="a-1198-7996" test="not(cda:dataEnterer/cda:assignedEntity/cda:telecom) or cda:dataEnterer/cda:assignedEntity/cda:telecom[@use]">Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-7996).</sch:assert>
      <sch:assert id="a-1198-9946-c" test="not(testable)">If assignedEntity/id is a provider then this id, *SHOULD* include zero or one [[]0..1[]] id where id/@root ="2.16.840.1.113883.4.6" National Provider Identifier (CONF:1198-9946).</sch:assert>
      <sch:assert id="a-1198-16822" test="cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization/cda:id[@root='2.16.840.1.113883.4.6']">Such ids SHOULD contain zero or one [0..1] @root="2.16.840.1.113883.4.6" National Provider Identifier (CONF:1198-16822).</sch:assert>
      <sch:assert id="a-1198-7998" test="cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization/cda:telecom[@use]">This telecom SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-7998).</sch:assert>
      <sch:assert id="a-1198-7999" test="not(cda:legalAuthenticator/cda:assignedEntity/cda:telecom) or cda:legalAuthenticator/cda:assignedEntity/cda:telecom[@use]">Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-7999).</sch:assert>
      <sch:assert id="a-1198-10007-c" test="count(cda:participant[@typeCode='IND']) = count(cda:participant/cda:associatedEntity[@classCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.33']/voc:code/@value])">When participant/@typeCode is *IND*, associatedEntity/@classCode *SHOULD* be selected from ValueSet 2.16.840.1.113883.11.20.9.33 INDRoleclassCodes *STATIC 2011-09-30* (CONF:1198-10007).</sch:assert>
      <sch:assert id="a-1198-32889" test="not(cda:documentationOf/cda:serviceEvent/cda:performer/cda:functionCode) or cda:documentationOf/cda:serviceEvent/cda:performer/cda:functionCode[@code and @code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.1.11.10267']/voc:code/@value]">The functionCode, if present, SHOULD contain zero or one [0..1] @code, which SHOULD be selected from ValueSet ParticipationFunction urn:oid:2.16.840.1.113883.1.11.10267 STATIC (CONF:1198-32889).</sch:assert>
      <sch:assert id="a-1198-14847" test="not(cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:id) or cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:id[@root='2.16.840.1.113883.4.6']">Such ids SHOULD contain zero or one [0..1] @root="2.16.840.1.113883.4.6" National Provider Identifier (CONF:1198-14847).</sch:assert>
      <sch:assert id="a-1198-14842" test="not(cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity) or cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity[count(cda:code)=1]">This assignedEntity SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy (HIPAA) urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1198-14842).</sch:assert>
      <sch:assert id="a-1198-5259-v" test="count(cda:confidentialityCode[@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.1.11.16926']/voc:code/@value])=1">SHALL contain exactly one [1..1] confidentialityCode, which SHOULD be selected from ValueSet HL7 BasicConfidentialityKind urn:oid:2.16.840.1.113883.1.11.16926 STATIC (CONF:1198-5259).</sch:assert>
      <sch:assert id="a-1198-16788-v" test="not(cda:author/cda:assignedAuthor/cda:code) or cda:author/cda:assignedAuthor/cda:code[@code]">The code, if present, SHALL contain exactly one [1..1] @code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy (HIPAA) urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1198-16788).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.1.1-2015-08-01-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.1.1-2015-08-01-warnings-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.1.1-2015-08-01-5607-branch-5607-warnings-abstract" abstract="true">
      <sch:assert id="a-1198-16824-branch-5607" test="not(cda:assignedEntity/cda:id) or cda:assignedEntity/cda:id[@root='2.16.840.1.113883.4.6']">Such ids SHOULD contain zero or one [0..1] @root="2.16.840.1.113883.4.6" National Provider Identifier  (CONF:1198-16824).</sch:assert>
      <sch:assert id="a-1198-8000-branch-5607" test="not(cda:assignedEntity/cda:telecom) or cda:assignedEntity/cda:telecom[@use]">Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-8000).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.1.1-2015-08-01-5607-branch-5607-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:authenticator">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.1.1-2015-08-01-5607-branch-5607-warnings-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.1.1-2015-08-01-32882-branch-32882-warnings-abstract" abstract="true">
      <sch:assert id="a-1198-32885-branch-32882" test="@extension">SHOULD contain zero or one [0..1] @extension (CONF:1198-32885).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.1.1-2015-08-01-32882-branch-32882-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:author[cda:assignedAuthor][cda:id[@root='2.16.840.1.113883.4.6']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.1.1-2015-08-01-32882-branch-32882-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.22.4.49-2015-08-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.49-2015-08-01-warnings-abstract" abstract="true">
      <sch:assert id="a-1198-8738" test="count(cda:participant[@typeCode='LOC'][count(cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.32']])=1]) &gt; 0">SHOULD contain zero or more [0..*] participant (CONF:1198-8738) such that it SHALL contain exactly one [1..1] Service Delivery Location (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.32) (CONF:1198-14903). SHALL contain exactly one [1..1] @typeCode="LOC" Location (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-8740).</sch:assert>
      <sch:assert id="a-1198-8719" test="cda:code[count(cda:originalText)=1]">This code SHOULD contain zero or one [0..1] originalText (CONF:1198-8719).</sch:assert>
      <sch:assert id="a-1198-15970" test="not(cda:code/cda:originalText) or cda:code/cda:originalText[count(cda:reference)=1]">The originalText, if present, SHOULD contain zero or one [0..1] reference (CONF:1198-15970).</sch:assert>
      <sch:assert id="a-1198-15971" test="not(cda:code/cda:originalText/cda:reference) or cda:code/cda:originalText/cda:reference[@value]">The reference, if present, SHOULD contain zero or one [0..1] @value (CONF:1198-15971).</sch:assert>
      <sch:assert id="a-1198-32177-c" test="not(sdtc:dischargeDispositionCode) or count(sdtc:dischargeDispositionCode[@code])=1">This sdtc:dischargeDispositionCode *SHOULD* contain exactly [[]1..1[]] *@code*, which *SHOULD* be selected from ValueSet 2.16.840.1.113883.3.88.12.80.33 NUBC UB-04 FL17-Patient Status (code system 2.16.840.1.113883.6.301.5) *DYNAMIC* or, if access to NUBC is unavailable, from CodeSystem 2.16.840.1.113883.12.112 HL7 Discharge Disposition (CONF:1198-32177).</sch:assert>
      <sch:assert id="a-1198-32377-c" test="not(sdtc:dischargeDispositionCode) or (sdtc:dischargeDispositionCode[@codeSystem='2.16.840.1.113883.6.301.5'] or sdtc:dischargeDispositionCode[@codeSystem='2.16.840.1.113883.12.112'])">This sdtc:dischargeDispositionCode *SHOULD* contain exactly [[]1..1[]] *@codeSystem*, which *SHOULD* be either CodeSystem: NUBC 2.16.840.1.113883.6.301.5 *OR* CodeSystem: HL7 Discharge Disposition 2.16.840.1.113883.12.112 (CONF:1198-32377).</sch:assert>
      <sch:assert id="a-1198-8714-v" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet EncounterTypeCode urn:oid:2.16.840.1.113883.3.88.12.80.32 DYNAMIC (CONF:1198-8714).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.49-2015-08-01-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.49-2015-08-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.22.4.145-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.145-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.22.4.145-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.145']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.145-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.1-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.1-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.121-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.1-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.1']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.1-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.2-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.2-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.2-2016-02-01-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.2-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.3-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.3-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.3-2016-02-01-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.3']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.3-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.4-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.4-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.4-2016-02-01-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.4-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.5-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.5-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.5-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.5']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.5-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.2.4-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-warnings" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.1']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.2.1-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert id="a-2228-16396" test="count(cda:entryRelationship[@typeCode='MFST'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85' and @extension = '2014-12-01']])=1])=1">SHOULD contain zero or one [0..1] entryRelationship (CONF:2228-16396) such that it SHALL contain exactly one [1..1] Reaction (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.85:2014-12-01) (CONF:2228-16399). SHALL contain exactly one [1..1] @typeCode="MFST" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16397). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-16398).</sch:assert>
      <sch:assert id="a-2228-16391" test="cda:effectiveTime[count(cda:high)=1]">This effectiveTime SHOULD contain zero or one [0..1] high (CONF:2228-16391).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.104']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.15-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.15-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.15-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.15']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.15-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.16-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.16-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.16-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.16']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.16-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.18-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.18-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.13-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.18-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.18-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.29-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.29-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.29-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.29']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.29-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.32-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.32-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.12-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.32-2016-02-01-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.32']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.32-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.87-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.87-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.2-2015-08-01-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.87-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.87']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.87-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.33-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.33-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.39-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.33-2016-02-01-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.33']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.33-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.35-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.35-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.35-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.35']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.35-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.38-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.38-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.2-2015-08-01-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.38-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.38-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.36-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.36-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.36-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.36']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.36-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.61-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.61-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.61-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.61']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.61-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.14-2014-06-09-warnings-abstract" />
      <sch:assert id="a-2228-27312" test="count(cda:targetSiteCode) &gt; 0">SHOULD contain zero or more [0..*] targetSiteCode (CONF:2228-27312).</sch:assert>
      <sch:assert id="a-2228-27314" test="not(cda:targetSiteCode) or cda:targetSiteCode[@sdtc:valueSet]">The targetSiteCode, if present, SHOULD contain zero or one [0..1] @sdtc:valueSet (CONF:2228-27314).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.64-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.62-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.62-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.62-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.62']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.62-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.39-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.39-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.39-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.39']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.39-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.37-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.37-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.37-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.37']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.37-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.58-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.58-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.58-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.58']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.58-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.60-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.60-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.60-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.60-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.59-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.59-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.13-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.59-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.59']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.59-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.63-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.63-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.41-2014-06-09-warnings-abstract" />
      <sch:assert id="a-2228-27332" test="not(cda:targetSiteCode) or cda:targetSiteCode[@sdtc:valueSet]">The targetSiteCode, if present, SHOULD contain zero or one [0..1] @sdtc:valueSet (CONF:2228-27332).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.63-2016-02-01-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.63-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.65-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.65-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.41-2014-06-09-warnings-abstract" />
      <sch:assert id="a-2228-27728" test="not(cda:targetSiteCode) or cda:targetSiteCode[@sdtc:valueSet]">The targetSiteCode, if present, SHOULD contain zero or one [0..1] @sdtc:valueSet (CONF:2228-27728).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.65-2016-02-01-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.65-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.69-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.69-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.69-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.69-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.69']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.69-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.81-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.81-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.81-2016-02-01-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.81']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.81-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.141-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.141-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.141-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.141']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.141-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.142-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.142-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.142-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.142']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.142-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.82-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.82-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.82-2016-02-01-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.82']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.82-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.1.1-2016-02-01-warnings">
    <!--Pattern is used in an implied relationship.-->
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.1.1-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.1.1-2015-08-01-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.1.1-2016-02-01-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.1.1-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.1.2-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.1.2-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.1.1-2016-02-01-warnings-abstract" />
      <sch:assert id="a-2228-16857" test="cda:recordTarget/cda:patientRole[count(cda:id[@root='2.16.840.1.113883.4.572'])=1]">This patientRole SHOULD contain zero or one [0..1] id (CONF:2228-16857) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.572" Medicare HIC number (CONF:2228-16858).</sch:assert>
      <sch:assert id="a-2228-28241" test="cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization[count(cda:id[@root='2.16.840.1.113883.4.336'][@extension])=1]">This representedCustodianOrganization SHOULD contain zero or one [0..1] id (CONF:2228-28241) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.336" CMS Certification Number (CONF:2228-28244). SHALL contain exactly one [1..1] @extension (CONF:2228-28245).</sch:assert>
      <sch:assert id="a-2228-28242" test="cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization[count(cda:id[@root='2.16.840.1.113883.4.2'][@extension])=1]">This representedCustodianOrganization SHOULD contain zero or one [0..1] id (CONF:2228-28242) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.2" Tax ID Number (CONF:2228-28246). SHALL contain exactly one [1..1] @extension (CONF:2228-28247).</sch:assert>
      <sch:assert id="a-2228-28243" test="cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization[count(cda:id[@root='1.3.6.1.4.1.33895'][@extension])=1]">This representedCustodianOrganization SHOULD contain zero or one [0..1] id (CONF:2228-28243) such that it SHALL contain exactly one [1..1] @root="1.3.6.1.4.1.33895" The Joint Commission’s Health Care Organization (HCO) Identification Number (CONF:2228-28248). SHALL contain exactly one [1..1] @extension (CONF:2228-28249).</sch:assert>
      <sch:assert id="a-2228-16706-c" test="count(cda:informationRecipient) = 0 or count(cda:informationRecipient/cda:intendedRecipient/cda:id) &gt; 0">IntendedRecipient ID can be used by the receiver to ensure they are processing a file that was intended to be sent to them (CONF:2228-16706).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.1.2-2016-02-01-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.1.2-2016-02-01-warnings-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.1.2-2016-02-01-16579-branch-16579-warnings-abstract" abstract="true">
      <sch:assert id="a-2228-16587-branch-16579" test="not(cda:serviceEvent/cda:performer/cda:assignedEntity) or cda:serviceEvent/cda:performer/cda:assignedEntity[count(cda:id[@root='2.16.840.1.113883.4.6'])=1]">This assignedEntity SHOULD contain zero or one [0..1] id (CONF:2228-16587) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.6" National Provider ID (CONF:2228-16588).</sch:assert>
      <sch:assert id="a-2228-16592-branch-16579" test="not(cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization) or cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization[count(cda:id[@root='2.16.840.1.113883.4.2'])=1]">This representedOrganization SHOULD contain zero or one [0..1] id (CONF:2228-16592) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.2" Tax ID Number (CONF:2228-16593).</sch:assert>
      <sch:assert id="a-2228-16595-branch-16579" test="not(cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization) or cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization[count(cda:id[@root='2.16.840.1.113883.4.336'][@extension])=1]">This representedOrganization SHOULD contain zero or one [0..1] id (CONF:2228-16595) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.336" Facility CMS Certification Number (CONF:2228-16596). SHALL contain exactly one [1..1] @extension (CONF:2228-16597).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.1.2-2016-02-01-16579-branch-16579-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2']]/cda:documentationOf[cda:serviceEvent[cda:performer[@typeCode='PRF']][@classCode='PCPR']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.1.2-2016-02-01-16579-branch-16579-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.30-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.30-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.104-2016-02-01-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.30-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.30']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.30-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.31-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.31-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.39-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.31-2016-02-01-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.31']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.31-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.103-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.103-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.103-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.103']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.103-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.114-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.114-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert id="a-2228-28221" test="not(cda:participant/cda:participantRole) or cda:participant/cda:participantRole[count(cda:id) &gt; 0]">This participantRole SHOULD contain zero or more [0..*] id (CONF:2228-28221) such that it</sch:assert>
      <sch:assert id="a-2228-28220" test="not(cda:participant/cda:participantRole) or cda:participant/cda:participantRole[count(cda:code[@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.114222.4.11.1066']/voc:code/@value or @nullFlavor])=1]">This participantRole SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy (HIPAA) urn:oid:2.16.840.1.114222.4.11.1066 (CONF:2228-28220).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.114-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.114']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.114-2016-02-01-warnings-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.114-2016-02-01-28221-branch-28221-warnings-abstract" abstract="true">
      <sch:assert id="a-2228-28222-branch-28221" test="@root='2.16.840.1.113883.4.6'">SHOULD contain zero or one [0..1] @root="2.16.840.1.113883.4.6" National Provider ID (CONF:2228-28222).</sch:assert>
      <sch:assert id="a-2228-28223-branch-28221" test="@extension">SHOULD contain zero or one [0..1] @extension (CONF:2228-28223).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.114-2016-02-01-28221-branch-28221-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.114']]/cda:participant[cda:participantRole][cda:id]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.114-2016-02-01-28221-branch-28221-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.48-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.48-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.48-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.48']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.48-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.67-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.67-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.67-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.67']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.67-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.51-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.51-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.51-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.51']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.51-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.54-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.54-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.79-2015-08-01-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.54-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.54']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.54-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.17-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.17-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.17-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.17']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.17-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.19-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.19-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.19-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.19']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.19-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.26-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.26-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.13-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.26-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.26']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.26-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.25-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.25-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.25-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.25']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.25-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.27-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.27-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.44-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.27-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.27']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.27-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.6-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.6-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.6-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.6']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.6-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.8-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.8-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.90-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.8-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.8']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.8-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.130-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.130-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.130-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.130']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.130-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.9-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.9-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.43-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.9-2016-02-01-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.9-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.7-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.7-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.14-2014-06-09-warnings-abstract" />
      <sch:assert id="a-2228-12416" test="count(cda:targetSiteCode)=1">SHOULD contain zero or one [0..1] targetSiteCode (CONF:2228-12416).</sch:assert>
      <sch:assert id="a-2228-27730" test="not(cda:targetSiteCode) or cda:targetSiteCode[@sdtc:valueSet]">The targetSiteCode, if present, SHOULD contain zero or one [0..1] @sdtc:valueSet (CONF:2228-27730).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.7-2016-02-01-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.7-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.10-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.10-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.43-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.10-2016-02-01-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.10-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.131-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.131-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.131-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.131']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.131-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.21-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.21-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.49-2015-08-01-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.21-2016-02-01-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.21']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.21-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.22-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.22-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.40-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.22-2016-02-01-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.22']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.22-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.132-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.132-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.132-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.132']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.132-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.23-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.23-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.49-2015-08-01-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.23-2016-02-01-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.23-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.133-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.133-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.133-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.133']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.133-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.24-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.24-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.40-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.24-2016-02-01-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.24']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.24-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.134-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.134-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.134-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.134']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.134-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.125-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.125-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.125-2016-02-01-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.125']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.125-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.14-2016-02-16-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.14-2016-02-16-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.14-2016-02-16-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.14']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.14-2016-02-16-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.123-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.123-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.123-2016-02-01-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.123']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.123-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.135-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.135-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.4-2015-08-01-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.135-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.135-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.11-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.11-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.11-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.11']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.11-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.121-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.121-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.121-2016-02-01-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.121']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.121-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.13-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.13-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.13-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.13']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.13-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.136-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.136-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.4-2015-08-01-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.136-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.136']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.136-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.76-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.76-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.76-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.76']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.76-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.120-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.120-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.120-2016-02-01-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.120']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.120-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.127-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.127-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.127-2016-02-01-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.127']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.127-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.122-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.122-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.122-2016-02-01-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.122']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.122-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.124-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.124-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.124-2016-02-01-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.124']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.124-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.77-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.77-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.77-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.77']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.77-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.79-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.79-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.79-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.79']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.79-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.78-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.78-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.78-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.78']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.78-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.137-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.137-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.3-2015-08-01-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.137-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.137-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.138-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.138-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.3-2015-08-01-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.138-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.138']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.138-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.42-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.42-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.42-2016-02-01-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.42']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.42-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.43-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.43-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.7-2014-06-09-warnings-abstract" />
      <sch:assert id="a-2228-14130" test="count(cda:entryRelationship[@typeCode='MFST'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85' and @extension = '2014-12-01']])=1])=1">SHOULD contain zero or one [0..1] entryRelationship (CONF:2228-14130) such that it SHALL contain exactly one [1..1] @typeCode="MFST" (CONF:2228-14131). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-14132). SHALL contain exactly one [1..1] Reaction (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.85:2014-12-01) (CONF:2228-27124).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.43-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.43']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.43-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.44-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.44-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.7-2014-06-09-warnings-abstract" />
      <sch:assert id="a-2228-14155" test="count(cda:entryRelationship[@typeCode='MFST'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85' and @extension = '2014-12-01']])=1])=1">SHOULD contain zero or one [0..1] entryRelationship (CONF:2228-14155) such that it SHALL contain exactly one [1..1] @typeCode="MFST" (CONF:2228-14156). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-14157). SHALL contain exactly one [1..1] Reaction (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.85:2014-12-01) (CONF:2228-27125).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.44-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.44']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.44-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.105-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.105-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.105-2016-02-01-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.105']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.105-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.45-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.45-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.18-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.45-2016-02-01-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.45-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.139-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.139-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.139-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.139']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.139-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.46-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.46-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.7-2014-06-09-warnings-abstract" />
      <sch:assert id="a-2228-14106" test="count(cda:entryRelationship[@typeCode='MFST'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85' and @extension = '2014-12-01']])=1])=1">SHOULD contain zero or one [0..1] entryRelationship (CONF:2228-14106) such that it SHALL contain exactly one [1..1] @typeCode="MFST" (CONF:2228-14107). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-14108). SHALL contain exactly one [1..1] Reaction (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.85:2014-12-01) (CONF:2228-27128).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.46-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.46']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.46-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.47-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.47-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.42-2014-06-09-warnings-abstract" />
      <sch:assert id="a-2228-27736" test="not(cda:routeCode) or cda:routeCode[@sdtc:valueSet]">The routeCode, if present, SHOULD contain zero or one [0..1] @sdtc:valueSet (CONF:2228-27736).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.47-2016-02-01-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.47']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.47-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.75-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.75-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.42-2014-06-09-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.75-2016-02-01-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.75']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.75-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.112-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.112-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.46-2015-08-01-warnings-abstract" />
      <sch:assert id="a-2228-27694" test="cda:value[@xsi:type='CD'][@sdtc:valueSet]">This value SHOULD contain zero or one [0..1] @sdtc:valueSet (CONF:2228-27694).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.112-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.112']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.112-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.12-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.12-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.45-2015-08-01-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.12-2016-02-01-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.12']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.12-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.140-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.140-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.140-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.140']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.140-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.84-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.84-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.84-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.84']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.84-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.83-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.83-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.83-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.83']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.83-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.143-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.143-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.22.4.120-warnings-abstract" />
      <sch:assert id="a-2228-28637" test="not(cda:routeCode) or cda:routeCode[@sdtc:valueSet]">The routeCode, if present, SHOULD contain zero or one [0..1] @sdtc:valueSet (CONF:2228-28637).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.143-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.143']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.143-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.24.3.41-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.41-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.22.4.16-2014-06-09-warnings-abstract" />
      <sch:assert id="a-2228-27644" test="not(cda:routeCode) or cda:routeCode[@sdtc:valueSet]">The routeCode, if present, SHOULD contain zero or one [0..1] @sdtc:valueSet (CONF:2228-27644).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.41-2016-02-01-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.41']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.24.3.41-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
</sch:schema>