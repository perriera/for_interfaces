### [What is Angular Routing?](https://stackoverflow.com/questions/54966153/what-is-angular-routing) 
> Angular routing is the method to direct the users to the relevant page that they want to perform their actions. In other words, There may be multiple components in a single angular app. Routing is the way to implement the connection between those components. If you say yes Angular will add app-routing.module.ts file to your app folder. You can add your component information and URL settings to that file as below example.
```
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
```