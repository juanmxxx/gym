import 'package:flutter/material.dart';

class TipsText {
  List suplements = [
    {
      "Sustancia":
          "Es un elemento natural ya que en micho de los casos son obtenidas a traves del suero que produce la leche y en ningun caso se obtiene de un proceso quimico antinatural.",
      "Obtencion":
          "Una vez obtienes la sustancia (leche en este caso) lo proximo es separar la leche del suero, seguido hay que deshidratar el suero obtenido y previamente separado para luego al final darle el sabor que se quiera dar (chocolate, fresa, nata, vainilla...)",
      "Funcion":
          "Basicamente lo que produce la proteina en tu cuerpo es la regeneracion de tejidos musculares afectados o dañados durante la realizacion de actividad fisica, ayuda a que la recuperacion de estos sea mas rapida y que nuestro organismo obtenga las proteinas necesarias en paralelo a la actividad fisica de forma mas economica. Ya que si tuviesemos que obtener esas proteinas a partir de la comida el gasto en esta seria bastante mas elevado.",
      "Ventajas": "\n-Más economico frente a nutrirnos de alimentos directamente"
          "\n-Facil y rapida preparacion (la mayoria de proteinas son solubles en casi cualquier liquido (incluso agua fria), y la preparacion se basa en echar la proteina y el liquido, agitar y tomar."
          "\n-Ayuda al organismo a obtener el aporte proteico necesario para la actividad fisica."
          "\n-Se pueden adquirir de gran cantidad de sabores."
          "\n-Ayuda a controlar el apetito.",
      "Moraleja":
          "Estas ventajas se dan si se combina SIEMPRE el uso de proteinas con la realizacion de ejercicio."
    },
    {
      "Sustancia":
          "Otro complemento, un gran conocido y que igualmente puede ser consumido en polvo o en comprimidos. A demas es un elemento natural ya que se puede observar su presencia en la mayoria de alimentos carnicos como carne de res, salmon, atun e incluso lacteos y es igualmente producida por el cuerpo.",
      "Obtencion":
          "Es creada a partir de sintesis quimica usando como matrias primas el sarcosinato y la cianamida, es uno de los metodos mas extendidos ya que es el asegura las GMP (Good Manufacturing Practice).",
      "Funcion":
          "La que esta hace en tu cuerpo es proporcionarte una mayor energia a los musculos (consumir preferenmente antes de cada entrenamiento) de cara al ejercicio y por ende generar una menor fatiga durante las largas sesiones. se recomienda consumirla cada dia en las mismas cantidades, en cuanto a cantidad la mayoria de expertos estan de acuerdo en base a la masa corporal, por ejemplo una persona de 70kg deberia consumir solo 7 gramos de creatina al dia, para alguien de 120 kilos, serian 12 gramos diarios. Aunque no tiene que ser exacto, pero si algo constante para notar sus efectos.",
      "Ventajas":
          "\n-Es un suplemento barato y se toma tiempo en acabar (500 gramos rondan 12 - 16 euros)."
              "\n-Combate la fatiga y cansancio muscular durante las sesiones."
              "\n-Ayuda a mejorar la memoria"
              "\n-Reduce el riesgo de lesiones"
              "\n-Beneficios para la salud osea"
              "\n-Contribuye a la hidratacion y regeneracion de la piel",
      "Moraleja":
          "Es un suplemento que se puede tomar durante todo el año, pero se recomienda hacer descansos de 1 mes cada 3 meses para que el cuerpo no se acostumbre a su consumo y no pierda efectividad."
    },
    {
      "Sustancia":
          "Este es un suplemento conocido que puede ser consumido en cápsulas. Es un producto natural que se obtiene principalmente de la aleta de tiburón y de su espina o esqueleto.",
      "Obtencion":
          "Se obtiene directamente del tejido cartilaginoso del animal, una vez obtenida la materia prima posteriormente es secado y micropulverizado.",
      "Funcion":
          "Ayuda sobretodo en ciertos deportes donde el desgaste de las articulaciones es mayor, como por ejemplo el running donde las articulaciones de la rodilla sufren mas, o motociclistas donde por sus posturas y a veces las heridas que estos sufren ayudandoles a regenerar esa piel o tejido cartilaginoso aunque tambien se puede aplicar al ambito del gimnasio sobre todo a la hora de realizacion en ejercicios de fuerza o peso pesado las articulaciones en algunos casos pueden verse tambien afectadas.",
      "Ventajas": "-Aporte proteico. Los cartilagos tambien incluyen en gran porcentaje proteinas"
          "\n-Ayuda a prevenir lesiones en las zonas criticas donde hay articulaciones (rodillas, tobillos....)"
          "\n-Tiene propiedades antiinflamarias para las articulaciones."
          "\n-Gran aliado contra la osteoporosis."
          "\n-Incluso previene el glaucoma al recudir la presion ocular."
          "\n-Gran cantidad de colageno muy beneficioso para la piel, ayuda en la recuperacion del tejido en heridas.",
      "Moraleja":
          "Importante SIEMPRE combinar el uso de este suplemento con la realizacion de ejercicio en la que haya bastante carga articular."
    },
    {
      "Sustancia":
          "Estos son suplementos muy conocidos que pueden ser consumidos en cápsulas, polvos o incluso a través de alimentos ricos en proteínas. Son los componentes básicos de las proteínas y se obtienen principalmente de fuentes de proteínas como la carne, los huevos y los productos lácteos.",
      "Obtencion":
          "Los aminoácidos se obtienen a través de la descomposición de las proteínas en los alimentos que consumimos. Una vez que las proteínas se descomponen en aminoácidos, estos se utilizan para construir nuevas proteínas en nuestro cuerpo.",
      "Funcion":
          "Los aminoácidos son esenciales para la construcción y reparación de tejidos, incluyendo el tejido muscular. Son especialmente útiles para aquellos que realizan entrenamientos de fuerza o resistencia, ya que pueden ayudar a mejorar la recuperación muscular y reducir la fatiga.",
      "Ventajas": "\n-Ayudan a la recuperación muscular después del ejercicio."
          "\n-Reducen la fatiga y mejoran el rendimiento deportivo."
          "\n-Pueden ayudar a prevenir la pérdida de masa muscular durante la dieta."
          "\n-Pueden ser beneficiosos para la salud del corazón y la función cerebral."
          "\n-Pueden ayudar a mejorar la salud de la piel, el cabello y las uñas.",
      "Moraleja":
          "Es importante combinar SIEMPRE el uso de los aminoacidos con la realizacion de ejercicio para obtener los mejores resultados."
    }
  ];

  List trainings = [
    {
      "Parrafo 1":
          "En el caso de querer seguir un entrenamiento basado en el ambito de resistencia, es decir, gran cantidad de repeticiones por serie (generalmente a partir de 12) lo mas adecuado es una dieta en la cual se mantenga o supere ligeramente el consumo de calorias necesarias por dia, en el caso de un sujeto el cual su consumo sean 2500 kilocalorias, nos tendriamos que atener a un consumo de 2500 a 2700 kilocalorias. Son entrenamientos que van de la mano de rutinas de definicion.",
      "Parrafo 2":
          "Son entrenamientos donde al buscarse la resistencia es importante considerar el peso ya que buscamos resistir el maximo tiempo posible y donde algunas ocasiones deberemos mover nuestro propio peso, cuanto menor sea este menor la cantidad de esfuerzo y energia para moverlo. Aqui el consumo de grasa debera ser mas moderado pero siempre equilibrado ya que nos evitara la aparicion de lesiones donde podemos obtenerla en forma natural o complementos los cuales pueden ser un gran aliado.",
    },
    {
      "Parrafo 1":
          "En el caso de seguir un entrenamiento basado en fuerza, es decir, mover una gran cantidad de kilos durante el rango de 6 - 8 repeticiones por serie lo mejor y basado en mi experiencia personal es seguir una dieta en alto contenido calorico, si por ejemplo nuestro consumo diario recomendado esta en las 3000 kilocalorias, en este caso podria decirse que nuestro consumo deberia basarse en unas 3300 - 3500 kilocalorias.",
      "Parrafo 2":
          "Ya que siempre la fuerza es bueno que este acompañada de una rutina en volumen, que es donde habra un aporte extra de nutricion y por ende energico a demas de un mayor consumo en cuanto a grasas que tambien es otra ayuda y de cara a la evasion de lesiones. Tambien puede ser un gran aliado el uso de suplementos (tambien hay un apartado donde se tratan)."
    },
    {
      "Parrafo 1":
          "En el caso de querer seguir un entrenamiento basado en la flexibilidad, es decir, mejorar la capacidad de tus articulaciones para moverse en un rango completo de movimiento, lo más adecuado es una dieta equilibrada que incluya suficientes proteínas para la reparación y crecimiento muscular, y suficientes vitaminas y minerales para apoyar la salud ósea y articular. Por ejemplo, si tu consumo diario recomendado es de 2000 kilocalorías, podrías mantener ese nivel de consumo.",
      "Parrafo 2":
          "Los entrenamientos de flexibilidad a menudo implican una serie de estiramientos y movimientos que pueden ser mejorados con un peso corporal más ligero. Aquí, el consumo de grasa debería ser moderado y equilibrado, ya que un exceso de grasa corporal puede limitar la flexibilidad. Los suplementos como los ácidos grasos omega-3 pueden ser beneficiosos para la salud de las articulaciones."
    },
  ];

  List getSuplements() {
    return suplements;
  }

  List getTrainings() {
    return trainings;
  }
}
