// Copyright (c) 2018 The Cedicoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#include <qt/cedicoin.h>

#include <util/translation.h>

#include <QCoreApplication>

#include <functional>
#include <string>

/** Translate string to current locale using Qt. */
extern const std::function<std::string(const char*)> G_TRANSLATION_FUN = [](const char* psz) {
    return QCoreApplication::translate("cedicoin-core", psz).toStdString();
};

int main(int argc, char* argv[]) { return GuiMain(argc, argv); }
