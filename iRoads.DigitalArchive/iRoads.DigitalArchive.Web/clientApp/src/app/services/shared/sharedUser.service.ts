import { Injectable } from '@angular/core';
import {User} from '../../models/User'
@Injectable({
    providedIn: 'root',
})
export class SharedUserService {
    private user: User | undefined;
    private token: string | undefined;

    constructor() { }
    getUser() {
        return this.user;
    }
    setUser(user: User) {
        this.user = user;
    }
    setUserRole(role: number) {
        if (this.user) {
            this.user.Role = role;
        }
    }

    getToken() {
        return this.token;
    }
    setToken(token: string | undefined) {
        this.token = token;
    }
}
