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
    float4 m_55 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_49 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _967 = false;
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
        float _1357 = as_type<float>(_100);
        out.gl_Position.z = _1357;
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
        float _1426 = as_type<float>(_136);
        out.gl_Position.z = _1426;
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
    float _252 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _254 = fma(_244, _140, _246);
    float _256 = fma(_244, _138, _248);
    float _258 = fma(_244, _142, _250);
    float _260 = in.m_43.x;
    float _262 = fma(_254, _168, _158);
    float _264 = fma(_256, _168, _156);
    float _266 = fma(_258, _168, _160);
    float _268 = _252 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _270 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _272 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _274 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _276 = _268 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _278 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _270);
    float _280 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _272);
    float _282 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _274);
    float _284 = in.m_45.y;
    float _286 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _278);
    float _288 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _280);
    float _290 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _282);
    float _292 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _294 = _286 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _296 = _288 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _298 = _290 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _300 = in.m_43.y;
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _304 = _294 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _308 = _296 + _306;
    float _310 = _292 * _260;
    float _312 = _304 * _304;
    float _314 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _316 = _298 + _314;
    int _318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _320 = _318 != 0;
    float _322 = in.m_45.x;
    float _324 = fma(_308, _308, _312);
    float _326 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _328 = trunc(_310);
    int _330 = int(_328);
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _334 = _332 != 0;
    float _336 = fma(_316, _316, _324);
    bool _338 = _260 > 0.5;
    bool _340 = _338 && _320;
    float _342 = _326 * _260;
    float _344 = -_284;
    float _346 = _344 + 1.0;
    float _348 = rsqrt(_336);
    bool _350 = _300 > 0.5;
    float _352 = sqrt(_336);
    int _354 = _330 << 4;
    int _356 = _354 + 1712;
    float _358 = _284;
    float _360 = _346;
    if (_334)
    {
        float _362 = _350 ? _346 : _284;
        _358 = _362;
    }
    float _364 = _358;
    float _366 = _322;
    if (!_320)
    {
        _360 = _322;
    }
    float _368 = _360;
    float _370 = _368;
    if (_340)
    {
        float _372 = -_322;
        float _374 = _372 + 1.0;
        _366 = _374;
    }
    float _376 = _366;
    float _378 = trunc(_342);
    int _380 = int(_378);
    float _382 = _304 * _348;
    float _384 = _308 * _348;
    float _386 = _316 * _348;
    if (_320)
    {
        _370 = _376;
    }
    float _388 = _370;
    float _390 = -_382;
    float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    float _394 = -_384;
    float _396 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[18].w, _308);
    float _398 = -_386;
    float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _316);
    float _402 = _352 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _404 = _392 * _392;
    float _406 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _408 = precise::min(_276, _402);
    float _410 = fma(_396, _396, _404);
    uint _413 = uint(int(uint(_356) >> uint(2)));
    uint _415 = uint(int(uint(int(_413)) >> uint(2)));
    int _417 = int(_413) & 3;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[int(_415)][_417];
    int _421 = int(_413) + 1;
    uint _423 = uint(int(uint(_421) >> uint(2)));
    int _425 = _421 & 3;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[int(_423)][_425];
    int _429 = _380 << 4;
    int _431 = _429 + 1968;
    float _433 = _382 * _408;
    float _435 = _384 * _408;
    float _437 = fma(_400, _400, _410);
    float _439 = _304 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _441 = -_433;
    float _443 = _304 + _441;
    int _445 = _356 + 8;
    uint _447 = uint(int(uint(_445) >> uint(2)));
    uint _449 = uint(int(uint(int(_447)) >> uint(2)));
    int _451 = int(_447) & 3;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[int(_449)][_451];
    float _455 = -_435;
    float _457 = _308 + _455;
    float _459 = fma(_308, (*spvDescriptorSet0.vp_c8)._m0[28].x, _439);
    float _461 = _443 * _443;
    float _463 = _386 * _408;
    float _465 = sqrt(_437);
    float _467 = fma(_316, (*spvDescriptorSet0.vp_c8)._m0[28].z, _459);
    float _469 = fma(_457, _457, _461);
    uint _471 = uint(int(uint(_431) >> uint(2)));
    uint _473 = uint(int(uint(int(_471)) >> uint(2)));
    int _475 = int(_471) & 3;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[int(_473)][_475];
    int _479 = int(_471) + 1;
    uint _481 = uint(int(uint(_479) >> uint(2)));
    int _483 = _479 & 3;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[int(_481)][_483];
    float _487 = -_463;
    float _489 = _316 + _487;
    float _491 = _364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _493 = _467 >= 0.0;
    out.m_47.w = _408;
    float _495 = fma(_489, _489, _469);
    float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _499 = _491 * _406;
    int _501 = _431 + 8;
    uint _503 = uint(int(uint(_501) >> uint(2)));
    uint _505 = uint(int(uint(int(_503)) >> uint(2)));
    int _507 = int(_503) & 3;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[int(_505)][_507];
    float _511 = _348 * _465;
    float _513 = sqrt(_495);
    float _515 = _388 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _517 = 1.0;
    if (_493)
    {
        out.m_37.x = 0.0;
    }
    out.m_49.x = 1.0;
    out.m_49.y = 1.0;
    out.m_49.z = 1.0;
    float _519 = _515 * _497;
    out.m_51.x = _519;
    out.m_51.y = _499;
    float _521 = _348 * _513;
    float _523 = _419 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _525 = _427 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (_493)
    {
        _517 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _527 = _517;
    float _529 = _521 * _511;
    float _531 = _268 * _529;
    float _533 = _453 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _535 = as_type<int>(_453);
    if (_493)
    {
        float _537 = _527 * 5.0;
        _535 = as_type<int>(_537);
    }
    int _539 = _535;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _531;
    float _543 = _477 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _545 = _485 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _547 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _549 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _551 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _553 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_493)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2126 = as_type<float>(_539);
        out.gl_Position.z = _2126;
    }
    float _557 = _509 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_55.x = _547;
    out.m_55.y = _551;
    out.m_55.z = _549;
    out.m_55.w = _541;
    float _559 = _557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _553;
    out.m_57.y = _555;
    out.m_57.z = _559;
    if (_493)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _561 = -_382;
    float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[18].w, _294);
    float _565 = -_384;
    float _567 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[18].w, _296);
    float _569 = -_386;
    float _571 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[18].w, _298);
    float _573 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _575 = _563 + _573;
    float _577 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _579 = _567 + _577;
    float _581 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _583 = _571 + _581;
    float _585 = _575 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _587 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[28].x, _585);
    float _589 = fma(_583, (*spvDescriptorSet0.vp_c8)._m0[28].z, _587);
    bool _591 = _589 >= 0.0;
    float _593 = _583;
    if (_591)
    {
        _593 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _595 = _593;
    int _597 = as_type<int>(_595);
    if (_591)
    {
        out.m_37.x = 0.0;
    }
    if (_591)
    {
        float _599 = _595 * 5.0;
        _597 = as_type<int>(_599);
    }
    int _601 = _597;
    if (_591)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2235 = as_type<float>(_601);
        out.gl_Position.z = _2235;
    }
    if (_591)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _603 = in.m_59.x;
    float _605 = in.m_59.y;
    float _607 = in.m_59.z;
    float _609 = _166 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _613 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _611;
    float _615 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _617 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _619 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _617;
    float _621 = _613 * _613;
    float _623 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _625 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _623;
    float _627 = _615 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _629 = fma(_619, _619, _621);
    float _631 = _627 * _529;
    float _633 = fma(_625, _625, _629);
    float _635 = _609 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _637 = sqrt(_633);
    float _639 = _635 * _529;
    float _641 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _643 = precise::clamp(_641, 0.0, 1.0);
    float _645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _605);
    float _647 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _607);
    float _649 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _603);
    float _651 = rsqrt(_633);
    float _653 = _631 * _645;
    float _655 = _639 * _647;
    float _657 = _531 * _649;
    float _659 = _653 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _661 = _653 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _663 = _653 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _665 = _637 * 0.066666670143604278564453125;
    float _667 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[25].x, _659);
    float _669 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[24].x, _661);
    float _671 = fma(_643, -0.64999997615814208984375, 1.0);
    float _673 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[26].x, _663);
    float _675 = precise::max(_665, 1.0);
    float _677 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[25].z, _667);
    float _679 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[24].z, _669);
    float _681 = _651 * (-0.20000000298023223876953125);
    float _683 = precise::min(_675, 2.0);
    float _685 = _677 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _687 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[26].z, _673);
    float _689 = fma(_613, _681, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _691 = fma(_619, _681, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _693 = _683 * _671;
    float _695 = _679 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _697 = _294 + _685;
    float _699 = -_689;
    float _701 = _699 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _703 = _687 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _705 = _296 + _695;
    float _707 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _709 = _697 + _707;
    float _711 = -_691;
    float _713 = _711 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _715 = _701 * _701;
    float _717 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _719 = _705 + _717;
    float _721 = fma(_709, _693, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _723 = _298 + _703;
    float _725 = fma(_713, _713, _715);
    float _727 = fma(_719, _693, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _729 = -_721;
    float _731 = _729 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _733 = fma(_625, _681, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _735 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _737 = _723 + _735;
    float _739 = -_727;
    float _741 = _739 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _743 = _731 * _731;
    float _745 = -_733;
    float _747 = _745 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _749 = fma(_737, _693, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _751 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _753 = _689 + _751;
    float _755 = fma(_741, _741, _743);
    float _757 = fma(_747, _747, _725);
    float _759 = -_749;
    float _761 = _759 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _763 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _765 = _691 + _763;
    float _767 = _753 * _753;
    float _769 = fma(_761, _761, _755);
    float _771 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _773 = _733 + _771;
    float _775 = fma(_765, _765, _767);
    float _777 = sqrt(_757);
    float _779 = fma(_773, _773, _775);
    float _781 = sqrt(_769);
    float _783 = rsqrt(_779);
    float _785 = -_777;
    float _787 = _781 + _785;
    float _789 = _783 * _787;
    float _791 = -_789;
    float _793 = fma(_773, _791, _749);
    float _795 = -_789;
    float _797 = fma(_765, _795, _727);
    float _799 = -_789;
    float _801 = fma(_753, _799, _721);
    float _803 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _805 = _793 + _803;
    float _807 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _809 = _797 + _807;
    float _811 = _805 * _805;
    float _813 = fma(_809, _809, _811);
    float _815 = sqrt(_813);
    bool _817 = _815 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _819 = _811;
    float _821 = _783;
    float _823 = _797;
    if (!_817)
    {
        _819 = _793;
    }
    float _825 = _819;
    float _827 = _825;
    if (!_817)
    {
        _821 = _801;
    }
    float _829 = _821;
    bool _831 = !_817;
    float _833 = _829;
    if (!_831)
    {
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _837 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _839 = _815 + _837;
        float _841 = _801 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _843 = _839 * _835;
        float _845 = rsqrt(_813);
        float _847 = _843 * 0.15915493667125701904296875;
        float _849 = _847 * 6.283185482025146484375;
        float _851 = cos(_849);
        float _853 = _847 * 6.283185482025146484375;
        float _855 = sin(_853);
        float _857 = _851 + (-1.0);
        float _859 = _857 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _861 = fma(_855, _841, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _863 = fma(_801, _851, _859);
        float _865 = _845 * _861;
        float _867 = fma(_809, _865, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _869 = fma(_805, _865, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _833 = _863;
        _823 = _867;
        _827 = _869;
    }
    float _871 = _833;
    float _873 = _823;
    float _875 = _827;
    float _877 = -_433;
    float _879 = _877 + _871;
    float _881 = -_435;
    float _883 = _881 + _873;
    float _885 = -_463;
    float _887 = _885 + _875;
    out.m_55.x = _547;
    out.m_55.y = _551;
    out.m_55.z = _549;
    out.m_55.w = _541;
    float _889 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _891 = _879 + _889;
    float _893 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _895 = _883 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _899 = _887 + _897;
    out.m_57.x = _553;
    out.m_57.y = _555;
    out.m_57.z = _559;
    float _901 = _891 * _891;
    float _903 = -_435;
    float _905 = _296 + _903;
    float _907 = -_433;
    float _909 = _294 + _907;
    float _911 = fma(_895, _895, _901);
    float _913 = -_463;
    float _915 = _298 + _913;
    float _917 = fma(_899, _899, _911);
    float _919 = sqrt(_917);
    bool _921 = _919 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _923 = isnan(_919);
    bool _925 = _921 || _923;
    bool _927 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _929 = _925 || _927;
    float _931 = _911;
    if (!_929)
    {
        _931 = 1.0;
    }
    float _933 = _931;
    bool _935 = !_929;
    float _937 = _933;
    if (!_935)
    {
        bool _939 = _919 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _941 = isnan(_919);
        bool _943 = _939 || _941;
        bool _945 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _947 = _943 || _945;
        if (!_947)
        {
            float _949 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _951 = _919 + _949;
            float _953 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _955 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _953;
            float _957 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _959 = _957 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _961 = 1.0 / _955;
            float _963 = _951 * _961;
            float _965 = fma(_963, _959, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _937 = _965;
            _967 = true;
        }
        else
        {
            bool _969 = _919 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _971 = isnan(_919);
            bool _973 = _969 || _971;
            bool _975 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _977 = _973 || _975;
            if (!_977)
            {
                float _979 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _981 = _919 + _979;
                float _983 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _985 = _983 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _987 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _989 = _987 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _991 = 1.0 / _985;
                float _993 = _981 * _991;
                float _995 = fma(_993, _989, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _937 = _995;
                _967 = true;
            }
            else
            {
                _937 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _967 = false;
    float _997 = _937;
    float _999 = -_382;
    float _1001 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[18].w, _909);
    float _1003 = -_384;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    float _1007 = -_386;
    float _1009 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[18].w, _915);
    float _1011 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1013 = _879 + _1011;
    float _1015 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1017 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1019 = _887 + _1017;
    float _1021 = fma(_1013, _997, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1023 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1015);
    out.m_61.x = _1005;
    out.m_61.y = _1001;
    out.m_61.z = _1009;
    float _1025 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1023);
    float _1027 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1029 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1031 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1027);
    float _1033 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1035 = _883 + _1033;
    float _1037 = 1.0 / _1029;
    float _1039 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1031);
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1043 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.5);
    bool _1051 = _1047 || _1049;
    float _1053 = _1041 + _1029;
    float _1055 = fma(_1035, _997, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1057 = fma(_1019, _997, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1059 = -_382;
    float _1061 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1021);
    float _1063 = -_384;
    float _1065 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1055);
    float _1067 = -_386;
    float _1069 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1057);
    float _1071 = _1053 * _1037;
    float _1073 = _1071 * 0.5;
    float _1075 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1077 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1079 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1083 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1081);
    float _1085 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1075);
    float _1087 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1077);
    float _1089 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1091 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1079);
    float _1093 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1085);
    float _1095 = 1.0 / _1083;
    float _1097 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1099 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1089);
    float _1101 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1103 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1091);
    float _1105 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1107 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1099);
    float _1109 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1111 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1113 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1115 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1117 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1109);
    float _1119 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1111);
    float _1121 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1113);
    float _1123 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1115);
    float _1125 = _1109;
    float _1127 = _1105;
    if (_1051)
    {
        _1125 = 1.0;
    }
    float _1129 = _1125;
    float _1131 = _1103 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1133 = _1129;
    if (_1051)
    {
        _1127 = 1.0;
    }
    float _1135 = _1127;
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1139 = _1095 * _1137;
    float _1141 = _1135;
    if (!_1051)
    {
        float _1143 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1145 = _1143 * 0.15915493667125701904296875;
        float _1147 = _1145 * 6.283185482025146484375;
        float _1149 = cos(_1147);
        float _1151 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1153 = _1151 * 0.15915493667125701904296875;
        float _1155 = _1145 * 6.283185482025146484375;
        float _1157 = sin(_1155);
        float _1159 = 1.0 / _1149;
        float _1161 = _1153 * 6.283185482025146484375;
        float _1163 = cos(_1161);
        float _1165 = _1157 * _1159;
        float _1167 = _1153 * 6.283185482025146484375;
        float _1169 = sin(_1167);
        float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1173 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1171;
        float _1175 = _1163 * _1165;
        float _1177 = 1.0 / _1173;
        float _1179 = 1.0 / _1175;
        float _1181 = _1169 * _1179;
        float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1185 = fma(_1139, _1181, _1183);
        float _1187 = _1185 * _1177;
        float _1189 = precise::clamp(_1187, 0.0, 1.0);
        _1133 = _1189;
    }
    float _1191 = _1133;
    if (!_1051)
    {
        float _1193 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1195 = _1193 * 0.15915493667125701904296875;
        float _1197 = _1195 * 6.283185482025146484375;
        float _1199 = cos(_1197);
        float _1201 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1203 = _1201 * 0.15915493667125701904296875;
        float _1205 = _1195 * 6.283185482025146484375;
        float _1207 = sin(_1205);
        float _1209 = 1.0 / _1199;
        float _1211 = _1203 * 6.283185482025146484375;
        float _1213 = cos(_1211);
        float _1215 = _1207 * _1209;
        float _1217 = _1203 * 6.283185482025146484375;
        float _1219 = sin(_1217);
        float _1221 = _1213 * _1215;
        float _1223 = 1.0 / _1221;
        float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1227 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1225;
        float _1229 = 1.0 / _1227;
        float _1231 = _1219 * _1223;
        float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1235 = fma(_1139, _1231, _1233);
        float _1237 = _1235 * _1229;
        float _1239 = precise::clamp(_1237, 0.0, 1.0);
        float _1241 = -_1239;
        float _1243 = _1241 + 1.0;
        _1141 = _1243;
    }
    float _1245 = _1141;
    float _1247 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1249 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1117);
    float _1251 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1121);
    float _1253 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1123);
    bool _1255 = _1191 > 0.0;
    bool _1257 = isnan(_1191);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan(0.0);
    bool _1263 = _1259 || _1261;
    float _1265 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1119);
    float _1267 = _1191 * _1245;
    float _1269 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1249);
    float _1271 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1253);
    float _1273 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1251);
    bool _1275 = _1245 <= 0.0;
    bool _1277 = !_1263;
    bool _1279 = _1275 || _1277;
    float _1281 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1265);
    float _1283 = _1269 + _1271;
    float _1285 = _1273 + _1271;
    float _1287 = _1271 * 0.5;
    float _1289 = _1267 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1291 = _1283 * 0.5;
    float _1293 = _1285 * 0.5;
    float _1295 = fma(_1281, -0.5, _1287);
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _1065;
    out.m_63.y = _1061;
    out.m_63.z = _1069;
    out.gl_Position.x = _1269;
    out.gl_Position.y = _1281;
    out.gl_Position.z = _1273;
    out.gl_Position.w = _1271;
    out.m_65.x = _1291;
    out.m_65.y = _1295;
    out.m_65.z = _1293;
    out.m_65.w = _1271;
    out.m_37.x = _1297;
    if (!_1279)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_37.x = 0.0;
    float _1299 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1299;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _967 = false;
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
        float _1357 = as_type<float>(_100);
        out.gl_Position.z = _1357;
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
        float _1426 = as_type<float>(_136);
        out.gl_Position.z = _1426;
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
    float _252 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _254 = fma(_244, _140, _246);
    float _256 = fma(_244, _138, _248);
    float _258 = fma(_244, _142, _250);
    float _260 = in.m_43.x;
    float _262 = fma(_254, _168, _158);
    float _264 = fma(_256, _168, _156);
    float _266 = fma(_258, _168, _160);
    float _268 = _252 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _270 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _272 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _274 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _276 = _268 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _278 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _270);
    float _280 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _272);
    float _282 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _274);
    float _284 = in.m_45.y;
    float _286 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _278);
    float _288 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _280);
    float _290 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _282);
    float _292 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _294 = _286 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _296 = _288 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _298 = _290 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _300 = in.m_43.y;
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _304 = _294 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _308 = _296 + _306;
    float _310 = _292 * _260;
    float _312 = _304 * _304;
    float _314 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _316 = _298 + _314;
    int _318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _320 = _318 != 0;
    float _322 = in.m_45.x;
    float _324 = fma(_308, _308, _312);
    float _326 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _328 = trunc(_310);
    int _330 = int(_328);
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _334 = _332 != 0;
    float _336 = fma(_316, _316, _324);
    bool _338 = _260 > 0.5;
    bool _340 = _338 && _320;
    float _342 = _326 * _260;
    float _344 = -_284;
    float _346 = _344 + 1.0;
    float _348 = rsqrt(_336);
    bool _350 = _300 > 0.5;
    float _352 = sqrt(_336);
    int _354 = _330 << 4;
    int _356 = _354 + 1712;
    float _358 = _284;
    float _360 = _346;
    if (_334)
    {
        float _362 = _350 ? _346 : _284;
        _358 = _362;
    }
    float _364 = _358;
    float _366 = _322;
    if (!_320)
    {
        _360 = _322;
    }
    float _368 = _360;
    float _370 = _368;
    if (_340)
    {
        float _372 = -_322;
        float _374 = _372 + 1.0;
        _366 = _374;
    }
    float _376 = _366;
    float _378 = trunc(_342);
    int _380 = int(_378);
    float _382 = _304 * _348;
    float _384 = _308 * _348;
    float _386 = _316 * _348;
    if (_320)
    {
        _370 = _376;
    }
    float _388 = _370;
    float _390 = -_382;
    float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    float _394 = -_384;
    float _396 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[18].w, _308);
    float _398 = -_386;
    float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _316);
    float _402 = _352 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _404 = _392 * _392;
    float _406 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _408 = precise::min(_276, _402);
    float _410 = fma(_396, _396, _404);
    uint _413 = uint(int(uint(_356) >> uint(2)));
    uint _415 = uint(int(uint(int(_413)) >> uint(2)));
    int _417 = int(_413) & 3;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[int(_415)][_417];
    int _421 = int(_413) + 1;
    uint _423 = uint(int(uint(_421) >> uint(2)));
    int _425 = _421 & 3;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[int(_423)][_425];
    int _429 = _380 << 4;
    int _431 = _429 + 1968;
    float _433 = _382 * _408;
    float _435 = _384 * _408;
    float _437 = fma(_400, _400, _410);
    float _439 = _304 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _441 = -_433;
    float _443 = _304 + _441;
    int _445 = _356 + 8;
    uint _447 = uint(int(uint(_445) >> uint(2)));
    uint _449 = uint(int(uint(int(_447)) >> uint(2)));
    int _451 = int(_447) & 3;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[int(_449)][_451];
    float _455 = -_435;
    float _457 = _308 + _455;
    float _459 = fma(_308, (*spvDescriptorSet0.vp_c8)._m0[28].x, _439);
    float _461 = _443 * _443;
    float _463 = _386 * _408;
    float _465 = sqrt(_437);
    float _467 = fma(_316, (*spvDescriptorSet0.vp_c8)._m0[28].z, _459);
    float _469 = fma(_457, _457, _461);
    uint _471 = uint(int(uint(_431) >> uint(2)));
    uint _473 = uint(int(uint(int(_471)) >> uint(2)));
    int _475 = int(_471) & 3;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[int(_473)][_475];
    int _479 = int(_471) + 1;
    uint _481 = uint(int(uint(_479) >> uint(2)));
    int _483 = _479 & 3;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[int(_481)][_483];
    float _487 = -_463;
    float _489 = _316 + _487;
    float _491 = _364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _493 = _467 >= 0.0;
    out.m_47.w = _408;
    float _495 = fma(_489, _489, _469);
    float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _499 = _491 * _406;
    int _501 = _431 + 8;
    uint _503 = uint(int(uint(_501) >> uint(2)));
    uint _505 = uint(int(uint(int(_503)) >> uint(2)));
    int _507 = int(_503) & 3;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[int(_505)][_507];
    float _511 = _348 * _465;
    float _513 = sqrt(_495);
    float _515 = _388 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _517 = 1.0;
    if (_493)
    {
        out.m_37.x = 0.0;
    }
    out.m_49.x = 1.0;
    out.m_49.y = 1.0;
    out.m_49.z = 1.0;
    float _519 = _515 * _497;
    out.m_51.x = _519;
    out.m_51.y = _499;
    float _521 = _348 * _513;
    float _523 = _419 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _525 = _427 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (_493)
    {
        _517 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _527 = _517;
    float _529 = _521 * _511;
    float _531 = _268 * _529;
    float _533 = _453 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _535 = as_type<int>(_453);
    if (_493)
    {
        float _537 = _527 * 5.0;
        _535 = as_type<int>(_537);
    }
    int _539 = _535;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _531;
    float _543 = _477 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _545 = _485 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _547 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _549 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _551 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _553 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_493)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2126 = as_type<float>(_539);
        out.gl_Position.z = _2126;
    }
    float _557 = _509 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_55.x = _547;
    out.m_55.y = _551;
    out.m_55.z = _549;
    out.m_55.w = _541;
    float _559 = _557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _553;
    out.m_57.y = _555;
    out.m_57.z = _559;
    if (_493)
    {
        return out;
    }
    float _561 = -_382;
    float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[18].w, _294);
    float _565 = -_384;
    float _567 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[18].w, _296);
    float _569 = -_386;
    float _571 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[18].w, _298);
    float _573 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _575 = _563 + _573;
    float _577 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _579 = _567 + _577;
    float _581 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _583 = _571 + _581;
    float _585 = _575 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _587 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[28].x, _585);
    float _589 = fma(_583, (*spvDescriptorSet0.vp_c8)._m0[28].z, _587);
    bool _591 = _589 >= 0.0;
    float _593 = _583;
    if (_591)
    {
        _593 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _595 = _593;
    int _597 = as_type<int>(_595);
    if (_591)
    {
        out.m_37.x = 0.0;
    }
    if (_591)
    {
        float _599 = _595 * 5.0;
        _597 = as_type<int>(_599);
    }
    int _601 = _597;
    if (_591)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2235 = as_type<float>(_601);
        out.gl_Position.z = _2235;
    }
    if (_591)
    {
        return out;
    }
    float _603 = in.m_59.x;
    float _605 = in.m_59.y;
    float _607 = in.m_59.z;
    float _609 = _166 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _613 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _611;
    float _615 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _617 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _619 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _617;
    float _621 = _613 * _613;
    float _623 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _625 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _623;
    float _627 = _615 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _629 = fma(_619, _619, _621);
    float _631 = _627 * _529;
    float _633 = fma(_625, _625, _629);
    float _635 = _609 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _637 = sqrt(_633);
    float _639 = _635 * _529;
    float _641 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _643 = precise::clamp(_641, 0.0, 1.0);
    float _645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _605);
    float _647 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _607);
    float _649 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _603);
    float _651 = rsqrt(_633);
    float _653 = _631 * _645;
    float _655 = _639 * _647;
    float _657 = _531 * _649;
    float _659 = _653 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _661 = _653 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _663 = _653 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _665 = _637 * 0.066666670143604278564453125;
    float _667 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[25].x, _659);
    float _669 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[24].x, _661);
    float _671 = fma(_643, -0.64999997615814208984375, 1.0);
    float _673 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[26].x, _663);
    float _675 = precise::max(_665, 1.0);
    float _677 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[25].z, _667);
    float _679 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[24].z, _669);
    float _681 = _651 * (-0.20000000298023223876953125);
    float _683 = precise::min(_675, 2.0);
    float _685 = _677 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _687 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[26].z, _673);
    float _689 = fma(_613, _681, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _691 = fma(_619, _681, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _693 = _683 * _671;
    float _695 = _679 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _697 = _294 + _685;
    float _699 = -_689;
    float _701 = _699 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _703 = _687 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _705 = _296 + _695;
    float _707 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _709 = _697 + _707;
    float _711 = -_691;
    float _713 = _711 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _715 = _701 * _701;
    float _717 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _719 = _705 + _717;
    float _721 = fma(_709, _693, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _723 = _298 + _703;
    float _725 = fma(_713, _713, _715);
    float _727 = fma(_719, _693, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _729 = -_721;
    float _731 = _729 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _733 = fma(_625, _681, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _735 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _737 = _723 + _735;
    float _739 = -_727;
    float _741 = _739 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _743 = _731 * _731;
    float _745 = -_733;
    float _747 = _745 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _749 = fma(_737, _693, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _751 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _753 = _689 + _751;
    float _755 = fma(_741, _741, _743);
    float _757 = fma(_747, _747, _725);
    float _759 = -_749;
    float _761 = _759 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _763 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _765 = _691 + _763;
    float _767 = _753 * _753;
    float _769 = fma(_761, _761, _755);
    float _771 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _773 = _733 + _771;
    float _775 = fma(_765, _765, _767);
    float _777 = sqrt(_757);
    float _779 = fma(_773, _773, _775);
    float _781 = sqrt(_769);
    float _783 = rsqrt(_779);
    float _785 = -_777;
    float _787 = _781 + _785;
    float _789 = _783 * _787;
    float _791 = -_789;
    float _793 = fma(_773, _791, _749);
    float _795 = -_789;
    float _797 = fma(_765, _795, _727);
    float _799 = -_789;
    float _801 = fma(_753, _799, _721);
    float _803 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _805 = _793 + _803;
    float _807 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _809 = _797 + _807;
    float _811 = _805 * _805;
    float _813 = fma(_809, _809, _811);
    float _815 = sqrt(_813);
    bool _817 = _815 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _819 = _811;
    float _821 = _783;
    float _823 = _797;
    if (!_817)
    {
        _819 = _793;
    }
    float _825 = _819;
    float _827 = _825;
    if (!_817)
    {
        _821 = _801;
    }
    float _829 = _821;
    bool _831 = !_817;
    float _833 = _829;
    if (!_831)
    {
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _837 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _839 = _815 + _837;
        float _841 = _801 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _843 = _839 * _835;
        float _845 = rsqrt(_813);
        float _847 = _843 * 0.15915493667125701904296875;
        float _849 = _847 * 6.283185482025146484375;
        float _851 = cos(_849);
        float _853 = _847 * 6.283185482025146484375;
        float _855 = sin(_853);
        float _857 = _851 + (-1.0);
        float _859 = _857 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _861 = fma(_855, _841, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _863 = fma(_801, _851, _859);
        float _865 = _845 * _861;
        float _867 = fma(_809, _865, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _869 = fma(_805, _865, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _833 = _863;
        _823 = _867;
        _827 = _869;
    }
    float _871 = _833;
    float _873 = _823;
    float _875 = _827;
    float _877 = -_433;
    float _879 = _877 + _871;
    float _881 = -_435;
    float _883 = _881 + _873;
    float _885 = -_463;
    float _887 = _885 + _875;
    out.m_55.x = _547;
    out.m_55.y = _551;
    out.m_55.z = _549;
    out.m_55.w = _541;
    float _889 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _891 = _879 + _889;
    float _893 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _895 = _883 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _899 = _887 + _897;
    out.m_57.x = _553;
    out.m_57.y = _555;
    out.m_57.z = _559;
    float _901 = _891 * _891;
    float _903 = -_435;
    float _905 = _296 + _903;
    float _907 = -_433;
    float _909 = _294 + _907;
    float _911 = fma(_895, _895, _901);
    float _913 = -_463;
    float _915 = _298 + _913;
    float _917 = fma(_899, _899, _911);
    float _919 = sqrt(_917);
    bool _921 = _919 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _923 = isnan(_919);
    bool _925 = _921 || _923;
    bool _927 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _929 = _925 || _927;
    float _931 = _911;
    if (!_929)
    {
        _931 = 1.0;
    }
    float _933 = _931;
    bool _935 = !_929;
    float _937 = _933;
    if (!_935)
    {
        bool _939 = _919 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _941 = isnan(_919);
        bool _943 = _939 || _941;
        bool _945 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _947 = _943 || _945;
        if (!_947)
        {
            float _949 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _951 = _919 + _949;
            float _953 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _955 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _953;
            float _957 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _959 = _957 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _961 = 1.0 / _955;
            float _963 = _951 * _961;
            float _965 = fma(_963, _959, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _937 = _965;
            _967 = true;
        }
        else
        {
            bool _969 = _919 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _971 = isnan(_919);
            bool _973 = _969 || _971;
            bool _975 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _977 = _973 || _975;
            if (!_977)
            {
                float _979 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _981 = _919 + _979;
                float _983 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _985 = _983 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _987 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _989 = _987 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _991 = 1.0 / _985;
                float _993 = _981 * _991;
                float _995 = fma(_993, _989, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _937 = _995;
                _967 = true;
            }
            else
            {
                _937 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _967 = false;
    float _997 = _937;
    float _999 = -_382;
    float _1001 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[18].w, _909);
    float _1003 = -_384;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    float _1007 = -_386;
    float _1009 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[18].w, _915);
    float _1011 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1013 = _879 + _1011;
    float _1015 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1017 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1019 = _887 + _1017;
    float _1021 = fma(_1013, _997, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1023 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1015);
    out.m_61.x = _1005;
    out.m_61.y = _1001;
    out.m_61.z = _1009;
    float _1025 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1023);
    float _1027 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1029 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1031 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1027);
    float _1033 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1035 = _883 + _1033;
    float _1037 = 1.0 / _1029;
    float _1039 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1031);
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1043 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.5);
    bool _1051 = _1047 || _1049;
    float _1053 = _1041 + _1029;
    float _1055 = fma(_1035, _997, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1057 = fma(_1019, _997, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1059 = -_382;
    float _1061 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1021);
    float _1063 = -_384;
    float _1065 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1055);
    float _1067 = -_386;
    float _1069 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1057);
    float _1071 = _1053 * _1037;
    float _1073 = _1071 * 0.5;
    float _1075 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1077 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1079 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1083 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1081);
    float _1085 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1075);
    float _1087 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1077);
    float _1089 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1091 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1079);
    float _1093 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1085);
    float _1095 = 1.0 / _1083;
    float _1097 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1099 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1089);
    float _1101 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1103 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1091);
    float _1105 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1107 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1099);
    float _1109 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1111 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1113 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1115 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1117 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1109);
    float _1119 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1111);
    float _1121 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1113);
    float _1123 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1115);
    float _1125 = _1109;
    float _1127 = _1105;
    if (_1051)
    {
        _1125 = 1.0;
    }
    float _1129 = _1125;
    float _1131 = _1103 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1133 = _1129;
    if (_1051)
    {
        _1127 = 1.0;
    }
    float _1135 = _1127;
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1139 = _1095 * _1137;
    float _1141 = _1135;
    if (!_1051)
    {
        float _1143 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1145 = _1143 * 0.15915493667125701904296875;
        float _1147 = _1145 * 6.283185482025146484375;
        float _1149 = cos(_1147);
        float _1151 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1153 = _1151 * 0.15915493667125701904296875;
        float _1155 = _1145 * 6.283185482025146484375;
        float _1157 = sin(_1155);
        float _1159 = 1.0 / _1149;
        float _1161 = _1153 * 6.283185482025146484375;
        float _1163 = cos(_1161);
        float _1165 = _1157 * _1159;
        float _1167 = _1153 * 6.283185482025146484375;
        float _1169 = sin(_1167);
        float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1173 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1171;
        float _1175 = _1163 * _1165;
        float _1177 = 1.0 / _1173;
        float _1179 = 1.0 / _1175;
        float _1181 = _1169 * _1179;
        float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1185 = fma(_1139, _1181, _1183);
        float _1187 = _1185 * _1177;
        float _1189 = precise::clamp(_1187, 0.0, 1.0);
        _1133 = _1189;
    }
    float _1191 = _1133;
    if (!_1051)
    {
        float _1193 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1195 = _1193 * 0.15915493667125701904296875;
        float _1197 = _1195 * 6.283185482025146484375;
        float _1199 = cos(_1197);
        float _1201 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1203 = _1201 * 0.15915493667125701904296875;
        float _1205 = _1195 * 6.283185482025146484375;
        float _1207 = sin(_1205);
        float _1209 = 1.0 / _1199;
        float _1211 = _1203 * 6.283185482025146484375;
        float _1213 = cos(_1211);
        float _1215 = _1207 * _1209;
        float _1217 = _1203 * 6.283185482025146484375;
        float _1219 = sin(_1217);
        float _1221 = _1213 * _1215;
        float _1223 = 1.0 / _1221;
        float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1227 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1225;
        float _1229 = 1.0 / _1227;
        float _1231 = _1219 * _1223;
        float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1235 = fma(_1139, _1231, _1233);
        float _1237 = _1235 * _1229;
        float _1239 = precise::clamp(_1237, 0.0, 1.0);
        float _1241 = -_1239;
        float _1243 = _1241 + 1.0;
        _1141 = _1243;
    }
    float _1245 = _1141;
    float _1247 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1249 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1117);
    float _1251 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1121);
    float _1253 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1123);
    bool _1255 = _1191 > 0.0;
    bool _1257 = isnan(_1191);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan(0.0);
    bool _1263 = _1259 || _1261;
    float _1265 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1119);
    float _1267 = _1191 * _1245;
    float _1269 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1249);
    float _1271 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1253);
    float _1273 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1251);
    bool _1275 = _1245 <= 0.0;
    bool _1277 = !_1263;
    bool _1279 = _1275 || _1277;
    float _1281 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1265);
    float _1283 = _1269 + _1271;
    float _1285 = _1273 + _1271;
    float _1287 = _1271 * 0.5;
    float _1289 = _1267 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1291 = _1283 * 0.5;
    float _1293 = _1285 * 0.5;
    float _1295 = fma(_1281, -0.5, _1287);
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _1065;
    out.m_63.y = _1061;
    out.m_63.z = _1069;
    out.gl_Position.x = _1269;
    out.gl_Position.y = _1281;
    out.gl_Position.z = _1273;
    out.gl_Position.w = _1271;
    out.m_65.x = _1291;
    out.m_65.y = _1295;
    out.m_65.z = _1293;
    out.m_65.w = _1271;
    out.m_37.x = _1297;
    if (!_1279)
    {
        return out;
    }
    out.m_37.x = 0.0;
    float _1299 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1299;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _967 = false;
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
        float _1357 = as_type<float>(_100);
        out.gl_Position.z = _1357;
    }
    if (!_88)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1426 = as_type<float>(_136);
        out.gl_Position.z = _1426;
    }
    if (_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _252 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _254 = fma(_244, _140, _246);
    float _256 = fma(_244, _138, _248);
    float _258 = fma(_244, _142, _250);
    float _260 = in.m_43.x;
    float _262 = fma(_254, _168, _158);
    float _264 = fma(_256, _168, _156);
    float _266 = fma(_258, _168, _160);
    float _268 = _252 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _270 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _272 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _274 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _276 = _268 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _278 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _270);
    float _280 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _272);
    float _282 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _274);
    float _284 = in.m_45.y;
    float _286 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _278);
    float _288 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _280);
    float _290 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _282);
    float _292 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _294 = _286 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _296 = _288 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _298 = _290 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _300 = in.m_43.y;
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _304 = _294 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _308 = _296 + _306;
    float _310 = _292 * _260;
    float _312 = _304 * _304;
    float _314 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _316 = _298 + _314;
    int _318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _320 = _318 != 0;
    float _322 = in.m_45.x;
    float _324 = fma(_308, _308, _312);
    float _326 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _328 = trunc(_310);
    int _330 = int(_328);
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _334 = _332 != 0;
    float _336 = fma(_316, _316, _324);
    bool _338 = _260 > 0.5;
    bool _340 = _338 && _320;
    float _342 = _326 * _260;
    float _344 = -_284;
    float _346 = _344 + 1.0;
    float _348 = rsqrt(_336);
    bool _350 = _300 > 0.5;
    float _352 = sqrt(_336);
    int _354 = _330 << 4;
    int _356 = _354 + 1712;
    float _358 = _284;
    float _360 = _346;
    if (_334)
    {
        float _362 = _350 ? _346 : _284;
        _358 = _362;
    }
    float _364 = _358;
    float _366 = _322;
    if (!_320)
    {
        _360 = _322;
    }
    float _368 = _360;
    float _370 = _368;
    if (_340)
    {
        float _372 = -_322;
        float _374 = _372 + 1.0;
        _366 = _374;
    }
    float _376 = _366;
    float _378 = trunc(_342);
    int _380 = int(_378);
    float _382 = _304 * _348;
    float _384 = _308 * _348;
    float _386 = _316 * _348;
    if (_320)
    {
        _370 = _376;
    }
    float _388 = _370;
    float _390 = -_382;
    float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    float _394 = -_384;
    float _396 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[18].w, _308);
    float _398 = -_386;
    float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _316);
    float _402 = _352 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _404 = _392 * _392;
    float _406 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _408 = precise::min(_276, _402);
    float _410 = fma(_396, _396, _404);
    uint _413 = uint(int(uint(_356) >> uint(2)));
    uint _415 = uint(int(uint(int(_413)) >> uint(2)));
    int _417 = int(_413) & 3;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[int(_415)][_417];
    int _421 = int(_413) + 1;
    uint _423 = uint(int(uint(_421) >> uint(2)));
    int _425 = _421 & 3;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[int(_423)][_425];
    int _429 = _380 << 4;
    int _431 = _429 + 1968;
    float _433 = _382 * _408;
    float _435 = _384 * _408;
    float _437 = fma(_400, _400, _410);
    float _439 = _304 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _441 = -_433;
    float _443 = _304 + _441;
    int _445 = _356 + 8;
    uint _447 = uint(int(uint(_445) >> uint(2)));
    uint _449 = uint(int(uint(int(_447)) >> uint(2)));
    int _451 = int(_447) & 3;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[int(_449)][_451];
    float _455 = -_435;
    float _457 = _308 + _455;
    float _459 = fma(_308, (*spvDescriptorSet0.vp_c8)._m0[28].x, _439);
    float _461 = _443 * _443;
    float _463 = _386 * _408;
    float _465 = sqrt(_437);
    float _467 = fma(_316, (*spvDescriptorSet0.vp_c8)._m0[28].z, _459);
    float _469 = fma(_457, _457, _461);
    uint _471 = uint(int(uint(_431) >> uint(2)));
    uint _473 = uint(int(uint(int(_471)) >> uint(2)));
    int _475 = int(_471) & 3;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[int(_473)][_475];
    int _479 = int(_471) + 1;
    uint _481 = uint(int(uint(_479) >> uint(2)));
    int _483 = _479 & 3;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[int(_481)][_483];
    float _487 = -_463;
    float _489 = _316 + _487;
    float _491 = _364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _493 = _467 >= 0.0;
    out.m_47.w = _408;
    float _495 = fma(_489, _489, _469);
    float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _499 = _491 * _406;
    int _501 = _431 + 8;
    uint _503 = uint(int(uint(_501) >> uint(2)));
    uint _505 = uint(int(uint(int(_503)) >> uint(2)));
    int _507 = int(_503) & 3;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[int(_505)][_507];
    float _511 = _348 * _465;
    float _513 = sqrt(_495);
    float _515 = _388 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _517 = 1.0;
    if (_493)
    {
        out.m_37.x = 0.0;
    }
    out.m_49.x = 1.0;
    out.m_49.y = 1.0;
    out.m_49.z = 1.0;
    float _519 = _515 * _497;
    out.m_51.x = _519;
    out.m_51.y = _499;
    float _521 = _348 * _513;
    float _523 = _419 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _525 = _427 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (_493)
    {
        _517 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _527 = _517;
    float _529 = _521 * _511;
    float _531 = _268 * _529;
    float _533 = _453 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _535 = as_type<int>(_453);
    if (_493)
    {
        float _537 = _527 * 5.0;
        _535 = as_type<int>(_537);
    }
    int _539 = _535;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _531;
    float _543 = _477 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _545 = _485 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _547 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _549 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _551 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _553 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_493)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2126 = as_type<float>(_539);
        out.gl_Position.z = _2126;
    }
    float _557 = _509 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_55.x = _547;
    out.m_55.y = _551;
    out.m_55.z = _549;
    out.m_55.w = _541;
    float _559 = _557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _553;
    out.m_57.y = _555;
    out.m_57.z = _559;
    if (_493)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _561 = -_382;
    float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[18].w, _294);
    float _565 = -_384;
    float _567 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[18].w, _296);
    float _569 = -_386;
    float _571 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[18].w, _298);
    float _573 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _575 = _563 + _573;
    float _577 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _579 = _567 + _577;
    float _581 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _583 = _571 + _581;
    float _585 = _575 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _587 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[28].x, _585);
    float _589 = fma(_583, (*spvDescriptorSet0.vp_c8)._m0[28].z, _587);
    bool _591 = _589 >= 0.0;
    float _593 = _583;
    if (_591)
    {
        _593 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _595 = _593;
    int _597 = as_type<int>(_595);
    if (_591)
    {
        out.m_37.x = 0.0;
    }
    if (_591)
    {
        float _599 = _595 * 5.0;
        _597 = as_type<int>(_599);
    }
    int _601 = _597;
    if (_591)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2235 = as_type<float>(_601);
        out.gl_Position.z = _2235;
    }
    if (_591)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _603 = in.m_59.x;
    float _605 = in.m_59.y;
    float _607 = in.m_59.z;
    float _609 = _166 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _613 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _611;
    float _615 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _617 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _619 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _617;
    float _621 = _613 * _613;
    float _623 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _625 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _623;
    float _627 = _615 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _629 = fma(_619, _619, _621);
    float _631 = _627 * _529;
    float _633 = fma(_625, _625, _629);
    float _635 = _609 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _637 = sqrt(_633);
    float _639 = _635 * _529;
    float _641 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _643 = precise::clamp(_641, 0.0, 1.0);
    float _645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _605);
    float _647 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _607);
    float _649 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _603);
    float _651 = rsqrt(_633);
    float _653 = _631 * _645;
    float _655 = _639 * _647;
    float _657 = _531 * _649;
    float _659 = _653 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _661 = _653 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _663 = _653 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _665 = _637 * 0.066666670143604278564453125;
    float _667 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[25].x, _659);
    float _669 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[24].x, _661);
    float _671 = fma(_643, -0.64999997615814208984375, 1.0);
    float _673 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[26].x, _663);
    float _675 = precise::max(_665, 1.0);
    float _677 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[25].z, _667);
    float _679 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[24].z, _669);
    float _681 = _651 * (-0.20000000298023223876953125);
    float _683 = precise::min(_675, 2.0);
    float _685 = _677 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _687 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[26].z, _673);
    float _689 = fma(_613, _681, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _691 = fma(_619, _681, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _693 = _683 * _671;
    float _695 = _679 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _697 = _294 + _685;
    float _699 = -_689;
    float _701 = _699 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _703 = _687 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _705 = _296 + _695;
    float _707 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _709 = _697 + _707;
    float _711 = -_691;
    float _713 = _711 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _715 = _701 * _701;
    float _717 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _719 = _705 + _717;
    float _721 = fma(_709, _693, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _723 = _298 + _703;
    float _725 = fma(_713, _713, _715);
    float _727 = fma(_719, _693, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _729 = -_721;
    float _731 = _729 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _733 = fma(_625, _681, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _735 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _737 = _723 + _735;
    float _739 = -_727;
    float _741 = _739 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _743 = _731 * _731;
    float _745 = -_733;
    float _747 = _745 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _749 = fma(_737, _693, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _751 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _753 = _689 + _751;
    float _755 = fma(_741, _741, _743);
    float _757 = fma(_747, _747, _725);
    float _759 = -_749;
    float _761 = _759 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _763 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _765 = _691 + _763;
    float _767 = _753 * _753;
    float _769 = fma(_761, _761, _755);
    float _771 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _773 = _733 + _771;
    float _775 = fma(_765, _765, _767);
    float _777 = sqrt(_757);
    float _779 = fma(_773, _773, _775);
    float _781 = sqrt(_769);
    float _783 = rsqrt(_779);
    float _785 = -_777;
    float _787 = _781 + _785;
    float _789 = _783 * _787;
    float _791 = -_789;
    float _793 = fma(_773, _791, _749);
    float _795 = -_789;
    float _797 = fma(_765, _795, _727);
    float _799 = -_789;
    float _801 = fma(_753, _799, _721);
    float _803 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _805 = _793 + _803;
    float _807 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _809 = _797 + _807;
    float _811 = _805 * _805;
    float _813 = fma(_809, _809, _811);
    float _815 = sqrt(_813);
    bool _817 = _815 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _819 = _811;
    float _821 = _783;
    float _823 = _797;
    if (!_817)
    {
        _819 = _793;
    }
    float _825 = _819;
    float _827 = _825;
    if (!_817)
    {
        _821 = _801;
    }
    float _829 = _821;
    bool _831 = !_817;
    float _833 = _829;
    if (!_831)
    {
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _837 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _839 = _815 + _837;
        float _841 = _801 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _843 = _839 * _835;
        float _845 = rsqrt(_813);
        float _847 = _843 * 0.15915493667125701904296875;
        float _849 = _847 * 6.283185482025146484375;
        float _851 = cos(_849);
        float _853 = _847 * 6.283185482025146484375;
        float _855 = sin(_853);
        float _857 = _851 + (-1.0);
        float _859 = _857 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _861 = fma(_855, _841, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _863 = fma(_801, _851, _859);
        float _865 = _845 * _861;
        float _867 = fma(_809, _865, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _869 = fma(_805, _865, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _833 = _863;
        _823 = _867;
        _827 = _869;
    }
    float _871 = _833;
    float _873 = _823;
    float _875 = _827;
    float _877 = -_433;
    float _879 = _877 + _871;
    float _881 = -_435;
    float _883 = _881 + _873;
    float _885 = -_463;
    float _887 = _885 + _875;
    out.m_55.x = _547;
    out.m_55.y = _551;
    out.m_55.z = _549;
    out.m_55.w = _541;
    float _889 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _891 = _879 + _889;
    float _893 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _895 = _883 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _899 = _887 + _897;
    out.m_57.x = _553;
    out.m_57.y = _555;
    out.m_57.z = _559;
    float _901 = _891 * _891;
    float _903 = -_435;
    float _905 = _296 + _903;
    float _907 = -_433;
    float _909 = _294 + _907;
    float _911 = fma(_895, _895, _901);
    float _913 = -_463;
    float _915 = _298 + _913;
    float _917 = fma(_899, _899, _911);
    float _919 = sqrt(_917);
    bool _921 = _919 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _923 = isnan(_919);
    bool _925 = _921 || _923;
    bool _927 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _929 = _925 || _927;
    float _931 = _911;
    if (!_929)
    {
        _931 = 1.0;
    }
    float _933 = _931;
    bool _935 = !_929;
    float _937 = _933;
    if (!_935)
    {
        bool _939 = _919 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _941 = isnan(_919);
        bool _943 = _939 || _941;
        bool _945 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _947 = _943 || _945;
        if (!_947)
        {
            float _949 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _951 = _919 + _949;
            float _953 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _955 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _953;
            float _957 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _959 = _957 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _961 = 1.0 / _955;
            float _963 = _951 * _961;
            float _965 = fma(_963, _959, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _937 = _965;
            _967 = true;
        }
        else
        {
            bool _969 = _919 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _971 = isnan(_919);
            bool _973 = _969 || _971;
            bool _975 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _977 = _973 || _975;
            if (!_977)
            {
                float _979 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _981 = _919 + _979;
                float _983 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _985 = _983 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _987 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _989 = _987 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _991 = 1.0 / _985;
                float _993 = _981 * _991;
                float _995 = fma(_993, _989, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _937 = _995;
                _967 = true;
            }
            else
            {
                _937 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _967 = false;
    float _997 = _937;
    float _999 = -_382;
    float _1001 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[18].w, _909);
    float _1003 = -_384;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    float _1007 = -_386;
    float _1009 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[18].w, _915);
    float _1011 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1013 = _879 + _1011;
    float _1015 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1017 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1019 = _887 + _1017;
    float _1021 = fma(_1013, _997, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1023 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1015);
    out.m_61.x = _1005;
    out.m_61.y = _1001;
    out.m_61.z = _1009;
    float _1025 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1023);
    float _1027 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1029 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1031 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1027);
    float _1033 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1035 = _883 + _1033;
    float _1037 = 1.0 / _1029;
    float _1039 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1031);
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1043 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.5);
    bool _1051 = _1047 || _1049;
    float _1053 = _1041 + _1029;
    float _1055 = fma(_1035, _997, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1057 = fma(_1019, _997, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1059 = -_382;
    float _1061 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1021);
    float _1063 = -_384;
    float _1065 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1055);
    float _1067 = -_386;
    float _1069 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1057);
    float _1071 = _1053 * _1037;
    float _1073 = _1071 * 0.5;
    float _1075 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1077 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1079 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1083 = fma(_1073, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1081);
    float _1085 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1075);
    float _1087 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1077);
    float _1089 = _1061 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1091 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1079);
    float _1093 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1085);
    float _1095 = 1.0 / _1083;
    float _1097 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1099 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1089);
    float _1101 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1103 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1091);
    float _1105 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1107 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1099);
    float _1109 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1111 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1113 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1115 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1117 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1109);
    float _1119 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1111);
    float _1121 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1113);
    float _1123 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1115);
    float _1125 = _1109;
    float _1127 = _1105;
    if (_1051)
    {
        _1125 = 1.0;
    }
    float _1129 = _1125;
    float _1131 = _1103 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1133 = _1129;
    if (_1051)
    {
        _1127 = 1.0;
    }
    float _1135 = _1127;
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1139 = _1095 * _1137;
    float _1141 = _1135;
    if (!_1051)
    {
        float _1143 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1145 = _1143 * 0.15915493667125701904296875;
        float _1147 = _1145 * 6.283185482025146484375;
        float _1149 = cos(_1147);
        float _1151 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1153 = _1151 * 0.15915493667125701904296875;
        float _1155 = _1145 * 6.283185482025146484375;
        float _1157 = sin(_1155);
        float _1159 = 1.0 / _1149;
        float _1161 = _1153 * 6.283185482025146484375;
        float _1163 = cos(_1161);
        float _1165 = _1157 * _1159;
        float _1167 = _1153 * 6.283185482025146484375;
        float _1169 = sin(_1167);
        float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1173 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1171;
        float _1175 = _1163 * _1165;
        float _1177 = 1.0 / _1173;
        float _1179 = 1.0 / _1175;
        float _1181 = _1169 * _1179;
        float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1185 = fma(_1139, _1181, _1183);
        float _1187 = _1185 * _1177;
        float _1189 = precise::clamp(_1187, 0.0, 1.0);
        _1133 = _1189;
    }
    float _1191 = _1133;
    if (!_1051)
    {
        float _1193 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1195 = _1193 * 0.15915493667125701904296875;
        float _1197 = _1195 * 6.283185482025146484375;
        float _1199 = cos(_1197);
        float _1201 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1203 = _1201 * 0.15915493667125701904296875;
        float _1205 = _1195 * 6.283185482025146484375;
        float _1207 = sin(_1205);
        float _1209 = 1.0 / _1199;
        float _1211 = _1203 * 6.283185482025146484375;
        float _1213 = cos(_1211);
        float _1215 = _1207 * _1209;
        float _1217 = _1203 * 6.283185482025146484375;
        float _1219 = sin(_1217);
        float _1221 = _1213 * _1215;
        float _1223 = 1.0 / _1221;
        float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1227 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1225;
        float _1229 = 1.0 / _1227;
        float _1231 = _1219 * _1223;
        float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1235 = fma(_1139, _1231, _1233);
        float _1237 = _1235 * _1229;
        float _1239 = precise::clamp(_1237, 0.0, 1.0);
        float _1241 = -_1239;
        float _1243 = _1241 + 1.0;
        _1141 = _1243;
    }
    float _1245 = _1141;
    float _1247 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1249 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1117);
    float _1251 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1121);
    float _1253 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1123);
    bool _1255 = _1191 > 0.0;
    bool _1257 = isnan(_1191);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan(0.0);
    bool _1263 = _1259 || _1261;
    float _1265 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1119);
    float _1267 = _1191 * _1245;
    float _1269 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1249);
    float _1271 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1253);
    float _1273 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1251);
    bool _1275 = _1245 <= 0.0;
    bool _1277 = !_1263;
    bool _1279 = _1275 || _1277;
    float _1281 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1265);
    float _1283 = _1269 + _1271;
    float _1285 = _1273 + _1271;
    float _1287 = _1271 * 0.5;
    float _1289 = _1267 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1291 = _1283 * 0.5;
    float _1293 = _1285 * 0.5;
    float _1295 = fma(_1281, -0.5, _1287);
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _1065;
    out.m_63.y = _1061;
    out.m_63.z = _1069;
    out.gl_Position.x = _1269;
    out.gl_Position.y = _1281;
    out.gl_Position.z = _1273;
    out.gl_Position.w = _1271;
    out.m_65.x = _1291;
    out.m_65.y = _1295;
    out.m_65.z = _1293;
    out.m_65.w = _1271;
    out.m_37.x = _1297;
    if (!_1279)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_37.x = 0.0;
    float _1299 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1299;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

