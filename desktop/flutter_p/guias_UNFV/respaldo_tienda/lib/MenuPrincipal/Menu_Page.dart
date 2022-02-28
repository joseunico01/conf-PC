import 'package:flutter/material.dart';
import 'package:flutter_proyecto_tienda/Firebase/Historial/Historial_lista.dart';
import 'package:flutter_proyecto_tienda/Firebase/Tienda/Clase_tienda.dart';
import 'package:flutter_proyecto_tienda/Firebase/Tienda/Tienda_editar.dart';
import 'package:flutter_proyecto_tienda/Firebase/Tienda/Tienda_models.dart';
import 'package:flutter_proyecto_tienda/Producto/Producto_page.dart';
import 'package:flutter_proyecto_tienda/Reserva/ListarReserva/Reserva_Lista.dart';
import 'package:flutter_proyecto_tienda/Usuario/ListarUsuario/Usuario_Lista.dart';
import 'package:flutter_proyecto_tienda/main.dart';

class MenuPrincipal extends StatefulWidget{
  late String id;
  late String usua;
  late String tipo;
  @override
  MenuPrincipal({required this.id,required this.usua,required this.tipo});
  State<MenuPrincipal> createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal>{

  TiendaModel tienda=new TiendaModel(id:'', nombre:'', direccion:'', distrito:'', telefono:'', dia:'', hora:'');
  final objtienda=new Tienda();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Menu Principal'),
        actions: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Text('Usuario: '+widget.usua+" \nTipo: "+widget.tipo+" ",style: TextStyle(fontSize: 20)),
            Icon(widget.tipo=='Cliente'?Icons.account_circle:Icons.account_box,size: 30),
          Text('   ')
          ]
        )
      ],
    ),
    backgroundColor: Colors.lightGreen[100],
      body: Container(
        color: Colors.lightGreen[100],
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FutureBuilder(
                  future: objtienda.ListarTienda(),
                  builder: (BuildContext context, AsyncSnapshot<List<TiendaModel>> snapshot){
                    if(snapshot.hasData){
                      final tienda=snapshot.data;
                      return ListView.builder(
                        shrinkWrap:true,
                        itemBuilder: (context,i)=>_crearLista(context,tienda![i]),
                        itemCount: tienda!.length,
                      );
                    }else{
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
                ),
                         Text('\n'),_btnProductos(), 
                         Text('\n'),_btnReservas(),
                         Text('\n'),_btnUsuarios(),
                         Text('\n'),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             _btnHistorial(),
                             _btnCerrar()
                           ],
                         ),
                         ],
            ),
          ),
        ),
      ),
    );
  }

  _crearLista(BuildContext context,TiendaModel tienda){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:<Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.store),
                  Text(' ${tienda.nombre}')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on),
                  Text(' ${tienda.direccion} de\n${tienda.distrito}',textAlign: TextAlign.center),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone),
                  Text(' ${tienda.telefono}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_time),
                  Text(' Horario de Atencion:\n${tienda.dia} ${tienda.hora}',textAlign: TextAlign.center),
                ],
              ),
      ] 
      ),
      widget.tipo=='Administrador'?
      Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Editar'),
      IconButton(
        icon: Icon(Icons.edit),
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context)=>EditarTienda(
                id:widget.id,
                usu:widget.usua,
                tipo:widget.tipo,
                idt:tienda.id,
                nom:tienda.nombre,
                dir:tienda.direccion,
                dis:tienda.distrito,
                tel:tienda.telefono,
                dia:tienda.dia,
                hor:tienda.hora,
              )
            )
          );
        }
      )])
      :Image.asset('imagenes/logo.png',width: 100),
      ]);
  }

  Widget _btnProductos(){
    return RaisedButton.icon(
      color: Colors.green,
      shape: StadiumBorder(),
      textColor: Colors.white,
      icon: Icon(Icons.local_offer_outlined),
      onPressed: (){
        _productos();
      },
      label: Text(widget.tipo=='Administrador'?'Mis Productos':'Productos'),
    );
  }

  Widget _btnReservas(){
    return RaisedButton.icon(
      color: Colors.green,
      shape: StadiumBorder(),
      textColor: Colors.white,
      icon: Icon(Icons.shopping_basket_outlined),
      onPressed: (){
        _reservas();
      },
      label: Text(widget.tipo=='Administrador'?'Reservas':'Mis Reservas'),
    );
  }

  Widget _btnUsuarios(){
    return RaisedButton.icon(
      color: Colors.green,
      shape: StadiumBorder(),
      textColor: Colors.white,
      icon: Icon(Icons.manage_accounts_outlined),
      onPressed: (){
        _usuarios();
      },
      label: Text(widget.tipo=='Administrador'?'Usuarios':'Mi Usuario'),
    );
  }

  Widget _btnHistorial(){
    return RaisedButton.icon(
      color: Colors.blue[900],
      shape: StadiumBorder(),
      textColor: Colors.white,
      icon: Icon(Icons.history),
      onPressed: (){
        _historial();
      },
      label: Text(widget.tipo=='Administrador'?'Historial\nde Reservas':'Mi Historial\nde Reservas'),
    );
  }

  Widget _btnCerrar(){
    return RaisedButton.icon(
      color: Colors.red[900],
      shape: StadiumBorder(),
      textColor: Colors.white,
      icon: Icon(Icons.exit_to_app),
      onPressed: (){
        _cerrar();
      },
      label: Text('Cerrar Sesion'),
    );
  }

  void _productos(){
    Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context)=>ListarProductos(
                id: widget.id,
                usua:widget.usua,
                tipo:widget.tipo
              ))
          );
  }

  void _reservas(){
    Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context)=>ListarReservas(
                id: widget.id,
                usua:widget.usua,
                tipo:widget.tipo
              ))
          );
  }

  void _usuarios(){
    Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context)=>ListarUsuarios(
                id: widget.id,
                tipo:widget.tipo
              ))
          );
  }

  void _historial(){
    Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context)=>ListarHistorial(
                id:widget.id,
                tipo:widget.tipo,
              ))
          );
  }

  void _cerrar(){
    showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text("Cerrar Sesion"),
        content: Text("Seguro que desea cerrar sesion"),
        actions: [
          FlatButton(
            child: Text("Si"),
            onPressed:(){
              Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder:(BuildContext context){
          return new MyApp();
        }),
      (Route route)=>false
    );
            },
            ),
            FlatButton(
            child: Text("No"),
            onPressed:(){
              Navigator.of(context).pop("No");
            },
            )
        ],
      ));
  }

}

//---------------------------------Agregar datos tienda------------------------------------------------------

/*
TiendaModel tienda=new TiendaModel(id:'', nombre:'', direccion:'', distrito:'', telefono:'', dia:'', hora:'');
  final objtienda=new Tienda();

  tienda.id='Tienda';
  tienda.nombre='Tienda "MSN"';
  tienda.direccion='Asoc. Viv. Villa Santa Rosa';
  tienda.distrito='Huachipa-Lurigancho';
  tienda.telefono='918504709';
  tienda.dia='Lun-Dom';
  tienda.hora='6:00 AM/8:00 PM';

  objtienda.AgregarTienda(tienda);
*/