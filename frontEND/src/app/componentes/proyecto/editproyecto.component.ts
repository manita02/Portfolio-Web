import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Proyecto } from 'src/app/modelo/proyecto';
import { ProyectoService } from 'src/app/servicio/proyecto.service';

@Component({
  selector: 'app-editproyecto',
  templateUrl: './editproyecto.component.html',
  styleUrls: ['./editproyecto.component.css']
})
export class EditproyectoComponent implements OnInit {

  proyecto: Proyecto = null; 
  constructor(private proyectoS: ProyectoService, private activatedRouter: ActivatedRoute, private router: Router) { }

  ngOnInit(): void {
    const id = this.activatedRouter.snapshot.params['id']; 
    this.proyectoS.detail(id).subscribe(
      data =>{
        this.proyecto = data; 
      }, err => {
        alert("ERROR ---> URL demasiado larga (utilicé un acortardor de URL online) ó CAMPO VACÍO ó Tiempo límite excedido"); 
        this.router.navigate(['']);
      }
    )
  
  }

  onUpdate(): void{
    if (confirm('¿Está seguro que desea guardar los cambios?')) {
      const id = this.activatedRouter.snapshot.params['id']; 
      this.proyectoS.update(id, this.proyecto).subscribe(
        data=>{
         alert("Proyecto actualizado");
         this.router.navigate(['']);  
        }, err =>{
          alert("ERROR ---> URL demasiado larga (utilicé un acortardor de URL online) ó CAMPO VACÍO ó Tiempo límite excedido");  
          this.router.navigate(['']);
        })
    
    }
    
  }

}
