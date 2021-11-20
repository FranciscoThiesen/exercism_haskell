{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_nucleotide_count (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,3,0,8] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/random_person/Exercism/haskell/nucleotide-count/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/bin"
libdir     = "/Users/random_person/Exercism/haskell/nucleotide-count/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/lib/x86_64-osx-ghc-8.10.7/nucleotide-count-1.3.0.8-H83W7f9BzNv34ZA3hlHgrz"
dynlibdir  = "/Users/random_person/Exercism/haskell/nucleotide-count/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/lib/x86_64-osx-ghc-8.10.7"
datadir    = "/Users/random_person/Exercism/haskell/nucleotide-count/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/share/x86_64-osx-ghc-8.10.7/nucleotide-count-1.3.0.8"
libexecdir = "/Users/random_person/Exercism/haskell/nucleotide-count/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/libexec/x86_64-osx-ghc-8.10.7/nucleotide-count-1.3.0.8"
sysconfdir = "/Users/random_person/Exercism/haskell/nucleotide-count/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "nucleotide_count_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "nucleotide_count_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "nucleotide_count_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "nucleotide_count_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "nucleotide_count_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "nucleotide_count_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
