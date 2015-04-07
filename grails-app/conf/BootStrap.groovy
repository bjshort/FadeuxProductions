import fadeuxproductions.security.Role
import fadeuxproductions.security.User
import fadeuxproductions.security.UserRole

class BootStrap {


    def init = { servletContext ->
        makeUsersAndRoles()
    }
    def destroy = {
    }

    def makeUsersAndRoles() {
        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)

        makeUserWithPass("Curran", "3xtremelySafe", adminRole)
    }

    def makeUserWithPass(String username, String password, Role userRole) {
        addRoleToUser (makeUser(username, password), userRole)
    }

    def makeUsers(List userNames, Role userRole) {
        userNames.each { userName ->
            addRoleToUser (makeUser(userName), userRole)
        }
    }

    def addRoleToUser(User user, Role role) {
        if (!user.authorities.contains(role)) {
            UserRole.create user, role
        }
    }

    def makeUser(String username) {
        User.findByUsername(username) ?: new User(
                username: username,
                password: username,
                enabled: true).save(failOnError: true)
    }

    def makeUser(String username, String password) {
        User.findByUsername(username) ?: new User(
                username: username,
                password: password,
                enabled: true).save(failOnError: true)
    }
}
