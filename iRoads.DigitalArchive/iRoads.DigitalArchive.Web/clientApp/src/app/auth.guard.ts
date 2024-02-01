import { Injectable } from '@angular/core';
import {
  ActivatedRouteSnapshot,
  CanActivate,
  RouterStateSnapshot,
} from '@angular/router';
import { AuthService } from './services/shared/auth.service';


@Injectable({
  providedIn: 'root',
})
export class AuthGuard implements CanActivate {
  constructor(
    private authService: AuthService
  ) { }
  async canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
    return this.authService.refreshTokenIfNeeded();
  }
}
