{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_grains (
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
version = Version [1,2,0,6] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/random_person/Exercism/haskell/grains/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/bin"
libdir     = "/Users/random_person/Exercism/haskell/grains/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/lib/x86_64-osx-ghc-8.10.7/grains-1.2.0.6-6ZWL1sgY5BmFYVYHkSfWHo"
dynlibdir  = "/Users/random_person/Exercism/haskell/grains/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/lib/x86_64-osx-ghc-8.10.7"
datadir    = "/Users/random_person/Exercism/haskell/grains/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/share/x86_64-osx-ghc-8.10.7/grains-1.2.0.6"
libexecdir = "/Users/random_person/Exercism/haskell/grains/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/libexec/x86_64-osx-ghc-8.10.7/grains-1.2.0.6"
sysconfdir = "/Users/random_person/Exercism/haskell/grains/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "grains_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "grains_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "grains_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "grains_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "grains_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "grains_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
