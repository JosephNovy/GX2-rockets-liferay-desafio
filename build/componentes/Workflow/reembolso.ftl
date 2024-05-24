<?xml version="1.0"?>

<workflow-definition
	xmlns="urn:liferay.com:liferay-workflow_7.4.0"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="urn:liferay.com:liferay-workflow_7.4.0 http://www.liferay.com/dtd/liferay-workflow-definition_7_4_0.xsd"
>
	<version>55</version>
	<state>
		<name>d411c8f8-5102-4f58-99a7-ccf4d3eedd5b</name>
		<description>Begin a workflow.</description>
		<metadata>
			<![CDATA[
				{
					"xy": [
						-343,
						221.9999771118164
					]
				}
			]]>
		</metadata>
		<actions>
			<action>
				<name>pedido de reembolso criado</name>
				<description></description>
				<status>1</status>
				<priority>1</priority>
				<execution-type>onExit</execution-type>
			</action>
			<notification>
				<name>Pedido de reembolso realizado</name>
				<description>
					<![CDATA[]]>
				</description>
				<template>
					<![CDATA[Pedido de reembolso]]>
				</template>
				<template-language>text</template-language>
				<notification-type>email</notification-type>
				<notification-type>user-notification</notification-type>
				<recipients receptionType="to">
					<user />
				</recipients>
				<execution-type>onEntry</execution-type>
			</notification>
		</actions>
		<initial>true</initial>
		<labels>
			<label language-id="en_US">
				pedido de Reembolso criado
			</label>
		</labels>
		<transitions>
			<transition>
				<labels>
					<label language-id="en_US">
						Pedido de reembolso criado
					</label>
				</labels>
				<name>475f4504-5c1d-4d22-8ef3-39af9a76c519</name>
				<target>4b84bc77-f96a-428e-ac51-da245fb1bc4d</target>
				<default>true</default>
			</transition>
		</transitions>
	</state>
	<state>
		<name>f5dc8597-3447-4004-94a4-feb6d64e71c0</name>
		<description>Reembolso realizado e processado pelo financeiro</description>
		<metadata>
			<![CDATA[
				{
					"xy": [
						1047,
						210.9999771118164
					],
					"terminal": true
				}
			]]>
		</metadata>
		<actions>
			<action>
				<name>reembolso realizado</name>
				<description></description>
				<status>0</status>
				<priority>1</priority>
				<execution-type>onEntry</execution-type>
			</action>
			<notification>
				<name>Reembolso realizado</name>
				<description>
					<![CDATA[]]>
				</description>
				<template>
					<![CDATA[${userName} seu pedido de reembolso foi aceito e realizado pela parte financeira da empresa]]>
				</template>
				<template-language>freemarker</template-language>
				<notification-type>email</notification-type>
				<notification-type>user-notification</notification-type>
				<recipients receptionType="to">
					<user />
				</recipients>
				<execution-type>onEntry</execution-type>
			</notification>
		</actions>
		<labels>
			<label language-id="en_US">
				Reembolso realizado
			</label>
		</labels>
	</state>
	<state>
		<name>47c69098-8ae1-4a61-807c-b120aa9485e7</name>
		<description>Pedido de reembolso negado.</description>
		<metadata>
			<![CDATA[
				{
					"xy": [
						37.991455078125,
						299.4460220336914
					],
					"terminal": true
				}
			]]>
		</metadata>
		<actions>
			<action>
				<name>Recusa de reembolso</name>
				<description></description>
				<status>4</status>
				<priority>1</priority>
				<execution-type>onEntry</execution-type>
			</action>
			<notification>
				<name>Reembolso negado .</name>
				<description>
					<![CDATA[]]>
				</description>
				<template>
					<![CDATA[${userName} seu reembolso foi negado]]>
				</template>
				<template-language>freemarker</template-language>
				<notification-type>email</notification-type>
				<notification-type>user-notification</notification-type>
				<recipients receptionType="to">
					<user />
				</recipients>
				<execution-type>onEntry</execution-type>
			</notification>
		</actions>
		<labels>
			<label language-id="en_US">
				pedido de Reembolso negado
			</label>
		</labels>
	</state>
	<task>
		<name>4b84bc77-f96a-428e-ac51-da245fb1bc4d</name>
		<description>Pedido de reembolso realizado e aguardando analise pelo gerente</description>
		<metadata>
			<![CDATA[
				{
					"xy": [
						78.991455078125,
						-28.923301696777344
					]
				}
			]]>
		</metadata>
		<actions>
			<action>
				<name>Aceitar reembolso - gerente</name>
				<description></description>
				<status>1</status>
				<priority>1</priority>
				<execution-type>onAssignment</execution-type>
			</action>
			<action>
				<name>Recusar reembolso - gerente</name>
				<description></description>
				<status>4</status>
				<priority>1</priority>
				<execution-type>onAssignment</execution-type>
			</action>
			<notification>
				<name>Pedido de reembolso</name>
				<description>
					<![CDATA[]]>
				</description>
				<template>
					<![CDATA[Um pedido de reembolso foi realizado]]>
				</template>
				<template-language>freemarker</template-language>
				<notification-type>email</notification-type>
				<notification-type>user-notification</notification-type>
				<recipients receptionType="to">
					<roles>
						<role>
							<role-id>42918</role-id>
						</role>
					</roles>
				</recipients>
				<execution-type>onAssignment</execution-type>
			</notification>
		</actions>
		<assignments>
			<roles>
				<role>
					<role-id>42918</role-id>
				</role>
			</roles>
		</assignments>
		<labels>
			<label language-id="en_US">
				Analise do Gerente
			</label>
		</labels>
		<transitions>
			<transition>
				<labels>
					<label language-id="en_US">
						Aceitar reembolso - gerente
					</label>
				</labels>
				<name>8a5956a9-bdec-4865-bdb2-8c9d3b7d53dc</name>
				<target>06107017-ba03-4011-a5cb-f6896725eab6</target>
				<default>true</default>
			</transition>
			<transition>
				<labels>
					<label language-id="en_US">
						Pedido de reembolso negado
					</label>
				</labels>
				<name>00d7f51e-1180-4d84-8835-9ee894d7037d</name>
				<target>47c69098-8ae1-4a61-807c-b120aa9485e7</target>
				<default>false</default>
			</transition>
		</transitions>
	</task>
	<task>
		<name>06107017-ba03-4011-a5cb-f6896725eab6</name>
		<description>Reembolso aceito pelo gerente e esperando analise pelo diretor</description>
		<metadata>
			<![CDATA[
				{
					"xy": [
						488.9913330078125,
						264.2968215942383
					]
				}
			]]>
		</metadata>
		<actions>
			<action>
				<name>Aceitar reembolso - diretor</name>
				<description></description>
				<status>0</status>
				<priority>1</priority>
				<execution-type>onAssignment</execution-type>
			</action>
			<action>
				<name>Recusar reembolso - diretor</name>
				<description></description>
				<status>4</status>
				<priority>1</priority>
				<execution-type>onAssignment</execution-type>
			</action>
			<notification>
				<name>Pedido de reembolso aceito pelo gerente</name>
				<description>
					<![CDATA[]]>
				</description>
				<template>
					<![CDATA[O Gerente aceitou um pedido reembolso]]>
				</template>
				<template-language>freemarker</template-language>
				<notification-type>email</notification-type>
				<notification-type>user-notification</notification-type>
				<recipients receptionType="to">
					<roles>
						<role>
							<role-id>20101</role-id>
						</role>
					</roles>
				</recipients>
				<execution-type>onAssignment</execution-type>
			</notification>
		</actions>
		<assignments>
			<roles>
				<role>
					<role-id>20101</role-id>
				</role>
			</roles>
		</assignments>
		<labels>
			<label language-id="en_US">
				Analise Diretor
			</label>
		</labels>
		<transitions>
			<transition>
				<labels>
					<label language-id="en_US">
						Aceitar reembolso - diretor
					</label>
				</labels>
				<name>4ae16171-598a-4f04-ae4c-42b23d7ce7b8</name>
				<target>35218745-6c4c-4204-a5a6-ccca70644f75</target>
				<default>true</default>
			</transition>
			<transition>
				<labels>
					<label language-id="en_US">
						Pedido de reembolso negado
					</label>
				</labels>
				<name>6dc560df-4587-41b7-8d54-632344b6dcd6</name>
				<target>47c69098-8ae1-4a61-807c-b120aa9485e7</target>
				<default>false</default>
			</transition>
		</transitions>
	</task>
	<task>
		<name>35218745-6c4c-4204-a5a6-ccca70644f75</name>
		<description>Reembolso aceito e esperando processamento pelo financeiro</description>
		<metadata>
			<![CDATA[
				{
					"xy": [
						675.991455078125,
						29.296859741210938
					]
				}
			]]>
		</metadata>
		<actions>
			<action>
				<name>Efetuar reembolso</name>
				<description></description>
				<status>0</status>
				<priority>1</priority>
				<execution-type>onAssignment</execution-type>
			</action>
			<notification>
				<name>Pedido de reembolso aceito pelo diretor</name>
				<description>
					<![CDATA[]]>
				</description>
				<template>
					<![CDATA[Diretor aceitou um pedido de reembolso]]>
				</template>
				<template-language>freemarker</template-language>
				<notification-type>email</notification-type>
				<notification-type>user-notification</notification-type>
				<recipients receptionType="to">
					<roles>
						<role>
							<role-id>20111</role-id>
						</role>
					</roles>
				</recipients>
				<execution-type>onAssignment</execution-type>
			</notification>
		</actions>
		<assignments>
			<roles>
				<role>
					<role-id>20111</role-id>
				</role>
			</roles>
		</assignments>
		<labels>
			<label language-id="en_US">
				Financeito
			</label>
		</labels>
		<transitions>
			<transition>
				<labels>
					<label language-id="en_US">
						efetuar reembolso
					</label>
				</labels>
				<name>79b513d0-56d6-43bd-9e4a-555f60693fa9</name>
				<target>f5dc8597-3447-4004-94a4-feb6d64e71c0</target>
				<default>true</default>
			</transition>
		</transitions>
	</task>
</workflow-definition>