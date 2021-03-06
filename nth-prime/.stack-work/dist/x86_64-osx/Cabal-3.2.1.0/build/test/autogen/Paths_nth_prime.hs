{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_nth_prime (
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
version = Version [2,1,0,6] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/random_person/Exercism/haskell/nth-prime/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/bin"
libdir     = "/Users/random_person/Exercism/haskell/nth-prime/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/lib/x86_64-osx-ghc-8.10.7/nth-prime-2.1.0.6-Bthyrg2D6rG7kuxuiLOeeL-test"
dynlibdir  = "/Users/random_person/Exercism/haskell/nth-prime/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/lib/x86_64-osx-ghc-8.10.7"
datadir    = "/Users/random_person/Exercism/haskell/nth-prime/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/share/x86_64-osx-ghc-8.10.7/nth-prime-2.1.0.6"
libexecdir = "/Users/random_person/Exercism/haskell/nth-prime/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/libexec/x86_64-osx-ghc-8.10.7/nth-prime-2.1.0.6"
sysconfdir = "/Users/random_person/Exercism/haskell/nth-prime/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "nth_prime_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "nth_prime_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "nth_prime_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "nth_prime_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "nth_prime_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "nth_prime_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
