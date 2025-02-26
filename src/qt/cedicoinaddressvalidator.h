// Copyright (c) 2011-2014 The Cedicoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef CEDICOIN_QT_CEDICOINADDRESSVALIDATOR_H
#define CEDICOIN_QT_CEDICOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class CedicoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit CedicoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Cedicoin address widget validator, checks for a valid cedicoin address.
 */
class CedicoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit CedicoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // CEDICOIN_QT_CEDICOINADDRESSVALIDATOR_H
