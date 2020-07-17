use master
go

alter database Bd_Gtisys add filegroup Bd_Gtisys_Data2


alter database Bd_Gtisys
add file(

	name = Bd_Gtisys1,
	filename = 'E:\SQLdata4\Bd_Gtisys1.ndf' ,
	size = 1MB,
	maxsize = 200MB,
	FILEGROWTH = 10MB
)to filegroup Bd_Gtisys_Data2



----Creo una tabla
use Bd_Gtisys
go

create table RptHistoricoventas
(
	idventas int,
	idusuario int
)on  Bd_Gtisys_Data2 --- Por defecto se van al primary


-----cambio el storage de la tabla
CREATE UNIQUE CLUSTERED INDEX PK_OPER_TIPO_CURSO
ON OPER_TIPO_CURSO(ID_TIPO_CURSO)
WITH (DROP_EXISTING=ON,ONLINE=ON) ON Bd_Gtisys_Data2

---CBO_CAB_COMPROBANTE

CREATE UNIQUE CLUSTERED INDEX PK_CBO_COMPROBANTE
ON CBO_CAB_COMPROBANTE(ID_CAB_COMPROBANTE)
WITH (DROP_EXISTING=ON,ONLINE=OFF) ON Bd_Gtisys_Data2

