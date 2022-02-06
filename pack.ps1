$gitTag = (git tag --points-at)
$archiveName = "aviutl-DynamicPolygon"
if (![string]::IsNullOrEmpty($gitTag))
{
    $archiveName = "${archiveName}_${gitTag}"
}

New-Item publish -ItemType Directory -Force

7z a "publish\${archiveName}.zip" `
    .\README.md `
    .\CHANGELOG.md `
    .\LICENSE `
    .\CREDITS.md `
    ".\script\@動く多角形.anm" `
    ".\script\動く多角形ベース.obj" `
    ".\build\Release\KaroterraDynamicPolygon.dll"
