# 📋 Comentários do Projeto - `challenge-dev-flutter`

## Arquitetura limpa com MVVM
  A aplicação foi estruturada utilizando a arquitetura **MVVM (Model-View-ViewModel)**, uma abordagem recomendada pela documentação do Flutter que promove a separação de responsabilidades e melhora a testabilidade do código.

A organização do projeto seguiu a seguinte estrutura:
- **UI (View):** Responsável pela interface com o usuário. É composta pelas `Screens` (telas da aplicação) e por `Widgets` reutilizáveis que são compartilhados entre as telas. Esta camada reage às mudanças de estado gerenciadas pelos `ViewModels`.
- **Camada de Dados (Data):** Contém os `Services`, responsáveis pela comunicação com fontes de dados externas (como a API), e os `Repositories`, que abstraem a origem dos dados para o resto da aplicação.
- **Camada de Domínio (Domain):** Abriga as `Entities` (modelos de negócio puros) e os `DTOs` (Data Transfer Objects), que definem os contratos de dados para a comunicação entre as camadas.

## Uso de bibliotecas
  As dependências escolhidas são todas recomendadas oficialmente ou amplamente utilizadas na comunidade Flutter:
  - `go_router` para navegação moderna e declarativa.
  - `provider` para injeção de dependência leve e gerenciamento de estado.
  - `intl` e `mask_text_input_formatter` para formatação de datas/input mask.
  - `http` para requisições em APIs.

## Cobertura funcional completa
  Todas as funcionalidades propostas no desafio foram implementadas corretamente.

## Melhorias sugeridas (caso tivesse mais tempo)

1. **Cobertura de testes**  
   - Adicionar testes unitários e de widget para garantir a estabilidade da aplicação.  
   - Cobrir `ViewModel`, `Service` e `Repository`.

2. **Gerenciamento de tema mais centralizado**  
   - Criar um arquivo `theme.dart` para consolidar estilos (cores, fontes, etc).  
   - Aplicar `ThemeData` customizado para reforçar a consistência visual.

3. **Implementação de autenticação**  
   - Adicionar login/logout e controle de acesso nas rotas com `go_router`.

4. **Melhorias na experiência do usuário**  
   - Implementar busca (caso a API suporte).  
   - Exibir loaders durante requisições (alguns já foram aplicados corretamente).  

5. **Persistência local (cache)**  
   - Utilizar `shared_preferences` ou `hive` para salvar alunos offline.  
   - Isso melhoraria a performance e experiência offline.

6. **Finalização da Floating Action Bar**  
   - Implementar os outros botões da Floating Action Bar.

## Flutter
- **Flutter Version:** Flutter 3.32.7 • channel stable
- **Dart SDK:** Dart SDK version: 3.8.1 (stable)