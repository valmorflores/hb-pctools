# hb-pctools
Project like PcTools - File manager write in harbour

O reconhecimento de voz funciona através de uma chamada ao serviço de reconhecimento de voz da IBM.
Crie sua conta gratuitamente no site da IBM ou pesquise por https://cloud.ibm.com/

Você deve copiar o arquivo config.default.ch para config.ch
Depois ajuste as configuração com seus dados / conta:

**config.ch**


`#define IBM_API_KEY "0000000000-uJxxxxxxxxxxx-xxxxxxxxxxxxxx-00xx"
#define IBM_URL     "https://api.us-south.speech-to-text.watson.cloud.ibm.com/instances/xxxxxxxx-yyyy-xxxx-xxxx-xxxxyyyyyyyy/v1/"
`

Feito isso, basta ter o Harbour instalado no seu Linux e compilar. 
A compilação está no arquivo compila.sh - Em windows basta fazer algo similar compila.bat

Todo: Fazer API busar internamente ai inves de usar curl

Todo: Fazer aplicativo gravar o som ao inves de usar um software externo de gravação.

Vou melhorando este app para ficar com as características do PCTools e suas funcionalidades
Espero que curtam. Valeu!

Video 1 do youtube sobre este software:
https://www.youtube.com/watch?v=vzWEp6REs-g&t=17s

