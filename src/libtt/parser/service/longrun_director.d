// Copyright 2020 Danilo Spinella <danyspin97@protonmail.com>
// Distributed under the terms of the GNU General Public License v2

module libtt.parser.service.longrun_director;

@safe:

import libtt.parser.section : EnvironmentBuilder, LoggerScriptBuilder,
    LongrunOptionsBuilder, MainSection, MainSectionBuilder, ScriptBuilder, SectionBuilder;
import libtt.parser.service.service_director : ServiceDirector;
import libtt.data : Environment, LoggerScript, Longrun, LongrunOptions, Script, Service;

class LongrunDirector : ServiceDirector
{
public:
    this()
    {
        super();
        options = new LongrunOptions();
        environment = new Environment();
    }

    override Service instanceService(in string path)
    {
        auto service = new Longrun(mainSection.name, mainSection.polishName,
                mainSection.description, path, options, run,);

        if (finish !is null)
        {
            service.finish = finish;
        }
        if (logger !is null)
        {
            service.logger = logger;
        }

        return service;
    }

    override SectionBuilder getBuilderForSection(in string section)
    {
        switch (section)
        {
        case "main":
            return new MainSectionBuilder(&mainSection);
        case "run":
            return new ScriptBuilder(&run, environment);
        case "finish":
            return new ScriptBuilder(&finish, environment);
        case "logger":
            return new LoggerScriptBuilder(&logger, environment, mainSection.name);
        case "config":
            return new EnvironmentBuilder(environment);
        case "options":
            return new LongrunOptionsBuilder(options);
        default:
            immutable auto msg = `Section "` ~ section ~ `" is not supported.`;
            throw new Exception(msg);
        }
    }

private:
    Environment environment;
    MainSection mainSection;
    Script run;
    Script finish;
    LoggerScript logger;
    LongrunOptions options;
}
