CREATE OR ALTER VIEW VIEW_ACOMPANHAMENTO(
    ID,
    SOLICITACAO,
    ID_ETAPA,
    ETAPA,
    OBSERVACAO,
    DATA)
AS
select A.ID, S.ID SOLICITACAO, A.ETAPA ID_ETAPA, E.NOME ETAPA, A.observacao, A.DATA
from TB_ACOMPANHAMENTO A
join TB_ETAPA E on A.ETAPA = E.ID
join TB_SOLICITACAO S on A.SOLICITACAO = S.ID
join TB_CLIENTE C on S.CLIENTE = C.ID
order by A.ID asc;

