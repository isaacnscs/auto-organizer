# Auto-organizer
___Um script simples para deixar suas pastas organizadas___

---
## Comportamento
Por enquanto, essa é uma aplicação simples do comando `mv` junto a caracteres coringa, como visto no trecho abaixo:
```sh
 pictures='*.jpg *.png'
 mv -n $pictures ~/Pictures
```
> Nesse exemplo, serão movidos todos arquivos com extensão* `.jpg .png` *para pasta padrão de imagens* `~/Pictures`.
A flag `-n` indica para não sobreescrever arquivos já existentes

---

## Compatibilidade

Esse script foi escrito a partir de um sistema baseado no **Ubuntu**, então deve funcionar em distribuições com base no mesmo ou no **Debian**.

## Instalação

Auto-organizer não precisa de nada complexo, apenas baixe o arquivo .sh e faa os passos abaixo

1. Para baixar, execute o comando: 
```sh
curl https://raw.githubusercontent.com/isaacnscs/auto-organizer/main/auto-organizer.sh > auto-organizer.sh
```
*Nesse caso, é o mesmo que abrir o arquivo.sh > RAW > salvar como)*

3. Navegue até o diretório onde o arquivo foi baixado
```sh
cd ~/Downloads
```
3. Dê permissão para ser executado
```sh
chmod +x auto-organizer.sh
```
4. Opcional: para poder usar o script a partir de qualquer pasta no terminal (caso contrário, você vai precisar adicionar o caminho toda vez que for usar):
```sh
sudo mv auto-organizer.sh /usr/bin
```
Ou tudo de uma vez:
```sh
curl https://raw.githubusercontent.com/isaacnscs/auto-organizer/main/auto-organizer.sh > auto-organizer.sh && chmod +x ~/Downloads/auto-organizer.sh && sudo mv auto-organizer.sh /usr/bin
```

---
## Uso
**A pasta padrão para o script atuar é `~/Downloads`** sempre que você sentir que seus "Downloads" estão uma bagunça, basta chamar o script pelo terminal
```sh
auto-organizer
```
Se você pulou a parte 3 da instação, ou não quis fazê-lo, para executar o script é necessário digitar o caminho completo:
```sh
~/Downloads/auto-organizer.sh
```
Para organizar outras pastas é só adicionar o caminho logo a seguir
```sh
$ auto-organizer ~/pasta/pasta-exemplo
```
---
## Personalização
###### Primeiro é necessário editar o script. (Abra o arquivo para mais detalhes sobre funcionamento)
* Você vai precisar de permissão para editar `sudo vi ~/usr/bin/auto-organizer.sh` nesse caso estamo usando o `vi`, mas pode ser qualquer outro editor de texto compatível, como o `nano`
* Se você pulou a parte 3 da instalação (não moveu para /usr/bin), **basta usar um editor de texto qualquer**

##### Adicionar extenções
Por exemplo, para que arquivos com a extensão `.raw` também sejam movidos para a pasta `~/Pictures`, basta adiconar `*.raw` dentro da variável local `pictures`
```sh
local pictures='*.jpeg *.jpg *.png *.gif'         # Sem o *.raw
local pictures='*.jpeg *.jpg *.png *.gif *.raw'   # Com o *.raw
```
**IMPORTANTE:** Todas extensões tem que estar dentro de `´` (aspas), separadas por um espaço e seguindo a mesma sintaxe acima para que funcionem corretamente; O nome das variáveis também não podem se repetir ~~(até podem, mas isso é uma outra conversa)~~.

##### Adiconar caminhos personalizados
Caso não queira que algum conjunto de arquivos não sejam movidos para as pastas padrão, basta mudar o caminho dentro da função. **Mas tenha certeza que o caminho de destino EXISTE**.
```sh
 mv -n $pictures ~/Pictures                  # Caminho padrão
 mv -n $pictures ~/Documents/Imagens         # Caminho personaliazdo
```
##### Adiconar extensões e caminhos personalizados
Aqui entra um pouco de conhecimento em bash; se quiser usar seu próprio conjunto de extensões é preciso criar uma variavél e adicionar o comando personalizado, **desde que as extensões não existam em outras variáveis**. Nesse caso, basta apagar onde se repete.

###### Exemplo 1: Mover arquivos de uma extensão para um caminho específico
```sh
local minha_variavel_raw='*.raw'                 
mv -n $minha_variavel_raw ~/Pictures/raw         # Caminho personaliazdo, a pasta raw deve existir
```
###### Exemplo 2: Será necessário remover `*.mp4 *.jpeg *.gif` da variável $pictures

```sh
local minha_variavel='*.jpeg *.raw *.mp4 *.gif'                 
mv -n $minha_variavel ~/Documents/Imagens/pasta-qualquer         # Caminho personaliazdo
```
---
## Recursos futuros
- Implementar um algoritmo para, ao mover os arquivos, renomear, caso já exista um com mesmo nome e extensão na pasta destino;
- Opção de inserir o caminho destino já na *chamada* do script;
- Opção de organizar os arquivos em subpastas, de arcordo com a extensão;
- Ler os arquivos **recursivamente** entre pastas e subpastas e ogarnizar; Imagine ter que organizar um backup pessoal, fotos, videos, documentos, manualmente; com essa solução tudo isso é feito de forma automatizada;
- Compatibilidade com Windows ou aquivo .bat

---
## Desenvolvimento
Toda contribuição será bem-vinda, basta fazer um *Pull Request* ou abrir uma *issue*


> Nota: No momento sou iniciante, e entre outras coisas, o desenvolvimento desse projeto não é minha MAIOR prioridade. 
Aglumas coisas podem demorar mais que o esperado, espero que compreendam.
