﻿# arroyo-challenge
## Ejercicio 1
Se creo codigo modula de Terraform para el Ej1
Todo el despliegue se realiza automaticante :
```
terraform init
terraform plan
terraform apply
```
Las privates key seran enviadas por privado via email.
Se configuro ssh para windows en la instancia.

Esto creara las intancia solicitada completamente automatizado utilizando MIG.

## Ejercicio 2
Se agrego el repositorio de GitHub y se configuraron Trigger para cloud build utilizando pull requests.
Se crearon los diferentes servicios utilizando cloud build.
Se dio permiso a la service account para cloud build para poder acceder a la API de los diferentes servicios.
Se crearon las secrets en Secret Manager.

### Docker image pushed por Cloud Build
![Alt text](/images/gcr.png "GCR")

### App Engine deploy para NodeJS
![Alt text](/images/appengine.png "AppEngine")

### Salida Final de cloud build 
![Alt text](/images/finalsteps.png "Final")

### Errores
Google no me permite agregar la cuenta carlos.albarran.ddl@gmail.com, se probo con otras cuentas de gmail exitosamente.
Las cuentas Fabio.rincon@arroyoconsulting.net, andres.zapata@arroyoconsulting.net, carlos.albarran@arroyoconsulting.net
no pertencen a usuarios de Gsuite por lo que no puden ser linkeadas. 
