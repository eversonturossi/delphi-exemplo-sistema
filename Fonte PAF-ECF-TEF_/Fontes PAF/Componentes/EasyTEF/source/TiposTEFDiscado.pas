{*******************************************************************************
  Autor......: EasyTEF Team - 03/01/2008
  Objetivo...: Arquivo de tipos do Delphi para os valores predefinidos do TEF
               Discado.
  Comentários:
  Alterações.:
*******************************************************************************}

unit TiposTEFDiscado;

interface

uses
  Classes, SysUtils, Graphics;

type
  // tipos enumerados
  TTipoGerenciador = (tgGerenciadorPadrao, tgPayGo, tgTecBan, tgHipercard,
    tgBanrisul);

  TMetodoECF = (tmeSubTotal, tmeIniciarFechamentoCupom, tmeEfetuarFormaPgto,
    tmeEfetuarFormaPgtoDescForma, tmeTerminarFechamentoCupom);

  TTipoTef = (ttNone, ttGpAtivo, ttAdministrativa, ttCheque, ttCartao,
    ttCancelamento, ttConfirmacao, ttNaoConfirmacao, ttPagamentos);
    
  // eventos
  TOnImprimirCupomECF = procedure (imagemCupomTef: TStrings;
    var impressaoOk: Boolean) of object;
  TOnMensagemOperador = procedure (msg: string) of object;
  TOnOperacaoECFOk = procedure (var operacaoECFOk: Boolean) of object;
  TOnValorPersonalizadoReq = procedure (var campo, valor: string) of object;
  TOnTratamentoECFOk = procedure (var operacaoECFOk: Boolean;
    params: array of string; var retorno: string) of object;
  TOnAbrirComprovanteNaoFiscalVinculado = procedure (var operacaoECFOk: Boolean;
    valorCupom: string) of object;
  TOnGerarIdentificador = procedure (var identificacao: Integer) of object;

  //exceções personalizadas
  EGPInativo = class(Exception);

  //classes

  TBotaoOKConfig = class(TPersistent)
  private
    Flargura: Integer;
    Faltura: Integer;
    procedure Setaltura(const Value: Integer);
    procedure Setlargura(const Value: Integer);

    procedure iniciarVariaveis;
  public
    constructor Create;
  published
    property altura: Integer read Faltura write Setaltura default 40;
    property largura: Integer read Flargura write Setlargura default 110;
  end;

  TFormMsgOperadorConfig = class(TPersistent)
  private
    Flargura: Integer;
    Faltura: Integer;
    Ffont: TFont;
    FbotaoOK: TBotaoOKConfig;
    procedure Setaltura(const Value: Integer);
    procedure Setfont(const Value: TFont);
    procedure Setlargura(const Value: Integer);
    procedure SetbotaoOK(const Value: TBotaoOKConfig);

    procedure iniciarVariaveis;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property altura: Integer read Faltura write Setaltura default 185;
    property largura: Integer read Flargura write Setlargura default 500;
    property font: TFont read Ffont write Setfont;
    property botaoOK: TBotaoOKConfig read FbotaoOK write SetbotaoOK;
  end;

implementation

uses SobreFrmTEF;

{ TFormMsgOperadorConfig }

constructor TFormMsgOperadorConfig.Create;
begin
  inherited Create;
  iniciarVariaveis;
end;

destructor TFormMsgOperadorConfig.Destroy;
begin
  FbotaoOK.Free;
  Ffont.Free;
  inherited;
end;

procedure TFormMsgOperadorConfig.iniciarVariaveis;
begin
  Ffont := TFont.Create;
  FbotaoOK := TBotaoOKConfig.Create;
  Flargura := 500;
  Faltura := 185;
end;

procedure TFormMsgOperadorConfig.Setaltura(const Value: Integer);
begin
  Faltura := Value;
end;

procedure TFormMsgOperadorConfig.SetbotaoOK(const Value: TBotaoOKConfig);
begin
  FbotaoOK.Assign(Value);
end;

procedure TFormMsgOperadorConfig.Setfont(const Value: TFont);
begin
  Ffont.Assign(Value);
end;

procedure TFormMsgOperadorConfig.Setlargura(const Value: Integer);
begin
  Flargura := Value;
end;

{ TBotaoOKConfig }

constructor TBotaoOKConfig.Create;
begin
  inherited Create;
  iniciarVariaveis;  
end;

procedure TBotaoOKConfig.iniciarVariaveis;
begin
  Faltura := 40;
  Flargura := 110;
end;

procedure TBotaoOKConfig.Setaltura(const Value: Integer);
begin
  Faltura := Value;
end;

procedure TBotaoOKConfig.Setlargura(const Value: Integer);
begin
  Flargura := Value;
end;

end.
