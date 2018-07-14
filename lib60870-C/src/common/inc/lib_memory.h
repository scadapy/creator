/*
 *  Copyright 2016 MZ Automation GmbH
 *
 *  This file is part of lib60870-C
 *
 *  lib60870-C is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  lib60870-C is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with lib60870-C.  If not, see <http://www.gnu.org/licenses/>.
 *
 *  See COPYING file for the complete license text.
 */

#ifndef MEMORY_H_
#define MEMORY_H_

#define CALLOC(nmemb, size) Memory_calloc(nmemb, size)
#define MALLOC(size)        Memory_malloc(size)
#define REALLOC(oldptr, size)   Memory_realloc(oldptr, size)
#define FREEMEM(ptr)        Memory_free(ptr)

#define GLOBAL_CALLOC(nmemb, size) Memory_calloc(nmemb, size)
#define GLOBAL_MALLOC(size)        Memory_malloc(size)
#define GLOBAL_REALLOC(oldptr, size)   Memory_realloc(oldptr, size)
#define GLOBAL_FREEMEM(ptr)        Memory_free(ptr)

#ifdef __cplusplus
extern "C" {
#endif

#include <stdlib.h>

typedef void
(*MemoryExceptionHandler) (void* parameter);

void
Memory_installExceptionHandler(MemoryExceptionHandler handler, void* parameter);

void*
Memory_malloc(size_t size);

void*
Memory_calloc(size_t nmemb, size_t size);

void *
Memory_realloc(void *ptr, size_t size);

void
Memory_free(void* memb);

#ifdef __cplusplus
}
#endif

#endif /* MEMORY_H_ */
