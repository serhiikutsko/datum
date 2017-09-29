<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright (c) 2016-2017 Zerocracy

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to read
the Software only. Permissions is hereby NOT GRANTED to use, copy, modify,
merge, publish, distribute, sublicense, and/or sell copies of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="1.0">
  <xsl:include href="../../templates.xsl"/>
  <xsl:template match="/reminders">
    <html lang="en">
      <body>
        <section>
          <h1>Reminders</h1>
          <p>
            This is the full list of reminders in current project.
          </p>
          <xsl:for-each select="order">
            <h3>
              <xsl:value-of select="@job"/>
            </h3>
            <table>
              <thead>
                <tr>
                  <th>
                    <xsl:text>Reminder</xsl:text>
                  </th>
                  <th>
                    <xsl:text>for</xsl:text>
                  </th>
                </tr>
              </thead>
              <tbody>
                <xsl:apply-templates select="reminder">
                  <xsl:sort select="created" order="descending" data-type="text"/>
                </xsl:apply-templates>
              </tbody>
            </table>
          </xsl:for-each>
        </section>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="reminder">
    <tr>
      <td>
        <xsl:value-of select="label"/>
      </td>
      <td>
        <xsl:value-of select="login"/>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
