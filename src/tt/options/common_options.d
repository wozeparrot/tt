// Copyright 2020 Rasmus Thomsen <oss@cogitri.dev>
// Distributed under the terms of the GNU General Public License v2

module tt.options.common_options;

import std.getopt : Option;

import tt.options.debug_level : DebugLevel;

@safe:
nothrow:

struct CommonOptions
{
    /// Whether to show the version of tt
    bool showVersion;
    /// Whether to show the helpText of tt
    bool showHelp;
    /// The level of debugging to enable in tt
    DebugLevel debugLevel;
    /// What subcommand to run
    string subcommand;
    /// Common options get from getopt
    Option[] getoptOptions;
}
