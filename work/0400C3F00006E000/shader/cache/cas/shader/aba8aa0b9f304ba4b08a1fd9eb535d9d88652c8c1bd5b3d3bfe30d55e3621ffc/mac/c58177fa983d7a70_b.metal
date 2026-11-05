#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c15 [[id(5)]];
    constant _16* vp_c16 [[id(6)]];
};

struct main0_out
{
    float4 m_53 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_49 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_51 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_34 [[attribute(2)]];
    float4 m_39 [[attribute(3)]];
    float4 m_59 [[attribute(5)]];
    float4 m_43 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
    float4 m_45 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _933 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_34.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_84);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    if (!_88)
    {
        out.m_37.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _94 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1323 = as_type<float>(_100);
        out.gl_Position.z = _1323;
    }
    if (!_88)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _104 = in.m_39.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_114)
    {
        float _120 = float(_84);
        _92 = _120;
    }
    float _122 = _92;
    bool _124 = _118 >= _122;
    bool _126 = !_114;
    bool _128 = _124 || _126;
    float _130 = _122;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_37.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _102 = as_type<int>(_134);
    }
    int _136 = _102;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1392 = as_type<float>(_136);
        out.gl_Position.z = _1392;
    }
    if (_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_39.x;
    float _140 = in.m_39.y;
    float _142 = in.m_39.z;
    float _144 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_34.x;
    float _158 = in.m_34.y;
    float _160 = in.m_34.z;
    float _162 = in.m_41.x;
    float _164 = in.m_41.y;
    float _166 = in.m_41.z;
    float _168 = in.m_41.w;
    float _170 = 0.0;
    float _172 = _144;
    if (!_154)
    {
        float _174 = _144 * _144;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_154)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_154;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _144 * _192;
        float _202 = exp2(_200);
        float _204 = _198 * 0.693147182464599609375;
        float _206 = 1.0 / _204;
        float _208 = 1.0 / _196;
        float _210 = _202 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _206, _144);
        float _216 = _214 * _208;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_154;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _144 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    float _246 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = in.m_43.x;
    float _254 = fma(_244, _140, _246);
    float _256 = fma(_244, _138, _248);
    float _258 = fma(_244, _142, _250);
    float _260 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = fma(_254, _168, _158);
    float _264 = fma(_256, _168, _156);
    float _266 = fma(_258, _168, _160);
    float _268 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _270 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _272 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _274 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _276 = _268 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _278 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _270);
    float _280 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _272);
    float _282 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _274);
    float _284 = in.m_45.x;
    float _286 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _278);
    float _288 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _280);
    float _290 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _282);
    float _292 = in.m_45.y;
    float _294 = _286 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _296 = _288 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _298 = _290 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _300 = in.m_43.y;
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _304 = _294 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _308 = _296 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _312 = _298 + _310;
    float _314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _316 = _304 * _304;
    float _318 = fma(_308, _308, _316);
    float _320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _322 = fma(_312, _312, _318);
    float _324 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _326 = _324 * _252;
    float _328 = sqrt(_322);
    bool _330 = _300 > 0.5;
    float _332 = rsqrt(_322);
    float _334 = trunc(_326);
    int _336 = int(_334);
    float _338 = _328 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _340 = precise::min(_276, _338);
    float _342 = _304 * _332;
    float _344 = _308 * _332;
    out.m_47.w = _340;
    float _346 = _342 * _340;
    int _348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _350 = _348 != 0;
    float _352 = -_344;
    float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[18].w, _308);
    int _356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _358 = _356 != 0;
    float _360 = _344 * _340;
    int _362 = _336 << 4;
    int _364 = _362 + 1712;
    float _366 = -_342;
    float _368 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    bool _370 = _252 > 0.5;
    bool _372 = _370 && _350;
    float _374 = -_346;
    float _376 = _304 + _374;
    uint _379 = uint(int(uint(_364) >> uint(2)));
    uint _381 = uint(int(uint(int(_379)) >> uint(2)));
    int _383 = int(_379) & 3;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[int(_381)][_383];
    int _387 = int(_379) + 1;
    uint _389 = uint(int(uint(_387) >> uint(2)));
    int _391 = _387 & 3;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[int(_389)][_391];
    float _395 = _368 * _368;
    float _397 = -_360;
    float _399 = _308 + _397;
    float _401 = fma(_354, _354, _395);
    float _403 = _312 * _332;
    float _405 = _376 * _376;
    int _407 = _364 + 8;
    uint _409 = uint(int(uint(_407) >> uint(2)));
    uint _411 = uint(int(uint(int(_409)) >> uint(2)));
    int _413 = int(_409) & 3;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[int(_411)][_413];
    float _417 = -_292;
    float _419 = _417 + 1.0;
    float _421 = -_403;
    float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[18].w, _312);
    float _425 = _403 * _340;
    float _427 = fma(_399, _399, _405);
    float _429 = fma(_423, _423, _401);
    float _431 = _423;
    float _433 = _292;
    if (_350)
    {
        _431 = _284;
    }
    float _435 = _431;
    float _437 = -_425;
    float _439 = _312 + _437;
    float _441 = _435;
    float _443 = _439;
    if (_358)
    {
        float _445 = _330 ? _419 : _292;
        _433 = _445;
    }
    float _447 = _433;
    if (_372)
    {
        float _449 = -_435;
        float _451 = _449 + 1.0;
        _441 = _451;
    }
    float _453 = _441;
    float _455 = fma(_439, _439, _427);
    if (!_350)
    {
        _443 = _284;
    }
    float _457 = _443;
    float _459 = sqrt(_429);
    float _461 = _447 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _463 = _457;
    if (_350)
    {
        _463 = _453;
    }
    float _465 = _463;
    float _467 = _304 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _469 = _461 * _314;
    float _471 = fma(_308, (*spvDescriptorSet0.vp_c8)._m0[28].x, _467);
    float _473 = sqrt(_455);
    float _475 = _465 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _477 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[28].z, _471);
    float _479 = _475 * _320;
    out.m_49.x = 1.0;
    out.m_49.y = 1.0;
    out.m_49.z = 1.0;
    bool _481 = _477 >= 0.0;
    float _483 = _332 * _459;
    out.m_51.x = _479;
    out.m_51.y = _469;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _487 = _332 * _473;
    float _489 = _385 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _491 = _393 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _495 = _487 * _483;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[123].x;
    if (_481)
    {
        _499 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _501 = _499;
    float _503 = _415 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _507 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _509 = _497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _511 = as_type<int>(_501);
    if (_481)
    {
        float _513 = _501 * 5.0;
        _511 = as_type<int>(_513);
    }
    int _515 = _511;
    float _517 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _519 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _521 = _503 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _523 = _505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = _268 * _495;
    if (_481)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2045 = as_type<float>(_515);
        out.gl_Position.z = _2045;
    }
    out.m_53.x = _517;
    out.m_53.y = _519;
    out.m_53.z = _521;
    out.m_53.w = _485;
    out.m_55.x = _507;
    out.m_55.y = _509;
    out.m_55.z = _523;
    if (_481)
    {
        out.m_37.x = 0.0;
    }
    out.m_57.x = _525;
    if (_481)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _527 = -_342;
    float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[18].w, _294);
    float _531 = -_344;
    float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[18].w, _296);
    float _535 = -_403;
    float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[18].w, _298);
    float _539 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _541 = _529 + _539;
    float _543 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _545 = _533 + _543;
    float _547 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _549 = _537 + _547;
    float _551 = _541 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _553 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[28].x, _551);
    float _555 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[28].z, _553);
    bool _557 = _555 >= 0.0;
    float _559 = _549;
    if (_557)
    {
        _559 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _561 = _559;
    int _563 = as_type<int>(_561);
    if (_557)
    {
        out.m_37.x = 0.0;
    }
    if (_557)
    {
        float _565 = _561 * 5.0;
        _563 = as_type<int>(_565);
    }
    int _567 = _563;
    if (_557)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2152 = as_type<float>(_567);
        out.gl_Position.z = _2152;
    }
    if (_557)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _569 = in.m_59.x;
    float _571 = in.m_59.y;
    float _573 = in.m_59.z;
    float _575 = _166 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _577 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _579 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _577;
    float _581 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _583 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _585 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _583;
    float _587 = _579 * _579;
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _591 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _589;
    float _593 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _595 = fma(_585, _585, _587);
    float _597 = _593 * _495;
    float _599 = fma(_591, _591, _595);
    float _601 = _575 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _603 = sqrt(_599);
    float _605 = _601 * _495;
    float _607 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _609 = precise::clamp(_607, 0.0, 1.0);
    float _611 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _571);
    float _613 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _573);
    float _615 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _569);
    float _617 = rsqrt(_599);
    float _619 = _597 * _611;
    float _621 = _605 * _613;
    float _623 = _525 * _615;
    float _625 = _619 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _627 = _619 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _629 = _619 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _631 = _603 * 0.066666670143604278564453125;
    float _633 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[25].x, _625);
    float _635 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[24].x, _627);
    float _637 = fma(_609, -0.64999997615814208984375, 1.0);
    float _639 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[26].x, _629);
    float _641 = precise::max(_631, 1.0);
    float _643 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[25].z, _633);
    float _645 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[24].z, _635);
    float _647 = _617 * (-0.20000000298023223876953125);
    float _649 = precise::min(_641, 2.0);
    float _651 = _643 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _653 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[26].z, _639);
    float _655 = fma(_579, _647, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _657 = fma(_585, _647, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _659 = _649 * _637;
    float _661 = _645 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _663 = _294 + _651;
    float _665 = -_655;
    float _667 = _665 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _669 = _653 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _671 = _296 + _661;
    float _673 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _675 = _663 + _673;
    float _677 = -_657;
    float _679 = _677 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _681 = _667 * _667;
    float _683 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _685 = _671 + _683;
    float _687 = fma(_675, _659, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _689 = _298 + _669;
    float _691 = fma(_679, _679, _681);
    float _693 = fma(_685, _659, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _695 = -_687;
    float _697 = _695 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _699 = fma(_591, _647, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _701 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _703 = _689 + _701;
    float _705 = -_693;
    float _707 = _705 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _709 = _697 * _697;
    float _711 = -_699;
    float _713 = _711 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _715 = fma(_703, _659, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _717 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _719 = _657 + _717;
    float _721 = fma(_707, _707, _709);
    float _723 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _725 = _655 + _723;
    float _727 = fma(_713, _713, _691);
    float _729 = -_715;
    float _731 = _729 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _735 = _699 + _733;
    float _737 = _725 * _725;
    float _739 = fma(_731, _731, _721);
    float _741 = sqrt(_727);
    float _743 = fma(_719, _719, _737);
    float _745 = fma(_735, _735, _743);
    float _747 = sqrt(_739);
    float _749 = rsqrt(_745);
    float _751 = -_741;
    float _753 = _747 + _751;
    float _755 = _749 * _753;
    float _757 = -_755;
    float _759 = fma(_735, _757, _715);
    float _761 = -_755;
    float _763 = fma(_719, _761, _693);
    float _765 = -_755;
    float _767 = fma(_725, _765, _687);
    float _769 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _771 = _759 + _769;
    float _773 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _775 = _763 + _773;
    float _777 = _771 * _771;
    float _779 = fma(_775, _775, _777);
    float _781 = sqrt(_779);
    bool _783 = _781 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _785 = _687;
    float _787 = _755;
    float _789 = _763;
    if (!_783)
    {
        _785 = _759;
    }
    float _791 = _785;
    float _793 = _791;
    if (!_783)
    {
        _787 = _767;
    }
    float _795 = _787;
    bool _797 = !_783;
    float _799 = _795;
    if (!_797)
    {
        float _801 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _803 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _805 = _781 + _803;
        float _807 = rsqrt(_779);
        float _809 = _805 * _801;
        float _811 = _767 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _813 = _809 * 0.15915493667125701904296875;
        float _815 = _813 * 6.283185482025146484375;
        float _817 = cos(_815);
        float _819 = _813 * 6.283185482025146484375;
        float _821 = sin(_819);
        float _823 = _817 + (-1.0);
        float _825 = _823 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _827 = fma(_821, _811, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _829 = fma(_767, _817, _825);
        float _831 = _807 * _827;
        float _833 = fma(_775, _831, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _835 = fma(_771, _831, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _799 = _829;
        _789 = _833;
        _793 = _835;
    }
    float _837 = _799;
    float _839 = _789;
    float _841 = _793;
    float _843 = -_346;
    float _845 = _843 + _837;
    float _847 = -_360;
    float _849 = _847 + _839;
    float _851 = -_425;
    float _853 = _851 + _841;
    out.m_53.x = _517;
    out.m_53.y = _519;
    out.m_53.z = _521;
    out.m_53.w = _485;
    float _855 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _857 = _845 + _855;
    float _859 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _861 = _849 + _859;
    out.m_55.x = _507;
    out.m_55.y = _509;
    out.m_55.z = _523;
    float _863 = _857 * _857;
    float _865 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _867 = _853 + _865;
    float _869 = -_360;
    float _871 = _296 + _869;
    float _873 = -_346;
    float _875 = _294 + _873;
    float _877 = fma(_861, _861, _863);
    float _879 = -_425;
    float _881 = _298 + _879;
    float _883 = fma(_867, _867, _877);
    float _885 = sqrt(_883);
    bool _887 = _885 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _889 = isnan(_885);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _895 = _891 || _893;
    float _897 = _877;
    if (!_895)
    {
        _897 = 1.0;
    }
    float _899 = _897;
    bool _901 = !_895;
    float _903 = _899;
    if (!_901)
    {
        bool _905 = _885 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _907 = isnan(_885);
        bool _909 = _905 || _907;
        bool _911 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _913 = _909 || _911;
        if (!_913)
        {
            float _915 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _917 = _885 + _915;
            float _919 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _921 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _919;
            float _923 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _925 = _923 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _927 = 1.0 / _921;
            float _929 = _917 * _927;
            float _931 = fma(_929, _925, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _903 = _931;
            _933 = true;
        }
        else
        {
            bool _935 = _885 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _937 = isnan(_885);
            bool _939 = _935 || _937;
            bool _941 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _943 = _939 || _941;
            if (!_943)
            {
                float _945 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _947 = _885 + _945;
                float _949 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _951 = _949 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _953 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _955 = _953 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _957 = 1.0 / _951;
                float _959 = _947 * _957;
                float _961 = fma(_959, _955, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _903 = _961;
                _933 = true;
            }
            else
            {
                _903 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _933 = false;
    float _963 = _903;
    float _965 = -_342;
    float _967 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[18].w, _875);
    float _969 = -_344;
    float _971 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[18].w, _871);
    float _973 = -_403;
    float _975 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _881);
    float _977 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _979 = _845 + _977;
    float _981 = _967 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _983 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _985 = _853 + _983;
    float _987 = fma(_979, _963, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _989 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[11].x, _981);
    out.m_61.x = _971;
    out.m_61.y = _967;
    out.m_61.z = _975;
    float _991 = -_342;
    float _993 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[18].w, _987);
    float _995 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[11].z, _989);
    float _997 = _967 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _999 = _995 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1001 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[10].x, _997);
    float _1003 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1005 = _849 + _1003;
    float _1007 = 1.0 / _999;
    float _1009 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1001);
    float _1011 = _993 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1013 = _1009 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1015 = _1013 + _999;
    float _1017 = fma(_1005, _963, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1019 = fma(_985, _963, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1021 = -_403;
    float _1023 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1019);
    float _1025 = _1015 * _1007;
    float _1027 = _1025 * 0.5;
    float _1029 = -_344;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1017);
    float _1033 = _993 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1035 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1037 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1035);
    float _1039 = _993 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1041 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1033);
    bool _1043 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.5);
    bool _1051 = _1047 || _1049;
    float _1053 = _993 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1055 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1039);
    float _1057 = 1.0 / _1037;
    float _1059 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1041);
    float _1061 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1053);
    float _1063 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1055);
    float _1065 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1011);
    float _1067 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1069 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1061);
    float _1071 = _1063 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1073 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1065);
    float _1075 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1077 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1079 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1081 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1083 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1075);
    float _1085 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1077);
    float _1087 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1079);
    float _1089 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1081);
    float _1091 = _1071;
    float _1093 = _1075;
    if (_1051)
    {
        _1091 = 1.0;
    }
    float _1095 = _1091;
    float _1097 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1099 = _1095;
    if (_1051)
    {
        _1093 = 1.0;
    }
    float _1101 = _1093;
    float _1103 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1105 = _1057 * _1103;
    float _1107 = _1101;
    if (!_1051)
    {
        float _1109 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1111 = _1109 * 0.15915493667125701904296875;
        float _1113 = _1111 * 6.283185482025146484375;
        float _1115 = cos(_1113);
        float _1117 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1119 = _1117 * 0.15915493667125701904296875;
        float _1121 = _1111 * 6.283185482025146484375;
        float _1123 = sin(_1121);
        float _1125 = 1.0 / _1115;
        float _1127 = _1119 * 6.283185482025146484375;
        float _1129 = cos(_1127);
        float _1131 = _1123 * _1125;
        float _1133 = _1119 * 6.283185482025146484375;
        float _1135 = sin(_1133);
        float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1139 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1137;
        float _1141 = _1129 * _1131;
        float _1143 = 1.0 / _1139;
        float _1145 = 1.0 / _1141;
        float _1147 = _1135 * _1145;
        float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1151 = fma(_1105, _1147, _1149);
        float _1153 = _1151 * _1143;
        float _1155 = precise::clamp(_1153, 0.0, 1.0);
        _1099 = _1155;
    }
    float _1157 = _1099;
    if (!_1051)
    {
        float _1159 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1161 = _1159 * 0.15915493667125701904296875;
        float _1163 = _1161 * 6.283185482025146484375;
        float _1165 = cos(_1163);
        float _1167 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1169 = _1167 * 0.15915493667125701904296875;
        float _1171 = _1161 * 6.283185482025146484375;
        float _1173 = sin(_1171);
        float _1175 = 1.0 / _1165;
        float _1177 = _1169 * 6.283185482025146484375;
        float _1179 = cos(_1177);
        float _1181 = _1173 * _1175;
        float _1183 = _1169 * 6.283185482025146484375;
        float _1185 = sin(_1183);
        float _1187 = _1179 * _1181;
        float _1189 = 1.0 / _1187;
        float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1193 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1191;
        float _1195 = 1.0 / _1193;
        float _1197 = _1185 * _1189;
        float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1201 = fma(_1105, _1197, _1199);
        float _1203 = _1201 * _1195;
        float _1205 = precise::clamp(_1203, 0.0, 1.0);
        float _1207 = -_1205;
        float _1209 = _1207 + 1.0;
        _1107 = _1209;
    }
    float _1211 = _1107;
    float _1213 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1215 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1083);
    float _1217 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1087);
    float _1219 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1089);
    bool _1221 = _1157 > 0.0;
    bool _1223 = isnan(_1157);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan(0.0);
    bool _1229 = _1225 || _1227;
    float _1231 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1085);
    float _1233 = _1157 * _1211;
    float _1235 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1215);
    float _1237 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1219);
    float _1239 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1217);
    bool _1241 = _1211 <= 0.0;
    bool _1243 = !_1229;
    bool _1245 = _1241 || _1243;
    float _1247 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1231);
    float _1249 = _1235 + _1237;
    float _1251 = _1239 + _1237;
    float _1253 = _1237 * 0.5;
    float _1255 = _1233 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1257 = _1249 * 0.5;
    float _1259 = _1251 * 0.5;
    float _1261 = fma(_1247, -0.5, _1253);
    float _1263 = _1255 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _1031;
    out.m_63.y = _993;
    out.m_63.z = _1023;
    out.gl_Position.x = _1235;
    out.gl_Position.y = _1247;
    out.gl_Position.z = _1239;
    out.gl_Position.w = _1237;
    out.m_65.x = _1257;
    out.m_65.y = _1261;
    out.m_65.z = _1259;
    out.m_65.w = _1237;
    out.m_37.x = _1263;
    if (!_1245)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_37.x = 0.0;
    float _1265 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1265;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _933 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_34.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_84);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    if (!_88)
    {
        out.m_37.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _94 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1323 = as_type<float>(_100);
        out.gl_Position.z = _1323;
    }
    if (!_88)
    {
        return out;
    }
    float _104 = in.m_39.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_114)
    {
        float _120 = float(_84);
        _92 = _120;
    }
    float _122 = _92;
    bool _124 = _118 >= _122;
    bool _126 = !_114;
    bool _128 = _124 || _126;
    float _130 = _122;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_37.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _102 = as_type<int>(_134);
    }
    int _136 = _102;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1392 = as_type<float>(_136);
        out.gl_Position.z = _1392;
    }
    if (_128)
    {
        return out;
    }
    float _138 = in.m_39.x;
    float _140 = in.m_39.y;
    float _142 = in.m_39.z;
    float _144 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_34.x;
    float _158 = in.m_34.y;
    float _160 = in.m_34.z;
    float _162 = in.m_41.x;
    float _164 = in.m_41.y;
    float _166 = in.m_41.z;
    float _168 = in.m_41.w;
    float _170 = 0.0;
    float _172 = _144;
    if (!_154)
    {
        float _174 = _144 * _144;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_154)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_154;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _144 * _192;
        float _202 = exp2(_200);
        float _204 = _198 * 0.693147182464599609375;
        float _206 = 1.0 / _204;
        float _208 = 1.0 / _196;
        float _210 = _202 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _206, _144);
        float _216 = _214 * _208;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_154;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _144 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    float _246 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = in.m_43.x;
    float _254 = fma(_244, _140, _246);
    float _256 = fma(_244, _138, _248);
    float _258 = fma(_244, _142, _250);
    float _260 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = fma(_254, _168, _158);
    float _264 = fma(_256, _168, _156);
    float _266 = fma(_258, _168, _160);
    float _268 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _270 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _272 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _274 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _276 = _268 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _278 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _270);
    float _280 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _272);
    float _282 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _274);
    float _284 = in.m_45.x;
    float _286 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _278);
    float _288 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _280);
    float _290 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _282);
    float _292 = in.m_45.y;
    float _294 = _286 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _296 = _288 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _298 = _290 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _300 = in.m_43.y;
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _304 = _294 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _308 = _296 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _312 = _298 + _310;
    float _314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _316 = _304 * _304;
    float _318 = fma(_308, _308, _316);
    float _320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _322 = fma(_312, _312, _318);
    float _324 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _326 = _324 * _252;
    float _328 = sqrt(_322);
    bool _330 = _300 > 0.5;
    float _332 = rsqrt(_322);
    float _334 = trunc(_326);
    int _336 = int(_334);
    float _338 = _328 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _340 = precise::min(_276, _338);
    float _342 = _304 * _332;
    float _344 = _308 * _332;
    out.m_47.w = _340;
    float _346 = _342 * _340;
    int _348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _350 = _348 != 0;
    float _352 = -_344;
    float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[18].w, _308);
    int _356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _358 = _356 != 0;
    float _360 = _344 * _340;
    int _362 = _336 << 4;
    int _364 = _362 + 1712;
    float _366 = -_342;
    float _368 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    bool _370 = _252 > 0.5;
    bool _372 = _370 && _350;
    float _374 = -_346;
    float _376 = _304 + _374;
    uint _379 = uint(int(uint(_364) >> uint(2)));
    uint _381 = uint(int(uint(int(_379)) >> uint(2)));
    int _383 = int(_379) & 3;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[int(_381)][_383];
    int _387 = int(_379) + 1;
    uint _389 = uint(int(uint(_387) >> uint(2)));
    int _391 = _387 & 3;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[int(_389)][_391];
    float _395 = _368 * _368;
    float _397 = -_360;
    float _399 = _308 + _397;
    float _401 = fma(_354, _354, _395);
    float _403 = _312 * _332;
    float _405 = _376 * _376;
    int _407 = _364 + 8;
    uint _409 = uint(int(uint(_407) >> uint(2)));
    uint _411 = uint(int(uint(int(_409)) >> uint(2)));
    int _413 = int(_409) & 3;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[int(_411)][_413];
    float _417 = -_292;
    float _419 = _417 + 1.0;
    float _421 = -_403;
    float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[18].w, _312);
    float _425 = _403 * _340;
    float _427 = fma(_399, _399, _405);
    float _429 = fma(_423, _423, _401);
    float _431 = _423;
    float _433 = _292;
    if (_350)
    {
        _431 = _284;
    }
    float _435 = _431;
    float _437 = -_425;
    float _439 = _312 + _437;
    float _441 = _435;
    float _443 = _439;
    if (_358)
    {
        float _445 = _330 ? _419 : _292;
        _433 = _445;
    }
    float _447 = _433;
    if (_372)
    {
        float _449 = -_435;
        float _451 = _449 + 1.0;
        _441 = _451;
    }
    float _453 = _441;
    float _455 = fma(_439, _439, _427);
    if (!_350)
    {
        _443 = _284;
    }
    float _457 = _443;
    float _459 = sqrt(_429);
    float _461 = _447 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _463 = _457;
    if (_350)
    {
        _463 = _453;
    }
    float _465 = _463;
    float _467 = _304 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _469 = _461 * _314;
    float _471 = fma(_308, (*spvDescriptorSet0.vp_c8)._m0[28].x, _467);
    float _473 = sqrt(_455);
    float _475 = _465 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _477 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[28].z, _471);
    float _479 = _475 * _320;
    out.m_49.x = 1.0;
    out.m_49.y = 1.0;
    out.m_49.z = 1.0;
    bool _481 = _477 >= 0.0;
    float _483 = _332 * _459;
    out.m_51.x = _479;
    out.m_51.y = _469;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _487 = _332 * _473;
    float _489 = _385 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _491 = _393 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _495 = _487 * _483;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[123].x;
    if (_481)
    {
        _499 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _501 = _499;
    float _503 = _415 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _507 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _509 = _497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _511 = as_type<int>(_501);
    if (_481)
    {
        float _513 = _501 * 5.0;
        _511 = as_type<int>(_513);
    }
    int _515 = _511;
    float _517 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _519 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _521 = _503 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _523 = _505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = _268 * _495;
    if (_481)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2045 = as_type<float>(_515);
        out.gl_Position.z = _2045;
    }
    out.m_53.x = _517;
    out.m_53.y = _519;
    out.m_53.z = _521;
    out.m_53.w = _485;
    out.m_55.x = _507;
    out.m_55.y = _509;
    out.m_55.z = _523;
    if (_481)
    {
        out.m_37.x = 0.0;
    }
    out.m_57.x = _525;
    if (_481)
    {
        return out;
    }
    float _527 = -_342;
    float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[18].w, _294);
    float _531 = -_344;
    float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[18].w, _296);
    float _535 = -_403;
    float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[18].w, _298);
    float _539 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _541 = _529 + _539;
    float _543 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _545 = _533 + _543;
    float _547 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _549 = _537 + _547;
    float _551 = _541 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _553 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[28].x, _551);
    float _555 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[28].z, _553);
    bool _557 = _555 >= 0.0;
    float _559 = _549;
    if (_557)
    {
        _559 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _561 = _559;
    int _563 = as_type<int>(_561);
    if (_557)
    {
        out.m_37.x = 0.0;
    }
    if (_557)
    {
        float _565 = _561 * 5.0;
        _563 = as_type<int>(_565);
    }
    int _567 = _563;
    if (_557)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2152 = as_type<float>(_567);
        out.gl_Position.z = _2152;
    }
    if (_557)
    {
        return out;
    }
    float _569 = in.m_59.x;
    float _571 = in.m_59.y;
    float _573 = in.m_59.z;
    float _575 = _166 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _577 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _579 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _577;
    float _581 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _583 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _585 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _583;
    float _587 = _579 * _579;
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _591 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _589;
    float _593 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _595 = fma(_585, _585, _587);
    float _597 = _593 * _495;
    float _599 = fma(_591, _591, _595);
    float _601 = _575 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _603 = sqrt(_599);
    float _605 = _601 * _495;
    float _607 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _609 = precise::clamp(_607, 0.0, 1.0);
    float _611 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _571);
    float _613 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _573);
    float _615 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _569);
    float _617 = rsqrt(_599);
    float _619 = _597 * _611;
    float _621 = _605 * _613;
    float _623 = _525 * _615;
    float _625 = _619 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _627 = _619 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _629 = _619 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _631 = _603 * 0.066666670143604278564453125;
    float _633 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[25].x, _625);
    float _635 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[24].x, _627);
    float _637 = fma(_609, -0.64999997615814208984375, 1.0);
    float _639 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[26].x, _629);
    float _641 = precise::max(_631, 1.0);
    float _643 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[25].z, _633);
    float _645 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[24].z, _635);
    float _647 = _617 * (-0.20000000298023223876953125);
    float _649 = precise::min(_641, 2.0);
    float _651 = _643 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _653 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[26].z, _639);
    float _655 = fma(_579, _647, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _657 = fma(_585, _647, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _659 = _649 * _637;
    float _661 = _645 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _663 = _294 + _651;
    float _665 = -_655;
    float _667 = _665 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _669 = _653 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _671 = _296 + _661;
    float _673 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _675 = _663 + _673;
    float _677 = -_657;
    float _679 = _677 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _681 = _667 * _667;
    float _683 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _685 = _671 + _683;
    float _687 = fma(_675, _659, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _689 = _298 + _669;
    float _691 = fma(_679, _679, _681);
    float _693 = fma(_685, _659, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _695 = -_687;
    float _697 = _695 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _699 = fma(_591, _647, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _701 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _703 = _689 + _701;
    float _705 = -_693;
    float _707 = _705 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _709 = _697 * _697;
    float _711 = -_699;
    float _713 = _711 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _715 = fma(_703, _659, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _717 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _719 = _657 + _717;
    float _721 = fma(_707, _707, _709);
    float _723 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _725 = _655 + _723;
    float _727 = fma(_713, _713, _691);
    float _729 = -_715;
    float _731 = _729 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _735 = _699 + _733;
    float _737 = _725 * _725;
    float _739 = fma(_731, _731, _721);
    float _741 = sqrt(_727);
    float _743 = fma(_719, _719, _737);
    float _745 = fma(_735, _735, _743);
    float _747 = sqrt(_739);
    float _749 = rsqrt(_745);
    float _751 = -_741;
    float _753 = _747 + _751;
    float _755 = _749 * _753;
    float _757 = -_755;
    float _759 = fma(_735, _757, _715);
    float _761 = -_755;
    float _763 = fma(_719, _761, _693);
    float _765 = -_755;
    float _767 = fma(_725, _765, _687);
    float _769 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _771 = _759 + _769;
    float _773 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _775 = _763 + _773;
    float _777 = _771 * _771;
    float _779 = fma(_775, _775, _777);
    float _781 = sqrt(_779);
    bool _783 = _781 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _785 = _687;
    float _787 = _755;
    float _789 = _763;
    if (!_783)
    {
        _785 = _759;
    }
    float _791 = _785;
    float _793 = _791;
    if (!_783)
    {
        _787 = _767;
    }
    float _795 = _787;
    bool _797 = !_783;
    float _799 = _795;
    if (!_797)
    {
        float _801 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _803 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _805 = _781 + _803;
        float _807 = rsqrt(_779);
        float _809 = _805 * _801;
        float _811 = _767 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _813 = _809 * 0.15915493667125701904296875;
        float _815 = _813 * 6.283185482025146484375;
        float _817 = cos(_815);
        float _819 = _813 * 6.283185482025146484375;
        float _821 = sin(_819);
        float _823 = _817 + (-1.0);
        float _825 = _823 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _827 = fma(_821, _811, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _829 = fma(_767, _817, _825);
        float _831 = _807 * _827;
        float _833 = fma(_775, _831, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _835 = fma(_771, _831, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _799 = _829;
        _789 = _833;
        _793 = _835;
    }
    float _837 = _799;
    float _839 = _789;
    float _841 = _793;
    float _843 = -_346;
    float _845 = _843 + _837;
    float _847 = -_360;
    float _849 = _847 + _839;
    float _851 = -_425;
    float _853 = _851 + _841;
    out.m_53.x = _517;
    out.m_53.y = _519;
    out.m_53.z = _521;
    out.m_53.w = _485;
    float _855 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _857 = _845 + _855;
    float _859 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _861 = _849 + _859;
    out.m_55.x = _507;
    out.m_55.y = _509;
    out.m_55.z = _523;
    float _863 = _857 * _857;
    float _865 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _867 = _853 + _865;
    float _869 = -_360;
    float _871 = _296 + _869;
    float _873 = -_346;
    float _875 = _294 + _873;
    float _877 = fma(_861, _861, _863);
    float _879 = -_425;
    float _881 = _298 + _879;
    float _883 = fma(_867, _867, _877);
    float _885 = sqrt(_883);
    bool _887 = _885 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _889 = isnan(_885);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _895 = _891 || _893;
    float _897 = _877;
    if (!_895)
    {
        _897 = 1.0;
    }
    float _899 = _897;
    bool _901 = !_895;
    float _903 = _899;
    if (!_901)
    {
        bool _905 = _885 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _907 = isnan(_885);
        bool _909 = _905 || _907;
        bool _911 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _913 = _909 || _911;
        if (!_913)
        {
            float _915 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _917 = _885 + _915;
            float _919 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _921 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _919;
            float _923 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _925 = _923 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _927 = 1.0 / _921;
            float _929 = _917 * _927;
            float _931 = fma(_929, _925, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _903 = _931;
            _933 = true;
        }
        else
        {
            bool _935 = _885 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _937 = isnan(_885);
            bool _939 = _935 || _937;
            bool _941 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _943 = _939 || _941;
            if (!_943)
            {
                float _945 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _947 = _885 + _945;
                float _949 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _951 = _949 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _953 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _955 = _953 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _957 = 1.0 / _951;
                float _959 = _947 * _957;
                float _961 = fma(_959, _955, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _903 = _961;
                _933 = true;
            }
            else
            {
                _903 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _933 = false;
    float _963 = _903;
    float _965 = -_342;
    float _967 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[18].w, _875);
    float _969 = -_344;
    float _971 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[18].w, _871);
    float _973 = -_403;
    float _975 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _881);
    float _977 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _979 = _845 + _977;
    float _981 = _967 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _983 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _985 = _853 + _983;
    float _987 = fma(_979, _963, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _989 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[11].x, _981);
    out.m_61.x = _971;
    out.m_61.y = _967;
    out.m_61.z = _975;
    float _991 = -_342;
    float _993 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[18].w, _987);
    float _995 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[11].z, _989);
    float _997 = _967 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _999 = _995 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1001 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[10].x, _997);
    float _1003 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1005 = _849 + _1003;
    float _1007 = 1.0 / _999;
    float _1009 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1001);
    float _1011 = _993 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1013 = _1009 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1015 = _1013 + _999;
    float _1017 = fma(_1005, _963, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1019 = fma(_985, _963, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1021 = -_403;
    float _1023 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1019);
    float _1025 = _1015 * _1007;
    float _1027 = _1025 * 0.5;
    float _1029 = -_344;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1017);
    float _1033 = _993 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1035 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1037 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1035);
    float _1039 = _993 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1041 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1033);
    bool _1043 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.5);
    bool _1051 = _1047 || _1049;
    float _1053 = _993 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1055 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1039);
    float _1057 = 1.0 / _1037;
    float _1059 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1041);
    float _1061 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1053);
    float _1063 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1055);
    float _1065 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1011);
    float _1067 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1069 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1061);
    float _1071 = _1063 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1073 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1065);
    float _1075 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1077 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1079 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1081 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1083 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1075);
    float _1085 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1077);
    float _1087 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1079);
    float _1089 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1081);
    float _1091 = _1071;
    float _1093 = _1075;
    if (_1051)
    {
        _1091 = 1.0;
    }
    float _1095 = _1091;
    float _1097 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1099 = _1095;
    if (_1051)
    {
        _1093 = 1.0;
    }
    float _1101 = _1093;
    float _1103 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1105 = _1057 * _1103;
    float _1107 = _1101;
    if (!_1051)
    {
        float _1109 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1111 = _1109 * 0.15915493667125701904296875;
        float _1113 = _1111 * 6.283185482025146484375;
        float _1115 = cos(_1113);
        float _1117 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1119 = _1117 * 0.15915493667125701904296875;
        float _1121 = _1111 * 6.283185482025146484375;
        float _1123 = sin(_1121);
        float _1125 = 1.0 / _1115;
        float _1127 = _1119 * 6.283185482025146484375;
        float _1129 = cos(_1127);
        float _1131 = _1123 * _1125;
        float _1133 = _1119 * 6.283185482025146484375;
        float _1135 = sin(_1133);
        float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1139 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1137;
        float _1141 = _1129 * _1131;
        float _1143 = 1.0 / _1139;
        float _1145 = 1.0 / _1141;
        float _1147 = _1135 * _1145;
        float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1151 = fma(_1105, _1147, _1149);
        float _1153 = _1151 * _1143;
        float _1155 = precise::clamp(_1153, 0.0, 1.0);
        _1099 = _1155;
    }
    float _1157 = _1099;
    if (!_1051)
    {
        float _1159 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1161 = _1159 * 0.15915493667125701904296875;
        float _1163 = _1161 * 6.283185482025146484375;
        float _1165 = cos(_1163);
        float _1167 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1169 = _1167 * 0.15915493667125701904296875;
        float _1171 = _1161 * 6.283185482025146484375;
        float _1173 = sin(_1171);
        float _1175 = 1.0 / _1165;
        float _1177 = _1169 * 6.283185482025146484375;
        float _1179 = cos(_1177);
        float _1181 = _1173 * _1175;
        float _1183 = _1169 * 6.283185482025146484375;
        float _1185 = sin(_1183);
        float _1187 = _1179 * _1181;
        float _1189 = 1.0 / _1187;
        float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1193 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1191;
        float _1195 = 1.0 / _1193;
        float _1197 = _1185 * _1189;
        float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1201 = fma(_1105, _1197, _1199);
        float _1203 = _1201 * _1195;
        float _1205 = precise::clamp(_1203, 0.0, 1.0);
        float _1207 = -_1205;
        float _1209 = _1207 + 1.0;
        _1107 = _1209;
    }
    float _1211 = _1107;
    float _1213 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1215 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1083);
    float _1217 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1087);
    float _1219 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1089);
    bool _1221 = _1157 > 0.0;
    bool _1223 = isnan(_1157);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan(0.0);
    bool _1229 = _1225 || _1227;
    float _1231 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1085);
    float _1233 = _1157 * _1211;
    float _1235 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1215);
    float _1237 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1219);
    float _1239 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1217);
    bool _1241 = _1211 <= 0.0;
    bool _1243 = !_1229;
    bool _1245 = _1241 || _1243;
    float _1247 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1231);
    float _1249 = _1235 + _1237;
    float _1251 = _1239 + _1237;
    float _1253 = _1237 * 0.5;
    float _1255 = _1233 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1257 = _1249 * 0.5;
    float _1259 = _1251 * 0.5;
    float _1261 = fma(_1247, -0.5, _1253);
    float _1263 = _1255 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _1031;
    out.m_63.y = _993;
    out.m_63.z = _1023;
    out.gl_Position.x = _1235;
    out.gl_Position.y = _1247;
    out.gl_Position.z = _1239;
    out.gl_Position.w = _1237;
    out.m_65.x = _1257;
    out.m_65.y = _1261;
    out.m_65.z = _1259;
    out.m_65.w = _1237;
    out.m_37.x = _1263;
    if (!_1245)
    {
        return out;
    }
    out.m_37.x = 0.0;
    float _1265 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1265;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _933 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_34.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_84);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    if (!_88)
    {
        out.m_37.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _94 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1323 = as_type<float>(_100);
        out.gl_Position.z = _1323;
    }
    if (!_88)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _104 = in.m_39.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_114)
    {
        float _120 = float(_84);
        _92 = _120;
    }
    float _122 = _92;
    bool _124 = _118 >= _122;
    bool _126 = !_114;
    bool _128 = _124 || _126;
    float _130 = _122;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_37.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _102 = as_type<int>(_134);
    }
    int _136 = _102;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1392 = as_type<float>(_136);
        out.gl_Position.z = _1392;
    }
    if (_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_39.x;
    float _140 = in.m_39.y;
    float _142 = in.m_39.z;
    float _144 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_34.x;
    float _158 = in.m_34.y;
    float _160 = in.m_34.z;
    float _162 = in.m_41.x;
    float _164 = in.m_41.y;
    float _166 = in.m_41.z;
    float _168 = in.m_41.w;
    float _170 = 0.0;
    float _172 = _144;
    if (!_154)
    {
        float _174 = _144 * _144;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_154)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_154;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _144 * _192;
        float _202 = exp2(_200);
        float _204 = _198 * 0.693147182464599609375;
        float _206 = 1.0 / _204;
        float _208 = 1.0 / _196;
        float _210 = _202 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _206, _144);
        float _216 = _214 * _208;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_154;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _144 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    float _246 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = in.m_43.x;
    float _254 = fma(_244, _140, _246);
    float _256 = fma(_244, _138, _248);
    float _258 = fma(_244, _142, _250);
    float _260 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = fma(_254, _168, _158);
    float _264 = fma(_256, _168, _156);
    float _266 = fma(_258, _168, _160);
    float _268 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _270 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _272 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _274 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _276 = _268 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _278 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _270);
    float _280 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _272);
    float _282 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _274);
    float _284 = in.m_45.x;
    float _286 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _278);
    float _288 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _280);
    float _290 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _282);
    float _292 = in.m_45.y;
    float _294 = _286 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _296 = _288 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _298 = _290 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _300 = in.m_43.y;
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _304 = _294 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _308 = _296 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _312 = _298 + _310;
    float _314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _316 = _304 * _304;
    float _318 = fma(_308, _308, _316);
    float _320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _322 = fma(_312, _312, _318);
    float _324 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _326 = _324 * _252;
    float _328 = sqrt(_322);
    bool _330 = _300 > 0.5;
    float _332 = rsqrt(_322);
    float _334 = trunc(_326);
    int _336 = int(_334);
    float _338 = _328 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _340 = precise::min(_276, _338);
    float _342 = _304 * _332;
    float _344 = _308 * _332;
    out.m_47.w = _340;
    float _346 = _342 * _340;
    int _348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _350 = _348 != 0;
    float _352 = -_344;
    float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[18].w, _308);
    int _356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _358 = _356 != 0;
    float _360 = _344 * _340;
    int _362 = _336 << 4;
    int _364 = _362 + 1712;
    float _366 = -_342;
    float _368 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    bool _370 = _252 > 0.5;
    bool _372 = _370 && _350;
    float _374 = -_346;
    float _376 = _304 + _374;
    uint _379 = uint(int(uint(_364) >> uint(2)));
    uint _381 = uint(int(uint(int(_379)) >> uint(2)));
    int _383 = int(_379) & 3;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[int(_381)][_383];
    int _387 = int(_379) + 1;
    uint _389 = uint(int(uint(_387) >> uint(2)));
    int _391 = _387 & 3;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[int(_389)][_391];
    float _395 = _368 * _368;
    float _397 = -_360;
    float _399 = _308 + _397;
    float _401 = fma(_354, _354, _395);
    float _403 = _312 * _332;
    float _405 = _376 * _376;
    int _407 = _364 + 8;
    uint _409 = uint(int(uint(_407) >> uint(2)));
    uint _411 = uint(int(uint(int(_409)) >> uint(2)));
    int _413 = int(_409) & 3;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[int(_411)][_413];
    float _417 = -_292;
    float _419 = _417 + 1.0;
    float _421 = -_403;
    float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[18].w, _312);
    float _425 = _403 * _340;
    float _427 = fma(_399, _399, _405);
    float _429 = fma(_423, _423, _401);
    float _431 = _423;
    float _433 = _292;
    if (_350)
    {
        _431 = _284;
    }
    float _435 = _431;
    float _437 = -_425;
    float _439 = _312 + _437;
    float _441 = _435;
    float _443 = _439;
    if (_358)
    {
        float _445 = _330 ? _419 : _292;
        _433 = _445;
    }
    float _447 = _433;
    if (_372)
    {
        float _449 = -_435;
        float _451 = _449 + 1.0;
        _441 = _451;
    }
    float _453 = _441;
    float _455 = fma(_439, _439, _427);
    if (!_350)
    {
        _443 = _284;
    }
    float _457 = _443;
    float _459 = sqrt(_429);
    float _461 = _447 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _463 = _457;
    if (_350)
    {
        _463 = _453;
    }
    float _465 = _463;
    float _467 = _304 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _469 = _461 * _314;
    float _471 = fma(_308, (*spvDescriptorSet0.vp_c8)._m0[28].x, _467);
    float _473 = sqrt(_455);
    float _475 = _465 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _477 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[28].z, _471);
    float _479 = _475 * _320;
    out.m_49.x = 1.0;
    out.m_49.y = 1.0;
    out.m_49.z = 1.0;
    bool _481 = _477 >= 0.0;
    float _483 = _332 * _459;
    out.m_51.x = _479;
    out.m_51.y = _469;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _487 = _332 * _473;
    float _489 = _385 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _491 = _393 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _495 = _487 * _483;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[123].x;
    if (_481)
    {
        _499 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _501 = _499;
    float _503 = _415 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _507 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _509 = _497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _511 = as_type<int>(_501);
    if (_481)
    {
        float _513 = _501 * 5.0;
        _511 = as_type<int>(_513);
    }
    int _515 = _511;
    float _517 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _519 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _521 = _503 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _523 = _505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = _268 * _495;
    if (_481)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2045 = as_type<float>(_515);
        out.gl_Position.z = _2045;
    }
    out.m_53.x = _517;
    out.m_53.y = _519;
    out.m_53.z = _521;
    out.m_53.w = _485;
    out.m_55.x = _507;
    out.m_55.y = _509;
    out.m_55.z = _523;
    if (_481)
    {
        out.m_37.x = 0.0;
    }
    out.m_57.x = _525;
    if (_481)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _527 = -_342;
    float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[18].w, _294);
    float _531 = -_344;
    float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[18].w, _296);
    float _535 = -_403;
    float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[18].w, _298);
    float _539 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _541 = _529 + _539;
    float _543 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _545 = _533 + _543;
    float _547 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _549 = _537 + _547;
    float _551 = _541 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _553 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[28].x, _551);
    float _555 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[28].z, _553);
    bool _557 = _555 >= 0.0;
    float _559 = _549;
    if (_557)
    {
        _559 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _561 = _559;
    int _563 = as_type<int>(_561);
    if (_557)
    {
        out.m_37.x = 0.0;
    }
    if (_557)
    {
        float _565 = _561 * 5.0;
        _563 = as_type<int>(_565);
    }
    int _567 = _563;
    if (_557)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2152 = as_type<float>(_567);
        out.gl_Position.z = _2152;
    }
    if (_557)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _569 = in.m_59.x;
    float _571 = in.m_59.y;
    float _573 = in.m_59.z;
    float _575 = _166 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _577 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _579 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _577;
    float _581 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _583 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _585 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _583;
    float _587 = _579 * _579;
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _591 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _589;
    float _593 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _595 = fma(_585, _585, _587);
    float _597 = _593 * _495;
    float _599 = fma(_591, _591, _595);
    float _601 = _575 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _603 = sqrt(_599);
    float _605 = _601 * _495;
    float _607 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _609 = precise::clamp(_607, 0.0, 1.0);
    float _611 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _571);
    float _613 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _573);
    float _615 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _569);
    float _617 = rsqrt(_599);
    float _619 = _597 * _611;
    float _621 = _605 * _613;
    float _623 = _525 * _615;
    float _625 = _619 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _627 = _619 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _629 = _619 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _631 = _603 * 0.066666670143604278564453125;
    float _633 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[25].x, _625);
    float _635 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[24].x, _627);
    float _637 = fma(_609, -0.64999997615814208984375, 1.0);
    float _639 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[26].x, _629);
    float _641 = precise::max(_631, 1.0);
    float _643 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[25].z, _633);
    float _645 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[24].z, _635);
    float _647 = _617 * (-0.20000000298023223876953125);
    float _649 = precise::min(_641, 2.0);
    float _651 = _643 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _653 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[26].z, _639);
    float _655 = fma(_579, _647, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _657 = fma(_585, _647, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _659 = _649 * _637;
    float _661 = _645 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _663 = _294 + _651;
    float _665 = -_655;
    float _667 = _665 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _669 = _653 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _671 = _296 + _661;
    float _673 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _675 = _663 + _673;
    float _677 = -_657;
    float _679 = _677 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _681 = _667 * _667;
    float _683 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _685 = _671 + _683;
    float _687 = fma(_675, _659, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _689 = _298 + _669;
    float _691 = fma(_679, _679, _681);
    float _693 = fma(_685, _659, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _695 = -_687;
    float _697 = _695 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _699 = fma(_591, _647, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _701 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _703 = _689 + _701;
    float _705 = -_693;
    float _707 = _705 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _709 = _697 * _697;
    float _711 = -_699;
    float _713 = _711 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _715 = fma(_703, _659, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _717 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _719 = _657 + _717;
    float _721 = fma(_707, _707, _709);
    float _723 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _725 = _655 + _723;
    float _727 = fma(_713, _713, _691);
    float _729 = -_715;
    float _731 = _729 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _735 = _699 + _733;
    float _737 = _725 * _725;
    float _739 = fma(_731, _731, _721);
    float _741 = sqrt(_727);
    float _743 = fma(_719, _719, _737);
    float _745 = fma(_735, _735, _743);
    float _747 = sqrt(_739);
    float _749 = rsqrt(_745);
    float _751 = -_741;
    float _753 = _747 + _751;
    float _755 = _749 * _753;
    float _757 = -_755;
    float _759 = fma(_735, _757, _715);
    float _761 = -_755;
    float _763 = fma(_719, _761, _693);
    float _765 = -_755;
    float _767 = fma(_725, _765, _687);
    float _769 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _771 = _759 + _769;
    float _773 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _775 = _763 + _773;
    float _777 = _771 * _771;
    float _779 = fma(_775, _775, _777);
    float _781 = sqrt(_779);
    bool _783 = _781 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _785 = _687;
    float _787 = _755;
    float _789 = _763;
    if (!_783)
    {
        _785 = _759;
    }
    float _791 = _785;
    float _793 = _791;
    if (!_783)
    {
        _787 = _767;
    }
    float _795 = _787;
    bool _797 = !_783;
    float _799 = _795;
    if (!_797)
    {
        float _801 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _803 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _805 = _781 + _803;
        float _807 = rsqrt(_779);
        float _809 = _805 * _801;
        float _811 = _767 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _813 = _809 * 0.15915493667125701904296875;
        float _815 = _813 * 6.283185482025146484375;
        float _817 = cos(_815);
        float _819 = _813 * 6.283185482025146484375;
        float _821 = sin(_819);
        float _823 = _817 + (-1.0);
        float _825 = _823 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _827 = fma(_821, _811, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _829 = fma(_767, _817, _825);
        float _831 = _807 * _827;
        float _833 = fma(_775, _831, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _835 = fma(_771, _831, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _799 = _829;
        _789 = _833;
        _793 = _835;
    }
    float _837 = _799;
    float _839 = _789;
    float _841 = _793;
    float _843 = -_346;
    float _845 = _843 + _837;
    float _847 = -_360;
    float _849 = _847 + _839;
    float _851 = -_425;
    float _853 = _851 + _841;
    out.m_53.x = _517;
    out.m_53.y = _519;
    out.m_53.z = _521;
    out.m_53.w = _485;
    float _855 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _857 = _845 + _855;
    float _859 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _861 = _849 + _859;
    out.m_55.x = _507;
    out.m_55.y = _509;
    out.m_55.z = _523;
    float _863 = _857 * _857;
    float _865 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _867 = _853 + _865;
    float _869 = -_360;
    float _871 = _296 + _869;
    float _873 = -_346;
    float _875 = _294 + _873;
    float _877 = fma(_861, _861, _863);
    float _879 = -_425;
    float _881 = _298 + _879;
    float _883 = fma(_867, _867, _877);
    float _885 = sqrt(_883);
    bool _887 = _885 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _889 = isnan(_885);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _895 = _891 || _893;
    float _897 = _877;
    if (!_895)
    {
        _897 = 1.0;
    }
    float _899 = _897;
    bool _901 = !_895;
    float _903 = _899;
    if (!_901)
    {
        bool _905 = _885 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _907 = isnan(_885);
        bool _909 = _905 || _907;
        bool _911 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _913 = _909 || _911;
        if (!_913)
        {
            float _915 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _917 = _885 + _915;
            float _919 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _921 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _919;
            float _923 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _925 = _923 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _927 = 1.0 / _921;
            float _929 = _917 * _927;
            float _931 = fma(_929, _925, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _903 = _931;
            _933 = true;
        }
        else
        {
            bool _935 = _885 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _937 = isnan(_885);
            bool _939 = _935 || _937;
            bool _941 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _943 = _939 || _941;
            if (!_943)
            {
                float _945 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _947 = _885 + _945;
                float _949 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _951 = _949 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _953 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _955 = _953 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _957 = 1.0 / _951;
                float _959 = _947 * _957;
                float _961 = fma(_959, _955, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _903 = _961;
                _933 = true;
            }
            else
            {
                _903 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _933 = false;
    float _963 = _903;
    float _965 = -_342;
    float _967 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[18].w, _875);
    float _969 = -_344;
    float _971 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[18].w, _871);
    float _973 = -_403;
    float _975 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _881);
    float _977 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _979 = _845 + _977;
    float _981 = _967 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _983 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _985 = _853 + _983;
    float _987 = fma(_979, _963, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _989 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[11].x, _981);
    out.m_61.x = _971;
    out.m_61.y = _967;
    out.m_61.z = _975;
    float _991 = -_342;
    float _993 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[18].w, _987);
    float _995 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[11].z, _989);
    float _997 = _967 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _999 = _995 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1001 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[10].x, _997);
    float _1003 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1005 = _849 + _1003;
    float _1007 = 1.0 / _999;
    float _1009 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1001);
    float _1011 = _993 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1013 = _1009 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1015 = _1013 + _999;
    float _1017 = fma(_1005, _963, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1019 = fma(_985, _963, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1021 = -_403;
    float _1023 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1019);
    float _1025 = _1015 * _1007;
    float _1027 = _1025 * 0.5;
    float _1029 = -_344;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1017);
    float _1033 = _993 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1035 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1037 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1035);
    float _1039 = _993 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1041 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1033);
    bool _1043 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.5);
    bool _1051 = _1047 || _1049;
    float _1053 = _993 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1055 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1039);
    float _1057 = 1.0 / _1037;
    float _1059 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1041);
    float _1061 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1053);
    float _1063 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1055);
    float _1065 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1011);
    float _1067 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1069 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1061);
    float _1071 = _1063 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1073 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1065);
    float _1075 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1077 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1079 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1081 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1083 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1075);
    float _1085 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1077);
    float _1087 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1079);
    float _1089 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1081);
    float _1091 = _1071;
    float _1093 = _1075;
    if (_1051)
    {
        _1091 = 1.0;
    }
    float _1095 = _1091;
    float _1097 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1099 = _1095;
    if (_1051)
    {
        _1093 = 1.0;
    }
    float _1101 = _1093;
    float _1103 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1105 = _1057 * _1103;
    float _1107 = _1101;
    if (!_1051)
    {
        float _1109 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1111 = _1109 * 0.15915493667125701904296875;
        float _1113 = _1111 * 6.283185482025146484375;
        float _1115 = cos(_1113);
        float _1117 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1119 = _1117 * 0.15915493667125701904296875;
        float _1121 = _1111 * 6.283185482025146484375;
        float _1123 = sin(_1121);
        float _1125 = 1.0 / _1115;
        float _1127 = _1119 * 6.283185482025146484375;
        float _1129 = cos(_1127);
        float _1131 = _1123 * _1125;
        float _1133 = _1119 * 6.283185482025146484375;
        float _1135 = sin(_1133);
        float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1139 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1137;
        float _1141 = _1129 * _1131;
        float _1143 = 1.0 / _1139;
        float _1145 = 1.0 / _1141;
        float _1147 = _1135 * _1145;
        float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1151 = fma(_1105, _1147, _1149);
        float _1153 = _1151 * _1143;
        float _1155 = precise::clamp(_1153, 0.0, 1.0);
        _1099 = _1155;
    }
    float _1157 = _1099;
    if (!_1051)
    {
        float _1159 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1161 = _1159 * 0.15915493667125701904296875;
        float _1163 = _1161 * 6.283185482025146484375;
        float _1165 = cos(_1163);
        float _1167 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1169 = _1167 * 0.15915493667125701904296875;
        float _1171 = _1161 * 6.283185482025146484375;
        float _1173 = sin(_1171);
        float _1175 = 1.0 / _1165;
        float _1177 = _1169 * 6.283185482025146484375;
        float _1179 = cos(_1177);
        float _1181 = _1173 * _1175;
        float _1183 = _1169 * 6.283185482025146484375;
        float _1185 = sin(_1183);
        float _1187 = _1179 * _1181;
        float _1189 = 1.0 / _1187;
        float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1193 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1191;
        float _1195 = 1.0 / _1193;
        float _1197 = _1185 * _1189;
        float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1201 = fma(_1105, _1197, _1199);
        float _1203 = _1201 * _1195;
        float _1205 = precise::clamp(_1203, 0.0, 1.0);
        float _1207 = -_1205;
        float _1209 = _1207 + 1.0;
        _1107 = _1209;
    }
    float _1211 = _1107;
    float _1213 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1215 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1083);
    float _1217 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1087);
    float _1219 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1089);
    bool _1221 = _1157 > 0.0;
    bool _1223 = isnan(_1157);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan(0.0);
    bool _1229 = _1225 || _1227;
    float _1231 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1085);
    float _1233 = _1157 * _1211;
    float _1235 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1215);
    float _1237 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1219);
    float _1239 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1217);
    bool _1241 = _1211 <= 0.0;
    bool _1243 = !_1229;
    bool _1245 = _1241 || _1243;
    float _1247 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1231);
    float _1249 = _1235 + _1237;
    float _1251 = _1239 + _1237;
    float _1253 = _1237 * 0.5;
    float _1255 = _1233 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1257 = _1249 * 0.5;
    float _1259 = _1251 * 0.5;
    float _1261 = fma(_1247, -0.5, _1253);
    float _1263 = _1255 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _1031;
    out.m_63.y = _993;
    out.m_63.z = _1023;
    out.gl_Position.x = _1235;
    out.gl_Position.y = _1247;
    out.gl_Position.z = _1239;
    out.gl_Position.w = _1237;
    out.m_65.x = _1257;
    out.m_65.y = _1261;
    out.m_65.z = _1259;
    out.m_65.w = _1237;
    out.m_37.x = _1263;
    if (!_1245)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_37.x = 0.0;
    float _1265 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1265;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

