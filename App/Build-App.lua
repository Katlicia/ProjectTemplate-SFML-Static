project "App"
   kind "ConsoleApp"
   language "C++"
   cppdialect "C++20"
   targetdir "Binaries/%{cfg.buildcfg}"
   staticruntime "off"

   files { "Source/**.h", "Source/**.cpp" }

   defines {
        "SFML_STATIC"
    }

   includedirs
   {
      "Source",

	  -- Include Core
	  "../Core/Source",
          -- Include SFML
      	  "../Vendor/SFML/include"
   }

   libdirs 
   { -- ../Vendor/SFML/lib doesn't work for some reason. If you change the folder structure make sure to update this.
    "$(ProjectDir)../Vendor/SFML/lib"
   }

   links
   {
      "Core",
      "freetype.lib",
      "opengl32.lib",
      "winmm.lib",
      "gdi32.lib",
      "FLAC.lib",
      "vorbisenc.lib",
      "vorbisfile.lib",
      "vorbis.lib",
      "ogg.lib"
   }

   targetdir ("../Binaries/" .. OutputDir .. "/%{prj.name}")
   objdir ("../Binaries/Intermediates/" .. OutputDir .. "/%{prj.name}")

   filter "system:windows"
       systemversion "latest"
       defines { "WINDOWS" }

   filter "configurations:Debug"
       defines { "DEBUG" }
       runtime "Debug"
       symbols "On"
       links {
        "sfml-audio-s-d.lib",
        "sfml-graphics-s-d.lib",
        "sfml-network-s-d.lib",
        "sfml-system-s-d.lib",
        "sfml-window-s-d.lib"
       }

   filter "configurations:Release"
       defines { "RELEASE" }
       runtime "Release"
       optimize "On"
       symbols "On"
       links {
        "sfml-audio-s.lib",
        "sfml-graphics-s.lib",
        "sfml-network-s.lib",
        "sfml-system-s.lib",
        "sfml-window-s.lib"
       }

   filter "configurations:Dist"
       defines { "DIST" }
       runtime "Release"
       optimize "On"
       symbols "Off"
       links {
        "sfml-audio-s.lib",
        "sfml-graphics-s.lib",
        "sfml-network-s.lib",
        "sfml-system-s.lib",
        "sfml-window-s.lib"
       }
