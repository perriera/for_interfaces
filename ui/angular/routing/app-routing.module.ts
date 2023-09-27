import { Routes, RouterModule } from '@angular/router';
import { AdminOrganizationComponent } from './admin-organization/admin-organization.component';
import { LoginComponent } from './login/login.component';    

const routes: Routes = [
  {
    path: '',
    component: LoginComponent,  //Go to login page
  },
  {
    path: 'organizations',
    component: AdminOrganizationComponent, //Go to organization page
  },
  { path: '**', redirectTo: 'login', pathMatch: 'full' } //If path is not match to, redirect to login page
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}