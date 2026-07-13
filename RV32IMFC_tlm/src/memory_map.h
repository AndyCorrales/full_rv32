#ifndef MEMORY_MAP_H
#define MEMORY_MAP_H

#include <cstdint>

// Mapa de direcciones GLOBAL del sistema. El Bus decodifica contra estos
// rangos para rutear cada transaccion TLM al target correspondiente.
namespace memory_map {

constexpr uint32_t RAM_BASE = 0x00000000;
constexpr uint32_t RAM_SIZE = 64 * 1024; // 64KB

// Rango reservado para la futura unidad vectorial (RVV). Por ahora la
// VectorUnit solo actua como INITIATOR hacia la RAM (loads/stores vle/vse);
// este rango se deja reservado para el dia en que la VectorUnit tambien
// exponga registros de estado/control mapeados en memoria (ej. vcsr, vl)
// como TARGET en el Bus.
constexpr uint32_t RVV_BASE = 0x10000000;
constexpr uint32_t RVV_SIZE = 64 * 1024; // 64KB

} // namespace memory_map

#endif // MEMORY_MAP_H
