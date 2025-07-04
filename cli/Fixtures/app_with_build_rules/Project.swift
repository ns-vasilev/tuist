import ProjectDescription

let project = Project(
    name: "App",
    organizationName: "Tuist",
    targets: [
        .target(
            name: "App",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.App",
            sources: ["App/*"],
            buildRules: [
                .buildRule(
                    name: "Process_InfoPlist.strings",
                    fileType: .sourceFilesWithNamesMatching,
                    filePatterns: "*/InfoPlist.strings",
                    compilerSpec: .customScript,
                    inputFiles: ["$(INPUT_FILE_PATH)"],
                    outputFiles: ["${DERIVED_FILES_DIR}/${INPUT_FILE_REGION_PATH_COMPONENT}/${INPUT_FILE_NAME}"],
                    script: "cp \"$SCRIPT_INPUT_FILE_0\" \"$SCRIPT_OUTPUT_FILE_0\""
                ),
            ]
        ),
    ]
)
