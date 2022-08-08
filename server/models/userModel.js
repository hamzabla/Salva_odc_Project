class User {
    constructor(id, fullName, UserName, phone, email,
        password, role ) {
            this.id = id;
            this.fullName = fullName;
            this.userName = UserName;
            this.phone = phone;
            this.email = email;
            this.password = password;
            this.role = role;
    }
}

module.exports = User;