/*
 * Jakefile
 * TFPDFView
 *
 * Created by Tim Fiedler on June 2, 2012.
 * Copyright 2012, 0x68 All rights reserved.
 */

var ENV = require("system").env,
    FILE = require("file"),
    JAKE = require("jake"),
    task = JAKE.task,
    FileList = JAKE.FileList,
    app = require("cappuccino/jake").app,
    configuration = ENV["CONFIG"] || ENV["CONFIGURATION"] || ENV["c"] || "Debug",
    OS = require("os");

app ("TFPDFView", function(task)
{
    task.setBuildIntermediatesPath(FILE.join("Build", "TFPDFView.build", configuration));
    task.setBuildPath(FILE.join("Build", configuration));

    task.setProductName("TFPDFView");
    task.setIdentifier("com.yourcompany.TFPDFView");
    task.setVersion("1.0");
    task.setAuthor("0x68");
    task.setEmail("feedback @nospam@ yourcompany.com");
    task.setSummary("TFPDFView");
    task.setSources((new FileList("**/*.j")).exclude(FILE.join("Build", "**")));
    task.setResources(new FileList("Resources/**"));
    task.setIndexFilePath("index.html");
    task.setInfoPlistPath("Info.plist");

    if (configuration === "Debug")
        task.setCompilerFlags("-DDEBUG -g");
    else
        task.setCompilerFlags("-O");
});

task ("default", ["TFPDFView"], function()
{
    printResults(configuration);
});

task ("build", ["default"]);

task ("debug", function()
{
    ENV["CONFIGURATION"] = "Debug";
    JAKE.subjake(["."], "build", ENV);
});

task ("release", function()
{
    ENV["CONFIGURATION"] = "Release";
    JAKE.subjake(["."], "build", ENV);
});

task ("run", ["debug"], function()
{
    OS.system(["open", FILE.join("Build", "Debug", "TFPDFView", "index.html")]);
});

task ("run-release", ["release"], function()
{
    OS.system(["open", FILE.join("Build", "Release", "TFPDFView", "index.html")]);
});

task ("deploy", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Deployment", "TFPDFView"));
    OS.system(["press", "-f", FILE.join("Build", "Release", "TFPDFView"), FILE.join("Build", "Deployment", "TFPDFView")]);
    printResults("Deployment")
});

task ("desktop", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Desktop", "TFPDFView"));
    require("cappuccino/nativehost").buildNativeHost(FILE.join("Build", "Release", "TFPDFView"), FILE.join("Build", "Desktop", "TFPDFView", "TFPDFView.app"));
    printResults("Desktop")
});

task ("run-desktop", ["desktop"], function()
{
    OS.system([FILE.join("Build", "Desktop", "TFPDFView", "TFPDFView.app", "Contents", "MacOS", "NativeHost"), "-i"]);
});

function printResults(configuration)
{
    print("----------------------------");
    print(configuration+" app built at path: "+FILE.join("Build", configuration, "TFPDFView"));
    print("----------------------------");
}
