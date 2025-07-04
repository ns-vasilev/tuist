import Foundation
import TSCUtility
import TuistLoader
import XCTest
@testable import TuistCore
@testable import TuistGenerator
@testable import TuistKit
@testable import TuistTesting

final class WorkspaceMapperFactoryTests: TuistUnitTestCase {
    var projectMapperFactory: ProjectMapperFactory!
    var subject: WorkspaceMapperFactory!

    override func setUp() {
        super.setUp()
        projectMapperFactory = ProjectMapperFactory()
    }

    override func tearDown() {
        projectMapperFactory = nil
        subject = nil
        super.tearDown()
    }

    func test_default_contains_the_project_workspace_mapper() {
        // Given
        subject = WorkspaceMapperFactory(
            projectMapper: SequentialProjectMapper(
                mappers: projectMapperFactory.default(
                    tuist: .default
                )
            )
        )

        // When
        let got = subject.default(tuist: .default)

        // Then
        XCTAssertContainsElementOfType(got, ProjectWorkspaceMapper.self)
    }

    func test_default_contains_the_tuist_workspace_identifier_mapper() {
        // Given
        subject = WorkspaceMapperFactory(
            projectMapper: SequentialProjectMapper(
                mappers: projectMapperFactory.default(
                    tuist: .default
                )
            )
        )

        // When
        let got = subject.default(tuist: .default)

        // Then
        XCTAssertContainsElementOfType(got, TuistWorkspaceIdentifierMapper.self)
    }

    func test_default_contains_the_tuist_workspace_render_markdown_readme_mapper() {
        // Given
        subject = WorkspaceMapperFactory(
            projectMapper: SequentialProjectMapper(
                mappers: projectMapperFactory.default(
                    tuist: .default
                )
            )
        )

        // When
        let got = subject.default(tuist: .default)

        // Then
        XCTAssertContainsElementOfType(got, TuistWorkspaceRenderMarkdownReadmeMapper.self)
    }

    func test_default_contains_the_tide_template_macros_mapper() {
        // Given
        subject = WorkspaceMapperFactory(
            projectMapper: SequentialProjectMapper(
                mappers: projectMapperFactory.default(
                    tuist: .default
                )
            )
        )

        // When
        let got = subject.default(tuist: .default)

        // Then
        XCTAssertContainsElementOfType(got, IDETemplateMacrosMapper.self)
    }

    func test_default_contains_the_last_upgrade_version_mapper() {
        // Given
        subject = WorkspaceMapperFactory(
            projectMapper: SequentialProjectMapper(
                mappers: projectMapperFactory.default(
                    tuist: .default
                )
            )
        )

        // When
        let got = subject.default(tuist: .default)

        // Then
        XCTAssertContainsElementOfType(got, LastUpgradeVersionWorkspaceMapper.self)
    }
}
