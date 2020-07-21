------------------------------------------------------------------------
-- IMPORTS
------------------------------------------------------------------------
    -- Base
import XMonad
import System.IO (hPutStrLn)
import System.Exit (exitSuccess)

    -- Actions
import XMonad.Actions.CopyWindow (kill1,
                                  killAllOtherCopies)
import XMonad.Actions.CycleWS (moveTo,
                               shiftTo,
                               WSType(..),
                               nextScreen,
                               prevScreen)
import XMonad.Actions.GridSelect
import XMonad.Actions.MouseResize
import XMonad.Actions.Promote
import XMonad.Actions.RotSlaves (rotSlavesDown,
                                 rotAllDown)
import qualified XMonad.Actions.TreeSelect as TS
import XMonad.Actions.WindowGo (runOrRaise)
import XMonad.Actions.WithAll (sinkAll,
                               killAll)
import qualified XMonad.Actions.Search as S

    -- Data
import Data.Char (isSpace)
import Data.Monoid
import Data.Maybe (isJust)
import Data.Tree
import Data.List (sortBy)
import Data.Function (on)
import Control.Monad (forM_,
                      join)
import XMonad.Util.NamedWindows (getName)
import qualified XMonad.StackSet as W
import qualified Data.Tuple.Extra as TE
import qualified Data.Map as M

    -- Hooks
import XMonad.Hooks.DynamicLog (dynamicLogWithPP,
                                wrap,
                                shorten,
                                PP(..))
-- for some fullscreen events, also for xcomposite in obs.
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageDocks (avoidStruts,
                                 docksEventHook,
                                 manageDocks,
                                 ToggleStruts(..))
import XMonad.Hooks.ManageHelpers (isFullscreen,
                                   doFullFloat)
import XMonad.Hooks.ServerMode
import XMonad.Hooks.SetWMName
import XMonad.Hooks.WorkspaceHistory

    -- Layouts
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spiral
import XMonad.Layout.ResizableTile
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns

    -- Layouts modifiers
import XMonad.Layout.LayoutModifier
import XMonad.Layout.LimitWindows (limitWindows,
                                   increaseLimit,
                                   decreaseLimit)
import XMonad.Layout.Magnifier
import XMonad.Layout.MultiToggle (mkToggle,
                                  single,
                                  EOT(EOT),
                                  (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL,
                                                            MIRROR,
                                                            NOBORDERS))
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed (renamed,
                              Rename(Replace))
import XMonad.Layout.ShowWName
import XMonad.Layout.Spacing
import XMonad.Layout.WindowArranger (windowArrange,
                                     WindowArrangerMsg(..))
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts,
                                                   ToggleLayout(Toggle))
import qualified XMonad.Layout.MultiToggle as MT (Toggle(..))

    -- Prompt
import XMonad.Prompt
import XMonad.Prompt.Input
import XMonad.Prompt.FuzzyMatch
import XMonad.Prompt.Man
import XMonad.Prompt.Pass
import XMonad.Prompt.Shell (shellPrompt)
import XMonad.Prompt.Ssh
import XMonad.Prompt.XMonad
import Control.Arrow (first)

    -- Utilities
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run (runProcessWithInput,
                        safeSpawn,
                        spawnPipe)
import XMonad.Util.SpawnOnce

------------------------------------------------------------------------
-- VARIABLES
------------------------------------------------------------------------
-- It's nice to assign values to stuff that you will use more than once
-- in the config. Setting values for things like font, terminal and editor
-- means you only have to change the value here to make changes globally.
myFont :: String
myFont = "xft:FiraCode Nerd Font:bold:size=9"
-- Sets modkey to super/windows key
myModMask :: KeyMask
myModMask = mod4Mask
-- Sets default terminal
myTerminal :: String
myTerminal = "alacritty"
-- Sets surf as browser for tree select
myBrowser :: String
myBrowser = "surf"
-- Sets firefox as browser for tree select
-- myBrowser = "firefox "

myEditor :: String
-- Sets emacs as editor for tree select
myEditor = "emacsclient -c -a emacs "  

-- border width of windows
myBorderWidth :: Dimension
myBorderWidth = 2          
-- Border color of normal windows
myNormColor :: String
myNormColor   = "#292d3e"  
-- Border color of focused windows
myFocusColor :: String
myFocusColor  = "#bbc5ff"  
-- Setting this for use in xprompts
altMask :: KeyMask
altMask = mod1Mask         

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

------------------------------------------------------------------------
-- AUTOSTART
------------------------------------------------------------------------
myStartupHook :: X ()
myStartupHook = do
          spawnOnce "feh --bg-fill --random ~/.wallpaper &"
          spawnOnce "dunst &"
          spawnOnce "$HOME/.config/polybar/launch.sh &"
          spawnOnce "nm-applet &"
          spawnOnce "keepassxc &"
          spawnOnce "flameshot &"
          spawnOnce "nextcloud &"
          setWMName "LG3D"
          spawnOnce "/usr/bin/emacs --daemon &"

------------------------------------------------------------------------
-- GRID SELECT
------------------------------------------------------------------------
-- GridSelect displays items (programs, open windows, etc.) in a 2D grid
-- and lets the user select from it with the cursor/hjkl keys or the mouse.
myColorizer :: Window -> Bool -> X (String, String)
myColorizer = colorRangeFromClassName
                  (0x29,0x2d,0x3e)
                  (0x29,0x2d,0x3e)
                  (0xc7,0x92,0xea)
                  (0xc0,0xa7,0x9a)
                  (0x29,0x2d,0x3e)

-- gridSelect menu layout
mygridConfig :: p -> GSConfig Window
mygridConfig colorizer = (buildDefaultGSConfig myColorizer)
    { gs_cellheight   = 40
    , gs_cellwidth    = 200
    , gs_cellpadding  = 6
    , gs_originFractX = 0.5
    , gs_originFractY = 0.5
    , gs_font         = myFont
    }

spawnSelected' :: [(String, String)] -> X ()
spawnSelected' lst = gridselect conf lst >>= flip whenJust spawn
    where conf = def
                   { gs_cellheight   = 40
                   , gs_cellwidth    = 200
                   , gs_cellpadding  = 6
                   , gs_originFractX = 0.5
                   , gs_originFractY = 0.5
                   , gs_font         = myFont
                   }

-- The lists below are actually 3-tuples for use with gridSelect and treeSelect.
-- TreeSelect uses all three values in the 3-tuples but GridSelect only needs first
-- two values in each list (see myAppGrid, myBookmarkGrid and myConfigGrid below).
myApplications :: [(String, String, String)]
myApplications = [ ("Audacity",
                    "audacity",
                    "Graphical cross-platform audio editor")
                 , ("Emacs",
                    "emacs",
                    "Much more than a text editor")
                 , ("Firefox",
                    "firefox",
                    "The famous open source web browser")
                 , ("Gimp",
                    "gimp",
                    "Open source alternative to Photoshop")
                 , ("Kdenlive",
                    "kdenlive",
                    "A great open source video editor")
                 , ("OBS",
                    "obs",
                    "Open broadcaster software")
                 , ("vifm",
                    "alacritty -e bash -c vifm",
                    "Lightweight cli file manager")
                 , ("alacritty",
                    "alacritty",
                    "simple, fast terminal")
                 , ("Surf Browser",
                    "surf suckless.org",
                    "Suckless surf web browser")
                 ]

myBookmarks :: [(String, String, String)]
myBookmarks = [ ("Site Name",
                 myBrowser ++ "https://www.distrotube.com",
                 "Official website for DistroTube")
              , ("Site Name",
                 myBrowser ++ "https://www.distrotube.com",
                 "Official website for DistroTube")
              , ("Site Name",
                 myBrowser ++ "https://www.distrotube.com",
                 "Official website for DistroTube")
              , ("Site Name",
                 myBrowser ++ "https://www.distrotube.com",
                 "Official website for DistroTube")
              , ("Site Name",
                 myBrowser ++ "https://www.distrotube.com",
                 "Official website for DistroTube")
              , ("Site Name",
                 myBrowser ++ "https://www.distrotube.com",
                 "Official website for DistroTube")
              , ("Site Name",
                 myBrowser ++ "https://www.distrotube.com",
                 "Official website for DistroTube")
              , ("Site Name",
                 myBrowser ++ "https://www.distrotube.com",
                 "Official website for DistroTube")
              , ("Site Name",
                 myBrowser ++ "https://www.distrotube.com",
                 "Official website for DistroTube")
              , ("Site Name",
                 myBrowser ++ "https://www.distrotube.com",
                 "Official website for DistroTube")
              , ("Site Name",
                 myBrowser ++ "https://www.distrotube.com",
                 "Official website for DistroTube")
              , ("Site Name",
                 myBrowser ++ "https://www.distrotube.com",
                 "Official website for DistroTube")
              , ("Site Name",
                 myBrowser ++ "https://www.distrotube.com",
                 "Official website for DistroTube")
              , ("Site Name",
                 myBrowser ++ "https://www.distrotube.com",
                 "Official website for DistroTube")
              , ("Site Name",
                 myBrowser ++ "https://www.distrotube.com",
                 "Official website for DistroTube")
              , ("Site Name",
                 myBrowser ++ "https://www.distrotube.com",
                 "Official website for DistroTube")
              , ("Site Name",
                 myBrowser ++ "https://www.distrotube.com",
                 "Official website for DistroTube")
              ]

myConfigs :: [(String, String, String)]
myConfigs = [ ("zshrc",
               myEditor ++ "/home/valentin/.config/zsh/.zshrc",
               "the z shell")
            , ("doom emacs config.el",
               myEditor ++ "/home/valentin/.doom.d/config.org",
               "doom emacs config")
            , ("doom emacs init.el",
               myEditor ++ "/home/valentin/.doom.d/init.el",
               "doom emacs init")
            , ("xmonad.hs",
               myEditor ++ "/home/valentin/.xmonad/xmonad.hs",
               "xmonad config")
            ]

-- Creating two lists and then zipping them together in a 2-tuple so that
-- GridSelect can use them. myAppGrid is the same as myApplications above,
-- minus the third set of values (the app descriptions). myBookmarkGrid
-- is the same as myBookmarks, minus the third set of values. And the same
-- thing is done with myConfigGrid, which is derived from myConfigs.
myAppGrid :: [(String, String)]
myAppGrid = zip
            [TE.fst3 $ xs !! n | n <- [0..(length xs - 1)]]
            [TE.snd3 $ xs !! n | n <- [0..(length xs - 1)]]
  where xs = myApplications

myBookmarkGrid :: [(String, String)]
myBookmarkGrid = zip
                 [TE.fst3 $ xs !! n | n <- [0..(length xs - 1)]]
                 [TE.snd3 $ xs !! n | n <- [0..(length xs - 1)]]
  where xs = myBookmarks

myConfigGrid :: [(String, String)]
myConfigGrid = zip
               [TE.fst3 $ xs !! n | n <- [0..(length xs - 1)]]
               [TE.snd3 $ xs !! n | n <- [0..(length xs - 1)]]
  where xs = myConfigs

------------------------------------------------------------------------
-- TREE SELECT
------------------------------------------------------------------------
-- TreeSelect displays your workspaces or actions in a Tree-like format.
-- You can select desired workspace/action with the cursor or hjkl keys.

treeselectAction :: TS.TSConfig (X ()) -> X ()
treeselectAction a = TS.treeselectAction a
   [ Node (TS.TSNode "applications" "a list of programs I use often" (return ()))
     [Node (TS.TSNode (TE.fst3 $ myApplications !! n)
                      (TE.thd3 $ myApplications !! n)
                      (spawn $ TE.snd3 $ myApplications !! n)
           ) [] | n <- [0..(length myApplications - 1)]
     ]
   , Node (TS.TSNode "bookmarks" "a list of web bookmarks" (return ()))
     [Node (TS.TSNode(TE.fst3 $ myBookmarks !! n)
                     (TE.thd3 $ myBookmarks !! n)
                     (spawn $ TE.snd3 $ myBookmarks !! n)
           ) [] | n <- [0..(length myBookmarks - 1)]
     ]
   , Node (TS.TSNode "config files" "config files that edit often" (return ()))
     [Node (TS.TSNode (TE.fst3 $ myConfigs !! n)
                      (TE.thd3 $ myConfigs !! n)
                      (spawn $ TE.snd3 $ myConfigs !! n)
           ) [] | n <- [0..(length myConfigs - 1)]
     ]
   ]

-- Configuration options for treeSelect
tsDefaultConfig :: TS.TSConfig a
tsDefaultConfig = TS.TSConfig { TS.ts_hidechildren = True
                              , TS.ts_background   = 0xdd292d3e
                              , TS.ts_font         = myFont
                              , TS.ts_node         = (0xffd0d0d0, 0xff202331)
                              , TS.ts_nodealt      = (0xffd0d0d0, 0xff292d3e)
                              , TS.ts_highlight    = (0xffffffff, 0xff755999)
                              , TS.ts_extra        = 0xffd0d0d0
                              , TS.ts_node_width   = 200
                              , TS.ts_node_height  = 20
                              , TS.ts_originX      = 0
                              , TS.ts_originY      = 0
                              , TS.ts_indent       = 80
                              , TS.ts_navigate     = myTreeNavigation
                              }

-- Keybindings for treeSelect menus. Use h-j-k-l to navigate.
-- Use 'o' and 'i' to move forward/back in the workspace history.
-- Single KEY's are for top-level nodes. SUPER+KEY are for the
-- second-level nodes. SUPER+ALT+KEY are third-level nodes.
myTreeNavigation = M.fromList
    [ ((0, xK_Escape),   TS.cancel)
    , ((0, xK_Return),   TS.select)
    , ((0, xK_space),    TS.select)
    , ((0, xK_Up),       TS.movePrev)
    , ((0, xK_Down),     TS.moveNext)
    , ((0, xK_Left),     TS.moveParent)
    , ((0, xK_Right),    TS.moveChild)
    , ((0, xK_k),        TS.movePrev)
    , ((0, xK_j),        TS.moveNext)
    , ((0, xK_h),        TS.moveParent)
    , ((0, xK_l),        TS.moveChild)
    , ((0, xK_o),        TS.moveHistBack)
    , ((0, xK_i),        TS.moveHistForward)
    , ((0, xK_d),        TS.moveTo ["dev"])
    , ((0, xK_g),        TS.moveTo ["graphics"])
    , ((0, xK_m),        TS.moveTo ["music"])
    , ((0, xK_v),        TS.moveTo ["video"])
    , ((0, xK_w),        TS.moveTo ["web"])
    , ((mod4Mask, xK_b), TS.moveTo ["web", "browser"])
    , ((mod4Mask, xK_c), TS.moveTo ["web", "chat"])
    , ((mod4Mask, xK_m), TS.moveTo ["web", "email"])
    , ((mod4Mask, xK_r), TS.moveTo ["web", "rss"])
    , ((mod4Mask, xK_w), TS.moveTo ["web", "web conference"])
    , ((mod4Mask, xK_d), TS.moveTo ["dev", "docs"])
    , ((mod4Mask, xK_e), TS.moveTo ["dev", "emacs"])
    , ((mod4Mask, xK_f), TS.moveTo ["dev", "files"])
    , ((mod4Mask, xK_p), TS.moveTo ["dev", "programming"])
    , ((mod4Mask, xK_t), TS.moveTo ["dev", "terminal"])
    , ((mod4Mask, xK_z), TS.moveTo ["dev", "virtualization"])
    , ((mod4Mask, xK_g), TS.moveTo ["graphics", "gimp"])
    , ((mod4Mask, xK_i), TS.moveTo ["graphics", "image viewer"])
    , ((mod4Mask, xK_a), TS.moveTo ["music", "audio editor"])
    , ((mod4Mask, xK_u), TS.moveTo ["music", "music player"])
    , ((mod4Mask, xK_o), TS.moveTo ["video", "obs"])
    , ((mod4Mask, xK_v), TS.moveTo ["video", "video player"])
    , ((mod4Mask, xK_k), TS.moveTo ["video", "kdenlive"])
    , ((mod4Mask .|. altMask, xK_h), TS.moveTo ["dev", "programming", "haskell"])
    , ((mod4Mask .|. altMask, xK_p), TS.moveTo ["dev", "programming", "python"])
    , ((mod4Mask .|. altMask, xK_s), TS.moveTo ["dev", "programming", "shell"])
    ]

------------------------------------------------------------------------
-- XPROMPT SETTINGS
------------------------------------------------------------------------
dtXPConfig :: XPConfig
dtXPConfig = def
      { font                = myFont
      , bgColor             = "#292d3e"
      , fgColor             = "#d0d0d0"
      , bgHLight            = "#c792ea"
      , fgHLight            = "#000000"
      , borderColor         = "#535974"
      , promptBorderWidth   = 0
      , promptKeymap        = dtXPKeymap
      , position            = Top
--    , position            = CenteredAt { xpCenterY = 0.3, xpWidth = 0.3 }
      , height              = 20
      , historySize         = 256
      , historyFilter       = id
      , defaultText         = []
      , autoComplete        = Just 100000
      , showCompletionOnTab = False
      -- , searchPredicate     = isPrefixOf
      , searchPredicate     = fuzzyMatch
      , alwaysHighlight     = True
      , maxComplRows        = Nothing
      }

-- The same config above minus the autocomplete feature which is annoying
-- on certain Xprompts, like the search engine prompts.
dtXPConfig' :: XPConfig
dtXPConfig' = dtXPConfig
      { autoComplete        = Nothing
      }

-- A list of all of the standard Xmonad prompts and a key press assigned to them.
-- These are used in conjunction with keybinding I set later in the config.
promptList :: [(String, XPConfig -> X ())]
promptList = [ ("m", manPrompt)
             , ("p", passPrompt)
             , ("g", passGeneratePrompt)
             , ("r", passRemovePrompt)
             , ("s", sshPrompt)
             , ("x", xmonadPrompt)
             ]

-- Same as the above list except this is for my custom prompts.
promptList' :: [(String, XPConfig -> String -> X (), String)]
promptList' = [ ("c", calcPrompt, "qalc")
              ]

------------------------------------------------------------------------
-- CUSTOM PROMPTS
------------------------------------------------------------------------
-- calcPrompt requires a cli calculator called qalcualte-gtk.
-- You could use this as a template for other custom prompts that
-- use command line programs that return a single line of output.
calcPrompt :: XPConfig -> String -> X ()
calcPrompt c ans =
    inputPrompt c (trim ans) ?+ \input ->
        liftIO(runProcessWithInput "qalc" [input] "") >>= calcPrompt c
    where
        trim  = f . f
            where f = reverse . dropWhile isSpace

------------------------------------------------------------------------
-- XPROMPT KEYMAP (emacs-like key bindings for xprompts)
------------------------------------------------------------------------
dtXPKeymap :: M.Map (KeyMask,KeySym) (XP ())
dtXPKeymap = M.fromList $
     map (first $ (,) controlMask)
     [ (xK_z, killBefore)
     , (xK_k, killAfter)
     , (xK_a, startOfLine)
     , (xK_e, endOfLine)
     , (xK_m, deleteString Next)
     , (xK_b, moveCursor Prev)
     , (xK_f, moveCursor Next)
     , (xK_BackSpace, killWord Prev)
     , (xK_y, pasteString)
     , (xK_g, quit)
     , (xK_bracketleft, quit)
     ]
     ++
     map (first $ (,) altMask)
     [ (xK_BackSpace, killWord Prev)
     , (xK_f, moveWord Next)
     , (xK_b, moveWord Prev)
     , (xK_d, killWord Next)
     , (xK_n, moveHistory W.focusUp')
     , (xK_p, moveHistory W.focusDown')
     ]
     ++
     map (first $ (,) 0) -- <key>
     [ (xK_Return, setSuccess True >> setDone True)
     , (xK_KP_Enter, setSuccess True >> setDone True)
     , (xK_BackSpace, deleteString Prev)
     , (xK_Delete, deleteString Next)
     , (xK_Left, moveCursor Prev)
     , (xK_Right, moveCursor Next)
     , (xK_Home, startOfLine)
     , (xK_End, endOfLine)
     , (xK_Down, moveHistory W.focusUp')
     , (xK_Up, moveHistory W.focusDown')
     , (xK_Escape, quit)
     ]

------------------------------------------------------------------------
-- SEARCH ENGINES
------------------------------------------------------------------------
-- Xmonad has several search engines available to use located in
-- XMonad.Actions.Search. Additionally, you can add other search engines
-- such as those listed below.
archwiki, reddit, urban :: S.SearchEngine

archwiki = S.searchEngine "archwiki" "https://wiki.archlinux.org/index.php?search="
reddit   = S.searchEngine "reddit" "https://www.reddit.com/search/?q="
urban    = S.searchEngine "urban" "https://www.urbandictionary.com/define.php?term="

-- This is the list of search engines that I want to use. Some are from
-- XMonad.Actions.Search, and some are the ones that I added above.
searchList :: [(String, S.SearchEngine)]
searchList = [ ("a", archwiki)
             , ("d", S.duckduckgo)
             , ("h", S.hoogle)
             , ("i", S.images)
             , ("r", reddit)
             , ("s", S.stackage)
             , ("t", S.thesaurus)
             , ("v", S.vocabulary)
             , ("b", S.wayback)
             , ("u", urban)
             , ("w", S.wikipedia)
             , ("y", S.youtube)
             ]



-- TreeSelect workspaces
myWorkspaces :: Forest String
myWorkspaces = [ Node "dev"
                   [ Node "terminal" []
                   , Node "emacs" []
                   , Node "docs" []
                   , Node "files" []
                   , Node "programming"
                     [ Node "haskell" []
                     , Node "python" []
                     , Node "shell" []
                     ]
                   , Node "virtualization" []
                   ]
               , Node "web"
                   [ Node "browser" []
                   , Node "chat" []
                   , Node "email" []
                   , Node "rss" []
                   , Node "web conference" []
                   ]
               , Node "graphics"
                   [ Node "gimp" []
                   , Node "image viewer" []
                   ]
              , Node "music"
                   [ Node "audio editor" []
                   , Node "music player" []
                   ]
               , Node "video"
                   [ Node "obs" []
                   , Node "kdenlive" []
                   , Node "video player" []
                   ]
               ]

------------------------------------------------------------------------
-- MANAGEHOOK
------------------------------------------------------------------------
-- Sets some rules for certain programs. Examples include forcing certain
-- programs to always float, or to always appear on a certain workspace.
-- Forcing programs to a certain workspace with a doShift requires xdotool
-- if you are using clickable workspaces. You need the className or title
-- of the program. Use xprop to get this info.

myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll
     -- using 'doShift ( myWorkspaces !! 7)' sends program to workspace 8!
     -- I'm doing it this way because otherwise I would have to write out
     -- the full name of my clickable workspaces, which would look like:
     -- doShift "<action xdotool super+8>gfx</action>"
     [ className =? "obs"     --> doShift  "video.obs" 
     , title =? "firefox"     --> doShift  "web.browser" 
     , title =? "qutebrowser" --> doShift  "web.browser"
     , className =? "mpv"     --> doShift  "video.movie player"
     , className =? "vlc"     --> doShift  "video.movie player"
     , className =? "Gimp"    --> doShift  "graphics.gimp"
     , className =? "Gimp"    --> doFloat
     , title =? "Oracle VM VirtualBox Manager"     --> doFloat
     , className =? "VirtualBox Manager" --> doShift   "dev.virtualization"
     , (className =? "firefox" <&&> resource =? "Dialog") --> doFloat
     ] <+> namedScratchpadManageHook myScratchPads

------------------------------------------------------------------------
-- LOGHOOK
------------------------------------------------------------------------
-- Sets opacity for inactive (unfocused) windows.
myLogHook :: X ()
myLogHook = fadeInactiveLogHook fadeAmount
  where fadeAmount = 1.0


------------------------------------------------------------------------
-- LOGHOOK 2
------------------------------------------------------------------------
-- this eventloghook logs active windows and the title of the active window to a
-- file, which comes in handy when using another bar e.g. polybar
eventLogHook = do
  winset <- gets windowset
  title <- maybe (return "") (fmap show . getName) . W.peek $ winset
  let currWs = W.currentTag winset
  -- let wss = map W.tag $ W.workspaces winset
  let wsStr = "[" ++ currWs ++ "]"
  -- let wsStr = join $ map (fmt currWs) $ sort' wss

  io $ appendFile "/tmp/.xmonad-title-log" (title ++ "\n")
  io $ appendFile "/tmp/.xmonad-workspace-log" (wsStr ++ "\n")

  -- where fmt currWs ws
  --         | currWs == ws = "[" ++ ws ++ "]"
  --         | otherwise    = " " ++ ws ++ " "
  --       sort' = sortBy (compare `on` (!! 0))
------------------------------------------------------------------------
-- LAYOUTS
------------------------------------------------------------------------
-- Makes setting the spacingRaw simpler to write. The spacingRaw
-- module adds a configurable amount of space around windows.
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

-- Below is a variation of the above except no borders are applied
-- if fewer than two windows. So a single window has no gaps.
mySpacing' :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing' i = spacingRaw True (Border i i i i) True (Border i i i i) True

-- Defining a bunch of layouts, many that I don't use.
tall     = renamed [Replace "tall"]
           $ limitWindows 12
           $ mySpacing 8
           $ ResizableTall 1 (3/100) (1/2) []
magnify  = renamed [Replace "magnify"]
           $ magnifier
           $ limitWindows 12
           $ mySpacing 8
           $ ResizableTall 1 (3/100) (1/2) []
monocle  = renamed [Replace "monocle"]
           $ limitWindows 20 Full
floats   = renamed [Replace "floats"]
           $ limitWindows 20 simplestFloat
grid     = renamed [Replace "grid"]
           $ limitWindows 12
           $ mySpacing 8
           $ mkToggle (single MIRROR)
           $ Grid (16/10)
spirals  = renamed [Replace "spirals"]
           $ mySpacing' 8
           $ spiral (6/7)
threeCol = renamed [Replace "threeCol"]
           $ limitWindows 7
           $ mySpacing' 4
           $ ThreeCol 1 (3/100) (1/2)
threeRow = renamed [Replace "threeRow"]
           $ limitWindows 7
           $ mySpacing' 4
           -- Mirror takes a layout and rotates it by 90 degrees.
           -- So we are applying Mirror to the ThreeCol layout.
           $ Mirror
           $ ThreeCol 1 (3/100) (1/2)
tabs     = renamed [Replace "tabs"]
           -- I cannot add spacing to this layout because it will
           -- add spacing between window and tabs which looks bad.
           $ tabbed shrinkText myTabConfig
  where
    myTabConfig = def { fontName            = "xft:FiraCode Nerd Font:regular:pixelsize=11"
                      , activeColor         = "#292d3e"
                      , inactiveColor       = "#3e445e"
                      , activeBorderColor   = "#292d3e"
                      , inactiveBorderColor = "#292d3e"
                      , activeTextColor     = "#ffffff"
                      , inactiveTextColor   = "#d0d0d0"
                      }

-- Theme for showWName which prints current workspace when you change workspaces.
myShowWNameTheme :: SWNConfig
myShowWNameTheme = def
    { swn_font              = "xft:FiraCode Nerd Font Mono:bold:size=60"
    , swn_fade              = 1.0
    , swn_bgcolor           = "#282a36"
    , swn_color             = "#F1F1F1"
    }

-- The layout hook
myLayoutHook = avoidStruts $ mouseResize $ windowArrange $ T.toggleLayouts floats $
               mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout
             where
               -- I've commented out the layouts I don't use.
               myDefaultLayout =     tall
                                 ||| magnify
                                 ||| noBorders monocle
                                 ||| floats
                                 -- ||| grid
                                 ||| noBorders tabs
                                 -- ||| spirals
                                 -- ||| threeCol
                                 -- ||| threeRow

------------------------------------------------------------------------
-- SCRATCHPADS
------------------------------------------------------------------------
-- Allows to have several floating scratchpads running different applications.
-- Import Util.NamedScratchpad.  Bind a key to namedScratchpadSpawnAction.
myScratchPads :: [NamedScratchpad]
myScratchPads = [ NS "terminal" spawnTerm findTerm manageTerm
                , NS "mocp" spawnMocp findMocp manageMocp
                ]
  where
    spawnTerm  = myTerminal ++ " -n scratchpad"
    findTerm   = resource =? "scratchpad"
    manageTerm = customFloating $ W.RationalRect l t w h
               where
                 h = 0.9
                 w = 0.9
                 t = 0.95 -h
                 l = 0.95 -w
    spawnMocp  = myTerminal ++ " -n mocp 'mocp'"
    findMocp   = resource =? "mocp"
    manageMocp = customFloating $ W.RationalRect l t w h
               where
                 h = 0.9
                 w = 0.9
                 t = 0.95 -h
                 l = 0.95 -w
------------------------------------------------------------------------
-- KEYBINDINGS
------------------------------------------------------------------------
-- I am using the Xmonad.Util.EZConfig module which allows keybindings
-- to be written in simpler, emacs-like format.
myKeys :: [(String, X ())]
myKeys =
    -- Xmonad
        [ ("M-C-r", spawn "xmonad --recompile")
        -- restarts xmonad and polybar
        , ("M-S-r", spawn "xmonad --restart && $HOME/.config/polybar/launch.sh")
        , ("M-S-q", io exitSuccess)

    -- Open my preferred terminal
        , ("M-<Return>", spawn myTerminal)

    -- Run Prompt
        , ("M-S-<Return>", shellPrompt dtXPConfig)

    -- Windows
        , ("M-S-c", kill1)
        , ("M-S-a", killAll)

    -- Floating windows
        , ("M-f", sendMessage (T.Toggle "floats"))
        , ("M-<Delete>", withFocused $ windows . W.sink)
        , ("M-S-<Delete>", sinkAll)

    -- Grid Select (CTRL-g followed by a key)
        , ("C-g g", spawnSelected' myAppGrid)
        , ("C-g m", spawnSelected' myBookmarkGrid)
        , ("C-g c", spawnSelected' myConfigGrid)
        , ("C-g t", goToSelected $ mygridConfig myColorizer)
        , ("C-g b", bringSelected $ mygridConfig myColorizer)

    -- Tree Select/
        -- tree select actions menu
        , ("C-y a", treeselectAction tsDefaultConfig)
        -- tree select workspaces menu
        , ("C-y t", TS.treeselectWorkspace tsDefaultConfig myWorkspaces W.greedyView)
        -- tree select choose workspace to send window
        , ("C-y g", TS.treeselectWorkspace tsDefaultConfig myWorkspaces W.shift)

    -- Windows navigation
        , ("M-m", windows W.focusMaster)
        , ("M-j", windows W.focusDown)
        , ("M-k", windows W.focusUp)
        --, ("M-S-m", windows W.swapMaster)
        , ("M-S-j", windows W.swapDown)
        , ("M-S-k", windows W.swapUp)
        , ("M-<Backspace>", promote)
        , ("M1-S-<Tab>", rotSlavesDown)
        , ("M1-C-<Tab>", rotAllDown)
        --, ("M-S-s", windows copyToAll)
        , ("M-C-s", killAllOtherCopies)

        -- Layouts
        , ("M-<Tab>", sendMessage NextLayout)
        , ("M-C-M1-<Up>", sendMessage Arrange)
        , ("M-C-M1-<Down>", sendMessage DeArrange)
        , ("M-<Space>", sendMessage (MT.Toggle NBFULL) >> sendMessage ToggleStruts)
        , ("M-S-<Space>", sendMessage ToggleStruts)
        , ("M-S-n", sendMessage $ MT.Toggle NOBORDERS)
        , ("M-<KP_Multiply>", sendMessage (IncMasterN 1))
        , ("M-<KP_Divide>", sendMessage (IncMasterN (-1)))
        , ("M-S-<KP_Multiply>", increaseLimit)
        , ("M-S-<KP_Divide>", decreaseLimit)

        , ("M-h", sendMessage Shrink)
        , ("M-l", sendMessage Expand)
        , ("M-C-j", sendMessage MirrorShrink)
        , ("M-C-k", sendMessage MirrorExpand)

    -- Workspaces
        , ("M-.", nextScreen)
        , ("M-,", prevScreen)
        , ("M-S-<KP_Add>", shiftTo Next nonNSP >> moveTo Next nonNSP)
        , ("M-S-<KP_Subtract>", shiftTo Prev nonNSP >> moveTo Prev nonNSP)

    -- Scratchpads
        , ("M-C-<Return>", namedScratchpadAction myScratchPads "terminal")
        , ("M-C-c", namedScratchpadAction myScratchPads "mocp")

    -- Controls for mocp music player.
        , ("M-u p", spawn "mpc play")
        , ("M-u <Space>", spawn "mpc toggle")

    -- Emacs (CTRL-e followed by a key)
        , ("C-e e", spawn "emacsclient -c -a ''")
        , ("C-e a", spawn "emacsclient -c -a '' --eval '(emms)'")
        , ("C-e b", spawn "emacsclient -c -a '' --eval '(ibuffer)'")
        , ("C-e d", spawn "emacsclient -c -a '' --eval '(dired nil)'")
        , ("C-e m", spawn "emacsclient -c -a '' --eval '(mu4e)'")
        , ("C-e n", spawn "emacsclient -c -a '' --eval '(elfeed)'")
        , ("C-e s", spawn "emacsclient -c -a '' --eval '(eshell)'")
        , ("C-e t", spawn "emacsclient -c -a '' --eval '(+vterm/here nil)'")

    --- My Applications (Super+Alt+Key)
        , ("M-M1-a", spawn (myTerminal ++ " -e bash -c ncpamixer"))
        , ("M-M1-b", spawn "surf www.youtube.com/")
        --, ("M-M1-e", spawn (myTerminal ++ " -e neomutt"))
        , ("M-M1-e", spawn "emacsclient -c -a '' --eval '(mu4e)'")
        , ("M-M1-f", spawn (myTerminal ++ " -e bash -c vifm"))
        , ("M-M1-i", spawn (myTerminal ++ " -e bash -c irssi"))
        , ("M-M1-j", spawn (myTerminal ++ " -e bash -c joplin"))
        , ("M-M1-l", spawn (myTerminal ++ " -e bash -c lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss gopher://distro.tube"))
        , ("M-M1-m", spawn (myTerminal ++ " -e bash -c mocp"))
        , ("M-M1-n", spawn "emacsclient -c -a '' --eval '(elfeed)'")
        , ("M-M1-p", spawn (myTerminal ++ " -e bash -c pianobar"))
        , ("M-M1-r", spawn (myTerminal ++ " -e bash -c rtv"))
        , ("M-M1-t", spawn (myTerminal ++ " -e bash -c toot curses"))
        , ("M-M1-w", spawn (myTerminal ++ " -e bash -c wopr report.xml"))
        , ("M-M1-y", spawn (myTerminal ++ " -e bash -c straw-viewer"))

    -- Multimedia Keys
        , ("<XF86AudioPlay>", spawn "cmus toggle")
        , ("<XF86AudioPrev>", spawn "cmus prev")
        , ("<XF86AudioNext>", spawn "cmus next")
        -- , ("<XF86AudioMute>",   spawn "amixer set Master toggle")
        , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%- unmute")
        , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+ unmute")
        , ("<XF86HomePage>", spawn "firefox")
        , ("<XF86Search>", safeSpawn "firefox" ["https://www.google.com/"])
        , ("<XF86Mail>", runOrRaise "geary" (resource =? "thunderbird"))
        , ("<XF86Calculator>", spawn (myTerminal ++ " -e bash -c bc -l"))
        , ("<XF86Eject>", spawn "toggleeject")
        , ("<Print>", spawn "flameshot gui -p ~/shots")
        ]
        -- Appending search engine prompts to keybindings list.
        -- Look at "search engines" section of this config for values for "k".
        ++ [("M-s " ++ k, S.promptSearch dtXPConfig' f) | (k,f) <- searchList ]
        ++ [("M-S-s " ++ k, S.selectSearch f) | (k,f) <- searchList ]
        -- Appending some extra xprompts to keybindings list.
        -- Look at "xprompt settings" section this of config for values for "k".
        ++ [("M-p " ++ k, f dtXPConfig') | (k,f) <- promptList ]
        ++ [("M-p " ++ k, f dtXPConfig' g) | (k,f,g) <- promptList' ]
        -- The following lines are needed for named scratchpads.
          where nonNSP          = WSIs (return (\ws -> W.tag ws /= "nsp"))
                nonEmptyNonNSP  = WSIs (return (\ws -> isJust (W.stack ws) && W.tag ws /= "nsp"))

------------------------------------------------------------------------
-- MAIN
------------------------------------------------------------------------
main :: IO ()
main =
    forM_ [".xmonad-workspace-log", ".xmonad-title-log"] $ \file -> do
    safeSpawn "mkfifo" ["/tmp/" ++ file]
    -- the xmonad, ya know...what the WM is named after!
    xmonad $ ewmh def
        { manageHook = ( isFullscreen --> doFullFloat ) <+> myManageHook <+> manageDocks
        -- Run xmonad commands from command line with "xmonadctl command". Commands include:
        -- shrink, expand, next-layout, default-layout, restart-wm, xterm, kill, refresh, run,
        -- focus-up, focus-down, swap-up, swap-down, swap-master, sink, quit-wm. You can run
        -- "xmonadctl 0" to generate full list of commands written to ~/.xsession-errors.
        , handleEventHook    = serverModeEventHookCmd
                               <+> serverModeEventHook
                               <+> serverModeEventHookF "XMONAD_PRINT" (io . putStrLn)
                               <+> docksEventHook
        , modMask            = myModMask
        , terminal           = myTerminal
        , startupHook        = myStartupHook
        , layoutHook         = showWName' myShowWNameTheme myLayoutHook
        , workspaces         = TS.toWorkspaces myWorkspaces
        , borderWidth        = myBorderWidth
        , normalBorderColor  = myNormColor
        , focusedBorderColor = myFocusColor
        , logHook = workspaceHistoryHook <+> myLogHook <+> eventLogHook
        } `additionalKeysP` myKeys
