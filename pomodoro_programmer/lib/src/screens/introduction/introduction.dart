import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_programmer/src/screens/introduction/widgets_introduction/background_introduction.dart';
import 'package:pomodoro_programmer/src/screens/introduction/widgets_introduction/boton_introduccion.dart';

class Introduction extends StatefulWidget {
  const Introduction({ Key? key }) : super(key: key);

  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  int _currentPageIndex=0;
  @override
  Widget build(BuildContext context) {
    var _text='¿Que es PomodoroDeV?\n'+
    '\nEs una herramienta de gestion del tiempo basada en la técnica Pomodoro.\n\n'+
    ' Te ayuda a optimizar el tiempo y aumentar tu eficiencia \n'+
    '\n1 Pomodoro=\n 25 minutos de maxima concentración por 5 minutos de descanso\n'+
    '\nDespués de 4 Pomodoros descansa 25 min';
    var _text2='¿Como llevarlo a cabo?\n\n'+
    'Transcurridos los 25 minutos'+' conviene levantarse y hacer cualquier otra'+
    ' cosa que no esté relacionada con la tarea que tenemos entre manos \n\n'+
    'En ocasiones no damos con la solución a un problema precisamente porque'+
    ' tenemos el problema delante. \n\nMuchas veces solo es necesario alejarse de lo que estamos haciendo durante un instante.';
    var _text3='¿Que beneficios tiene?\n\n'+
    'A medida que prácticas la técnica, descubrirás que tu capacidad de concentración y productividad mejorarán durante cada sesión.'+
    '\n\nEsta técnica te enseña a no competir contra el tiempo, sino a trabajar'+
    ' con él de una manera más eficiente.\n\nMantener la concentración durante mucho'+
    ' tiempo seguido es totalmente agotador no solo para tu cuerpo sino también para tu mente'+
    '\nDentro de los buenos hábitos de programación se menciona que debes hacer'+
    ' pausas frecuentes y descansar la vista.';
    var _fondo= 'fondo1.jpg';
    var _fondo2= 'fondo2.jpg';
    var _fondo3= 'fondo3.jpg';


List<Widget> pageList=[
  BackGround(data: _text,fondo: _fondo, ),
  BackGround(data: _text2,fondo: _fondo2,),
  BackGround(data: _text3,fondo: _fondo3,),

];

double height = MediaQuery.of(context).size.height;


    return Scaffold(
      
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            PageView.builder(
              onPageChanged: (int index){
                setState(() {
                  _currentPageIndex=index % (pageList.length);
                  print('pront$_currentPageIndex');
                });
              },
              itemCount: 10000,
              itemBuilder: (context, index){
                return pageList[index % (pageList.length)];
              },
              ),
               Positioned(
                 //indicador de página
              bottom: height*.15,
              left: 0,
              right: 0,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(pageList.length, (i) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPageIndex == i
                              ? Color(0xff1f94738)
                              : Colors.white),
                    );
                  }).toList(),
                ),
              ),
            ),

              
            // PageView(
            //   clipBehavior: Clip.hardEdge,
            //   onPageChanged: (int index){
            //     setState(() {
            //        _currentPageIndex= index ;
            //        print(index);
                  
                  
            //     });
               

            //   },
            //   controller: PageController(
               
            //     initialPage: 0,
                  
            //   ),
            //   physics: BouncingScrollPhysics(),
            //   children: [
            //     BackGround(data: _text,fondo: _fondo, currentPage: _currentPageIndex),
            //     BackGround(data: _text2,fondo: _fondo2,currentPage: _currentPageIndex),
            //     BackGround(data: _text3,fondo: _fondo3,currentPage: _currentPageIndex),

            //   ],
            // ),
            
            Contenido(),


          ],
        ),
        

      ),
      
    );
  }
}


class Contenido extends StatelessWidget {
  const Contenido({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: EdgeInsets.all(10),
         child: Column(
           children: [
             Expanded(child: Container(width: double.infinity,),),
             Container(
               height: height*.3,
               width: double.infinity,
               child: Column(
                
                 // ignore: prefer_const_literals_to_create_immutables
                 children: [
                    SizedBox(height: 150,),                  
                   SpinPerfect(child: BotonesRedes(textBtn: 'Entendido',  ruta: 'clock',)),
                 ],
               ),
             )
           ],
           
         ),
          
        );
          
  }
}