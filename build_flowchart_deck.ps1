# ==============================================================================
# Script: build_flowchart_deck.ps1
# Creates a creative, visual flowchart presentation for NLADR in native OpenXML PPTX
# Uses: Rectangles, Rounded Rectangles, Ovals (Ellipses), Right/Down Arrows, Diamonds (Rhombus)
# ==============================================================================

$buildDir = "$PSScriptRoot/flowchart_pptx_build"
$outputPptx = "$PSScriptRoot/NLADR_Creative_Flowchart_Presentation.pptx"

if (Test-Path $buildDir) {
  Remove-Item -Recurse -Force $buildDir
}

# Create folder structure
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

function Write-Utf8File($filePath, $text) {
  [System.IO.File]::WriteAllText($filePath, $text, [System.Text.Encoding]::UTF8)
}

# 1. [Content_Types].xml
$contentTypes = @'
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
  <Override PartName="/docProps/core.xml" ContentType="application/vnd.openxmlformats-package.core-properties+xml"/>
  <Override PartName="/docProps/app.xml" ContentType="application/vnd.openxmlformats-officedocument.extended-properties+xml"/>
</Types>
'@
Write-Utf8File "$buildDir/[Content_Types].xml" $contentTypes

# 2. _rels/.rels
$rootRels = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="ppt/presentation.xml"/>
  <Relationship Id="rId2" Type="http://schemas.openxmlformats.org/package/2006/relationships/metadata/core-properties" Target="docProps/core.xml"/>
  <Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/extended-properties" Target="docProps/app.xml"/>
</Relationships>
'@
Write-Utf8File "$buildDir/_rels/.rels" $rootRels

# 3. docProps/app.xml
$docPropsApp = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Properties xmlns="http://schemas.openxmlformats.org/officeDocument/2006/extended-properties" xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes">
  <TotalTime>0</TotalTime>
  <Words>0</Words>
  <Application>NLADR Architecture Flowchart Generator</Application>
  <PresentationFormat>On-screen Show (16:9)</PresentationFormat>
  <Paragraphs>0</Paragraphs>
  <Slides>3</Slides>
  <Company>Ministry of Law &amp; Justice / SIH 2026</Company>
  <AppVersion>16.0000</AppVersion>
</Properties>
'@
Write-Utf8File "$buildDir/docProps/app.xml" $docPropsApp

# 4. docProps/core.xml
$docPropsCore = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<cp:coreProperties xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <dc:title>NLADR - System Flowchart Presentation Deck</dc:title>
  <dc:subject>Visual Architecture &amp; Evidentiary Flowchart</dc:subject>
  <dc:creator>NLADR SIH Innovation Team</dc:creator>
  <cp:keywords>Flowchart, Process Flow, Architecture, SHA-256, Dual Vault, Section 63 BSA</cp:keywords>
  <dcterms:created xsi:type="dcterms:W3CDTF">2026-09-28T00:00:00Z</dcterms:created>
  <dcterms:modified xsi:type="dcterms:W3CDTF">2026-09-28T00:00:00Z</dcterms:modified>
</cp:coreProperties>
'@
Write-Utf8File "$buildDir/docProps/core.xml" $docPropsCore

# 5. ppt/presentation.xml
$presXml = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:presentation xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
  <p:sldMasterIdLst>
    <p:sldMasterId id="2147483648" r:id="rId1"/>
  </p:sldMasterIdLst>
  <p:sldIdLst>
    <p:sldId id="256" r:id="rId2"/>
    <p:sldId id="257" r:id="rId3"/>
    <p:sldId id="258" r:id="rId4"/>
  </p:sldIdLst>
  <p:sldSz cx="12192000" cy="6858000" type="screen16x9"/>
  <p:notesSz cx="6858000" cy="9144000"/>
</p:presentation>
'@
Write-Utf8File "$buildDir/ppt/presentation.xml" $presXml

# 6. ppt/_rels/presentation.xml.rels
$presRels = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideMaster" Target="slideMasters/slideMaster1.xml"/>
  <Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slide" Target="slides/slide1.xml"/>
  <Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slide" Target="slides/slide2.xml"/>
  <Relationship Id="rId4" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slide" Target="slides/slide3.xml"/>
</Relationships>
'@
Write-Utf8File "$buildDir/ppt/_rels/presentation.xml.rels" $presRels

# 7. ppt/theme/theme1.xml
$themeXml = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<a:theme xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" name="SIH Flowchart Theme">
  <a:themeElements>
    <a:clrScheme name="SIH Colors">
      <a:dk1><a:srgbClr val="0F172A"/></a:dk1>
      <a:lt1><a:srgbClr val="FFFFFF"/></a:lt1>
      <a:dk2><a:srgbClr val="1E293B"/></a:dk2>
      <a:lt2><a:srgbClr val="F8FAFC"/></a:lt2>
      <a:accent1><a:srgbClr val="002266"/></a:accent1>
      <a:accent2><a:srgbClr val="EA580C"/></a:accent2>
      <a:accent3><a:srgbClr val="16A34A"/></a:accent3>
      <a:accent4><a:srgbClr val="0284C7"/></a:accent4>
      <a:accent5><a:srgbClr val="DC2626"/></a:accent5>
      <a:accent6><a:srgbClr val="7C3AED"/></a:accent6>
      <a:hlink><a:srgbClr val="0284C7"/></a:hlink>
      <a:folHlink><a:srgbClr val="6D28D9"/></a:folHlink>
    </a:clrScheme>
    <a:fontScheme name="Office Font">
      <a:majorFont><a:latin typeface="Segoe UI Semibold"/></a:majorFont>
      <a:minorFont><a:latin typeface="Segoe UI"/></a:minorFont>
    </a:fontScheme>
    <a:fmtScheme name="Office Format">
      <a:fillStyleLst><a:solidFill><a:schemeClr val="phClr"/></a:solidFill></a:fillStyleLst>
      <a:lnStyleLst><a:ln w="9525"><a:solidFill><a:schemeClr val="phClr"/></a:solidFill></a:ln></a:lnStyleLst>
      <a:effectStyleLst><a:effectStyle><a:effectLst/></a:effectStyle></a:effectStyleLst>
      <a:bgFillStyleLst><a:solidFill><a:schemeClr val="phClr"/></a:solidFill></a:bgFillStyleLst>
    </a:fmtScheme>
  </a:themeElements>
</a:theme>
'@
Write-Utf8File "$buildDir/ppt/theme/theme1.xml" $themeXml

# 8. ppt/slideMasters/slideMaster1.xml
$masterXml = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:sldMaster xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
  <p:cSld><p:spTree><p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr><p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/><a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr></p:spTree></p:cSld>
  <p:clrMap bg1="lt1" tx1="dk1" bg2="lt2" tx2="dk2" accent1="accent1" accent2="accent2" accent3="accent3" accent4="accent4" accent5="accent5" accent6="accent6" hlink="hlink" folHlink="folHlink"/>
  <p:sldLayoutIdLst><p:sldLayoutId id="2147483649" r:id="rId1"/></p:sldLayoutIdLst>
  <p:txStyles>
    <p:titleStyle><a:lvl1pPr><a:defRPr sz="2800" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:defRPr></a:lvl1pPr></p:titleStyle>
    <p:bodyStyle><a:lvl1pPr><a:defRPr sz="1400"><a:solidFill><a:srgbClr val="1E293B"/></a:solidFill></a:defRPr></a:lvl1pPr></p:bodyStyle>
    <p:otherStyle><a:lvl1pPr><a:defRPr sz="1200"/></a:lvl1pPr></p:otherStyle>
  </p:txStyles>
</p:sldMaster>
'@
Write-Utf8File "$buildDir/ppt/slideMasters/slideMaster1.xml" $masterXml

# 9. ppt/slideMasters/_rels/slideMaster1.xml.rels
$masterRels = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideLayout" Target="../slideLayouts/slideLayout1.xml"/>
  <Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme" Target="../theme/theme1.xml"/>
</Relationships>
'@
Write-Utf8File "$buildDir/ppt/slideMasters/_rels/slideMaster1.xml.rels" $masterRels

# 10. ppt/slideLayouts/slideLayout1.xml
$layoutXml = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:sldLayout xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main" type="blank" preserve="1">
  <p:cSld><p:spTree><p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr><p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/><a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr></p:spTree></p:cSld>
  <p:clrMapOvr><a:masterClrMapping/></p:clrMapOvr>
</p:sldLayout>
'@
Write-Utf8File "$buildDir/ppt/slideLayouts/slideLayout1.xml" $layoutXml

# 11. ppt/slideLayouts/_rels/slideLayout1.xml.rels
$layoutRels = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideMaster" Target="../slideMasters/slideMaster1.xml"/>
</Relationships>
'@
Write-Utf8File "$buildDir/ppt/slideLayouts/_rels/slideLayout1.xml.rels" $layoutRels

# Slide Relationships Helper (slide1 to slide3)
for ($i = 1; $i -le 3; $i++) {
  $slideRelXml = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideLayout" Target="../slideLayouts/slideLayout1.xml"/>
</Relationships>
'@
  Write-Utf8File "$buildDir/ppt/slides/_rels/slide$i.xml.rels" $slideRelXml
}

# Slide Header Helper Function
function Get-FlowchartHeader($slideNum, $category, $title, $subtitle) {
  return @"
      <!-- Top Saffron Banner Bar -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="101" name="BannerTop"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="0" y="0"/><a:ext cx="12192000" cy="90000"/></a:xfrm>
          <a:prstGeom prst="rect"><a:avLst/></a:prstGeom>
          <a:solidFill><a:srgbClr val="EA580C"/></a:solidFill>
        </p:spPr>
      </p:sp>

      <!-- Slide Header Text Box -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="102" name="HeaderBox"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="600000" y="240000"/><a:ext cx="10992000" cy="850000"/></a:xfrm>
          <a:prstGeom prst="rect"><a:avLst/></a:prstGeom>
          <a:noFill/>
          <a:ln><a:noFill/></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr/><a:lstStyle/>
          <a:p>
            <a:r>
              <a:rPr sz="1100" b="1"><a:solidFill><a:srgbClr val="EA580C"/></a:solidFill></a:rPr>
              <a:t>NLADR PLATFORM ARCHITECTURE</a:t>
            </a:r>
            <a:r>
              <a:rPr sz="1100"><a:solidFill><a:srgbClr val="64748B"/></a:solidFill></a:rPr>
              <a:t>  |  FLOWCHART DECK  |  SLIDE $slideNum OF 3: $category</a:t>
            </a:r>
          </a:p>
          <a:p>
            <a:pPr marL="0" marR="0" indent="0"/>
            <a:r>
              <a:rPr sz="2200" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr>
              <a:t>$title</a:t>
            </a:r>
          </a:p>
          <a:p>
            <a:pPr marL="0" marR="0" indent="0"/>
            <a:r>
              <a:rPr sz="1100" i="1"><a:solidFill><a:srgbClr val="475569"/></a:solidFill></a:rPr>
              <a:t>$subtitle</a:t>
            </a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- Divider Line -->
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
# SLIDE 1: 5-Stage Closed-Loop Evidentiary Lifecycle
# ==============================================================================
$s1H = Get-FlowchartHeader "1" "CLOSED-LOOP LIFECYCLE" "End-to-End Evidence Lifecycle Flowchart" "Sequential flow from on-scene digital ingestion to cryptographic locking, custody transfer &amp; court admissibility"

$slide1XML = @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:sld xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
  <p:cSld>
    <p:spTree>
      <p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr>
      <p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/><a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr>

      $s1H

      <!-- STEP 1: Ingestion (Rounded Rectangle) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="201" name="Step1_Shape"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="750000" y="1450000"/><a:ext cx="1650000" cy="1150000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 2500"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="E0F2FE"/></a:solidFill>
          <a:ln w="25400"><a:solidFill><a:srgbClr val="0284C7"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr anchor="ctr"/><a:lstStyle/>
          <a:p>
            <a:pPr algn="ctr"/>
            <a:r><a:rPr sz="1100" b="1"><a:solidFill><a:srgbClr val="0369A1"/></a:solidFill></a:rPr><a:t>STEP 1</a:t></a:r>
          </a:p>
          <a:p>
            <a:pPr algn="ctr"/>
            <a:r><a:rPr sz="1350" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr><a:t>EVIDENCE&#10;INGESTION</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- Arrow 1 -> 2 (Right Arrow) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="202" name="Arrow1"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="2480000" y="1850000"/><a:ext cx="460000" cy="350000"/></a:xfrm>
          <a:prstGeom prst="rightArrow"><a:avLst/></a:prstGeom>
          <a:solidFill><a:srgbClr val="0284C7"/></a:solidFill>
          <a:ln><a:noFill/></a:ln>
        </p:spPr>
        <p:txBody><a:bodyPr/><a:lstStyle/><a:p><a:endParaRPr/></a:p></p:txBody>
      </p:sp>

      <!-- STEP 2: Cryptographic Hashing (Oval / Ellipse) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="203" name="Step2_Shape"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="3020000" y="1350000"/><a:ext cx="1650000" cy="1350000"/></a:xfrm>
          <a:prstGeom prst="ellipse"><a:avLst/></a:prstGeom>
          <a:solidFill><a:srgbClr val="FFEDD5"/></a:solidFill>
          <a:ln w="28000"><a:solidFill><a:srgbClr val="EA580C"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr anchor="ctr"/><a:lstStyle/>
          <a:p>
            <a:pPr algn="ctr"/>
            <a:r><a:rPr sz="1100" b="1"><a:solidFill><a:srgbClr val="C2410C"/></a:solidFill></a:rPr><a:t>STEP 2</a:t></a:r>
          </a:p>
          <a:p>
            <a:pPr algn="ctr"/>
            <a:r><a:rPr sz="1350" b="1"><a:solidFill><a:srgbClr val="9A3412"/></a:solidFill></a:rPr><a:t>SHA-256&#10;DIGEST LOCK</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- Arrow 2 -> 3 (Right Arrow) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="204" name="Arrow2"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="4750000" y="1850000"/><a:ext cx="460000" cy="350000"/></a:xfrm>
          <a:prstGeom prst="rightArrow"><a:avLst/></a:prstGeom>
          <a:solidFill><a:srgbClr val="EA580C"/></a:solidFill>
          <a:ln><a:noFill/></a:ln>
        </p:spPr>
        <p:txBody><a:bodyPr/><a:lstStyle/><a:p><a:endParaRPr/></a:p></p:txBody>
      </p:sp>

      <!-- STEP 3: Custody Routing (Rounded Rectangle) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="205" name="Step3_Shape"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="5290000" y="1450000"/><a:ext cx="1650000" cy="1150000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 2500"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="DCFCE7"/></a:solidFill>
          <a:ln w="25400"><a:solidFill><a:srgbClr val="16A34A"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr anchor="ctr"/><a:lstStyle/>
          <a:p>
            <a:pPr algn="ctr"/>
            <a:r><a:rPr sz="1100" b="1"><a:solidFill><a:srgbClr val="15803D"/></a:solidFill></a:rPr><a:t>STEP 3</a:t></a:r>
          </a:p>
          <a:p>
            <a:pPr algn="ctr"/>
            <a:r><a:rPr sz="1350" b="1"><a:solidFill><a:srgbClr val="166534"/></a:solidFill></a:rPr><a:t>CUSTODY&#10;ROUTING</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- Arrow 3 -> 4 (Right Arrow) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="206" name="Arrow3"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="7020000" y="1850000"/><a:ext cx="460000" cy="350000"/></a:xfrm>
          <a:prstGeom prst="rightArrow"><a:avLst/></a:prstGeom>
          <a:solidFill><a:srgbClr val="16A34A"/></a:solidFill>
          <a:ln><a:noFill/></a:ln>
        </p:spPr>
        <p:txBody><a:bodyPr/><a:lstStyle/><a:p><a:endParaRPr/></a:p></p:txBody>
      </p:sp>

      <!-- STEP 4: Dual Vault (Rounded Rectangle) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="207" name="Step4_Shape"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="7560000" y="1450000"/><a:ext cx="1650000" cy="1150000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 2500"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="F3E8FF"/></a:solidFill>
          <a:ln w="25400"><a:solidFill><a:srgbClr val="7C3AED"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr anchor="ctr"/><a:lstStyle/>
          <a:p>
            <a:pPr algn="ctr"/>
            <a:r><a:rPr sz="1100" b="1"><a:solidFill><a:srgbClr val="6D28D9"/></a:solidFill></a:rPr><a:t>STEP 4</a:t></a:r>
          </a:p>
          <a:p>
            <a:pPr algn="ctr"/>
            <a:r><a:rPr sz="1350" b="1"><a:solidFill><a:srgbClr val="4C1D95"/></a:solidFill></a:rPr><a:t>DUAL-VAULT&#10;ARCHIVAL</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- Arrow 4 -> 5 (Right Arrow) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="208" name="Arrow4"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="9290000" y="1850000"/><a:ext cx="460000" cy="350000"/></a:xfrm>
          <a:prstGeom prst="rightArrow"><a:avLst/></a:prstGeom>
          <a:solidFill><a:srgbClr val="7C3AED"/></a:solidFill>
          <a:ln><a:noFill/></a:ln>
        </p:spPr>
        <p:txBody><a:bodyPr/><a:lstStyle/><a:p><a:endParaRPr/></a:p></p:txBody>
      </p:sp>

      <!-- STEP 5: Court Admissibility (Oval / Ellipse) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="209" name="Step5_Shape"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="9830000" y="1350000"/><a:ext cx="1650000" cy="1350000"/></a:xfrm>
          <a:prstGeom prst="ellipse"><a:avLst/></a:prstGeom>
          <a:solidFill><a:srgbClr val="FEF2F2"/></a:solidFill>
          <a:ln w="28000"><a:solidFill><a:srgbClr val="DC2626"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr anchor="ctr"/><a:lstStyle/>
          <a:p>
            <a:pPr algn="ctr"/>
            <a:r><a:rPr sz="1100" b="1"><a:solidFill><a:srgbClr val="B91C1C"/></a:solidFill></a:rPr><a:t>STEP 5</a:t></a:r>
          </a:p>
          <a:p>
            <a:pPr algn="ctr"/>
            <a:r><a:rPr sz="1350" b="1"><a:solidFill><a:srgbClr val="7F1D1D"/></a:solidFill></a:rPr><a:t>COURT&#10;ADMISSIBILITY</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- DETAIL CARD 1 (Under Step 1) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="211" name="Card1"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="750000" y="2850000"/><a:ext cx="1650000" cy="3400000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 1500"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="F8FAFC"/></a:solidFill>
          <a:ln w="12700"><a:solidFill><a:srgbClr val="CBD5E1"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="100000" tIns="120000" rIns="100000" bIns="100000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="950" b="1"><a:solidFill><a:srgbClr val="0284C7"/></a:solidFill></a:rPr><a:t>ACTOR: POLICE IO</a:t></a:r>
          </a:p>
          <a:p>
            <a:r><a:rPr sz="880"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>• Logs unalterable case diary entries.&#10;• Attaches digital seizure memos &amp; FIR dossier.&#10;• Complies with Sec 173 CrPC / Sec 193 BNSS.</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- DETAIL CARD 2 (Under Step 2) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="212" name="Card2"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="3020000" y="2850000"/><a:ext cx="1650000" cy="3400000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 1500"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="F8FAFC"/></a:solidFill>
          <a:ln w="12700"><a:solidFill><a:srgbClr val="CBD5E1"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="100000" tIns="120000" rIns="100000" bIns="100000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="950" b="1"><a:solidFill><a:srgbClr val="EA580C"/></a:solidFill></a:rPr><a:t>CORE: WEB CRYPTO</a:t></a:r>
          </a:p>
          <a:p>
            <a:r><a:rPr sz="880"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>• Computes 256-bit SHA-256 client-side fingerprint.&#10;• 1-bit alteration completely changes digest.&#10;• Immutable WORM audit trail log created.</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- DETAIL CARD 3 (Under Step 3) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="213" name="Card3"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="5290000" y="2850000"/><a:ext cx="1650000" cy="3400000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 1500"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="F8FAFC"/></a:solidFill>
          <a:ln w="12700"><a:solidFill><a:srgbClr val="CBD5E1"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="100000" tIns="120000" rIns="100000" bIns="100000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="950" b="1"><a:solidFill><a:srgbClr val="16A34A"/></a:solidFill></a:rPr><a:t>ACCESS: ZERO-TRUST</a:t></a:r>
          </a:p>
          <a:p>
            <a:r><a:rPr sz="880"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>• Handover between Police, CFSL Lab &amp; Prosecutor.&#10;• Instant hash verification at receipt.&#10;• Prevents custodial evidence substitution.</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- DETAIL CARD 4 (Under Step 4) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="214" name="Card4"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="7560000" y="2850000"/><a:ext cx="1650000" cy="3400000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 1500"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="F8FAFC"/></a:solidFill>
          <a:ln w="12700"><a:solidFill><a:srgbClr val="CBD5E1"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="100000" tIns="120000" rIns="100000" bIns="100000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="950" b="1"><a:solidFill><a:srgbClr val="7C3AED"/></a:solidFill></a:rPr><a:t>STORAGE: DUAL-VAULT</a:t></a:r>
          </a:p>
          <a:p>
            <a:r><a:rPr sz="880"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>• Digital file tied to Physical Warehouse ID.&#10;• Tracks Vault No, Rack ID, Shelf Label.&#10;• Scannable Barcode &amp; Tamper-Seal logging.</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- DETAIL CARD 5 (Under Step 5) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="215" name="Card5"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="9830000" y="2850000"/><a:ext cx="1650000" cy="3400000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 1500"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="F8FAFC"/></a:solidFill>
          <a:ln w="12700"><a:solidFill><a:srgbClr val="CBD5E1"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="100000" tIns="120000" rIns="100000" bIns="100000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="950" b="1"><a:solidFill><a:srgbClr val="DC2626"/></a:solidFill></a:rPr><a:t>LEGAL: STATUTORY CERT</a:t></a:r>
          </a:p>
          <a:p>
            <a:r><a:rPr sz="880"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>• Auto-generates Sec 63 BSA / 65B IEA certificates.&#10;• Accepted by Hon'ble Trial Judge without dispute.&#10;• Accelerates conviction &amp; disposal rate.</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

    </p:spTree>
  </p:cSld>
</p:sld>
"@
Write-Utf8File "$buildDir/ppt/slides/slide1.xml" $slide1XML

# ==============================================================================
# SLIDE 2: Multi-Tiered System Architecture Flowchart
# ==============================================================================
$s2H = Get-FlowchartHeader "2" "TIERED ARCHITECTURE" "System Architectural Flow &amp; Entity Relationships" "Coordination between Sovereign Client Actors, Cryptographic Core, Dual Vaults &amp; Judicial Output"

$slide2XML = @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:sld xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
  <p:cSld>
    <p:spTree>
      <p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr>
      <p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/><a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr>

      $s2H

      <!-- SECTION 1 LABEL: CLIENT ACTORS -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="301" name="Sec1Label"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="700000" y="1350000"/><a:ext cx="2700000" cy="400000"/></a:xfrm>
          <a:prstGeom prst="rect"><a:avLst/></a:prstGeom>
          <a:noFill/><a:ln><a:noFill/></a:ln>
        </p:spPr>
        <p:txBody><a:bodyPr/><a:lstStyle/><a:p><a:r><a:rPr sz="1100" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr><a:t>1. SOVEREIGN CLIENT ACTORS</a:t></a:r></a:p></p:txBody>
      </p:sp>

      <!-- ACTOR 1: IO -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="302" name="Actor1"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="700000" y="1800000"/><a:ext cx="2700000" cy="950000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 2000"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="E0F2FE"/></a:solidFill>
          <a:ln w="19050"><a:solidFill><a:srgbClr val="0284C7"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr anchor="ctr" lIns="150000" rIns="150000"/><a:lstStyle/>
          <a:p><a:r><a:rPr sz="1100" b="1"><a:solidFill><a:srgbClr val="0369A1"/></a:solidFill></a:rPr><a:t>👮 Police Investigating Officer (IO)</a:t></a:r></a:p>
          <a:p><a:r><a:rPr sz="850"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr><a:t>FIRs, Case Diaries, Crime Scene Seizures</a:t></a:r></a:p>
        </p:txBody>
      </p:sp>

      <!-- ACTOR 2: CFSL Lab -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="303" name="Actor2"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="700000" y="2900000"/><a:ext cx="2700000" cy="950000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 2000"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="FFEDD5"/></a:solidFill>
          <a:ln w="19050"><a:solidFill><a:srgbClr val="EA580C"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr anchor="ctr" lIns="150000" rIns="150000"/><a:lstStyle/>
          <a:p><a:r><a:rPr sz="1100" b="1"><a:solidFill><a:srgbClr val="C2410C"/></a:solidFill></a:rPr><a:t>🔬 Forensic Analyst (CFSL/FSL)</a:t></a:r></a:p>
          <a:p><a:r><a:rPr sz="850"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr><a:t>Ballistic, Digital &amp; Chemical Hash Verification</a:t></a:r></a:p>
        </p:txBody>
      </p:sp>

      <!-- ACTOR 3: Prosecutor -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="304" name="Actor3"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="700000" y="4000000"/><a:ext cx="2700000" cy="950000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 2000"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="DCFCE7"/></a:solidFill>
          <a:ln w="19050"><a:solidFill><a:srgbClr val="16A34A"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr anchor="ctr" lIns="150000" rIns="150000"/><a:lstStyle/>
          <a:p><a:r><a:rPr sz="1100" b="1"><a:solidFill><a:srgbClr val="15803D"/></a:solidFill></a:rPr><a:t>⚖️ Public Prosecutor / Court</a:t></a:r></a:p>
          <a:p><a:r><a:rPr sz="850"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr><a:t>Charge Sheet Scrutiny &amp; Sec 63 BSA Exhibits</a:t></a:r></a:p>
        </p:txBody>
      </p:sp>

      <!-- ACTOR 4: Record Officer -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="305" name="Actor4"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="700000" y="5100000"/><a:ext cx="2700000" cy="950000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 2000"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="F3E8FF"/></a:solidFill>
          <a:ln w="19050"><a:solidFill><a:srgbClr val="7C3AED"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr anchor="ctr" lIns="150000" rIns="150000"/><a:lstStyle/>
          <a:p><a:r><a:rPr sz="1100" b="1"><a:solidFill><a:srgbClr val="6D28D9"/></a:solidFill></a:rPr><a:t>📦 Evidence Vault Custodian</a:t></a:r></a:p>
          <a:p><a:r><a:rPr sz="850"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr><a:t>Physical Coordinates, Barcode Scan, Custody Logs</a:t></a:r></a:p>
        </p:txBody>
      </p:sp>

      <!-- Arrow linking Client to Core -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="310" name="ArrowClientCore"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="3550000" y="3650000"/><a:ext cx="650000" cy="450000"/></a:xfrm>
          <a:prstGeom prst="rightArrow"><a:avLst/></a:prstGeom>
          <a:solidFill><a:srgbClr val="002266"/></a:solidFill>
          <a:ln><a:noFill/></a:ln>
        </p:spPr>
        <p:txBody><a:bodyPr/><a:lstStyle/><a:p><a:endParaRPr/></a:p></p:txBody>
      </p:sp>

      <!-- SECTION 2: CENTRAL SECURITY & CRYPTOGRAPHIC CORE -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="320" name="CoreBox"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="4350000" y="1800000"/><a:ext cx="3700000" cy="4250000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 1500"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="FFFFFF"/></a:solidFill>
          <a:ln w="25400"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="200000" tIns="180000" rIns="200000" bIns="180000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="1300" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr><a:t>2. NLADR SECURITY &amp; LOGIC CORE</a:t></a:r>
          </a:p>
          <a:p>
            <a:r><a:rPr sz="950" i="1"><a:solidFill><a:srgbClr val="64748B"/></a:solidFill></a:rPr><a:t>Zero-Trust Sovereign Processing Engine</a:t></a:r>
          </a:p>
          <a:p>
            <a:r><a:rPr sz="980" b="1"><a:solidFill><a:srgbClr val="EA580C"/></a:solidFill></a:rPr>
            <a:t>&#10;🔐 Web Crypto API (SHA-256)</a:t></a:r>
            <a:r><a:rPr sz="920"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;  Calculates 256-bit client-side mathematical digests instantly.</a:t></a:r>

            <a:r><a:rPr sz="980" b="1"><a:solidFill><a:srgbClr val="0284C7"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;🛡️ Dynamic 5-Tier RBAC Gatekeeper</a:t></a:r>
            <a:r><a:rPr sz="920"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;  Restricts unredacted FIR details based on officer jurisdiction.</a:t></a:r>

            <a:r><a:rPr sz="980" b="1"><a:solidFill><a:srgbClr val="16A34A"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;📜 WORM Audit Ledger Semantics</a:t></a:r>
            <a:r><a:rPr sz="920"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;  Write-Once-Read-Many logging with IP, timestamp &amp; badge tags.</a:t></a:r>

            <a:r><a:rPr sz="980" b="1"><a:solidFill><a:srgbClr val="DC2626"/></a:solidFill></a:rPr>
            <a:t>&#10;&#10;🚨 Real-Time Tamper Watchdog</a:t></a:r>
            <a:r><a:rPr sz="920"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>&#10;  Continuous integrity auditor halting dockets upon mismatch.</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- Arrows linking Core to Storage -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="325" name="ArrowCoreToTop"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="8200000" y="2450000"/><a:ext cx="550000" cy="350000"/></a:xfrm>
          <a:prstGeom prst="rightArrow"><a:avLst/></a:prstGeom>
          <a:solidFill><a:srgbClr val="0284C7"/></a:solidFill>
          <a:ln><a:noFill/></a:ln>
        </p:spPr>
        <p:txBody><a:bodyPr/><a:lstStyle/><a:p><a:endParaRPr/></a:p></p:txBody>
      </p:sp>

      <p:sp>
        <p:nvSpPr><p:cNvPr id="326" name="ArrowCoreToBottom"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="8200000" y="4750000"/><a:ext cx="550000" cy="350000"/></a:xfrm>
          <a:prstGeom prst="rightArrow"><a:avLst/></a:prstGeom>
          <a:solidFill><a:srgbClr val="7C3AED"/></a:solidFill>
          <a:ln><a:noFill/></a:ln>
        </p:spPr>
        <p:txBody><a:bodyPr/><a:lstStyle/><a:p><a:endParaRPr/></a:p></p:txBody>
      </p:sp>

      <!-- SECTION 3: DUAL VAULT ARCHIVAL -->
      <!-- TOP VAULT: DIGITAL LOCKER -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="330" name="DigitalVault"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="8900000" y="1800000"/><a:ext cx="2600000" cy="1950000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 2000"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="F0F9FF"/></a:solidFill>
          <a:ln w="22000"><a:solidFill><a:srgbClr val="0284C7"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="140000" tIns="140000" rIns="140000" bIns="140000"/><a:lstStyle/>
          <a:p><a:r><a:rPr sz="1100" b="1"><a:solidFill><a:srgbClr val="0369A1"/></a:solidFill></a:rPr><a:t>3A. DIGITAL CLOUD VAULT</a:t></a:r></a:p>
          <a:p>
            <a:r><a:rPr sz="900"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>• IndexedDB Offline Storage&#10;• LocalStorage Sync Cache&#10;• Vercel Edge Serverless Cloud&#10;• PostgreSQL Relational Tables</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- BOTTOM VAULT: PHYSICAL WAREHOUSE -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="331" name="PhysicalVault"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="8900000" y="4100000"/><a:ext cx="2600000" cy="1950000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 2000"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="FAF5FF"/></a:solidFill>
          <a:ln w="22000"><a:solidFill><a:srgbClr val="7C3AED"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="140000" tIns="140000" rIns="140000" bIns="140000"/><a:lstStyle/>
          <a:p><a:r><a:rPr sz="1100" b="1"><a:solidFill><a:srgbClr val="6D28D9"/></a:solidFill></a:rPr><a:t>3B. PHYSICAL WAREHOUSE</a:t></a:r></a:p>
          <a:p>
            <a:r><a:rPr sz="900"><a:solidFill><a:srgbClr val="334155"/></a:solidFill></a:rPr>
            <a:t>• Vault Room Identification&#10;• Rack &amp; Shelf Spatial Mapping&#10;• Barcode / RFID Tag Validation&#10;• Tamper-Seal Status Tracking</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

    </p:spTree>
  </p:cSld>
</p:sld>
"@
Write-Utf8File "$buildDir/ppt/slides/slide2.xml" $slide2XML

# ==============================================================================
# SLIDE 3: Real-Time Tamper Watchdog & Alert Flowchart
# ==============================================================================
$s3H = Get-FlowchartHeader "3" "TAMPER WATCHDOG" "Integrity Watchdog &amp; Malicious Tamper Quarantine" "Decision flowchart illustrating automatic hash recalculation, quarantine enforcement &amp; judicial alerts"

$slide3XML = @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:sld xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
  <p:cSld>
    <p:spTree>
      <p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr>
      <p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/><a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr>

      $s3H

      <!-- STEP A: FILE INGESTION OR ACCESS (Top Center Rect) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="401" name="ActionNode"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="3800000" y="1450000"/><a:ext cx="4600000" cy="950000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 2000"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="F8FAFC"/></a:solidFill>
          <a:ln w="22000"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr anchor="ctr"/><a:lstStyle/>
          <a:p>
            <a:pPr algn="ctr"/>
            <a:r><a:rPr sz="1200" b="1"><a:solidFill><a:srgbClr val="002266"/></a:solidFill></a:rPr><a:t>EVIDENCE ACCESS OR COURT DISPATCH TRIGGER</a:t></a:r>
          </a:p>
          <a:p>
            <a:pPr algn="ctr"/>
            <a:r><a:rPr sz="950"><a:solidFill><a:srgbClr val="475569"/></a:solidFill></a:rPr><a:t>User views document, transfers custody, or submits docket to Trial Court</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- Down Arrow to Decision Diamond -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="402" name="DownArrow1"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="5850000" y="2450000"/><a:ext cx="500000" cy="450000"/></a:xfrm>
          <a:prstGeom prst="downArrow"><a:avLst/></a:prstGeom>
          <a:solidFill><a:srgbClr val="002266"/></a:solidFill>
          <a:ln><a:noFill/></a:ln>
        </p:spPr>
        <p:txBody><a:bodyPr/><a:lstStyle/><a:p><a:endParaRPr/></a:p></p:txBody>
      </p:sp>

      <!-- DECISION DIAMOND (Rhombus) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="403" name="DecisionDiamond"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="3900000" y="2950000"/><a:ext cx="4400000" cy="1600000"/></a:xfrm>
          <a:prstGeom prst="rhombus"><a:avLst/></a:prstGeom>
          <a:solidFill><a:srgbClr val="FEF3C7"/></a:solidFill>
          <a:ln w="25400"><a:solidFill><a:srgbClr val="D97706"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr anchor="ctr"/><a:lstStyle/>
          <a:p>
            <a:pPr algn="ctr"/>
            <a:r><a:rPr sz="1150" b="1"><a:solidFill><a:srgbClr val="92400E"/></a:solidFill></a:rPr><a:t>SHA-256 INTEGRITY CHECK</a:t></a:r>
          </a:p>
          <a:p>
            <a:pPr algn="ctr"/>
            <a:r><a:rPr sz="950"><a:solidFill><a:srgbClr val="78350F"/></a:solidFill></a:rPr><a:t>Does Current File SHA-256 == Genesis Ledger Hash?</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- YES BRANCH -> RIGHT ARROW -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="404" name="ArrowYes"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="8400000" y="3550000"/><a:ext cx="550000" cy="400000"/></a:xfrm>
          <a:prstGeom prst="rightArrow"><a:avLst/></a:prstGeom>
          <a:solidFill><a:srgbClr val="16A34A"/></a:solidFill>
          <a:ln><a:noFill/></a:ln>
        </p:spPr>
        <p:txBody><a:bodyPr/><a:lstStyle/><a:p><a:endParaRPr/></a:p></p:txBody>
      </p:sp>

      <!-- SUCCESS BOX (Right Side) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="405" name="SuccessBox"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="9100000" y="2950000"/><a:ext cx="2400000" cy="1600000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 2000"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="DCFCE7"/></a:solidFill>
          <a:ln w="22000"><a:solidFill><a:srgbClr val="16A34A"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr anchor="ctr" lIns="120000" rIns="120000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="1100" b="1"><a:solidFill><a:srgbClr val="166534"/></a:solidFill></a:rPr><a:t>[✓] 100% INTACT</a:t></a:r>
          </a:p>
          <a:p>
            <a:r><a:rPr sz="900"><a:solidFill><a:srgbClr val="14532D"/></a:solidFill></a:rPr>
            <a:t>• Section 63 BSA certificate issued.&#10;• Docket transmitted to trial judge.&#10;• Legally uncontested evidence.</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

      <!-- NO BRANCH -> DOWN ARROW (RED) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="406" name="ArrowNo"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="5850000" y="4600000"/><a:ext cx="500000" cy="450000"/></a:xfrm>
          <a:prstGeom prst="downArrow"><a:avLst/></a:prstGeom>
          <a:solidFill><a:srgbClr val="DC2626"/></a:solidFill>
          <a:ln><a:noFill/></a:ln>
        </p:spPr>
        <p:txBody><a:bodyPr/><a:lstStyle/><a:p><a:endParaRPr/></a:p></p:txBody>
      </p:sp>

      <!-- QUARANTINE WARNING BOX (Bottom Wide Callout) -->
      <p:sp>
        <p:nvSpPr><p:cNvPr id="407" name="AlertCallout"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr>
          <a:xfrm><a:off x="1500000" y="5150000"/><a:ext cx="9200000" cy="1300000"/></a:xfrm>
          <a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 2000"/></a:avLst></p:prstGeom>
          <a:solidFill><a:srgbClr val="FEF2F2"/></a:solidFill>
          <a:ln w="25400"><a:solidFill><a:srgbClr val="DC2626"/></a:solidFill></a:ln>
        </p:spPr>
        <p:txBody>
          <a:bodyPr lIns="200000" tIns="140000" rIns="200000" bIns="140000"/><a:lstStyle/>
          <a:p>
            <a:r><a:rPr sz="1200" b="1"><a:solidFill><a:srgbClr val="991B1B"/></a:solidFill></a:rPr><a:t>[!] 🚨 INTEGRITY MISMATCH DETECTED — AUTOMATED QUARANTINE</a:t></a:r>
          </a:p>
          <a:p>
            <a:r><a:rPr sz="950"><a:solidFill><a:srgbClr val="7F1D1D"/></a:solidFill></a:rPr>
            <a:t>• Transmission to trial court is FROZEN immediately.&#10;• Emergency alert dispatched with IP Address, actor identity &amp; timestamp to SP &amp; Trial Judge.&#10;• Mismatch violation cryptographically committed to permanent WORM audit logs.</a:t></a:r>
          </a:p>
        </p:txBody>
      </p:sp>

    </p:spTree>
  </p:cSld>
</p:sld>
"@
Write-Utf8File "$buildDir/ppt/slides/slide3.xml" $slide3XML

# ==============================================================================
# Compress into .pptx archive
# ==============================================================================
if (Test-Path $outputPptx) {
  Remove-Item -Force $outputPptx
}

[System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | Out-Null
[System.IO.Compression.ZipFile]::CreateFromDirectory($buildDir, $outputPptx)

$f = Get-Item $outputPptx
Write-Output "SUCCESS: Created $($f.FullName) ($($f.Length) bytes)"
