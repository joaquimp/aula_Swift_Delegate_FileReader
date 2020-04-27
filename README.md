# Material da teoria

Acesse o material da teoria [aqui](Protocols.pdf).

## Desafio Delegate

Desenvolva um pacote utilizando Swift Package Manager que faz uso do padrão delegate para fornecer leitura de um arquivo XML no estilo SAX, veja  figura a seguir:

![imagem](img/parser.png)

Você deve implementar o SAX Parse, o input é uma String contendo um documento XML, para isso este projeto já fornece a maneira de ler um arquivo XML de exemplo.

O seu parser deve permitir o registro de um delegate que irá receber as mensagens:

- ``startDocumento()`` - invocado quando inicia-se a leitura do arquivo
- ``startElement()``- invocado toda vez que acha um novo elemento, por exemplo: ``<CATALOG>``, ``<CD>``, etc
- ``characters()``- invocado quando encontra texto, por exemplo: ``Empire Burlesque``, ``Bob Dylan``, etc
- ``endElement()`` - invocado quando encontra o fechamento de um elemento, por exemplo: ``<\CATALOG>``, ``<\CD>``, etc
- ``endDocument()`` - invocado quando o documento termina
