import { Component, OnInit } from '@angular/core';
import { Experiencia } from 'src/app/modelo/experiencia';
import { SExperienciaService } from 'src/app/servicio/s-experiencia.service';
import { TokenService } from 'src/app/servicio/token.service';

@Component({
  selector: 'app-experiencia-laboral',
  templateUrl: './experiencia-laboral.component.html',
  styleUrls: ['./experiencia-laboral.component.css']
})
export class ExperienciaLaboralComponent implements OnInit {
  expe: Experiencia[] = []; 
  constructor(private sExperiencia: SExperienciaService, private tokenService: TokenService) { }

  isLogged = false; 

  ngOnInit(): void {
    this.cargarExperiencia();
    if(this.tokenService.getToken()){
      this.isLogged = true; 
    } else{
      this.isLogged = false; 
    }
 
  }

  cargarExperiencia(): void{
    this.sExperiencia.lista().subscribe(data =>{this.expe = data;})
  }

  delete(id?: number){
    if (confirm('¿Está seguro que desea eliminar esta experiencia?')) {
      if(id != undefined){
        this.sExperiencia.delete(id).subscribe(
          data => {
            this.cargarExperiencia(); 
          }, err => {
            alert("No se pudo borrar la experiencia"); 
          }
        )
      }

    }
    
  }

}


