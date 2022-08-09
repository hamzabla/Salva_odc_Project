class User {
    constructor(fullName, UserName, phone, email,
        password, role ) {
            this.fullName = fullName;
            this.userName = UserName;
            this.phone = phone;
            this.email = email;
            this.password = password;
            this.role = role;
    }
}

module.exports = User;