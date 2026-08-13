# Каталог rollout проектных overlay

Снимок: 2026-08-13, после проверки пилота. Этот Markdown — единственный канонический rollout-реестр; параллельный JSON/YAML-реестр не используется.

## Состояния

- `complete` — обязательный КАРКАС присутствует и validator проходит.
- `pilot` — repository выбран для текущего ограниченного rollout.
- `incomplete` — самостоятельный чистый Git-root, но обязательный overlay неполон.
- `blocked` — изменение запрещено до устранения точного blocker.

## Фактический inventory `projects/*`

| Repository | Lifecycle | Git-ready | Overlay-state | Blocker | Следующее действие |
|---|---|---:|---|---|---|
| `ai-mix` | active | да, clean | incomplete | — | выполнить отдельный gap analysis после текущей очереди |
| `dune-rts` | candidate | нет | blocked | `not-git-root` | отдельно решить создание или восстановление Git-root |
| `electro-tutor` | active | да, clean | incomplete | — | **следующий rollout-кандидат после пилота** |
| `math-morph` | active | нет, dirty | blocked | `dirty-worktree` | дождаться завершения или разделения текущих изменений |
| `monte-carlo` | active | да, clean | incomplete | — | оставить в очереди после следующего кандидата |
| `OffScreenCanvas` | active | да, rollout-ветка | complete | — | сохранить как первый проверенный пилот; product stage выполнять отдельно |
| `receipt-scanner-ua` | active | да, clean | incomplete | `stale-compatibility` | актуализировать compatibility audit перед rollout |
| `server` | active | да, clean | incomplete | — | провести gap analysis в последующей волне |
| `Task_21.07_Svelte` | active | да, clean | incomplete | — | провести gap analysis локальной automation |
| `text-recognition-core` | reference | да, clean | complete | — | сохранять как эталон validator |
| `toemath` | active | да, clean | incomplete | — | оставить в очереди |
| `video-chronicle` | active | да, clean | incomplete | отсутствуют `docs/AI_PLAN.md` и `specs/system.spec.md` | выполнить отдельный gap analysis после текущей очереди |
| `wifi-share` | active | да, clean | incomplete | — | оставить в очереди |

## Текущий допуск

Пилот `OffScreenCanvas` успешно проходит read-only validator; runtime-код не изменён. Единственный эталон, независимо прошедший ту же проверку, — `text-recognition-core`.

Ровно один следующий кандидат — `electro-tutor`, если новый read-only снимок не выявит `dirty-worktree`, `not-git-root` или необходимость менять runtime-код. В таком случае rollout останавливается и blocker фиксируется здесь до выбора другого repository.
