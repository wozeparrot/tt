// Copyright 2020 Danilo Spinella <danyspin97@protonmail.com>
// Distributed under the terms of the GNU General Public License v2

module libtt.data.service_options;

import libtt.data.service : Service;

@safe:
nothrow:

abstract class ServiceOptions
{
public:
    @property ref string[] dependencies()
    {
        return m_depends;
    }

    @property void dependencies(ref string[] depends)
    {
        m_depends = depends;
    }

    override string toString()
    {
        if (dependencies.length != 0)
        {
            import std.array : join;
            import std.format : format;

            auto ret = format("depends = ( %s )", dependencies.join(" "));
            return ret;
        }

        return "";
    }

private:
    string[] m_depends;
}
