/*
 *  cs101_master_connection.c
 *
 *  Copyright 2017 MZ Automation GmbH
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

#include "iec60870_slave.h"

void
IMasterConnection_sendASDU(IMasterConnection self, CS101_ASDU asdu)
{
    self->sendASDU(self, asdu);
}

void
IMasterConnection_sendACT_CON(IMasterConnection self, CS101_ASDU asdu, bool negative)
{
    self->sendACT_CON(self, asdu, negative);
}

void
IMasterConnection_sendACT_TERM(IMasterConnection self, CS101_ASDU asdu)
{
    self->sendACT_TERM(self, asdu);
}

CS101_AppLayerParameters
IMasterConnection_getApplicationLayerParameters(IMasterConnection self)
{
    return self->getApplicationLayerParameters(self);
}
