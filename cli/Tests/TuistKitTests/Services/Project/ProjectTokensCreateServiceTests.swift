import Foundation
import Mockable
import TuistLoader
import TuistServer
import TuistTesting
import XCTest

@testable import TuistKit

final class ProjectTokensCreateServiceTests: TuistUnitTestCase {
    private var createProjectTokenService: MockCreateProjectTokenServicing!
    private var serverEnvironmentService: MockServerEnvironmentServicing!
    private var configLoader: MockConfigLoading!
    private var serverURL: URL!
    private var subject: ProjectTokensCreateService!

    override func setUp() {
        super.setUp()

        createProjectTokenService = .init()
        serverEnvironmentService = .init()
        configLoader = .init()
        serverURL = URL(string: "https://test.tuist.dev")!
        given(configLoader)
            .loadConfig(path: .any)
            .willReturn(.test(url: serverURL))
        given(serverEnvironmentService)
            .url(configServerURL: .value(serverURL))
            .willReturn(serverURL)
        subject = ProjectTokensCreateService(
            createProjectTokenService: createProjectTokenService,
            serverEnvironmentService: serverEnvironmentService,
            configLoader: configLoader
        )
    }

    override func tearDown() {
        createProjectTokenService = nil
        serverEnvironmentService = nil
        configLoader = nil
        serverURL = nil
        subject = nil

        super.tearDown()
    }

    func test_create_project_token() async throws {
        try await withMockedDependencies {
            // Given
            given(createProjectTokenService)
                .createProjectToken(
                    fullHandle: .value("tuist-org/tuist"),
                    serverURL: .any
                )
                .willReturn("new-token")

            // When
            try await subject.run(fullHandle: "tuist-org/tuist", directory: nil)

            // Then
            XCTAssertStandardOutput(pattern: "new-token")
        }
    }
}
