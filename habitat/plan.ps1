$pkg_name="habitat-aspnet-sample"
$pkg_origin="core"
$pkg_version="0.2.0"
$pkg_source="nosuchfile.tar.gz"
$pkg_upstream_url="https://github.com/mwrock/habitat-aspnet-sample"
$pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
$pkg_license=@('MIT')
$pkg_description="A sample ASP.NET Core app"

$pkg_deps=@("core/dotnet-core")

function invoke-download { }
function invoke-verify { }
function invoke-unpack { }


function Invoke-Build {
  cp $PLAN_CONTEXT/../* $HAB_CACHE_SRC_PATH/$pkg_dirname -recurse -force -Exclude ".vagrant"
  dotnet restore
  dotnet build
  if($LASTEXITCODE -ne 0) {
      Write-Error "dotnet build failed!"
  }
}

function Invoke-Install {
  dotnet publish --output "$pkg_prefix/www"
}
