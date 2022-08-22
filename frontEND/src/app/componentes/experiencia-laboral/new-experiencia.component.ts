import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Experiencia } from 'src/app/modelo/experiencia';
import { SExperienciaService } from 'src/app/servicio/s-experiencia.service';

@Component({
  selector: 'app-new-experiencia',
  templateUrl: './new-experiencia.component.html',
  styleUrls: ['./new-experiencia.component.css']
})
export class NewExperienciaComponent implements OnInit {
  nombreE: string = ''; 
  descripcionE: string= ''; 
  img: string= ''; 
  anocomienzo: number;

  constructor(private sExperiencia: SExperienciaService, private router: Router) { }

  ngOnInit(): void {
  }

  onCreate(): void{
    const expe = new Experiencia(this.nombreE, this.descripcionE, this.img, this.anocomienzo); 
    this.sExperiencia.save(expe).subscribe(data=>{
      alert("Experiencia añadida"); 
      this.router.navigate(['']); 
    }, err =>{
      alert("ERROR ---> URL demasiado larga (utilicé un acortardor de URL online) ó CAMPO VACÍO ó Tiempo límite excedido");  
      this.router.navigate(['']);
    })
  }

}
