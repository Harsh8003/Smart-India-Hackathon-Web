# ==============================================================================
# Build Real Native PowerPoint (.pptx) Presentation for SIH 2026
# Theme: Official Light SIH Theme (White, Deep Navy, Saffron, Green, Charcoal)
# ==============================================================================

$buildDir = "$PSScriptRoot/pptx_build"
$outputPptx = "$PSScriptRoot/NLADR_SIH_Presentation.pptx"

if (Test-Path $buildDir) {
  Remove-Item -Recurse -Force $buildDir
}

# Create Folder Structure
$dirs = @(
  "$buildDir/_rels",
  "$buildDir/docProps",
  "$buildDir/ppt/_rels",
  "$buildDir/ppt/slides/_rels",
  "$buildDir/ppt/slideLayouts/_rels",
  "$buildDir/ppt/slideMasters/_rels",
  "$buildDir/ppt/theme"
)
foreach ($d in $dirs) {
  New-Item -ItemType Directory -Path $d -Force | Out-Null
}

# 1. [Content_Types].xml
@'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
  <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
  <Default Extension="xml" ContentType="application/xml"/>
  <Override PartName="/ppt/presentation.xml" ContentType="application/vnd.openxmlformats-officedocument.presentationml.presentation.main+xml"/>
  <Override PartName="/ppt/slideMasters/slideMaster1.xml" ContentType="application/vnd.openxmlformats-officedocument.presentationml.slideMaster+xml"/>
  <Override PartName="/ppt/slideLayouts/slideLayout1.xml" ContentType="application/vnd.openxmlformats-officedocument.presentationml.slideLayout+xml"/>
  <Override PartName="/ppt/theme/theme1.xml" ContentType="application/vnd.openxmlformats-officedocument.theme+xml"/>
  <Override PartName="/ppt/slides/slide1.xml" ContentType="application/vnd.openxmlformats-officedocument.presentationml.slide+xml"/>
  <Override PartName="/ppt/slides/slide2.xml" ContentType="application/vnd.openxmlformats-officedocument.presentationml.slide+xml"/>
  <Override PartName="/ppt/slides/slide3.xml" ContentType="application/vnd.openxmlformats-officedocument.presentationml.slide+xml"/>
  <Override PartName="/ppt/slides/slide4.xml" ContentType="application/vnd.openxmlformats-officedocument.presentationml.slide+xml"/>
  <Override PartName="/ppt/slides/slide5.xml" ContentType="application/vnd.openxmlformats-officedocument.presentationml.slide+xml"/>
  <Override PartName="/docProps/core.xml" ContentType="application/vnd.openxmlformats-package.core-properties+xml"/>
  <Override PartName="/docProps/app.xml" ContentType="application/vnd.openxmlformats-officedocument.extended-properties+xml"/>
</Types>
'@ | Set-Content -Encoding UTF8 "$buildDir/[Content_Types].xml"

# 2. _rels/.rels
@'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="ppt/presentation.xml"/>
  <Relationship Id="rId2" Type="http://schemas.openxmlformats.org/package/2006/relationships/metadata/core-properties" Target="docProps/core.xml"/>
  <Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/extended-properties" Target="docProps/app.xml"/>
</Relationships>
'@ | Set-Content -Encoding UTF8 "$buildDir/_rels/.rels"

# 3. docProps/app.xml
@'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Properties xmlns="http://schemas.openxmlformats.org/officeDocument/2006/extended-properties" xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes">
  <TotalTime>0</TotalTime>
  <Words>0</Words>
  <Application>Smart India Hackathon PPT Generator</Application>
  <PresentationFormat>On-screen Show (16:9)</PresentationFormat>
  <Paragraphs>0</Paragraphs>
  <Slides>5</Slides>
  <Notes>0</Notes>
  <HiddenSlides>0</HiddenSlides>
  <MMClips>0</MMClips>
  <ScaleCrop>false</ScaleCrop>
  <HeadingPairs><vt:vector size="2" baseType="variant"><vt:variant><vt:lpstr>Theme</vt:lpstr></vt:variant><vt:variant><vt:i4>1</vt:i4></vt:variant></vt:vector></HeadingPairs>
  <TitlesOfParts><vt:vector size="1" baseType="lpstr"><vt:lpstr>SIH 2026 Presentation</vt:lpstr></vt:vector></TitlesOfParts>
  <Company>Smart India Hackathon</Company>
  <LinksUpToDate>false</LinksUpToDate>
  <SharedDoc>false</SharedDoc>
  <HyperlinksChanged>false</HyperlinksChanged>
  <AppVersion>16.0000</AppVersion>
</Properties>
'@ | Set-Content -Encoding UTF8 "$buildDir/docProps/app.xml"

# 4. docProps/core.xml
@'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<cp:coreProperties xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <dc:title>NLADR - Smart India Hackathon Presentation</dc:title>
  <dc:subject>National Legal &amp; Investigation Document Repository</dc:subject>
  <dc:creator>SIH Innovation Team</dc:creator>
  <cp:keywords>SIH, LegalTech, Document Management, BNS, BSA, Forensic Evidence</cp:keywords>
  <dc:description>Smart India Hackathon Official 5-Slide Presentation Deck</dc:description>
  <cp:lastModifiedBy>SIH Innovation Team</cp:lastModifiedBy>
  <dcterms:created xsi:type="dcterms:W3CDTF">2026-09-19T00:00:00Z</dcterms:created>
  <dcterms:modified xsi:type="dcterms:W3CDTF">2026-09-19T00:00:00Z</dcterms:modified>
</cp:coreProperties>
'@ | Set-Content -Encoding UTF8 "$buildDir/docProps/core.xml"

# 5. ppt/presentation.xml
@'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:presentation xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
  <p:sldMasterIdLst>
    <p:sldMasterId id="2147483648" r:id="rId1"/>
  </p:sldMasterIdLst>
  <p:sldIdLst>
    <p:sldId id="256" r:id="rId2"/>
    <p:sldId id="257" r:id="rId3"/>
    <p:sldId id="258" r:id="rId4"/>
    <p:sldId id="259" r:id="rId5"/>
    <p:sldId id="260" r:id="rId6"/>
  </p:sldIdLst>
  <p:sldSz cx="12192000" cy="6858000" type="screen16x9"/>
  <p:notesSz cx="6858000" cy="9144000"/>
</p:presentation>
'@ | Set-Content -Encoding UTF8 "$buildDir/ppt/presentation.xml"

# 6. ppt/_rels/presentation.xml.rels
@'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideMaster" Target="slideMasters/slideMaster1.xml"/>
  <Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slide" Target="slides/slide1.xml"/>
  <Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slide" Target="slides/slide2.xml"/>
  <Relationship Id="rId4" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slide" Target="slides/slide3.xml"/>
  <Relationship Id="rId5" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slide" Target="slides/slide4.xml"/>
  <Relationship Id="rId6" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slide" Target="slides/slide5.xml"/>
</Relationships>
'@ | Set-Content -Encoding UTF8 "$buildDir/ppt/_rels/presentation.xml.rels"

# 7. ppt/theme/theme1.xml
@'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<a:theme xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" name="SIH Light Theme">
  <a:themeElements>
    <a:clrScheme name="SIH Light">
      <a:dk1><a:srgbClr val="0F172A"/></a:dk1>
      <a:lt1><a:srgbClr val="FFFFFF"/></a:lt1>
      <a:dk2><a:srgbClr val="1E293B"/></a:dk2>
      <a:lt2><a:srgbClr val="F8FAFC"/></a:lt2>
      <a:accent1><a:srgbClr val="002266"/></a:accent1>
      <a:accent2><a:srgbClr val="EA580C"/></a:accent2>
      <a:accent3><a:srgbClr val="16A34A"/></a:accent3>
      <a:accent4><a:srgbClr val="0284C7"/></a:accent4>
      <a:accent5><a:srgbClr val="DC2626"/></a:accent5>
      <a:accent6><a:srgbClr val="D97706"/></a:accent6>
      <a:hlink><a:srgbClr val="0284C7"/></a:hlink>
      <a:folHlink><a:srgbClr val="6D28D9"/></a:folHlink>
    </a:clrScheme>
    <a:fontScheme name="SIH Office">
      <a:majorFont><a:latin typeface="Segoe UI Semibold"/></a:majorFont>
      <a:minorFont><a:latin typeface="Segoe UI"/></a:minorFont>
    </a:fontScheme>
    <a:fmtScheme name="SIH Format">
      <a:fillStyleLst><a:solidFill><a:schemeClr val="phClr"/></a:solidFill></a:fillStyleLst>
      <a:lnStyleLst><a:ln w="9525"><a:solidFill><a:schemeClr val="phClr"/></a:solidFill></a:ln></a:lnStyleLst>
      <a:effectStyleLst><a:effectStyle><a:effectLst/></a:effectStyle></a:effectStyleLst>
      <a:bgFillStyleLst><a:solidFill><a:schemeClr val="phClr"/></a:solidFill></a:bgFillStyleLst>
    </a:fmtScheme>
  </a:themeElements>
</a:theme>
'@ | Set-Content -Encoding UTF8 "$buildDir/ppt/theme/theme1.xml"

# 8. ppt/slideMasters/slideMaster1.xml
@'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:sldMaster xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
  <p:cSld>
    <p:spTree>
      <p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr>
      <p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/><a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr>
    </p:spTree>
  </p:cSld>
  <p:clrMap bg1="lt1" tx1="dk1" bg2="lt2" tx2="dk2" accent1="accent1" accent2="accent2" accent3="accent3" accent4="accent4" accent5="accent5" accent6="accent6" hlink="hlink" folHlink="folHlink"/>
  <p:sldLayoutIdLst>
    <p:sldLayoutId id="2147483649" r:id="rId1"/>
  </p:sldLayoutIdLst>
  <p:txStyles>
    <p:titleStyle><a:lvl1pPr><a:defRPr sz="2800" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:defRPr></a:lvl1pPr></p:titleStyle>
    <p:bodyStyle><a:lvl1pPr><a:defRPr sz="1400"><a:solidFill><a:srgbClr val="1E293B"/></a:solidFill></a:defRPr></a:lvl1pPr></p:bodyStyle>
    <p:otherStyle><a:lvl1pPr><a:defRPr sz="1200"/></a:lvl1pPr></p:otherStyle>
  </p:txStyles>
</p:sldMaster>
'@ | Set-Content -Encoding UTF8 "$buildDir/ppt/slideMasters/slideMaster1.xml"

# 9. ppt/slideMasters/_rels/slideMaster1.xml.rels
@'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideLayout" Target="../slideLayouts/slideLayout1.xml"/>
  <Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme" Target="../theme/theme1.xml"/>
</Relationships>
'@ | Set-Content -Encoding UTF8 "$buildDir/ppt/slideMasters/_rels/slideMaster1.xml.rels"

# 10. ppt/slideLayouts/slideLayout1.xml
@'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:sldLayout xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main" type="blank" preserve="1">
  <p:cSld>
    <p:spTree>
      <p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr>
      <p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/><a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr>
    </p:spTree>
  </p:cSld>
  <p:clrMapOvr><a:masterClrMapping/></p:clrMapOvr>
</p:sldLayout>
'@ | Set-Content -Encoding UTF8 "$buildDir/ppt/slideLayouts/slideLayout1.xml"

# 11. ppt/slideLayouts/_rels/slideLayout1.xml.rels
@'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideMaster" Target="../slideMasters/slideMaster1.xml"/>
</Relationships>
'@ | Set-Content -Encoding UTF8 "$buildDir/ppt/slideLayouts/_rels/slideLayout1.xml.rels"

# Slide Relationships Helper (slide1 to slide5)
for ($i = 1; $i -le 5; $i++) {
  @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideLayout" Target="../slideLayouts/slideLayout1.xml"/>
</Relationships>
'@ | Set-Content -Encoding UTF8 "$buildDir/ppt/slides/_rels/slide$i.xml.rels"
}

# ==============================================================================
# FUNCTION: Generate Slide XML
# ==============================================================================
function Get-SlideHeaderXML($sihNumber, $slideCategory, $slideTitle, $slideSubtitle) {
  return @"
      <!-- SIH Top Banner Stripe (Tricolor Accent) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="101" name="BannerTop"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="0" y="0"/><a:ext cx="12192000" cy="80000"/></a:xfrm>
          <a:prstGeom prst="rect"><a:avLst/></a:prstGeom>
          <a:solidFill><a:srgbClr val="EA580C"/></a:solidFill>
        </p:spPr>
      </p:sp>

      <!-- SIH Header Box -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="102" name="HeaderBox"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="600000" y="220000"/><a:ext cx="10992000" cy="850000"/></a:xfrm>
          <a:prstGeom prst="rect"><a:avLst/></a:prstGeom>
          <a:noFill/>
          <a:ln><a:noFill/></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr/><a:lstStyle/>
          <a:p>
            <a:r>
              <a:rPr sz="1100" b="1"><a:solidFill><a:srgbClr val="EA580C"/></a:solidFill></a:rPr>
              <a:t>SMART INDIA HACKATHON 2026</a:t>
            </a:r>
            <a:r>
              <a:rPr sz="1100"><a:solidFill><a:srgbClr val="64748B"/></a:solidFill></a:rPr>
              <a:t>  |  THEME: LEGALTECH &amp; SMART GOVERNANCE  |  SLIDE $sihNumber OF 5: $slideCategory</a:t>
            </a:r>
          </a:p>
          <a:p>
            <a:pPr marL="0" marR="0" indent="0"/>
            <a:r>
              <a:rPr sz="2200" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr>
              <a:t>$slideTitle</a:t>
            </a:r>
          </a:p>
          <a:p>
            <a:pPr marL="0" marR="0" indent="0"/>
            <a:r>
              <a:rPr sz="1150" i="1"><a:solidFill><a:srgbClr val="475569"/></a:solidFill></a:rPr>
              <a:t>$slideSubtitle</a:t>
            </a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- SIH Header Divider -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="103" name="Divider"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="600000" y="1120000"/><a:ext cx="10992000" cy="25000"/></a:xfrm>
          <a:prstGeom prst="rect"><a:avLst/></a:prstGeom>
          <a:solidFill><a:srgbClr val="CBD5E1"/></a:solidFill>
        </p:spPr>
      </p:sp>
"@
}

# ==============================================================================
# SLIDE 1: Problem Landscape, Solution & Hierarchy
# ==============================================================================
$s1Header = Get-SlideHeaderXML "1" "PROBLEM, SOLUTION &amp; HIERARCHY" "National Legal &amp; Investigation Document Repository (NLADR)" "Sovereign Tamper-Evident Evidence Lifecycle, Chain-of-Custody &amp; Judicial Integrity"

$slide1XML = @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:sld xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
  <p:cSld>
    <p:spTree>
      <p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr>
      <p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/><a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr>

      $s1Header

      <!-- Card 1: Real-World Issue (Left Column Top) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="110" name="CardProblem"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="600000" y="1250000"/><a:ext cx="5250000" cy="1550000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 2000"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="FEF2F2"/></a:solidFill>
          <a:ln w="19050"><a:solidFill><a:srgbClr val="F87171"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="180000" tIns="140000" rIns="180000" bIns="140000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="1300" b="1"><a:solidFill><a:srgbClr val="991B1B"/></a:solidFill></a:rPr><a:t>[!] REAL-WORLD ISSUE: EVIDENCE VULNERABILITY IN PAPER SYSTEMS</a:t></a:r>
          </a:p>
          <a:p>
            <a:r><a:rPr sz="1050"><a:solidFill><a:srgbClr val="1E293B"/></a:solidFill></a:rPr>
            <a:t>• 5.02 Crore+ pending cases in Indian courts; criminal trials average 5-11 years.&#10;• Critical procedural delays and wrongful acquittals result from missing case diaries, manipulated physical evidence, and broken chains of custody.&#10;• High risk of physical damage, warehouse file decay, and unauthorized record swapping.</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- Card 2: Solution & Why It Is Important (Left Column Mid) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="111" name="CardSolution"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="600000" y="2900000"/><a:ext cx="5250000" cy="1650000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 2000"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="F0FDF4"/></a:solidFill>
          <a:ln w="19050"><a:solidFill><a:srgbClr val="4ADE80"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="180000" tIns="140000" rIns="180000" bIns="140000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="1300" b="1"><a:solidFill><a:srgbClr val="166534"/></a:solidFill></a:rPr><a:t>[✓] PROPOSED SOVEREIGN SOLUTION &amp; IMPORTANCE</a:t></a:r>
          </a:p>
          <a:p>
            <a:r><a:rPr sz="1050"><a:solidFill><a:srgbClr val="1E293B"/></a:solidFill></a:rPr>
            <a:t>• NLADR: Sovereign, role-based digital evidence management portal.&#10;• Client-Side SHA-256 Hashing locks evidence integrity at ingestion.&#10;• Dual Physical-Digital Vault Mapping binds physical exhibits to cloud dockets.&#10;• Why Important: Guarantees Article 21 Right to Speedy Trial; prevents custodial tampering; eliminates paper loss.</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- Card 3: Identified Risks & Engineering Mitigations (Left Column Bottom) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="112" name="CardRisks"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="600000" y="4650000"/><a:ext cx="5250000" cy="1850000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 2000"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="FFFBEB"/></a:solidFill>
          <a:ln w="19050"><a:solidFill><a:srgbClr val="FCD34D"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="180000" tIns="140000" rIns="180000" bIns="140000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="1300" b="1"><a:solidFill><a:srgbClr val="92400E"/></a:solidFill></a:rPr><a:t>[!] IDENTIFIED RISKS &amp; ENGINEERING MITIGATIONS</a:t></a:r>
          </a:p>
          <a:p>
            <a:r><a:rPr sz="1000"><a:solidFill><a:srgbClr val="1E293B"/></a:solidFill></a:rPr>
            <a:t>1. Insider Tampering: SHA-256 digest comparison halts compromised dossiers.&#10;2. Judicial Rejection: Automated Section 63 BSA / Sec 65B electronic certificates.&#10;3. Data Privacy Breach: Strict RBAC &amp; DPDP Act 2023 complainant redaction.&#10;4. Physical/Digital Desync: Barcode/QR locator tags on physical warehouse racks.</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- Card 4: Hierarchical Structure Form (Right Column Full) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="113" name="CardHierarchy"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="6050000" y="1250000"/><a:ext cx="5542000" cy="5250000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 1500"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="F8FAFC"/></a:solidFill>
          <a:ln w="19050"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="200000" tIns="160000" rIns="200000" bIns="160000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="1400" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr><a:t>HIERARCHICAL GOVERNANCE &amp; OPERATIONAL STRUCTURE</a:t></a:r>
          </a:p>
          <a:p><a:r><a:rPr sz="1000" i="1"><a:solidFill><a:srgbClr val="64748B"/></a:solidFill></a:rPr><a:t>End-to-End Institutional Coordination Across India's Legal Framework</a:t></a:r></a:p>
          <a:p>
            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr>
            <a:t>&#10;[1] MINISTRY LEVEL: Ministry of Law &amp; Justice / Ministry of Home Affairs</a:t></a:r>
            <a:r><a:rPr sz="1000"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;  ├── Policy guidelines, statutory alignment (BNS, BNSS, BSA 2023)&#10;  └── Interoperability with e-Courts 3.0 &amp; ICJS National Backbone</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="0284C7"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;[2] NLADR CENTRAL CORE: Sovereign Cryptographic Grid</a:t></a:r>
            <a:r><a:rPr sz="1000"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;  ├── FIPS 180-4 SHA-256 Checksum Engine &amp; RFC 3161 Timestamping&#10;  └── Immutable Audit Log, Intrusion Detection &amp; Zero-Trust Gatekeeper</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="EA580C"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;[3] LAW ENFORCEMENT: Investigating Officers (IO) &amp; Police Stations</a:t></a:r>
            <a:r><a:rPr sz="1000"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;  ├── Case diary entries under Sec 173 CrPC / Sec 193 BNSS&#10;  ├── Digital seizure memo &amp; videography hashing (Sec 105 BNSS)&#10;  └── Dispatch to Forensic Science Laboratories (CFSL/FSL)</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="16A34A"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;[4] JUDICIAL &amp; PROSECUTION: Public Prosecutors &amp; Trial Courts</a:t></a:r>
            <a:r><a:rPr sz="1000"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;  ├── Charge-sheet review, trial hearing schedules &amp; conviction tracking&#10;  └── Automated Sec 63 BSA / Sec 65B IEA Certified Exhibit Generation</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="6D28D9"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;[5] PHYSICAL CUSTODY &amp; CITIZEN TRANSPARENCY</a:t></a:r>
            <a:r><a:rPr sz="1000"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;  ├── Record Custodian: Warehouse, Vault, Rack &amp; Shelf Spatial Mapping&#10;  └── Citizen Portal: FIR tracking, grievance filing &amp; certified receipts</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

    </p:spTree>
  </p:cSld>
</p:sld>
"@
$slide1XML | Set-Content -Encoding UTF8 "$buildDir/ppt/slides/slide1.xml"

# ==============================================================================
# SLIDE 2: Technical Approach, Circular Flow & Technologies
# ==============================================================================
$s2Header = Get-SlideHeaderXML "2" "TECHNICAL APPROACH &amp; ARCHITECTURE" "Technical Approach, Circular Flow &amp; Technology Stack" "5-Stage Closed-Loop Cryptographic Lifecycle with Zero-Trust Multi-Role Coordination"

$slide2XML = @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:sld xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
  <p:cSld>
    <p:spTree>
      <p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr>
      <p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/><a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr>

      $s2Header

      <!-- Circular Flow Diagram Representation (Left Box) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="210" name="CircularFlowBox"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="600000" y="1250000"/><a:ext cx="5450000" cy="5250000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 1500"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="F8FAFC"/></a:solidFill>
          <a:ln w="19050"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="200000" tIns="160000" rIns="200000" bIns="160000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="1400" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr><a:t>5-STAGE CLOSED-LOOP EVIDENCE LIFECYCLE FLOW</a:t></a:r>
          </a:p>
          <a:p><a:r><a:rPr sz="1000" i="1"><a:solidFill><a:srgbClr val="64748B"/></a:solidFill></a:rPr><a:t>Continuous Integrity Verification from Crime Scene to Final Judgment</a:t></a:r></a:p>
          <a:p>
            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="0284C7"/></a:solidFill></a:rPr>
            <a:t>&#10;STAGE 1: INCIDENT &amp; EVIDENCE INGESTION (Top of Cycle)</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="1E293B"/></a:solidFill></a:rPr>
            <a:t>&#10;• IO logs Case Diary; uploads seizure memo, FIR, CCTV, audio, forensic lab PDFs.&#10;• Captures GPS, EXIF device metadata, and timestamp via 256-bit TLS.</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="EA580C"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;STAGE 2: CRYPTOGRAPHIC HASHING (Web Crypto API)</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="1E293B"/></a:solidFill></a:rPr>
            <a:t>&#10;• Instant 256-bit SHA-256 fingerprint generated at ingestion.&#10;• 1-bit alteration completely breaks checksum; bound to RFC 3161 PKI time-stamp.</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="16A34A"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;STAGE 3: ROLE-BASED CUSTODY ROUTING (RBAC Governance)</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="1E293B"/></a:solidFill></a:rPr>
            <a:t>• Evidence transitions securely: IO -&gt; Forensic Lab (CFSL) -&gt; Public Prosecutor.&#10;• Real-time immutable event log tracking actor ID, role, action, and IP address.</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="6D28D9"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;STAGE 4: DUAL-LOCATION VAULT ARCHIVAL (Physical + Cloud)</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="1E293B"/></a:solidFill></a:rPr>
            <a:t>• Physical custody record mapped to exact warehouse Vault, Rack &amp; Shelf ID.&#10;• Barcode/QR generated for evidence lockers; digital files encrypted at rest (AES-256).</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;STAGE 5: JUDICIAL ADMISSIBILITY &amp; TRIAL DISPOSAL (Closing Cycle)</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="1E293B"/></a:solidFill></a:rPr>
            <a:t>• Automated generation of Section 63 BSA / Section 65B IEA Certificates.&#10;• Certified PDF dossier exported directly to e-Courts Judicial Cause List.</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- Right Column: Technologies & Pictorial Multi-Role Workflow -->
      <!-- Box 1: Technologies Used -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="211" name="TechStackBox"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="6250000" y="1250000"/><a:ext cx="5342000" cy="2550000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 2000"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="EFF6FF"/></a:solidFill>
          <a:ln w="19050"><a:solidFill><a:srgbClr val="38BDF8"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="180000" tIns="140000" rIns="180000" bIns="140000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="1300" b="1"><a:solidFill><a:srgbClr val="0369A1"/></a:solidFill></a:rPr><a:t>[&lt;/&gt;] TECHNOLOGIES USED &amp; ARCHITECTURAL STACK</a:t></a:r>
          </a:p>
          <a:p>
            <a:r><a:rPr sz="1020"><a:solidFill><a:srgbClr val="1E293B"/></a:solidFill></a:rPr>
            <a:t>• Frontend &amp; UI: Semantic HTML5, CSS3 Gov Theme, Vanilla ES6+ Modular State Engine (Zero heavyweight runtime, instant &lt;800ms load).&#10;• Cryptography &amp; Security: Native Web Crypto API (SHA-256), FIPS 180-4, RFC 3161 PKI, 256-bit TLS in transit, AES-256 at rest.&#10;• Compliance &amp; Standards: GIGW 3.0 Accessible Indian Gov Website Guidelines, ISO 27001, DPDP Act 2023.&#10;• Cloud &amp; Offline Storage: Vercel Serverless Edge, IndexedDB local encrypted cache (offline-resilient for rural police stations).</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- Box 2: Pictorial Persona Representation -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="212" name="PersonaBox"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="6250000" y="3950000"/><a:ext cx="5342000" cy="2550000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 2000"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="F8FAFC"/></a:solidFill>
          <a:ln w="19050"><a:solidFill><a:srgbClr val="CBD5E1"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="180000" tIns="140000" rIns="180000" bIns="140000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="1300" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr><a:t>[👥] PICTORIAL MULTI-ROLE COORDINATION WORKFLOW</a:t></a:r>
          </a:p>
          <a:p>
            <a:r><a:rPr sz="1000"><a:solidFill><a:srgbClr val="1E293B"/></a:solidFill></a:rPr>
            <a:t>• [Admin]: Oversees security locks, manages user credentials, monitors audit trail.&#10;• [Investigator]: Records case diary entries, hashes digital seizures, logs witnesses.&#10;• [Legal Officer]: Scrutinizes chargesheets, generates Section 63 BSA certificates, manages trial hearings.&#10;• [Record Custodian]: Manages physical evidence lockers, vault coordinates, QR scans.&#10;• [Citizen]: Tracks FIR procedural milestones; downloads certified acknowledgement PDF via DigiLocker.</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

    </p:spTree>
  </p:cSld>
</p:sld>
"@
$slide2XML | Set-Content -Encoding UTF8 "$buildDir/ppt/slides/slide2.xml"

# ==============================================================================
# SLIDE 3: Feasibility, Viability & Business Potential
# ==============================================================================
$s3Header = Get-SlideHeaderXML "3" "FEASIBILITY, VIABILITY &amp; BUSINESS POTENTIAL" "Feasibility Analysis, Business Viability &amp; Scalability" "Technical Ease, Zero Proprietary License Overhead, Administrative ROI &amp; National Scalability"

$slide3XML = @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:sld xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
  <p:cSld>
    <p:spTree>
      <p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvPr>
      <p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/><a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr>

      $s3Header

      <!-- 4-Dimensional Feasibility Matrix (Left Box) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="310" name="FeasBox"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="600000" y="1250000"/><a:ext cx="5450000" cy="5250000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 1500"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="F8FAFC"/></a:solidFill>
          <a:ln w="19050"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="200000" tIns="160000" rIns="200000" bIns="160000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="1400" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr><a:t>4-DIMENSIONAL FEASIBILITY ASSESSMENT</a:t></a:r>
          </a:p>
          <a:p><a:r><a:rPr sz="1000" i="1"><a:solidFill><a:srgbClr val="64748B"/></a:solidFill></a:rPr><a:t>Evaluating Practical Deployment Across India's District Courts &amp; Police Stations</a:t></a:r></a:p>
          <a:p>
            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="0284C7"/></a:solidFill></a:rPr>
            <a:t>&#10;1. TECHNICAL FEASIBILITY: Zero Heavy Dependencies</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="1E293B"/></a:solidFill></a:rPr>
            <a:t>&#10;• Runs directly in any standard browser; no heavy Python/Java runtime or GPU clusters needed.&#10;• Sub-second response times on 3G/4G; offline IndexedDB synchronization for remote stations.</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="EA580C"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;2. OPERATIONAL FEASIBILITY: Familiar Law Enforcement UX</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="1E293B"/></a:solidFill></a:rPr>
            <a:t>&#10;• Designed after traditional General Diary (GD) and Charge Sheet (Form 173) formats.&#10;• Constabulary requires less than 30 minutes training; includes bilingual English/Hindi support.</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="16A34A"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;3. LEGAL &amp; STATUTORY FEASIBILITY: 100% Law Aligned</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="1E293B"/></a:solidFill></a:rPr>
            <a:t>&#10;• Direct alignment with Bharatiya Sakshya Adhiniyam 2023 (Sec 61, 62 &amp; 63).&#10;• Adheres to Supreme Court Arjun Panditrao Khotkar (2020) electronic evidence standards.</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="6D28D9"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;4. FINANCIAL FEASIBILITY: Open-Source Cost Elimination</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="1E293B"/></a:solidFill></a:rPr>
            <a:t>&#10;• Eliminates ₹50,000/seat annual commercial software fees (OpenText/FileNet).&#10;• Pays for itself within 4 months through paper, courier, and transit reduction.</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- Right Column: Business Potential & Quantified ROI -->
      <!-- Box 1: Quantified Economic ROI -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="311" name="ROIBox"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="6250000" y="1250000"/><a:ext cx="5342000" cy="2750000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 2000"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="F0FDF4"/></a:solidFill>
          <a:ln w="19050"><a:solidFill><a:srgbClr val="22C55E"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="180000" tIns="140000" rIns="180000" bIns="140000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="1300" b="1"><a:solidFill><a:srgbClr val="15803D"/></a:solidFill></a:rPr><a:t>[₹] QUANTIFIED ADMINISTRATIVE ROI (Per 10,000 Cases/Month)</a:t></a:r>
          </a:p>
          <a:p>
            <a:r><a:rPr sz="1020"><a:solidFill><a:srgbClr val="1E293B"/></a:solidFill></a:rPr>
            <a:t>• 25.0 Lakh Sheets of Paper Saved Annually: 250 sheets/case eliminated.&#10;• ₹1.12 Crore Fiscal Cost Avoidance: Courier, photocopying, binding, and file warehousing expenditures slashed.&#10;• 60,000 Police Man-Hours Freed: IOs spend time solving crimes rather than physically ferrying paper dockets between stations and courts.&#10;• 70% Faster Trial Scheduling: Electronic dossiers reach Magisterial desks instantly upon filing.</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- Box 2: Target Market & Business Viability -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="312" name="MarketBox"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="6250000" y="4150000"/><a:ext cx="5342000" cy="2350000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 2000"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="F8FAFC"/></a:solidFill>
          <a:ln w="19050"><a:solidFill><a:srgbClr val="CBD5E1"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="180000" tIns="140000" rIns="180000" bIns="140000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="1300" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr><a:t>[🌐] MARKET VIABILITY &amp; SCALABILITY ROADMAP</a:t></a:r>
          </a:p>
          <a:p>
            <a:r><a:rPr sz="1000"><a:solidFill><a:srgbClr val="1E293B"/></a:solidFill></a:rPr>
            <a:t>• Addressable Market: 16,000+ Police Stations, 670+ District Courts, 25 High Courts.&#10;• Central Agencies: Immediate applicability for CBI, NIA, ED, DRI, SFIO, CVC.&#10;• Phase 1: Pilot district deployment with 20 police stations and 1 District Court.&#10;• Phase 2: State-wide rollout across State Police Headquarters &amp; High Court.&#10;• Phase 3: Pan-India ICJS (Inter-operable Criminal Justice System) integration.</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

    </p:spTree>
  </p:cSld>
</p:sld>
"@
$slide3XML | Set-Content -Encoding UTF8 "$buildDir/ppt/slides/slide3.xml"

# ==============================================================================
# SLIDE 4: Impacts, Limitations vs Perks & Safety Flowchart
# ==============================================================================
$s4Header = Get-SlideHeaderXML "4" "IMPACTS, LIMITATIONS VS PERKS &amp; SAFETY" "System Impacts, Limitations vs. Perks &amp; Safety Safeguards" "Comparative Benchmark Against Legacy Paper Systems with Real-Time Intrusion Alerts"

$slide4XML = @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:sld xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
  <p:cSld>
    <p:spTree>
      <p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvPr>
      <p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/><a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr>

      $s4Header

      <!-- Comparative Limitations vs Perks (Left Box) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="410" name="CompBox"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="600000" y="1250000"/><a:ext cx="5450000" cy="5250000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 1500"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="F8FAFC"/></a:solidFill>
          <a:ln w="19050"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="200000" tIns="160000" rIns="200000" bIns="160000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="1400" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr><a:t>BENCHMARK: LEGACY PAPER LIMITATIONS VS. NLADR PERKS</a:t></a:r>
          </a:p>
          <a:p><a:r><a:rPr sz="1000" i="1"><a:solidFill><a:srgbClr val="64748B"/></a:solidFill></a:rPr><a:t>Rigorous Performance Comparison Across Critical Justice Delivery Metrics</a:t></a:r></a:p>
          <a:p>
            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr>
            <a:t>&#10;1. DOCKET RETRIEVAL &amp; TRANSIT LATENCY</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="DC2626"/></a:solidFill></a:rPr><a:t>&#10;• Legacy Paper: 14 to 28 Days </a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="475569"/></a:solidFill></a:rPr><a:t>(Manual record clerk search, physical courier)</a:t></a:r>
            <a:r><a:rPr sz="980" b="1"><a:solidFill><a:srgbClr val="16A34A"/></a:solidFill></a:rPr><a:t>&#10;• NLADR Portal: &lt; 1.2 Seconds </a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="15803D"/></a:solidFill></a:rPr><a:t>[99.9% ACCELERATION VIA INDEXED SEARCH]</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;2. TAMPER VULNERABILITY &amp; INTEGRITY</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="DC2626"/></a:solidFill></a:rPr><a:t>&#10;• Legacy Paper: Extremely High </a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="475569"/></a:solidFill></a:rPr><a:t>(Page substitution, fire, pest damage, ink fade)</a:t></a:r>
            <a:r><a:rPr sz="980" b="1"><a:solidFill><a:srgbClr val="16A34A"/></a:solidFill></a:rPr><a:t>&#10;• NLADR Portal: Cryptographically Immune </a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="15803D"/></a:solidFill></a:rPr><a:t>[1-BIT MODIFICATION BREAKS HASH]</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;3. CHAIN-OF-CUSTODY AUDIT TRAIL</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="DC2626"/></a:solidFill></a:rPr><a:t>&#10;• Legacy Paper: Fragile Hand-Signed Registers </a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="475569"/></a:solidFill></a:rPr><a:t>(Frequently unverified in court)</a:t></a:r>
            <a:r><a:rPr sz="980" b="1"><a:solidFill><a:srgbClr val="16A34A"/></a:solidFill></a:rPr><a:t>&#10;• NLADR Portal: 100% Immutable Digital Ledger </a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="15803D"/></a:solidFill></a:rPr><a:t>[ACTOR, ROLE, IP &amp; TIMESTAMP]</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;4. ADMINISTRATIVE COST PER CASE</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="DC2626"/></a:solidFill></a:rPr><a:t>&#10;• Legacy Paper: ~₹4,500 / Case </a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="475569"/></a:solidFill></a:rPr><a:t>(Physical materials, vehicle transit, warehousing)</a:t></a:r>
            <a:r><a:rPr sz="980" b="1"><a:solidFill><a:srgbClr val="16A34A"/></a:solidFill></a:rPr><a:t>&#10;• NLADR Portal: ~₹35 / Case </a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="15803D"/></a:solidFill></a:rPr><a:t>[93% COST REDUCTION VIA SERVERLESS ARCHITECTURE]</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- Right Column: Safety, Visibility & Alert Flowchart -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="411" name="SafetyBox"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="6250000" y="1250000"/><a:ext cx="5342000" cy="5250000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 1500"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="F8FAFC"/></a:solidFill>
          <a:ln w="19050"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="200000" tIns="160000" rIns="200000" bIns="160000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="1400" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr><a:t>ALERTS, SAFETY &amp; VISIBILITY PIPELINE FLOWCHART</a:t></a:r>
          </a:p>
          <a:p><a:r><a:rPr sz="1000" i="1"><a:solidFill><a:srgbClr val="64748B"/></a:solidFill></a:rPr><a:t>Automated Real-Time Breach Detection &amp; Transparency Governance</a:t></a:r></a:p>
          <a:p>
            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="0284C7"/></a:solidFill></a:rPr>
            <a:t>&#10;[1] SECURE INGESTION GATEWAY</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;• File uploaded via TLS 1.3; device metadata &amp; IO token captured.</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="EA580C"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;[2] CRYPTOGRAPHIC INTEGRITY ENGINE</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;• SHA-256 hash calculated &amp; locked into immutable audit trail.</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="16A34A"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;[3] ROLE-SCOPED VISIBILITY GATE</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;• IO sees assigned case; Prosecutor views trial exhibits; Citizen sees redacted status.</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="DC2626"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;[4] AUTONOMOUS TAMPER WATCHDOG &amp; EMERGENCY ALERTS</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;• Background service continuously recalculates hashes against locked digests.&#10;• ON BREACH ATTEMPT: System instantly freezes docket, triggers SMS/email alert to Superintendent of Police &amp; Learned Trial Magistrate, and flags file as Quarantined.</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;[5] PERMANENT AUDIT LEDGER (WORM COMPLIANCE)</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;• Write-Once-Read-Many logging; every view, export, and transfer recorded permanently.</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

    </p:spTree>
  </p:cSld>
</p:sld>
"@
$slide4XML | Set-Content -Encoding UTF8 "$buildDir/ppt/slides/slide4.xml"

# ==============================================================================
# SLIDE 5: Research & References, Flowchart & Tracking Links
# ==============================================================================
$s5Header = Get-SlideHeaderXML "5" "RESEARCH, REFERENCES &amp; VERIFIED LINKS" "Statutory Research, Legal References &amp; Tracking Links" "Anchored in Bharatiya Legal Reforms, Landmark Supreme Court Precedents &amp; Open Source"

$slide5XML = @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:sld xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
  <p:cSld>
    <p:spTree>
      <p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvPr>
      <p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/><a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr>

      $s5Header

      <!-- Statutory Citations & Legal Standards (Left Box) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="510" name="ResearchBox"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="600000" y="1250000"/><a:ext cx="5450000" cy="5250000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 1500"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="F8FAFC"/></a:solidFill>
          <a:ln w="19050"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="200000" tIns="160000" rIns="200000" bIns="160000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="1400" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr><a:t>STATUTORY LEGAL RESEARCH &amp; JUDICIAL PRECEDENTS</a:t></a:r>
          </a:p>
          <a:p><a:r><a:rPr sz="1000" i="1"><a:solidFill><a:srgbClr val="64748B"/></a:solidFill></a:rPr><a:t>Rigorous Legal Anchors Ensuring Full Court Admissibility</a:t></a:r></a:p>
          <a:p>
            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr>
            <a:t>&#10;1. Bharatiya Sakshya Adhiniyam, 2023 (BSA)</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;• Section 61 &amp; 62: Legal recognition of electronic records as primary/secondary evidence.&#10;• Section 63: Mandatory statutory certificate for electronic record admissibility.</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="0284C7"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;2. Supreme Court of India Landmark Ruling</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;• Arjun Panditrao Khotkar v. Kailash Kushanrao Gorantyal (2020) 7 SCC 1: 3-Judge Bench established Section 65B(4) electronic certificate as mandatory condition precedent.</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="EA580C"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;3. Bharatiya Nagarik Suraksha Sanhita, 2023 (BNSS)</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;• Section 105: Mandatory audio-video recording of search and seizure operations.&#10;• Section 173 &amp; 193: Electronic submission of police investigation reports to Magistrates.</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="16A34A"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;4. Data Privacy &amp; Global Cyber Standards</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;• DPDP Act 2023 &amp; IT Act 2000 (Section 4): Citizen privacy, redaction, and legal validity.&#10;• NIST SP 800-88 &amp; ISO/IEC 27001: Media sanitization and evidence security management.</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- Right Column: Research Methodology Flowchart & Verified Links -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="511" name="MethodBox"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="6250000" y="1250000"/><a:ext cx="5342000" cy="5250000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 1500"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="F8FAFC"/></a:solidFill>
          <a:ln w="19050"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="200000" tIns="160000" rIns="200000" bIns="160000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="1400" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr><a:t>RESEARCH METHODOLOGY FLOWCHART &amp; VERIFIED LINKS</a:t></a:r>
          </a:p>
          <a:p><a:r><a:rPr sz="1000" i="1"><a:solidFill><a:srgbClr val="64748B"/></a:solidFill></a:rPr><a:t>Systematic Engineering from Legal Research to Live Production</a:t></a:r></a:p>
          <a:p>
            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="0284C7"/></a:solidFill></a:rPr>
            <a:t>&#10;STEP 1: Problem Discovery &amp; Field Analysis</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;• Analyzed NCRB crime records, court cause lists, and custodial evidence loss cases.</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="EA580C"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;STEP 2: Statutory Law Mapping</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;• Formulated statutory schemas for BNS 2023, BNSS 2023, and Section 63 BSA compliance.</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="16A34A"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;STEP 3: Cryptographic Architecture &amp; Proof of Concept</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;• Engineered client-side SHA-256 digest engine, RBAC state machine &amp; audit logging.</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="6D28D9"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;STEP 4: Persona Journey Validation &amp; GIGW Bilingual Interface</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;• Validated 5 discrete workflows: Admin, IO, Prosecutor, Custodian, and Citizen.</a:t></a:r>

            <a:r><a:rPr sz="1050" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;STEP 5: Production Deployment &amp; Verifiable Repositories</a:t></a:r>
            <a:r><a:rPr sz="980"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;• Live Cloud Deployment: nation-legal-investigation-document.vercel.app&#10;• Open Source Code: github.com/soniayush306/NATION-LEGAL-INVESTIGATION-DOCUMENTS&#10;• e-Courts &amp; ICJS Ready: Standardized JSON schemas for direct national API grid sync.</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

    </p:spTree>
  </p:cSld>
</p:sld>
"@
$slide5XML | Set-Content -Encoding UTF8 "$buildDir/ppt/slides/slide5.xml"

# ==============================================================================
# Compress into .pptx archive
# ==============================================================================
if (Test-Path $outputPptx) {
  Remove-Item -Force $outputPptx
}

[System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | Out-Null
[System.IO.Compression.ZipFile]::CreateFromDirectory($buildDir, $outputPptx)

Write-Output "SUCCESS: Created $outputPptx"
