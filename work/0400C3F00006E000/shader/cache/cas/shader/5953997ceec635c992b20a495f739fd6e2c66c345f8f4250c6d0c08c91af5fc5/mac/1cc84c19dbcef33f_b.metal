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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
};

struct main0_out
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_62 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
    float4 m_50 [[user(locn6)]];
    float4 m_54 [[user(locn7)]];
    float4 m_42 [[user(locn8)]];
    float4 m_56 [[user(locn9)]];
    float4 m_58 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_40 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_30.w;
    float _78 = trunc(_76);
    int _81 = int(_78);
    bool _85 = _81 >= 1;
    float _87 = 0.0;
    float _89 = as_type<float>(_81);
    if (!_85)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _87;
    float _93 = _91;
    if (!_85)
    {
        out.m_33.x = 0.0;
    }
    int _95 = 0;
    if (!_85)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_85)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1645 = as_type<float>(_99);
        out.gl_Position.z = _1645;
    }
    if (!_85)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_35.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_81);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    if (_127)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _89;
    if (_127)
    {
        out.m_33.x = 0.0;
    }
    if (_127)
    {
        float _131 = _129 * 5.0;
        _101 = as_type<int>(_131);
    }
    int _133 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1713 = as_type<float>(_133);
        out.gl_Position.z = _1713;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    int _139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _141 = _139 != 0;
    float _143 = in.m_40.x;
    float _145 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _147 = _145 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _149 = in.m_40.z;
    float _151 = in.m_40.w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = rint((*spvDescriptorSet0.vp_c7)._m0[0].x);
    float _165 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = in.m_40.y;
    float _169 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _171 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _173 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _175 = _165;
    if (!_141)
    {
        float _177 = in.m_40.z;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = 1.0 / _147;
    float _183 = _169 * _137;
    float _185 = 0.0;
    if (!_161)
    {
        float _187 = _165 * _165;
        float _189 = _187 * 0.5;
        _185 = _189;
    }
    float _191 = _185;
    int _193 = as_type<int>(_135) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_135) & 2;
    bool _199 = _197 != 0;
    int _201 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _203 = _201 != 0;
    float _205 = _191;
    if (!_161)
    {
        float _207 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _207;
    }
    float _209 = _205;
    float _211 = 0.0;
    float _213 = _209;
    if (_141)
    {
        _211 = _143;
    }
    float _215 = _211;
    int _217 = int(_195);
    int _219 = _199 ? 2 : 0;
    int _221 = _217 | _219;
    int _223 = _203 ? 4 : 0;
    int _225 = _221 | _223;
    int _227 = false ? 8 : 0;
    int _229 = _225 | _227;
    int _231 = _161 ? 16 : 0;
    int _233 = _229 | _231;
    int _235 = false ? 32 : 0;
    int _237 = _233 | _235;
    int _239 = _141 ? 64 : 0;
    int _241 = _237 | _239;
    int _243 = _241 & 4;
    bool _245 = _151 > 0.5;
    bool _247 = _149 > 0.5;
    float _249 = _215;
    float _251 = as_type<float>(_243);
    if (!_141)
    {
        _249 = _149;
    }
    float _253 = _249;
    bool _255 = !_195;
    float _257 = _255 ? (-0.5) : 0.5;
    bool _259 = !_199;
    float _261 = _259 ? (-0.5) : 0.5;
    bool _263 = !_161;
    float _265 = _179;
    if (!_263)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = _165 * _269;
        float _279 = 1.0 / _273;
        float _281 = _275 * 0.693147182464599609375;
        float _283 = exp2(_277);
        float _285 = 1.0 / _281;
        float _287 = _283 + (-1.0);
        float _289 = -_287;
        float _291 = fma(_289, _285, _165);
        float _293 = _291 * _279;
        float _295 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _295;
        _251 = _285;
    }
    float _297 = _213;
    float _299 = _251;
    bool _301 = !_161;
    float _303 = _299;
    if (!_301)
    {
        float _305 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = log2(_305);
        float _309 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _311 = _309 + 1.0;
        float _313 = 1.0 / _311;
        float _315 = _165 * _307;
        float _317 = exp2(_315);
        float _319 = -_317;
        float _321 = _319 + 1.0;
        float _323 = _321 * _313;
        _173 = _311;
        _175 = _323;
    }
    float _325 = _173;
    float _327 = _175;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _333 = _163 * 0.100000001490116119384765625;
    bool _335 = _167 > 0.5;
    float _337 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.02500000037252902984619140625;
    int _339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _341 = _339 != 0;
    float _343 = 1.0 / _331;
    float _345 = -_261;
    int _347 = _245 ? as_type<int>(_345) : as_type<int>(_261);
    float _349 = _297 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = -_261;
    float _353 = _351 + 0.5;
    float _355 = -_257;
    int _357 = _247 ? as_type<int>(_355) : as_type<int>(_257);
    float _359 = floor(_337);
    int _361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _363 = _361 != 0;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _367 = _365 != 0;
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _371 = _369 != 0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _379 = -_257;
    int _381 = _335 ? as_type<int>(_379) : as_type<int>(_257);
    out.m_42.y = _353;
    float _383 = 1.0 / _375;
    float _385 = 0.0;
    float _387 = _325;
    if (!_141)
    {
        _385 = _167;
    }
    float _389 = _385;
    bool _391 = !_341;
    float _393 = _391 ? _257 : as_type<float>(_357);
    float _395 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _397 = !_367;
    float _399 = _397 ? _257 : as_type<float>(_381);
    float _401 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _403 = _389;
    if (!_141)
    {
        _387 = _389;
    }
    float _405 = _387;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _411 = -_359;
    float _413 = _337 + _411;
    float _415 = _405;
    float _417 = _413;
    if (_141)
    {
        _403 = _167;
    }
    float _419 = _403;
    float _421 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[88].w, _377);
    float _423 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _401);
    bool _425 = _143 > 0.5;
    float _427 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _395);
    float _429 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _431 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[87].w, _421);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _437 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _429);
    float _439 = -_257;
    int _441 = _425 ? as_type<int>(_439) : as_type<int>(_257);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _449 = _447 != 0;
    float _451 = 1.0 / _435;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _455 = _453 != 0;
    float _457 = -_431;
    float _459 = _457 + 1.0;
    bool _461 = !_455;
    float _463 = _461 ? _257 : as_type<float>(_441);
    float _465 = 1.0 / _409;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _471 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _473 = _463 + 0.5;
    float _475 = 1.0 / _445;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _477;
    float _481 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _427);
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _485 = _479 * _181;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _495 = 1.0 / _469;
    float _497 = _419;
    if (!_141)
    {
        _303 = _179;
    }
    float _499 = _303;
    float _501 = _489 * _383;
    float _503 = _493 * _465;
    float _505 = _499;
    if (_141)
    {
        _505 = _419;
    }
    float _507 = _505;
    float _509 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[88].z, _483);
    if (_141)
    {
        _265 = _419;
    }
    float _511 = _265;
    float _513 = floor(_333);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _519;
    if (_141)
    {
        _415 = _143;
    }
    float _523 = _415;
    float _525 = _517 * _343;
    float _527 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _183);
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _537 = _521 * _475;
    float _539 = _531 * _495;
    float _541 = _535 * _451;
    float _543 = _475;
    float _545 = (*spvDescriptorSet0.vp_c10)._m0[6].x;
    if (_471)
    {
        float _547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _543 = _547;
    }
    float _549 = _543;
    float _551 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _423);
    if (_471)
    {
        float _553 = _143 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _545 = _553;
    }
    float _555 = _545;
    float _557 = fma(_513, -0.5, -1.5);
    float _559 = _555;
    if (!_141)
    {
        _497 = _143;
    }
    float _561 = _497;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _565 = rsqrt(_551);
    float _567 = fma((*spvDescriptorSet0.vp_c9)._m0[191].w, 2.0, -1.0);
    float _569 = _253 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _571 = _567;
    if (_471)
    {
        float _573 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[14].x, _413);
        _559 = _573;
    }
    float _575 = _559;
    float _577 = _567 * _557;
    float _579 = -_563;
    float _581 = fma(_569, 2.0, _579);
    float _583 = floor(_527);
    if (_471)
    {
        float _585 = _575 * _549;
        _571 = _585;
    }
    float _587 = _571;
    float _589 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _437);
    float _591 = _561 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _595 = 0.0;
    if (_471)
    {
        float _597 = floor(_587);
        _595 = _597;
    }
    float _599 = _595;
    float _601 = _257 * _565;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _607 = _601 * (*spvDescriptorSet0.vp_c9)._m0[194].z;
    float _609 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[83].z, _603);
    float _611 = _523 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _613 = -_583;
    float _615 = _527 + _613;
    float _617 = precise::min(_513, 1.0);
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _621 = -_593;
    float _623 = fma(_611, 2.0, _621);
    float _625 = _527 * 6.283185482025146484375;
    float _627 = _617 + (-1.0);
    float _629 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[83].w, _619);
    float _631 = 2.650000095367431640625 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _633 = 2.650000095367431640625 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _635 = _617 * _577;
    float _637 = 2.650000095367431640625 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _639 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[191].w, 1.0);
    if (_471)
    {
        float _641 = -_599;
        float _643 = _587 + _641;
        _417 = _643;
    }
    float _645 = _417;
    float _647 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[8].x, _631);
    float _649 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[10].x, _637);
    float _651 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[9].x, _633);
    bool _653 = _615 < 0.5;
    float _655 = float(_653);
    float _657 = _507 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _661 = _625 * 0.15915493667125701904296875;
    float _663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _665 = -_615;
    float _667 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _669 = -_655;
    float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _673 = fma(_657, -2.0, _659);
    float _675 = -_617;
    float _677 = _675 + 1.0;
    float _679 = in.m_35.x;
    float _681 = in.m_35.y;
    float _683 = in.m_35.z;
    float _685 = -_117;
    float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[81].x, _623);
    float _689 = fma(_591, -2.0, _605);
    float _691 = _661 * 6.283185482025146484375;
    float _693 = cos(_691);
    float _695 = fma(_607, _677, _601);
    float _697 = _297 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _699 = -_261;
    int _701 = _335 ? as_type<int>(_699) : as_type<int>(_261);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _705 = _645 + _703;
    float _707 = -_261;
    int _709 = _247 ? as_type<int>(_707) : as_type<int>(_261);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _713 = _645 + _711;
    float _715 = _663 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _717 = _393 + 0.5;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _721 = _719 != 0;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _725 = _723 != 0;
    float _727 = rsqrt(_481);
    float _729 = in.m_44.w;
    float _731 = fma(_715, _717, _687);
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _735 = _297 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _737 = fma(_693, 0.5, 0.5);
    float _739 = _695 * _639;
    out.m_46.w = _733;
    float _741 = -_737;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _745 = fma(_327, _679, _697);
    float _747 = fma(_327, _681, _735);
    float _749 = fma(_327, _683, _349);
    float _751 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[87].z, _509);
    float _753 = in.m_30.x;
    float _755 = in.m_30.y;
    float _757 = in.m_30.z;
    float _759 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _609);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _763 = _645 + _761;
    float _765 = -_117;
    float _767 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[86].x, _581);
    float _769 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _629);
    float _771 = fma(_485, _705, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _773 = fma(_525, _763, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _775 = fma(_501, _713, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _779 = _645 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _783 = _645 + _781;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _789 = _645 + _787;
    float _791 = fma(_539, _779, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _793 = fma(_537, _783, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _797 = _645 + _795;
    out.m_48.w = _785;
    float _799 = fma(_503, _789, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _801 = sqrt(_589);
    float _803 = fma(_541, _797, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _805 = !_449;
    float _807 = _805 ? _261 : as_type<float>(_701);
    float _809 = in.m_44.x;
    float _811 = in.m_44.y;
    float _813 = _261 * _727;
    bool _815 = !_363;
    float _817 = _815 ? _261 : as_type<float>(_347);
    float _819 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _673);
    float _821 = fma(_745, _729, _753);
    float _823 = fma(_747, _729, _755);
    float _825 = fma(_749, _729, _757);
    bool _827 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _829 = isnan(_645);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[86].y, _689);
    bool _841 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _843 = isnan(_645);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _855 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _857 = isnan(_645);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = -_837;
    float _869 = _867 + 1.0;
    bool _871 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _873 = isnan(_645);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = -_851;
    float _885 = _883 + 1.0;
    bool _887 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _889 = isnan(_645);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = _865 * _869;
    bool _901 = !_371;
    float _903 = _901 ? _261 : as_type<float>(_709);
    float _905 = -_881;
    float _907 = _905 + 1.0;
    float _909 = _881 * _885;
    float _911 = _771 * _899;
    float _913 = -_865;
    float _915 = _913 + 1.0;
    float _917 = _837 * _907;
    bool _919 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _921 = isnan(_645);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = -_897;
    float _933 = _931 + 1.0;
    float _935 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[159].x, _911);
    bool _937 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _939 = isnan(_645);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = _809 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _951 = _851 * _933;
    float _953 = fma(_773, _917, _935);
    float _955 = -_929;
    float _957 = _955 + 1.0;
    float _959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _961 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _963 = isnan(_645);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = fma(_775, _909, _953);
    float _975 = _801 * 7.0;
    float _977 = -_947;
    float _979 = _977 + 1.0;
    float _981 = _897 * _957;
    float _983 = fma(_799, _951, _973);
    float _985 = fma(_975, (*spvDescriptorSet0.vp_c10)._m0[8].z, _647);
    float _987 = fma(_975, (*spvDescriptorSet0.vp_c10)._m0[9].z, _651);
    float _989 = fma(_975, (*spvDescriptorSet0.vp_c10)._m0[10].z, _649);
    float _991 = -_971;
    float _993 = _991 + 1.0;
    float _995 = _929 * _979;
    float _997 = _949 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _999 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _739);
    float _1001 = fma(_791, _981, _983);
    float _1003 = _947 * _993;
    float _1005 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1007 = _997 * _999;
    float _1009 = fma(_803, _995, _1001);
    float _1011 = _853 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1013 = _817 + (-0.5);
    float _1015 = _959 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1017 = _903 + (-0.5);
    float _1019 = fma(_793, _1003, _1009);
    float _1021 = -_1011;
    float _1023 = -_819;
    float _1025 = fma(_1021, _1013, _1023);
    float _1027 = -_759;
    float _1029 = _1027 + 1.0;
    float _1031 = -_1015;
    float _1033 = -_839;
    float _1035 = fma(_1031, _1017, _1033);
    float _1037 = _823 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1039 = _823 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1041 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1019);
    float _1043 = _823 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1047 = _473 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1049 = -_1029;
    float _1051 = fma(_393, _1049, _731);
    float _1053 = _677 * _1041;
    float _1055 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1037);
    float _1057 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1039);
    float _1059 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1043);
    float _1061 = _1047 * _1005;
    bool _1063 = _813 >= 0.0;
    bool _1065 = isnan(_813);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan(0.0);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = _813 * (*spvDescriptorSet0.vp_c9)._m0[194].z;
    float _1077 = _1075 * 2.0;
    float _1079 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[194].z, _1041);
    float _1081 = -_807;
    float _1083 = _1081 + 0.5;
    float _1085 = -_769;
    float _1087 = _1085 + 1.0;
    float _1089 = _1073 * _1077;
    float _1091 = fma(_1079, _1073, _813);
    float _1093 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1095 = fma(_817, _1087, _1025);
    float _1097 = _811 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1099 = fma(_677, _1089, _1091);
    float _1101 = _1093 * _1045;
    float _1103 = fma(_825, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1057);
    float _1105 = fma(_825, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1055);
    float _1107 = _1099 * _639;
    float _1109 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    out.m_50.x = _1061;
    out.m_50.y = _1101;
    out.m_50.z = _1051;
    out.m_50.w = _1095;
    float _1111 = _1103 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1113 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1107);
    float _1115 = _1105 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    out.m_52.y = _639;
    float _1117 = _739 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1119 = _1109 * _1113;
    float _1121 = fma(_825, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1059);
    float _1123 = _987 + _1111;
    float _1125 = _985 + _1115;
    float _1127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1129 = _1121 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1131 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1133 = -_751;
    float _1135 = _1133 + 1.0;
    float _1137 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1139 = _1119 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1141 = _1119 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1143 = _989 + _1129;
    float _1145 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1147 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1149 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1151 = fma(_1007, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1139);
    float _1153 = fma(_1117, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1145);
    float _1155 = fma(_1117, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1147);
    float _1157 = fma(_1117, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1149);
    float _1159 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1161 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1163 = fma(_1007, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1141);
    float _1165 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1131);
    float _1167 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1159);
    float _1169 = fma(_1161, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1151);
    float _1171 = fma(_1161, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1163);
    float _1173 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1165);
    float _1175 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1167);
    float _1177 = _1143 + _1169;
    float _1179 = _1125 + _1171;
    float _1181 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1183 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1187 = _1177 + _1185;
    float _1189 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1191 = _1179 + _1189;
    bool _1193 = !_721;
    int _1195 = _1193 ? 0 : 1;
    float _1197 = _1183 + _1181;
    float _1199 = _1187 * _1187;
    float _1201 = 1.0 / _1181;
    float _1203 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1205 = _399 + 0.5;
    float _1207 = fma(_1191, _1191, _1199);
    int _1209 = abs(_1195);
    float _1211 = fma(_903, _459, _1035);
    int _1213 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _1215 = _1213 != 0;
    float _1217 = fma(_1203, _1205, _767);
    float _1219 = sqrt(_1207);
    float _1221 = _1155 + (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _1223 = !_1215;
    int _1225 = _1223 ? 0 : 1;
    float _1227 = -_1135;
    float _1229 = fma(_399, _1227, _1217);
    float _1231 = float(_1209);
    float _1233 = _1119 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1235 = abs(_1225);
    float _1237 = _1197 * _1201;
    float _1239 = _1237 * 0.5;
    out.m_54.x = _1229;
    out.m_54.y = _1211;
    float _1241 = abs(_667);
    float _1243 = _1231 * _1241;
    float _1245 = _1153 + (*spvDescriptorSet0.vp_c10)._m0[8].z;
    bool _1247 = !_725;
    int _1249 = _1247 ? 0 : 1;
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1253 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1251);
    bool _1255 = _1219 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1257 = fma(_1007, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1233);
    int _1259 = abs(_1249);
    float _1261 = _1157 + (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1263 = float(_1235);
    float _1265 = 1.0 / _1253;
    float _1267 = fma(_1161, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1257);
    out.m_56.x = _1245;
    out.m_56.y = _1221;
    out.m_56.z = _1261;
    float _1269 = fma(_1263, _743, _1243);
    bool _1271 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1273 = isnan(0.5);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1279 = _1275 || _1277;
    float _1281 = _1123 + _1267;
    float _1283 = float(_1259);
    float _1285 = _1245;
    float _1287 = _1261;
    float _1289 = _1283;
    float _1291 = as_type<float>(_1259);
    float _1293 = _1187;
    if (!_1255)
    {
        _1285 = _1179;
    }
    float _1295 = _1285;
    float _1297 = _1295;
    if (!_1255)
    {
        _1287 = _1177;
    }
    float _1299 = _1287;
    float _1301 = abs(_671);
    float _1303 = fma(_1283, _1301, _1269);
    float _1305 = _1299;
    if (!_1255)
    {
        _1289 = _1281;
    }
    float _1307 = _1289;
    bool _1309 = !_1255;
    float _1311 = _1307;
    if (!_1309)
    {
        float _1313 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1317 = _1219 + _1315;
        float _1319 = _1281 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1321 = rsqrt(_1207);
        float _1323 = _1317 * _1313;
        float _1325 = _1323 * 0.15915493667125701904296875;
        float _1327 = _1325 * 6.283185482025146484375;
        float _1329 = cos(_1327);
        float _1331 = _1325 * 6.283185482025146484375;
        float _1333 = sin(_1331);
        float _1335 = _1329 + (-1.0);
        float _1337 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1339 = fma(_1333, _1319, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1341 = fma(_1281, _1329, _1337);
        float _1343 = _1321 * _1339;
        float _1345 = fma(_1191, _1343, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1347 = fma(_1187, _1343, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1311 = _1341;
        _1297 = _1345;
        _1305 = _1347;
        _1291 = _1343;
    }
    float _1349 = _1311;
    float _1351 = _1297;
    float _1353 = _1305;
    float _1355 = _1291;
    float _1357 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1359 = _1355;
    if (_1279)
    {
        _1359 = 1.0;
    }
    float _1361 = _1359;
    float _1363 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1365 = _1361;
    if (_1279)
    {
        _1293 = 1.0;
    }
    float _1367 = _1293;
    float _1369 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1357);
    float _1371 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1373 = _1265 * _1371;
    float _1375 = _1367;
    if (!_1279)
    {
        float _1377 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1379 = _1377 * 0.15915493667125701904296875;
        float _1381 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1383 = _1379 * 6.283185482025146484375;
        float _1385 = cos(_1383);
        float _1387 = _1381 * 0.15915493667125701904296875;
        float _1389 = _1379 * 6.283185482025146484375;
        float _1391 = sin(_1389);
        float _1393 = 1.0 / _1385;
        float _1395 = _1387 * 6.283185482025146484375;
        float _1397 = cos(_1395);
        float _1399 = _1391 * _1393;
        float _1401 = _1387 * 6.283185482025146484375;
        float _1403 = sin(_1401);
        float _1405 = _1397 * _1399;
        float _1407 = 1.0 / _1405;
        float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1411 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1409;
        float _1413 = 1.0 / _1411;
        float _1415 = _1403 * _1407;
        float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1419 = fma(_1373, _1415, _1417);
        float _1421 = _1419 * _1413;
        float _1423 = precise::clamp(_1421, 0.0, 1.0);
        _1365 = _1423;
    }
    float _1425 = _1365;
    if (!_1279)
    {
        float _1427 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1429 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1431 = _1427 * 0.15915493667125701904296875;
        float _1433 = _1429 * 0.15915493667125701904296875;
        float _1435 = _1431 * 6.283185482025146484375;
        float _1437 = cos(_1435);
        float _1439 = _1431 * 6.283185482025146484375;
        float _1441 = sin(_1439);
        float _1443 = 1.0 / _1437;
        float _1445 = _1433 * 6.283185482025146484375;
        float _1447 = cos(_1445);
        float _1449 = _1441 * _1443;
        float _1451 = _1433 * 6.283185482025146484375;
        float _1453 = sin(_1451);
        float _1455 = _1447 * _1449;
        float _1457 = 1.0 / _1455;
        float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1461 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1459;
        float _1463 = 1.0 / _1461;
        float _1465 = _1453 * _1457;
        float _1467 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1469 = fma(_1373, _1465, _1467);
        float _1471 = _1469 * _1463;
        float _1473 = precise::clamp(_1471, 0.0, 1.0);
        float _1475 = -_1473;
        float _1477 = _1475 + 1.0;
        _1375 = _1477;
    }
    float _1479 = _1375;
    float _1481 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1363);
    float _1483 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1369);
    float _1485 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1487 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1489 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1481);
    float _1491 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1493 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1485);
    float _1495 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1487);
    float _1497 = _1489 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1499 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1501 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1503 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1505 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1493);
    float _1507 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1509 = _1425 > 0.0;
    bool _1511 = isnan(_1425);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan(0.0);
    bool _1517 = _1513 || _1515;
    float _1519 = _1425 * _1479;
    float _1521 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1499);
    float _1523 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1501);
    float _1525 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1503);
    float _1527 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1495);
    float _1529 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1531 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1507);
    bool _1533 = _1479 <= 0.0;
    bool _1535 = !_1517;
    bool _1537 = _1533 || _1535;
    float _1539 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1541 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1543 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1521);
    float _1545 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1523);
    float _1547 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1525);
    float _1549 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1531);
    float _1551 = _1303 * _1539;
    float _1553 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1543);
    float _1555 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1545);
    float _1557 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1547);
    float _1559 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1549);
    float _1561 = _1551 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1565 = _1351 + _1563;
    float _1567 = _1553 + _1559;
    float _1569 = _1557 + _1559;
    float _1571 = _1559 * 0.5;
    float _1573 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1575 = _1349 + _1573;
    float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1579 = _1353 + _1577;
    float _1581 = _1567 * 0.5;
    float _1583 = _1569 * 0.5;
    float _1585 = fma(_1555, -0.5, _1571);
    out.m_58.x = _1351;
    out.m_58.y = _1349;
    out.m_58.z = _1353;
    out.m_60.x = _1565;
    out.m_60.y = _1575;
    out.m_60.z = _1579;
    out.gl_Position.x = _1553;
    out.gl_Position.y = _1555;
    out.gl_Position.z = _1557;
    out.gl_Position.w = _1559;
    out.m_33.x = _1561;
    out.m_62.x = _1581;
    out.m_62.y = _1585;
    out.m_62.z = _1583;
    out.m_62.w = _1559;
    if (!_1537)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1587 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1587;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_30.w;
    float _78 = trunc(_76);
    int _81 = int(_78);
    bool _85 = _81 >= 1;
    float _87 = 0.0;
    float _89 = as_type<float>(_81);
    if (!_85)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _87;
    float _93 = _91;
    if (!_85)
    {
        out.m_33.x = 0.0;
    }
    int _95 = 0;
    if (!_85)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_85)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1645 = as_type<float>(_99);
        out.gl_Position.z = _1645;
    }
    if (!_85)
    {
        return out;
    }
    float _103 = in.m_35.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_81);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    if (_127)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _89;
    if (_127)
    {
        out.m_33.x = 0.0;
    }
    if (_127)
    {
        float _131 = _129 * 5.0;
        _101 = as_type<int>(_131);
    }
    int _133 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1713 = as_type<float>(_133);
        out.gl_Position.z = _1713;
    }
    if (_127)
    {
        return out;
    }
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    int _139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _141 = _139 != 0;
    float _143 = in.m_40.x;
    float _145 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _147 = _145 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _149 = in.m_40.z;
    float _151 = in.m_40.w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = rint((*spvDescriptorSet0.vp_c7)._m0[0].x);
    float _165 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = in.m_40.y;
    float _169 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _171 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _173 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _175 = _165;
    if (!_141)
    {
        float _177 = in.m_40.z;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = 1.0 / _147;
    float _183 = _169 * _137;
    float _185 = 0.0;
    if (!_161)
    {
        float _187 = _165 * _165;
        float _189 = _187 * 0.5;
        _185 = _189;
    }
    float _191 = _185;
    int _193 = as_type<int>(_135) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_135) & 2;
    bool _199 = _197 != 0;
    int _201 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _203 = _201 != 0;
    float _205 = _191;
    if (!_161)
    {
        float _207 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _207;
    }
    float _209 = _205;
    float _211 = 0.0;
    float _213 = _209;
    if (_141)
    {
        _211 = _143;
    }
    float _215 = _211;
    int _217 = int(_195);
    int _219 = _199 ? 2 : 0;
    int _221 = _217 | _219;
    int _223 = _203 ? 4 : 0;
    int _225 = _221 | _223;
    int _227 = false ? 8 : 0;
    int _229 = _225 | _227;
    int _231 = _161 ? 16 : 0;
    int _233 = _229 | _231;
    int _235 = false ? 32 : 0;
    int _237 = _233 | _235;
    int _239 = _141 ? 64 : 0;
    int _241 = _237 | _239;
    int _243 = _241 & 4;
    bool _245 = _151 > 0.5;
    bool _247 = _149 > 0.5;
    float _249 = _215;
    float _251 = as_type<float>(_243);
    if (!_141)
    {
        _249 = _149;
    }
    float _253 = _249;
    bool _255 = !_195;
    float _257 = _255 ? (-0.5) : 0.5;
    bool _259 = !_199;
    float _261 = _259 ? (-0.5) : 0.5;
    bool _263 = !_161;
    float _265 = _179;
    if (!_263)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = _165 * _269;
        float _279 = 1.0 / _273;
        float _281 = _275 * 0.693147182464599609375;
        float _283 = exp2(_277);
        float _285 = 1.0 / _281;
        float _287 = _283 + (-1.0);
        float _289 = -_287;
        float _291 = fma(_289, _285, _165);
        float _293 = _291 * _279;
        float _295 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _295;
        _251 = _285;
    }
    float _297 = _213;
    float _299 = _251;
    bool _301 = !_161;
    float _303 = _299;
    if (!_301)
    {
        float _305 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = log2(_305);
        float _309 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _311 = _309 + 1.0;
        float _313 = 1.0 / _311;
        float _315 = _165 * _307;
        float _317 = exp2(_315);
        float _319 = -_317;
        float _321 = _319 + 1.0;
        float _323 = _321 * _313;
        _173 = _311;
        _175 = _323;
    }
    float _325 = _173;
    float _327 = _175;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _333 = _163 * 0.100000001490116119384765625;
    bool _335 = _167 > 0.5;
    float _337 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.02500000037252902984619140625;
    int _339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _341 = _339 != 0;
    float _343 = 1.0 / _331;
    float _345 = -_261;
    int _347 = _245 ? as_type<int>(_345) : as_type<int>(_261);
    float _349 = _297 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = -_261;
    float _353 = _351 + 0.5;
    float _355 = -_257;
    int _357 = _247 ? as_type<int>(_355) : as_type<int>(_257);
    float _359 = floor(_337);
    int _361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _363 = _361 != 0;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _367 = _365 != 0;
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _371 = _369 != 0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _379 = -_257;
    int _381 = _335 ? as_type<int>(_379) : as_type<int>(_257);
    out.m_42.y = _353;
    float _383 = 1.0 / _375;
    float _385 = 0.0;
    float _387 = _325;
    if (!_141)
    {
        _385 = _167;
    }
    float _389 = _385;
    bool _391 = !_341;
    float _393 = _391 ? _257 : as_type<float>(_357);
    float _395 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _397 = !_367;
    float _399 = _397 ? _257 : as_type<float>(_381);
    float _401 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _403 = _389;
    if (!_141)
    {
        _387 = _389;
    }
    float _405 = _387;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _411 = -_359;
    float _413 = _337 + _411;
    float _415 = _405;
    float _417 = _413;
    if (_141)
    {
        _403 = _167;
    }
    float _419 = _403;
    float _421 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[88].w, _377);
    float _423 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _401);
    bool _425 = _143 > 0.5;
    float _427 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _395);
    float _429 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _431 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[87].w, _421);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _437 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _429);
    float _439 = -_257;
    int _441 = _425 ? as_type<int>(_439) : as_type<int>(_257);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _449 = _447 != 0;
    float _451 = 1.0 / _435;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _455 = _453 != 0;
    float _457 = -_431;
    float _459 = _457 + 1.0;
    bool _461 = !_455;
    float _463 = _461 ? _257 : as_type<float>(_441);
    float _465 = 1.0 / _409;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _471 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _473 = _463 + 0.5;
    float _475 = 1.0 / _445;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _477;
    float _481 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _427);
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _485 = _479 * _181;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _495 = 1.0 / _469;
    float _497 = _419;
    if (!_141)
    {
        _303 = _179;
    }
    float _499 = _303;
    float _501 = _489 * _383;
    float _503 = _493 * _465;
    float _505 = _499;
    if (_141)
    {
        _505 = _419;
    }
    float _507 = _505;
    float _509 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[88].z, _483);
    if (_141)
    {
        _265 = _419;
    }
    float _511 = _265;
    float _513 = floor(_333);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _519;
    if (_141)
    {
        _415 = _143;
    }
    float _523 = _415;
    float _525 = _517 * _343;
    float _527 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _183);
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _537 = _521 * _475;
    float _539 = _531 * _495;
    float _541 = _535 * _451;
    float _543 = _475;
    float _545 = (*spvDescriptorSet0.vp_c10)._m0[6].x;
    if (_471)
    {
        float _547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _543 = _547;
    }
    float _549 = _543;
    float _551 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _423);
    if (_471)
    {
        float _553 = _143 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _545 = _553;
    }
    float _555 = _545;
    float _557 = fma(_513, -0.5, -1.5);
    float _559 = _555;
    if (!_141)
    {
        _497 = _143;
    }
    float _561 = _497;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _565 = rsqrt(_551);
    float _567 = fma((*spvDescriptorSet0.vp_c9)._m0[191].w, 2.0, -1.0);
    float _569 = _253 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _571 = _567;
    if (_471)
    {
        float _573 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[14].x, _413);
        _559 = _573;
    }
    float _575 = _559;
    float _577 = _567 * _557;
    float _579 = -_563;
    float _581 = fma(_569, 2.0, _579);
    float _583 = floor(_527);
    if (_471)
    {
        float _585 = _575 * _549;
        _571 = _585;
    }
    float _587 = _571;
    float _589 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _437);
    float _591 = _561 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _595 = 0.0;
    if (_471)
    {
        float _597 = floor(_587);
        _595 = _597;
    }
    float _599 = _595;
    float _601 = _257 * _565;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _607 = _601 * (*spvDescriptorSet0.vp_c9)._m0[194].z;
    float _609 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[83].z, _603);
    float _611 = _523 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _613 = -_583;
    float _615 = _527 + _613;
    float _617 = precise::min(_513, 1.0);
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _621 = -_593;
    float _623 = fma(_611, 2.0, _621);
    float _625 = _527 * 6.283185482025146484375;
    float _627 = _617 + (-1.0);
    float _629 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[83].w, _619);
    float _631 = 2.650000095367431640625 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _633 = 2.650000095367431640625 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _635 = _617 * _577;
    float _637 = 2.650000095367431640625 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _639 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[191].w, 1.0);
    if (_471)
    {
        float _641 = -_599;
        float _643 = _587 + _641;
        _417 = _643;
    }
    float _645 = _417;
    float _647 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[8].x, _631);
    float _649 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[10].x, _637);
    float _651 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[9].x, _633);
    bool _653 = _615 < 0.5;
    float _655 = float(_653);
    float _657 = _507 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _661 = _625 * 0.15915493667125701904296875;
    float _663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _665 = -_615;
    float _667 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _669 = -_655;
    float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _673 = fma(_657, -2.0, _659);
    float _675 = -_617;
    float _677 = _675 + 1.0;
    float _679 = in.m_35.x;
    float _681 = in.m_35.y;
    float _683 = in.m_35.z;
    float _685 = -_117;
    float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[81].x, _623);
    float _689 = fma(_591, -2.0, _605);
    float _691 = _661 * 6.283185482025146484375;
    float _693 = cos(_691);
    float _695 = fma(_607, _677, _601);
    float _697 = _297 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _699 = -_261;
    int _701 = _335 ? as_type<int>(_699) : as_type<int>(_261);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _705 = _645 + _703;
    float _707 = -_261;
    int _709 = _247 ? as_type<int>(_707) : as_type<int>(_261);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _713 = _645 + _711;
    float _715 = _663 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _717 = _393 + 0.5;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _721 = _719 != 0;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _725 = _723 != 0;
    float _727 = rsqrt(_481);
    float _729 = in.m_44.w;
    float _731 = fma(_715, _717, _687);
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _735 = _297 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _737 = fma(_693, 0.5, 0.5);
    float _739 = _695 * _639;
    out.m_46.w = _733;
    float _741 = -_737;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _745 = fma(_327, _679, _697);
    float _747 = fma(_327, _681, _735);
    float _749 = fma(_327, _683, _349);
    float _751 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[87].z, _509);
    float _753 = in.m_30.x;
    float _755 = in.m_30.y;
    float _757 = in.m_30.z;
    float _759 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _609);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _763 = _645 + _761;
    float _765 = -_117;
    float _767 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[86].x, _581);
    float _769 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _629);
    float _771 = fma(_485, _705, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _773 = fma(_525, _763, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _775 = fma(_501, _713, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _779 = _645 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _783 = _645 + _781;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _789 = _645 + _787;
    float _791 = fma(_539, _779, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _793 = fma(_537, _783, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _797 = _645 + _795;
    out.m_48.w = _785;
    float _799 = fma(_503, _789, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _801 = sqrt(_589);
    float _803 = fma(_541, _797, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _805 = !_449;
    float _807 = _805 ? _261 : as_type<float>(_701);
    float _809 = in.m_44.x;
    float _811 = in.m_44.y;
    float _813 = _261 * _727;
    bool _815 = !_363;
    float _817 = _815 ? _261 : as_type<float>(_347);
    float _819 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _673);
    float _821 = fma(_745, _729, _753);
    float _823 = fma(_747, _729, _755);
    float _825 = fma(_749, _729, _757);
    bool _827 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _829 = isnan(_645);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[86].y, _689);
    bool _841 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _843 = isnan(_645);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _855 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _857 = isnan(_645);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = -_837;
    float _869 = _867 + 1.0;
    bool _871 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _873 = isnan(_645);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = -_851;
    float _885 = _883 + 1.0;
    bool _887 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _889 = isnan(_645);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = _865 * _869;
    bool _901 = !_371;
    float _903 = _901 ? _261 : as_type<float>(_709);
    float _905 = -_881;
    float _907 = _905 + 1.0;
    float _909 = _881 * _885;
    float _911 = _771 * _899;
    float _913 = -_865;
    float _915 = _913 + 1.0;
    float _917 = _837 * _907;
    bool _919 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _921 = isnan(_645);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = -_897;
    float _933 = _931 + 1.0;
    float _935 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[159].x, _911);
    bool _937 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _939 = isnan(_645);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = _809 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _951 = _851 * _933;
    float _953 = fma(_773, _917, _935);
    float _955 = -_929;
    float _957 = _955 + 1.0;
    float _959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _961 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _963 = isnan(_645);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = fma(_775, _909, _953);
    float _975 = _801 * 7.0;
    float _977 = -_947;
    float _979 = _977 + 1.0;
    float _981 = _897 * _957;
    float _983 = fma(_799, _951, _973);
    float _985 = fma(_975, (*spvDescriptorSet0.vp_c10)._m0[8].z, _647);
    float _987 = fma(_975, (*spvDescriptorSet0.vp_c10)._m0[9].z, _651);
    float _989 = fma(_975, (*spvDescriptorSet0.vp_c10)._m0[10].z, _649);
    float _991 = -_971;
    float _993 = _991 + 1.0;
    float _995 = _929 * _979;
    float _997 = _949 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _999 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _739);
    float _1001 = fma(_791, _981, _983);
    float _1003 = _947 * _993;
    float _1005 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1007 = _997 * _999;
    float _1009 = fma(_803, _995, _1001);
    float _1011 = _853 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1013 = _817 + (-0.5);
    float _1015 = _959 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1017 = _903 + (-0.5);
    float _1019 = fma(_793, _1003, _1009);
    float _1021 = -_1011;
    float _1023 = -_819;
    float _1025 = fma(_1021, _1013, _1023);
    float _1027 = -_759;
    float _1029 = _1027 + 1.0;
    float _1031 = -_1015;
    float _1033 = -_839;
    float _1035 = fma(_1031, _1017, _1033);
    float _1037 = _823 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1039 = _823 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1041 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1019);
    float _1043 = _823 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1047 = _473 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1049 = -_1029;
    float _1051 = fma(_393, _1049, _731);
    float _1053 = _677 * _1041;
    float _1055 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1037);
    float _1057 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1039);
    float _1059 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1043);
    float _1061 = _1047 * _1005;
    bool _1063 = _813 >= 0.0;
    bool _1065 = isnan(_813);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan(0.0);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = _813 * (*spvDescriptorSet0.vp_c9)._m0[194].z;
    float _1077 = _1075 * 2.0;
    float _1079 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[194].z, _1041);
    float _1081 = -_807;
    float _1083 = _1081 + 0.5;
    float _1085 = -_769;
    float _1087 = _1085 + 1.0;
    float _1089 = _1073 * _1077;
    float _1091 = fma(_1079, _1073, _813);
    float _1093 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1095 = fma(_817, _1087, _1025);
    float _1097 = _811 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1099 = fma(_677, _1089, _1091);
    float _1101 = _1093 * _1045;
    float _1103 = fma(_825, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1057);
    float _1105 = fma(_825, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1055);
    float _1107 = _1099 * _639;
    float _1109 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    out.m_50.x = _1061;
    out.m_50.y = _1101;
    out.m_50.z = _1051;
    out.m_50.w = _1095;
    float _1111 = _1103 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1113 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1107);
    float _1115 = _1105 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    out.m_52.y = _639;
    float _1117 = _739 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1119 = _1109 * _1113;
    float _1121 = fma(_825, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1059);
    float _1123 = _987 + _1111;
    float _1125 = _985 + _1115;
    float _1127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1129 = _1121 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1131 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1133 = -_751;
    float _1135 = _1133 + 1.0;
    float _1137 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1139 = _1119 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1141 = _1119 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1143 = _989 + _1129;
    float _1145 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1147 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1149 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1151 = fma(_1007, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1139);
    float _1153 = fma(_1117, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1145);
    float _1155 = fma(_1117, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1147);
    float _1157 = fma(_1117, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1149);
    float _1159 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1161 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1163 = fma(_1007, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1141);
    float _1165 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1131);
    float _1167 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1159);
    float _1169 = fma(_1161, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1151);
    float _1171 = fma(_1161, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1163);
    float _1173 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1165);
    float _1175 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1167);
    float _1177 = _1143 + _1169;
    float _1179 = _1125 + _1171;
    float _1181 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1183 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1187 = _1177 + _1185;
    float _1189 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1191 = _1179 + _1189;
    bool _1193 = !_721;
    int _1195 = _1193 ? 0 : 1;
    float _1197 = _1183 + _1181;
    float _1199 = _1187 * _1187;
    float _1201 = 1.0 / _1181;
    float _1203 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1205 = _399 + 0.5;
    float _1207 = fma(_1191, _1191, _1199);
    int _1209 = abs(_1195);
    float _1211 = fma(_903, _459, _1035);
    int _1213 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _1215 = _1213 != 0;
    float _1217 = fma(_1203, _1205, _767);
    float _1219 = sqrt(_1207);
    float _1221 = _1155 + (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _1223 = !_1215;
    int _1225 = _1223 ? 0 : 1;
    float _1227 = -_1135;
    float _1229 = fma(_399, _1227, _1217);
    float _1231 = float(_1209);
    float _1233 = _1119 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1235 = abs(_1225);
    float _1237 = _1197 * _1201;
    float _1239 = _1237 * 0.5;
    out.m_54.x = _1229;
    out.m_54.y = _1211;
    float _1241 = abs(_667);
    float _1243 = _1231 * _1241;
    float _1245 = _1153 + (*spvDescriptorSet0.vp_c10)._m0[8].z;
    bool _1247 = !_725;
    int _1249 = _1247 ? 0 : 1;
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1253 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1251);
    bool _1255 = _1219 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1257 = fma(_1007, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1233);
    int _1259 = abs(_1249);
    float _1261 = _1157 + (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1263 = float(_1235);
    float _1265 = 1.0 / _1253;
    float _1267 = fma(_1161, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1257);
    out.m_56.x = _1245;
    out.m_56.y = _1221;
    out.m_56.z = _1261;
    float _1269 = fma(_1263, _743, _1243);
    bool _1271 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1273 = isnan(0.5);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1279 = _1275 || _1277;
    float _1281 = _1123 + _1267;
    float _1283 = float(_1259);
    float _1285 = _1245;
    float _1287 = _1261;
    float _1289 = _1283;
    float _1291 = as_type<float>(_1259);
    float _1293 = _1187;
    if (!_1255)
    {
        _1285 = _1179;
    }
    float _1295 = _1285;
    float _1297 = _1295;
    if (!_1255)
    {
        _1287 = _1177;
    }
    float _1299 = _1287;
    float _1301 = abs(_671);
    float _1303 = fma(_1283, _1301, _1269);
    float _1305 = _1299;
    if (!_1255)
    {
        _1289 = _1281;
    }
    float _1307 = _1289;
    bool _1309 = !_1255;
    float _1311 = _1307;
    if (!_1309)
    {
        float _1313 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1317 = _1219 + _1315;
        float _1319 = _1281 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1321 = rsqrt(_1207);
        float _1323 = _1317 * _1313;
        float _1325 = _1323 * 0.15915493667125701904296875;
        float _1327 = _1325 * 6.283185482025146484375;
        float _1329 = cos(_1327);
        float _1331 = _1325 * 6.283185482025146484375;
        float _1333 = sin(_1331);
        float _1335 = _1329 + (-1.0);
        float _1337 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1339 = fma(_1333, _1319, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1341 = fma(_1281, _1329, _1337);
        float _1343 = _1321 * _1339;
        float _1345 = fma(_1191, _1343, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1347 = fma(_1187, _1343, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1311 = _1341;
        _1297 = _1345;
        _1305 = _1347;
        _1291 = _1343;
    }
    float _1349 = _1311;
    float _1351 = _1297;
    float _1353 = _1305;
    float _1355 = _1291;
    float _1357 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1359 = _1355;
    if (_1279)
    {
        _1359 = 1.0;
    }
    float _1361 = _1359;
    float _1363 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1365 = _1361;
    if (_1279)
    {
        _1293 = 1.0;
    }
    float _1367 = _1293;
    float _1369 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1357);
    float _1371 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1373 = _1265 * _1371;
    float _1375 = _1367;
    if (!_1279)
    {
        float _1377 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1379 = _1377 * 0.15915493667125701904296875;
        float _1381 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1383 = _1379 * 6.283185482025146484375;
        float _1385 = cos(_1383);
        float _1387 = _1381 * 0.15915493667125701904296875;
        float _1389 = _1379 * 6.283185482025146484375;
        float _1391 = sin(_1389);
        float _1393 = 1.0 / _1385;
        float _1395 = _1387 * 6.283185482025146484375;
        float _1397 = cos(_1395);
        float _1399 = _1391 * _1393;
        float _1401 = _1387 * 6.283185482025146484375;
        float _1403 = sin(_1401);
        float _1405 = _1397 * _1399;
        float _1407 = 1.0 / _1405;
        float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1411 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1409;
        float _1413 = 1.0 / _1411;
        float _1415 = _1403 * _1407;
        float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1419 = fma(_1373, _1415, _1417);
        float _1421 = _1419 * _1413;
        float _1423 = precise::clamp(_1421, 0.0, 1.0);
        _1365 = _1423;
    }
    float _1425 = _1365;
    if (!_1279)
    {
        float _1427 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1429 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1431 = _1427 * 0.15915493667125701904296875;
        float _1433 = _1429 * 0.15915493667125701904296875;
        float _1435 = _1431 * 6.283185482025146484375;
        float _1437 = cos(_1435);
        float _1439 = _1431 * 6.283185482025146484375;
        float _1441 = sin(_1439);
        float _1443 = 1.0 / _1437;
        float _1445 = _1433 * 6.283185482025146484375;
        float _1447 = cos(_1445);
        float _1449 = _1441 * _1443;
        float _1451 = _1433 * 6.283185482025146484375;
        float _1453 = sin(_1451);
        float _1455 = _1447 * _1449;
        float _1457 = 1.0 / _1455;
        float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1461 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1459;
        float _1463 = 1.0 / _1461;
        float _1465 = _1453 * _1457;
        float _1467 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1469 = fma(_1373, _1465, _1467);
        float _1471 = _1469 * _1463;
        float _1473 = precise::clamp(_1471, 0.0, 1.0);
        float _1475 = -_1473;
        float _1477 = _1475 + 1.0;
        _1375 = _1477;
    }
    float _1479 = _1375;
    float _1481 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1363);
    float _1483 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1369);
    float _1485 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1487 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1489 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1481);
    float _1491 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1493 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1485);
    float _1495 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1487);
    float _1497 = _1489 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1499 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1501 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1503 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1505 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1493);
    float _1507 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1509 = _1425 > 0.0;
    bool _1511 = isnan(_1425);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan(0.0);
    bool _1517 = _1513 || _1515;
    float _1519 = _1425 * _1479;
    float _1521 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1499);
    float _1523 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1501);
    float _1525 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1503);
    float _1527 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1495);
    float _1529 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1531 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1507);
    bool _1533 = _1479 <= 0.0;
    bool _1535 = !_1517;
    bool _1537 = _1533 || _1535;
    float _1539 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1541 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1543 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1521);
    float _1545 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1523);
    float _1547 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1525);
    float _1549 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1531);
    float _1551 = _1303 * _1539;
    float _1553 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1543);
    float _1555 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1545);
    float _1557 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1547);
    float _1559 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1549);
    float _1561 = _1551 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1565 = _1351 + _1563;
    float _1567 = _1553 + _1559;
    float _1569 = _1557 + _1559;
    float _1571 = _1559 * 0.5;
    float _1573 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1575 = _1349 + _1573;
    float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1579 = _1353 + _1577;
    float _1581 = _1567 * 0.5;
    float _1583 = _1569 * 0.5;
    float _1585 = fma(_1555, -0.5, _1571);
    out.m_58.x = _1351;
    out.m_58.y = _1349;
    out.m_58.z = _1353;
    out.m_60.x = _1565;
    out.m_60.y = _1575;
    out.m_60.z = _1579;
    out.gl_Position.x = _1553;
    out.gl_Position.y = _1555;
    out.gl_Position.z = _1557;
    out.gl_Position.w = _1559;
    out.m_33.x = _1561;
    out.m_62.x = _1581;
    out.m_62.y = _1585;
    out.m_62.z = _1583;
    out.m_62.w = _1559;
    if (!_1537)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1587 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1587;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _76 = in.m_30.w;
    float _78 = trunc(_76);
    int _81 = int(_78);
    bool _85 = _81 >= 1;
    float _87 = 0.0;
    float _89 = as_type<float>(_81);
    if (!_85)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _87;
    float _93 = _91;
    if (!_85)
    {
        out.m_33.x = 0.0;
    }
    int _95 = 0;
    if (!_85)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_85)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1645 = as_type<float>(_99);
        out.gl_Position.z = _1645;
    }
    if (!_85)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_35.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_81);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    if (_127)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _89;
    if (_127)
    {
        out.m_33.x = 0.0;
    }
    if (_127)
    {
        float _131 = _129 * 5.0;
        _101 = as_type<int>(_131);
    }
    int _133 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1713 = as_type<float>(_133);
        out.gl_Position.z = _1713;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    int _139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _141 = _139 != 0;
    float _143 = in.m_40.x;
    float _145 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _147 = _145 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _149 = in.m_40.z;
    float _151 = in.m_40.w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = rint((*spvDescriptorSet0.vp_c7)._m0[0].x);
    float _165 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = in.m_40.y;
    float _169 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _171 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _173 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _175 = _165;
    if (!_141)
    {
        float _177 = in.m_40.z;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = 1.0 / _147;
    float _183 = _169 * _137;
    float _185 = 0.0;
    if (!_161)
    {
        float _187 = _165 * _165;
        float _189 = _187 * 0.5;
        _185 = _189;
    }
    float _191 = _185;
    int _193 = as_type<int>(_135) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_135) & 2;
    bool _199 = _197 != 0;
    int _201 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _203 = _201 != 0;
    float _205 = _191;
    if (!_161)
    {
        float _207 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _207;
    }
    float _209 = _205;
    float _211 = 0.0;
    float _213 = _209;
    if (_141)
    {
        _211 = _143;
    }
    float _215 = _211;
    int _217 = int(_195);
    int _219 = _199 ? 2 : 0;
    int _221 = _217 | _219;
    int _223 = _203 ? 4 : 0;
    int _225 = _221 | _223;
    int _227 = false ? 8 : 0;
    int _229 = _225 | _227;
    int _231 = _161 ? 16 : 0;
    int _233 = _229 | _231;
    int _235 = false ? 32 : 0;
    int _237 = _233 | _235;
    int _239 = _141 ? 64 : 0;
    int _241 = _237 | _239;
    int _243 = _241 & 4;
    bool _245 = _151 > 0.5;
    bool _247 = _149 > 0.5;
    float _249 = _215;
    float _251 = as_type<float>(_243);
    if (!_141)
    {
        _249 = _149;
    }
    float _253 = _249;
    bool _255 = !_195;
    float _257 = _255 ? (-0.5) : 0.5;
    bool _259 = !_199;
    float _261 = _259 ? (-0.5) : 0.5;
    bool _263 = !_161;
    float _265 = _179;
    if (!_263)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = _165 * _269;
        float _279 = 1.0 / _273;
        float _281 = _275 * 0.693147182464599609375;
        float _283 = exp2(_277);
        float _285 = 1.0 / _281;
        float _287 = _283 + (-1.0);
        float _289 = -_287;
        float _291 = fma(_289, _285, _165);
        float _293 = _291 * _279;
        float _295 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _295;
        _251 = _285;
    }
    float _297 = _213;
    float _299 = _251;
    bool _301 = !_161;
    float _303 = _299;
    if (!_301)
    {
        float _305 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = log2(_305);
        float _309 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _311 = _309 + 1.0;
        float _313 = 1.0 / _311;
        float _315 = _165 * _307;
        float _317 = exp2(_315);
        float _319 = -_317;
        float _321 = _319 + 1.0;
        float _323 = _321 * _313;
        _173 = _311;
        _175 = _323;
    }
    float _325 = _173;
    float _327 = _175;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _333 = _163 * 0.100000001490116119384765625;
    bool _335 = _167 > 0.5;
    float _337 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.02500000037252902984619140625;
    int _339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _341 = _339 != 0;
    float _343 = 1.0 / _331;
    float _345 = -_261;
    int _347 = _245 ? as_type<int>(_345) : as_type<int>(_261);
    float _349 = _297 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = -_261;
    float _353 = _351 + 0.5;
    float _355 = -_257;
    int _357 = _247 ? as_type<int>(_355) : as_type<int>(_257);
    float _359 = floor(_337);
    int _361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _363 = _361 != 0;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _367 = _365 != 0;
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _371 = _369 != 0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _379 = -_257;
    int _381 = _335 ? as_type<int>(_379) : as_type<int>(_257);
    out.m_42.y = _353;
    float _383 = 1.0 / _375;
    float _385 = 0.0;
    float _387 = _325;
    if (!_141)
    {
        _385 = _167;
    }
    float _389 = _385;
    bool _391 = !_341;
    float _393 = _391 ? _257 : as_type<float>(_357);
    float _395 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _397 = !_367;
    float _399 = _397 ? _257 : as_type<float>(_381);
    float _401 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _403 = _389;
    if (!_141)
    {
        _387 = _389;
    }
    float _405 = _387;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _411 = -_359;
    float _413 = _337 + _411;
    float _415 = _405;
    float _417 = _413;
    if (_141)
    {
        _403 = _167;
    }
    float _419 = _403;
    float _421 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[88].w, _377);
    float _423 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _401);
    bool _425 = _143 > 0.5;
    float _427 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _395);
    float _429 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _431 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[87].w, _421);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _437 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _429);
    float _439 = -_257;
    int _441 = _425 ? as_type<int>(_439) : as_type<int>(_257);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _449 = _447 != 0;
    float _451 = 1.0 / _435;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _455 = _453 != 0;
    float _457 = -_431;
    float _459 = _457 + 1.0;
    bool _461 = !_455;
    float _463 = _461 ? _257 : as_type<float>(_441);
    float _465 = 1.0 / _409;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _471 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _473 = _463 + 0.5;
    float _475 = 1.0 / _445;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _477;
    float _481 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _427);
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _485 = _479 * _181;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _495 = 1.0 / _469;
    float _497 = _419;
    if (!_141)
    {
        _303 = _179;
    }
    float _499 = _303;
    float _501 = _489 * _383;
    float _503 = _493 * _465;
    float _505 = _499;
    if (_141)
    {
        _505 = _419;
    }
    float _507 = _505;
    float _509 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[88].z, _483);
    if (_141)
    {
        _265 = _419;
    }
    float _511 = _265;
    float _513 = floor(_333);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _519;
    if (_141)
    {
        _415 = _143;
    }
    float _523 = _415;
    float _525 = _517 * _343;
    float _527 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _183);
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _537 = _521 * _475;
    float _539 = _531 * _495;
    float _541 = _535 * _451;
    float _543 = _475;
    float _545 = (*spvDescriptorSet0.vp_c10)._m0[6].x;
    if (_471)
    {
        float _547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _543 = _547;
    }
    float _549 = _543;
    float _551 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _423);
    if (_471)
    {
        float _553 = _143 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _545 = _553;
    }
    float _555 = _545;
    float _557 = fma(_513, -0.5, -1.5);
    float _559 = _555;
    if (!_141)
    {
        _497 = _143;
    }
    float _561 = _497;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _565 = rsqrt(_551);
    float _567 = fma((*spvDescriptorSet0.vp_c9)._m0[191].w, 2.0, -1.0);
    float _569 = _253 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _571 = _567;
    if (_471)
    {
        float _573 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[14].x, _413);
        _559 = _573;
    }
    float _575 = _559;
    float _577 = _567 * _557;
    float _579 = -_563;
    float _581 = fma(_569, 2.0, _579);
    float _583 = floor(_527);
    if (_471)
    {
        float _585 = _575 * _549;
        _571 = _585;
    }
    float _587 = _571;
    float _589 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _437);
    float _591 = _561 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _595 = 0.0;
    if (_471)
    {
        float _597 = floor(_587);
        _595 = _597;
    }
    float _599 = _595;
    float _601 = _257 * _565;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _607 = _601 * (*spvDescriptorSet0.vp_c9)._m0[194].z;
    float _609 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[83].z, _603);
    float _611 = _523 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _613 = -_583;
    float _615 = _527 + _613;
    float _617 = precise::min(_513, 1.0);
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _621 = -_593;
    float _623 = fma(_611, 2.0, _621);
    float _625 = _527 * 6.283185482025146484375;
    float _627 = _617 + (-1.0);
    float _629 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[83].w, _619);
    float _631 = 2.650000095367431640625 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _633 = 2.650000095367431640625 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _635 = _617 * _577;
    float _637 = 2.650000095367431640625 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _639 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[191].w, 1.0);
    if (_471)
    {
        float _641 = -_599;
        float _643 = _587 + _641;
        _417 = _643;
    }
    float _645 = _417;
    float _647 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[8].x, _631);
    float _649 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[10].x, _637);
    float _651 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[9].x, _633);
    bool _653 = _615 < 0.5;
    float _655 = float(_653);
    float _657 = _507 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _661 = _625 * 0.15915493667125701904296875;
    float _663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _665 = -_615;
    float _667 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _669 = -_655;
    float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _673 = fma(_657, -2.0, _659);
    float _675 = -_617;
    float _677 = _675 + 1.0;
    float _679 = in.m_35.x;
    float _681 = in.m_35.y;
    float _683 = in.m_35.z;
    float _685 = -_117;
    float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[81].x, _623);
    float _689 = fma(_591, -2.0, _605);
    float _691 = _661 * 6.283185482025146484375;
    float _693 = cos(_691);
    float _695 = fma(_607, _677, _601);
    float _697 = _297 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _699 = -_261;
    int _701 = _335 ? as_type<int>(_699) : as_type<int>(_261);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _705 = _645 + _703;
    float _707 = -_261;
    int _709 = _247 ? as_type<int>(_707) : as_type<int>(_261);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _713 = _645 + _711;
    float _715 = _663 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _717 = _393 + 0.5;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _721 = _719 != 0;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _725 = _723 != 0;
    float _727 = rsqrt(_481);
    float _729 = in.m_44.w;
    float _731 = fma(_715, _717, _687);
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _735 = _297 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _737 = fma(_693, 0.5, 0.5);
    float _739 = _695 * _639;
    out.m_46.w = _733;
    float _741 = -_737;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _745 = fma(_327, _679, _697);
    float _747 = fma(_327, _681, _735);
    float _749 = fma(_327, _683, _349);
    float _751 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[87].z, _509);
    float _753 = in.m_30.x;
    float _755 = in.m_30.y;
    float _757 = in.m_30.z;
    float _759 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _609);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _763 = _645 + _761;
    float _765 = -_117;
    float _767 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[86].x, _581);
    float _769 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _629);
    float _771 = fma(_485, _705, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _773 = fma(_525, _763, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _775 = fma(_501, _713, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _779 = _645 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _783 = _645 + _781;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _789 = _645 + _787;
    float _791 = fma(_539, _779, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _793 = fma(_537, _783, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _797 = _645 + _795;
    out.m_48.w = _785;
    float _799 = fma(_503, _789, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _801 = sqrt(_589);
    float _803 = fma(_541, _797, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _805 = !_449;
    float _807 = _805 ? _261 : as_type<float>(_701);
    float _809 = in.m_44.x;
    float _811 = in.m_44.y;
    float _813 = _261 * _727;
    bool _815 = !_363;
    float _817 = _815 ? _261 : as_type<float>(_347);
    float _819 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _673);
    float _821 = fma(_745, _729, _753);
    float _823 = fma(_747, _729, _755);
    float _825 = fma(_749, _729, _757);
    bool _827 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _829 = isnan(_645);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[86].y, _689);
    bool _841 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _843 = isnan(_645);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _855 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _857 = isnan(_645);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = -_837;
    float _869 = _867 + 1.0;
    bool _871 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _873 = isnan(_645);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = -_851;
    float _885 = _883 + 1.0;
    bool _887 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _889 = isnan(_645);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = _865 * _869;
    bool _901 = !_371;
    float _903 = _901 ? _261 : as_type<float>(_709);
    float _905 = -_881;
    float _907 = _905 + 1.0;
    float _909 = _881 * _885;
    float _911 = _771 * _899;
    float _913 = -_865;
    float _915 = _913 + 1.0;
    float _917 = _837 * _907;
    bool _919 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _921 = isnan(_645);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = -_897;
    float _933 = _931 + 1.0;
    float _935 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[159].x, _911);
    bool _937 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _939 = isnan(_645);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = _809 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _951 = _851 * _933;
    float _953 = fma(_773, _917, _935);
    float _955 = -_929;
    float _957 = _955 + 1.0;
    float _959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _961 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _963 = isnan(_645);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = fma(_775, _909, _953);
    float _975 = _801 * 7.0;
    float _977 = -_947;
    float _979 = _977 + 1.0;
    float _981 = _897 * _957;
    float _983 = fma(_799, _951, _973);
    float _985 = fma(_975, (*spvDescriptorSet0.vp_c10)._m0[8].z, _647);
    float _987 = fma(_975, (*spvDescriptorSet0.vp_c10)._m0[9].z, _651);
    float _989 = fma(_975, (*spvDescriptorSet0.vp_c10)._m0[10].z, _649);
    float _991 = -_971;
    float _993 = _991 + 1.0;
    float _995 = _929 * _979;
    float _997 = _949 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _999 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _739);
    float _1001 = fma(_791, _981, _983);
    float _1003 = _947 * _993;
    float _1005 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1007 = _997 * _999;
    float _1009 = fma(_803, _995, _1001);
    float _1011 = _853 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1013 = _817 + (-0.5);
    float _1015 = _959 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1017 = _903 + (-0.5);
    float _1019 = fma(_793, _1003, _1009);
    float _1021 = -_1011;
    float _1023 = -_819;
    float _1025 = fma(_1021, _1013, _1023);
    float _1027 = -_759;
    float _1029 = _1027 + 1.0;
    float _1031 = -_1015;
    float _1033 = -_839;
    float _1035 = fma(_1031, _1017, _1033);
    float _1037 = _823 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1039 = _823 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1041 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1019);
    float _1043 = _823 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1047 = _473 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1049 = -_1029;
    float _1051 = fma(_393, _1049, _731);
    float _1053 = _677 * _1041;
    float _1055 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1037);
    float _1057 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1039);
    float _1059 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1043);
    float _1061 = _1047 * _1005;
    bool _1063 = _813 >= 0.0;
    bool _1065 = isnan(_813);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan(0.0);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = _813 * (*spvDescriptorSet0.vp_c9)._m0[194].z;
    float _1077 = _1075 * 2.0;
    float _1079 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[194].z, _1041);
    float _1081 = -_807;
    float _1083 = _1081 + 0.5;
    float _1085 = -_769;
    float _1087 = _1085 + 1.0;
    float _1089 = _1073 * _1077;
    float _1091 = fma(_1079, _1073, _813);
    float _1093 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1095 = fma(_817, _1087, _1025);
    float _1097 = _811 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1099 = fma(_677, _1089, _1091);
    float _1101 = _1093 * _1045;
    float _1103 = fma(_825, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1057);
    float _1105 = fma(_825, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1055);
    float _1107 = _1099 * _639;
    float _1109 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    out.m_50.x = _1061;
    out.m_50.y = _1101;
    out.m_50.z = _1051;
    out.m_50.w = _1095;
    float _1111 = _1103 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1113 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1107);
    float _1115 = _1105 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    out.m_52.y = _639;
    float _1117 = _739 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1119 = _1109 * _1113;
    float _1121 = fma(_825, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1059);
    float _1123 = _987 + _1111;
    float _1125 = _985 + _1115;
    float _1127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1129 = _1121 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1131 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1133 = -_751;
    float _1135 = _1133 + 1.0;
    float _1137 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1139 = _1119 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1141 = _1119 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1143 = _989 + _1129;
    float _1145 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1147 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1149 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1151 = fma(_1007, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1139);
    float _1153 = fma(_1117, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1145);
    float _1155 = fma(_1117, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1147);
    float _1157 = fma(_1117, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1149);
    float _1159 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1161 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1163 = fma(_1007, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1141);
    float _1165 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1131);
    float _1167 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1159);
    float _1169 = fma(_1161, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1151);
    float _1171 = fma(_1161, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1163);
    float _1173 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1165);
    float _1175 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1167);
    float _1177 = _1143 + _1169;
    float _1179 = _1125 + _1171;
    float _1181 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1183 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1187 = _1177 + _1185;
    float _1189 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1191 = _1179 + _1189;
    bool _1193 = !_721;
    int _1195 = _1193 ? 0 : 1;
    float _1197 = _1183 + _1181;
    float _1199 = _1187 * _1187;
    float _1201 = 1.0 / _1181;
    float _1203 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1205 = _399 + 0.5;
    float _1207 = fma(_1191, _1191, _1199);
    int _1209 = abs(_1195);
    float _1211 = fma(_903, _459, _1035);
    int _1213 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _1215 = _1213 != 0;
    float _1217 = fma(_1203, _1205, _767);
    float _1219 = sqrt(_1207);
    float _1221 = _1155 + (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _1223 = !_1215;
    int _1225 = _1223 ? 0 : 1;
    float _1227 = -_1135;
    float _1229 = fma(_399, _1227, _1217);
    float _1231 = float(_1209);
    float _1233 = _1119 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1235 = abs(_1225);
    float _1237 = _1197 * _1201;
    float _1239 = _1237 * 0.5;
    out.m_54.x = _1229;
    out.m_54.y = _1211;
    float _1241 = abs(_667);
    float _1243 = _1231 * _1241;
    float _1245 = _1153 + (*spvDescriptorSet0.vp_c10)._m0[8].z;
    bool _1247 = !_725;
    int _1249 = _1247 ? 0 : 1;
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1253 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1251);
    bool _1255 = _1219 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1257 = fma(_1007, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1233);
    int _1259 = abs(_1249);
    float _1261 = _1157 + (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1263 = float(_1235);
    float _1265 = 1.0 / _1253;
    float _1267 = fma(_1161, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1257);
    out.m_56.x = _1245;
    out.m_56.y = _1221;
    out.m_56.z = _1261;
    float _1269 = fma(_1263, _743, _1243);
    bool _1271 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1273 = isnan(0.5);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1279 = _1275 || _1277;
    float _1281 = _1123 + _1267;
    float _1283 = float(_1259);
    float _1285 = _1245;
    float _1287 = _1261;
    float _1289 = _1283;
    float _1291 = as_type<float>(_1259);
    float _1293 = _1187;
    if (!_1255)
    {
        _1285 = _1179;
    }
    float _1295 = _1285;
    float _1297 = _1295;
    if (!_1255)
    {
        _1287 = _1177;
    }
    float _1299 = _1287;
    float _1301 = abs(_671);
    float _1303 = fma(_1283, _1301, _1269);
    float _1305 = _1299;
    if (!_1255)
    {
        _1289 = _1281;
    }
    float _1307 = _1289;
    bool _1309 = !_1255;
    float _1311 = _1307;
    if (!_1309)
    {
        float _1313 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1317 = _1219 + _1315;
        float _1319 = _1281 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1321 = rsqrt(_1207);
        float _1323 = _1317 * _1313;
        float _1325 = _1323 * 0.15915493667125701904296875;
        float _1327 = _1325 * 6.283185482025146484375;
        float _1329 = cos(_1327);
        float _1331 = _1325 * 6.283185482025146484375;
        float _1333 = sin(_1331);
        float _1335 = _1329 + (-1.0);
        float _1337 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1339 = fma(_1333, _1319, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1341 = fma(_1281, _1329, _1337);
        float _1343 = _1321 * _1339;
        float _1345 = fma(_1191, _1343, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1347 = fma(_1187, _1343, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1311 = _1341;
        _1297 = _1345;
        _1305 = _1347;
        _1291 = _1343;
    }
    float _1349 = _1311;
    float _1351 = _1297;
    float _1353 = _1305;
    float _1355 = _1291;
    float _1357 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1359 = _1355;
    if (_1279)
    {
        _1359 = 1.0;
    }
    float _1361 = _1359;
    float _1363 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1365 = _1361;
    if (_1279)
    {
        _1293 = 1.0;
    }
    float _1367 = _1293;
    float _1369 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1357);
    float _1371 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1373 = _1265 * _1371;
    float _1375 = _1367;
    if (!_1279)
    {
        float _1377 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1379 = _1377 * 0.15915493667125701904296875;
        float _1381 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1383 = _1379 * 6.283185482025146484375;
        float _1385 = cos(_1383);
        float _1387 = _1381 * 0.15915493667125701904296875;
        float _1389 = _1379 * 6.283185482025146484375;
        float _1391 = sin(_1389);
        float _1393 = 1.0 / _1385;
        float _1395 = _1387 * 6.283185482025146484375;
        float _1397 = cos(_1395);
        float _1399 = _1391 * _1393;
        float _1401 = _1387 * 6.283185482025146484375;
        float _1403 = sin(_1401);
        float _1405 = _1397 * _1399;
        float _1407 = 1.0 / _1405;
        float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1411 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1409;
        float _1413 = 1.0 / _1411;
        float _1415 = _1403 * _1407;
        float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1419 = fma(_1373, _1415, _1417);
        float _1421 = _1419 * _1413;
        float _1423 = precise::clamp(_1421, 0.0, 1.0);
        _1365 = _1423;
    }
    float _1425 = _1365;
    if (!_1279)
    {
        float _1427 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1429 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1431 = _1427 * 0.15915493667125701904296875;
        float _1433 = _1429 * 0.15915493667125701904296875;
        float _1435 = _1431 * 6.283185482025146484375;
        float _1437 = cos(_1435);
        float _1439 = _1431 * 6.283185482025146484375;
        float _1441 = sin(_1439);
        float _1443 = 1.0 / _1437;
        float _1445 = _1433 * 6.283185482025146484375;
        float _1447 = cos(_1445);
        float _1449 = _1441 * _1443;
        float _1451 = _1433 * 6.283185482025146484375;
        float _1453 = sin(_1451);
        float _1455 = _1447 * _1449;
        float _1457 = 1.0 / _1455;
        float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1461 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1459;
        float _1463 = 1.0 / _1461;
        float _1465 = _1453 * _1457;
        float _1467 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1469 = fma(_1373, _1465, _1467);
        float _1471 = _1469 * _1463;
        float _1473 = precise::clamp(_1471, 0.0, 1.0);
        float _1475 = -_1473;
        float _1477 = _1475 + 1.0;
        _1375 = _1477;
    }
    float _1479 = _1375;
    float _1481 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1363);
    float _1483 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1369);
    float _1485 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1487 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1489 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1481);
    float _1491 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1493 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1485);
    float _1495 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1487);
    float _1497 = _1489 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1499 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1501 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1503 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1505 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1493);
    float _1507 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1509 = _1425 > 0.0;
    bool _1511 = isnan(_1425);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan(0.0);
    bool _1517 = _1513 || _1515;
    float _1519 = _1425 * _1479;
    float _1521 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1499);
    float _1523 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1501);
    float _1525 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1503);
    float _1527 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1495);
    float _1529 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1531 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1507);
    bool _1533 = _1479 <= 0.0;
    bool _1535 = !_1517;
    bool _1537 = _1533 || _1535;
    float _1539 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1541 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1543 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1521);
    float _1545 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1523);
    float _1547 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1525);
    float _1549 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1531);
    float _1551 = _1303 * _1539;
    float _1553 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1543);
    float _1555 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1545);
    float _1557 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1547);
    float _1559 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1549);
    float _1561 = _1551 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1565 = _1351 + _1563;
    float _1567 = _1553 + _1559;
    float _1569 = _1557 + _1559;
    float _1571 = _1559 * 0.5;
    float _1573 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1575 = _1349 + _1573;
    float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1579 = _1353 + _1577;
    float _1581 = _1567 * 0.5;
    float _1583 = _1569 * 0.5;
    float _1585 = fma(_1555, -0.5, _1571);
    out.m_58.x = _1351;
    out.m_58.y = _1349;
    out.m_58.z = _1353;
    out.m_60.x = _1565;
    out.m_60.y = _1575;
    out.m_60.z = _1579;
    out.gl_Position.x = _1553;
    out.gl_Position.y = _1555;
    out.gl_Position.z = _1557;
    out.gl_Position.w = _1559;
    out.m_33.x = _1561;
    out.m_62.x = _1581;
    out.m_62.y = _1585;
    out.m_62.z = _1583;
    out.m_62.w = _1559;
    if (!_1537)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1587 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1587;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

