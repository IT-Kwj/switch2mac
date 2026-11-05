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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_48 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_37 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _343 = false;
    bool _231 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1115 = as_type<float>(_85);
        out.gl_Position.z = _1115;
    }
    if (!_73)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _89 = in.m_35.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_99)
    {
        float _105 = float(_69);
        _79 = _105;
    }
    float _107 = _79;
    bool _109 = _103 >= _107;
    bool _111 = !_99;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _87 = as_type<int>(_119);
    }
    int _121 = _87;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1184 = as_type<float>(_121);
        out.gl_Position.z = _1184;
    }
    if (_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_37.x;
    float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _127 = _103 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _131 = _129 != 0;
    int _133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _135 = _133 != 0;
    int _137 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _139 = _137 != 0;
    float _141 = _127 * _125;
    float _143 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[20].x, _141);
    float _145 = floor(_143);
    float _147 = _143 * 6.283185482025146484375;
    float _149 = _147 * 0.15915493667125701904296875;
    bool _151 = !_131;
    int _153 = _151 ? 0 : 1;
    int _155 = abs(_153);
    float _157 = _149 * 6.283185482025146484375;
    float _159 = cos(_157);
    float _161 = -_145;
    float _163 = _143 + _161;
    bool _165 = !_139;
    int _167 = _165 ? 0 : 1;
    bool _169 = !_135;
    int _171 = _169 ? 0 : 1;
    int _173 = abs(_167);
    int _175 = abs(_171);
    float _177 = -_163;
    float _179 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _181 = float(_155);
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = fma(_159, 0.5, 0.5);
    float _187 = abs(_179);
    float _189 = _181 * _187;
    bool _191 = _163 < 0.5;
    float _193 = float(_191);
    float _195 = -_185;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _199 = float(_173);
    float _201 = -_193;
    float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _205 = float(_175);
    float _207 = fma(_199, _197, _189);
    float _209 = abs(_203);
    float _211 = fma(_205, _209, _207);
    bool _213 = !_183;
    float _229;
    if (!_213)
    {
        float _215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _217 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _221 = _219 * _215;
        float _223 = floor(_221);
        float _225 = -_223;
        float _227 = _221 + _225;
        _229 = _227;
        _231 = true;
    }
    else
    {
        float _233 = float(_69);
        float _235 = 1.0 / _233;
        float _237 = _103 * _235;
        _229 = _237;
    }
    _231 = false;
    float _239 = _229;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _239 + _241;
    float _245 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _247 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _249 = isnan(_239);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = _245 * _123;
    float _265 = -_257;
    float _267 = _265 + 1.0;
    bool _269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _271 = 1.0 / _261;
    float _273 = trunc(_263);
    int _275 = int(_273);
    float _277 = _243 * _271;
    bool _279 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _281 = isnan(_239);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _295;
    float _299 = _289 * _267;
    float _301 = fma(_293, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _303 = fma(_297, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _305 = -_289;
    float _307 = _305 + 1.0;
    float _309 = _301 * _299;
    float _311 = _303 * _299;
    float _313 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _315 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].y, _311);
    float _317 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[144].x, _313);
    float _319 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[144].y, _315);
    int _321 = _275 << 4;
    int _323 = _321 + 1712;
    bool _325 = !_269;
    float _341;
    if (!_325)
    {
        float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _329 = _123 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _333 = _331 * _327;
        float _335 = floor(_333);
        float _337 = -_335;
        float _339 = _333 + _337;
        _341 = _339;
        _343 = true;
    }
    else
    {
        float _345 = float(_69);
        float _347 = 1.0 / _345;
        float _349 = _103 * _347;
        _341 = _349;
    }
    _343 = false;
    float _351 = _341;
    float _353 = as_type<float>(int(gl_VertexIndex));
    bool _355 = _123 > 0.5;
    float _357 = in.m_42.x;
    float _359 = in.m_42.y;
    bool _361 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _363 = isnan(_351);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = in.m_37.y;
    float _375 = in.m_30.x;
    float _377 = in.m_30.y;
    float _379 = in.m_30.z;
    int _381 = as_type<int>(_353) & 1;
    bool _383 = _381 != 0;
    int _385 = as_type<int>(_353) & 2;
    bool _387 = _385 != 0;
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _391 = _389 != 0;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _395 = _393 != 0;
    float _397 = _317 * _357;
    float _399 = _319 * _359;
    bool _401 = _373 > 0.5;
    float _403 = _211 * _397;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _409 = _377 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _411 = _377 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _413 = _377 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _415 = 1.0 / _407;
    float _417 = _211 * _399;
    float _419 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _409);
    float _421 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _413);
    bool _423 = !_387;
    float _425 = _423 ? (-0.5) : 0.5;
    float _427 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _429 = !_383;
    float _431 = _429 ? (-0.5) : 0.5;
    float _433 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _411);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _439 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _425);
    float _441 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _443 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _431);
    float _445 = _427 * _439;
    float _447 = 1.0 / _437;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _449;
    float _453 = _441 * _443;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _461 = _451 * _415;
    float _463 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _465 = _445 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _471 = _445 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _473 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _475 = _457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _477 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _479 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[26].x, _471);
    float _481 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _421);
    float _483 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[24].x, _465);
    float _485 = _469 * _447;
    float _487 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].z, _479);
    out.m_44.x = _473;
    out.m_44.y = _475;
    out.m_44.z = _477;
    float _489 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].z, _483);
    bool _491 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _493 = isnan(_351);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    bool _503 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _505 = isnan(0.5);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _511 = _507 || _509;
    float _513 = _489 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _515 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _419);
    float _517 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _433);
    float _519 = _481 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _521 = _487 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _523 = _515 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _525 = _517 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _529 = _351 + _527;
    float _531 = _519 + _521;
    float _533 = _523 + _513;
    float _535 = _525 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _537 = fma(_461, _529, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _539 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _541 = _531 + _539;
    float _543 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _545 = _533 + _543;
    float _547 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[11].x, _535);
    float _549 = -_501;
    float _551 = _549 + 1.0;
    float _553 = _541 * _541;
    int _555 = _323 + 8;
    uint _558 = uint(int(uint(_555) >> uint(2)));
    uint _560 = uint(int(uint(int(_558)) >> uint(2)));
    int _562 = int(_558) & 3;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[int(_560)][_562];
    float _566 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[11].z, _547);
    float _568 = _371 * _551;
    float _570 = fma(_545, _545, _553);
    bool _572 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _574 = isnan(_351);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -_371;
    float _586 = _584 + 1.0;
    float _588 = _525 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _590 = sqrt(_570);
    float _592 = _566 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _596 = _351 + _594;
    float _598 = _582 * _586;
    float _600 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[10].x, _588);
    float _602 = -_582;
    float _604 = _602 + 1.0;
    float _606 = fma(_485, _596, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _608 = _445 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _610 = 1.0 / _592;
    float _612 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[10].z, _600);
    float _614 = _537 * _598;
    float _616 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[25].x, _608);
    float _618 = -_431;
    int _620 = _355 ? as_type<int>(_618) : as_type<int>(_431);
    float _622 = _612 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _624 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[115].x, _614);
    float _626 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].z, _616);
    bool _628 = _590 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _630 = _622 + _592;
    uint _632 = uint(int(uint(_323) >> uint(2)));
    uint _634 = uint(int(uint(int(_632)) >> uint(2)));
    int _636 = int(_632) & 3;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[int(_634)][_636];
    int _640 = int(_632) + 1;
    uint _642 = uint(int(uint(_640) >> uint(2)));
    int _644 = _640 & 3;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[int(_642)][_644];
    float _648 = _626 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _650 = fma(_606, _568, _624);
    float _652 = _525 + _648;
    float _654 = _630 * _610;
    float _656 = _654 * 0.5;
    float _658 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[117].x, _650);
    bool _660 = !_391;
    float _662 = _660 ? _431 : as_type<float>(_620);
    float _664 = -_425;
    int _666 = _401 ? as_type<int>(_664) : as_type<int>(_425);
    float _668 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _670 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[30].w, _668);
    float _672 = _463;
    float _674 = _431;
    float _676 = _531;
    float _678 = _545;
    float _680 = _541;
    if (!_628)
    {
        _672 = _533;
    }
    float _682 = _672;
    bool _684 = !_395;
    float _686 = _684 ? _425 : as_type<float>(_666);
    float _688 = _682;
    if (!_628)
    {
        _674 = _652;
    }
    float _690 = _674;
    bool _692 = !_628;
    float _694 = _690;
    if (!_692)
    {
        float _696 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _698 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _700 = _590 + _698;
        float _702 = _652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _704 = rsqrt(_570);
        float _706 = _700 * _696;
        float _708 = _706 * 0.15915493667125701904296875;
        float _710 = _708 * 6.283185482025146484375;
        float _712 = sin(_710);
        float _714 = _708 * 6.283185482025146484375;
        float _716 = cos(_714);
        float _718 = fma(_712, _702, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _720 = _704 * _718;
        float _722 = _716 + (-1.0);
        float _724 = fma(_545, _720, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _726 = fma(_541, _720, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _728 = _722 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _730 = fma(_652, _716, _728);
        _688 = _724;
        _676 = _726;
        _694 = _730;
    }
    float _732 = _688;
    float _734 = _676;
    float _736 = _694;
    float _738 = _736;
    if (_511)
    {
        _678 = _732;
    }
    float _740 = _678;
    float _742 = _740;
    if (_511)
    {
        _680 = _734;
    }
    float _744 = _680;
    float _746 = _744;
    if (!_511)
    {
        float _748 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _750 = _525 + _748;
        float _752 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _754 = _523 + _752;
        float _756 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _758 = -_523;
        float _760 = _758 + _732;
        float _762 = _750 * _750;
        float _764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _766 = _519 + _764;
        float _768 = -_519;
        float _770 = _768 + _734;
        float _772 = fma(_754, _754, _762);
        float _774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _776 = fma(_766, _766, _772);
        float _778 = sqrt(_776);
        float _780 = _756 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _782 = precise::min(_778, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _784 = _782 * _774;
        float _786 = _780 * _784;
        float _788 = -_525;
        float _790 = _788 + _736;
        float _792 = fma(_760, _786, _523);
        float _794 = fma(_790, _786, _525);
        float _796 = fma(_770, _786, _519);
        _738 = _794;
        _742 = _792;
        _746 = _796;
    }
    float _798 = _738;
    float _800 = _742;
    float _802 = _746;
    float _804 = 1.0 / _670;
    bool _806 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _808 = isnan(0.5);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _814 = _810 || _812;
    float _816 = _798 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _818 = _798 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _820 = _798 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _822 = _798 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _824 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[1].x, _816);
    float _826 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[0].x, _818);
    float _828 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[2].x, _820);
    float _830 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[3].x, _822);
    float _832 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[1].z, _824);
    float _834 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[0].z, _826);
    float _836 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[2].z, _828);
    float _838 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[3].z, _830);
    float _840 = _802;
    float _842 = _826;
    if (_814)
    {
        _840 = 1.0;
    }
    float _844 = _840;
    float _846 = _832 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _848 = _844;
    if (_814)
    {
        _842 = 1.0;
    }
    float _850 = _842;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _854 = _804 * _852;
    float _856 = _850;
    if (!_814)
    {
        float _858 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _860 = _858 * 0.15915493667125701904296875;
        float _862 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _864 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _866 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _864;
        float _868 = _860 * 6.283185482025146484375;
        float _870 = cos(_868);
        float _872 = _862 * 0.15915493667125701904296875;
        float _874 = _860 * 6.283185482025146484375;
        float _876 = sin(_874);
        float _878 = 1.0 / _870;
        float _880 = _872 * 6.283185482025146484375;
        float _882 = cos(_880);
        float _884 = _876 * _878;
        float _886 = _872 * 6.283185482025146484375;
        float _888 = sin(_886);
        float _890 = _882 * _884;
        float _892 = 1.0 / _866;
        float _894 = 1.0 / _890;
        float _896 = _888 * _894;
        float _898 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _900 = fma(_854, _896, _898);
        float _902 = _900 * _892;
        float _904 = precise::clamp(_902, 0.0, 1.0);
        _848 = _904;
    }
    float _906 = _848;
    if (!_814)
    {
        float _908 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _910 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _912 = _908 * 0.15915493667125701904296875;
        float _914 = _910 * 0.15915493667125701904296875;
        float _916 = _912 * 6.283185482025146484375;
        float _918 = cos(_916);
        float _920 = _912 * 6.283185482025146484375;
        float _922 = sin(_920);
        float _924 = 1.0 / _918;
        float _926 = _914 * 6.283185482025146484375;
        float _928 = cos(_926);
        float _930 = _922 * _924;
        float _932 = _914 * 6.283185482025146484375;
        float _934 = sin(_932);
        float _936 = _928 * _930;
        float _938 = 1.0 / _936;
        float _940 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _942 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _940;
        float _944 = 1.0 / _942;
        float _946 = _934 * _938;
        float _948 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _950 = fma(_854, _946, _948);
        float _952 = _950 * _944;
        float _954 = precise::clamp(_952, 0.0, 1.0);
        float _956 = -_954;
        float _958 = _956 + 1.0;
        _856 = _958;
    }
    float _960 = _856;
    float _962 = _846 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _964 = _834 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _968 = _846 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _970 = _846 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _972 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[6].x, _962);
    float _974 = _846 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _976 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[4].x, _968);
    float _978 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[5].x, _970);
    float _980 = _662 + 0.5;
    float _982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _984 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[7].x, _974);
    float _986 = _836 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _988 = _906 > 0.0;
    bool _990 = isnan(_906);
    bool _992 = _988 || _990;
    bool _994 = isnan(0.0);
    bool _996 = _992 || _994;
    float _998 = -_686;
    float _1000 = _998 + 0.5;
    float _1002 = _980 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1004 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[6].z, _972);
    float _1006 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[7].z, _984);
    float _1008 = _838 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1010 = _906 * _960;
    bool _1012 = _960 <= 0.0;
    bool _1014 = !_996;
    bool _1016 = _1012 || _1014;
    float _1018 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1020 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[4].z, _976);
    float _1022 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[5].z, _978);
    float _1024 = _638 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1026 = _1002 * _966;
    float _1028 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1004);
    float _1030 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1006);
    float _1032 = _1018 * _982;
    float _1034 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1020);
    float _1036 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1022);
    float _1038 = _564 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1040 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1042 = _646 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1044 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1046 = _1028 + _1030;
    float _1048 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1050 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1052 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1054 = _1044 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1056 = _1046 * 0.5;
    out.m_46.x = _1026;
    out.m_46.y = _1032;
    out.m_48.x = _1040;
    out.m_48.y = _1052;
    out.m_48.z = _1048;
    out.m_48.w = _1050;
    out.m_33.x = _1054;
    out.gl_Position.x = _1034;
    out.gl_Position.y = _1036;
    out.gl_Position.z = _1028;
    out.gl_Position.w = _1030;
    out.m_50.z = _1056;
    out.m_50.w = _1030;
    if (!_1016)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1058 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1058;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _343 = false;
    bool _231 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1115 = as_type<float>(_85);
        out.gl_Position.z = _1115;
    }
    if (!_73)
    {
        return out;
    }
    float _89 = in.m_35.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_99)
    {
        float _105 = float(_69);
        _79 = _105;
    }
    float _107 = _79;
    bool _109 = _103 >= _107;
    bool _111 = !_99;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _87 = as_type<int>(_119);
    }
    int _121 = _87;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1184 = as_type<float>(_121);
        out.gl_Position.z = _1184;
    }
    if (_113)
    {
        return out;
    }
    float _123 = in.m_37.x;
    float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _127 = _103 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _131 = _129 != 0;
    int _133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _135 = _133 != 0;
    int _137 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _139 = _137 != 0;
    float _141 = _127 * _125;
    float _143 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[20].x, _141);
    float _145 = floor(_143);
    float _147 = _143 * 6.283185482025146484375;
    float _149 = _147 * 0.15915493667125701904296875;
    bool _151 = !_131;
    int _153 = _151 ? 0 : 1;
    int _155 = abs(_153);
    float _157 = _149 * 6.283185482025146484375;
    float _159 = cos(_157);
    float _161 = -_145;
    float _163 = _143 + _161;
    bool _165 = !_139;
    int _167 = _165 ? 0 : 1;
    bool _169 = !_135;
    int _171 = _169 ? 0 : 1;
    int _173 = abs(_167);
    int _175 = abs(_171);
    float _177 = -_163;
    float _179 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _181 = float(_155);
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = fma(_159, 0.5, 0.5);
    float _187 = abs(_179);
    float _189 = _181 * _187;
    bool _191 = _163 < 0.5;
    float _193 = float(_191);
    float _195 = -_185;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _199 = float(_173);
    float _201 = -_193;
    float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _205 = float(_175);
    float _207 = fma(_199, _197, _189);
    float _209 = abs(_203);
    float _211 = fma(_205, _209, _207);
    bool _213 = !_183;
    float _229;
    if (!_213)
    {
        float _215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _217 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _221 = _219 * _215;
        float _223 = floor(_221);
        float _225 = -_223;
        float _227 = _221 + _225;
        _229 = _227;
        _231 = true;
    }
    else
    {
        float _233 = float(_69);
        float _235 = 1.0 / _233;
        float _237 = _103 * _235;
        _229 = _237;
    }
    _231 = false;
    float _239 = _229;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _239 + _241;
    float _245 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _247 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _249 = isnan(_239);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = _245 * _123;
    float _265 = -_257;
    float _267 = _265 + 1.0;
    bool _269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _271 = 1.0 / _261;
    float _273 = trunc(_263);
    int _275 = int(_273);
    float _277 = _243 * _271;
    bool _279 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _281 = isnan(_239);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _295;
    float _299 = _289 * _267;
    float _301 = fma(_293, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _303 = fma(_297, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _305 = -_289;
    float _307 = _305 + 1.0;
    float _309 = _301 * _299;
    float _311 = _303 * _299;
    float _313 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _315 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].y, _311);
    float _317 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[144].x, _313);
    float _319 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[144].y, _315);
    int _321 = _275 << 4;
    int _323 = _321 + 1712;
    bool _325 = !_269;
    float _341;
    if (!_325)
    {
        float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _329 = _123 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _333 = _331 * _327;
        float _335 = floor(_333);
        float _337 = -_335;
        float _339 = _333 + _337;
        _341 = _339;
        _343 = true;
    }
    else
    {
        float _345 = float(_69);
        float _347 = 1.0 / _345;
        float _349 = _103 * _347;
        _341 = _349;
    }
    _343 = false;
    float _351 = _341;
    float _353 = as_type<float>(int(gl_VertexIndex));
    bool _355 = _123 > 0.5;
    float _357 = in.m_42.x;
    float _359 = in.m_42.y;
    bool _361 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _363 = isnan(_351);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = in.m_37.y;
    float _375 = in.m_30.x;
    float _377 = in.m_30.y;
    float _379 = in.m_30.z;
    int _381 = as_type<int>(_353) & 1;
    bool _383 = _381 != 0;
    int _385 = as_type<int>(_353) & 2;
    bool _387 = _385 != 0;
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _391 = _389 != 0;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _395 = _393 != 0;
    float _397 = _317 * _357;
    float _399 = _319 * _359;
    bool _401 = _373 > 0.5;
    float _403 = _211 * _397;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _409 = _377 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _411 = _377 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _413 = _377 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _415 = 1.0 / _407;
    float _417 = _211 * _399;
    float _419 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _409);
    float _421 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _413);
    bool _423 = !_387;
    float _425 = _423 ? (-0.5) : 0.5;
    float _427 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _429 = !_383;
    float _431 = _429 ? (-0.5) : 0.5;
    float _433 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _411);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _439 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _425);
    float _441 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _443 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _431);
    float _445 = _427 * _439;
    float _447 = 1.0 / _437;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _449;
    float _453 = _441 * _443;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _461 = _451 * _415;
    float _463 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _465 = _445 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _471 = _445 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _473 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _475 = _457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _477 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _479 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[26].x, _471);
    float _481 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _421);
    float _483 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[24].x, _465);
    float _485 = _469 * _447;
    float _487 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].z, _479);
    out.m_44.x = _473;
    out.m_44.y = _475;
    out.m_44.z = _477;
    float _489 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].z, _483);
    bool _491 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _493 = isnan(_351);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    bool _503 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _505 = isnan(0.5);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _511 = _507 || _509;
    float _513 = _489 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _515 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _419);
    float _517 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _433);
    float _519 = _481 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _521 = _487 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _523 = _515 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _525 = _517 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _529 = _351 + _527;
    float _531 = _519 + _521;
    float _533 = _523 + _513;
    float _535 = _525 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _537 = fma(_461, _529, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _539 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _541 = _531 + _539;
    float _543 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _545 = _533 + _543;
    float _547 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[11].x, _535);
    float _549 = -_501;
    float _551 = _549 + 1.0;
    float _553 = _541 * _541;
    int _555 = _323 + 8;
    uint _558 = uint(int(uint(_555) >> uint(2)));
    uint _560 = uint(int(uint(int(_558)) >> uint(2)));
    int _562 = int(_558) & 3;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[int(_560)][_562];
    float _566 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[11].z, _547);
    float _568 = _371 * _551;
    float _570 = fma(_545, _545, _553);
    bool _572 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _574 = isnan(_351);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -_371;
    float _586 = _584 + 1.0;
    float _588 = _525 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _590 = sqrt(_570);
    float _592 = _566 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _596 = _351 + _594;
    float _598 = _582 * _586;
    float _600 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[10].x, _588);
    float _602 = -_582;
    float _604 = _602 + 1.0;
    float _606 = fma(_485, _596, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _608 = _445 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _610 = 1.0 / _592;
    float _612 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[10].z, _600);
    float _614 = _537 * _598;
    float _616 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[25].x, _608);
    float _618 = -_431;
    int _620 = _355 ? as_type<int>(_618) : as_type<int>(_431);
    float _622 = _612 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _624 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[115].x, _614);
    float _626 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].z, _616);
    bool _628 = _590 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _630 = _622 + _592;
    uint _632 = uint(int(uint(_323) >> uint(2)));
    uint _634 = uint(int(uint(int(_632)) >> uint(2)));
    int _636 = int(_632) & 3;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[int(_634)][_636];
    int _640 = int(_632) + 1;
    uint _642 = uint(int(uint(_640) >> uint(2)));
    int _644 = _640 & 3;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[int(_642)][_644];
    float _648 = _626 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _650 = fma(_606, _568, _624);
    float _652 = _525 + _648;
    float _654 = _630 * _610;
    float _656 = _654 * 0.5;
    float _658 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[117].x, _650);
    bool _660 = !_391;
    float _662 = _660 ? _431 : as_type<float>(_620);
    float _664 = -_425;
    int _666 = _401 ? as_type<int>(_664) : as_type<int>(_425);
    float _668 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _670 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[30].w, _668);
    float _672 = _463;
    float _674 = _431;
    float _676 = _531;
    float _678 = _545;
    float _680 = _541;
    if (!_628)
    {
        _672 = _533;
    }
    float _682 = _672;
    bool _684 = !_395;
    float _686 = _684 ? _425 : as_type<float>(_666);
    float _688 = _682;
    if (!_628)
    {
        _674 = _652;
    }
    float _690 = _674;
    bool _692 = !_628;
    float _694 = _690;
    if (!_692)
    {
        float _696 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _698 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _700 = _590 + _698;
        float _702 = _652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _704 = rsqrt(_570);
        float _706 = _700 * _696;
        float _708 = _706 * 0.15915493667125701904296875;
        float _710 = _708 * 6.283185482025146484375;
        float _712 = sin(_710);
        float _714 = _708 * 6.283185482025146484375;
        float _716 = cos(_714);
        float _718 = fma(_712, _702, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _720 = _704 * _718;
        float _722 = _716 + (-1.0);
        float _724 = fma(_545, _720, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _726 = fma(_541, _720, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _728 = _722 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _730 = fma(_652, _716, _728);
        _688 = _724;
        _676 = _726;
        _694 = _730;
    }
    float _732 = _688;
    float _734 = _676;
    float _736 = _694;
    float _738 = _736;
    if (_511)
    {
        _678 = _732;
    }
    float _740 = _678;
    float _742 = _740;
    if (_511)
    {
        _680 = _734;
    }
    float _744 = _680;
    float _746 = _744;
    if (!_511)
    {
        float _748 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _750 = _525 + _748;
        float _752 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _754 = _523 + _752;
        float _756 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _758 = -_523;
        float _760 = _758 + _732;
        float _762 = _750 * _750;
        float _764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _766 = _519 + _764;
        float _768 = -_519;
        float _770 = _768 + _734;
        float _772 = fma(_754, _754, _762);
        float _774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _776 = fma(_766, _766, _772);
        float _778 = sqrt(_776);
        float _780 = _756 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _782 = precise::min(_778, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _784 = _782 * _774;
        float _786 = _780 * _784;
        float _788 = -_525;
        float _790 = _788 + _736;
        float _792 = fma(_760, _786, _523);
        float _794 = fma(_790, _786, _525);
        float _796 = fma(_770, _786, _519);
        _738 = _794;
        _742 = _792;
        _746 = _796;
    }
    float _798 = _738;
    float _800 = _742;
    float _802 = _746;
    float _804 = 1.0 / _670;
    bool _806 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _808 = isnan(0.5);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _814 = _810 || _812;
    float _816 = _798 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _818 = _798 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _820 = _798 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _822 = _798 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _824 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[1].x, _816);
    float _826 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[0].x, _818);
    float _828 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[2].x, _820);
    float _830 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[3].x, _822);
    float _832 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[1].z, _824);
    float _834 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[0].z, _826);
    float _836 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[2].z, _828);
    float _838 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[3].z, _830);
    float _840 = _802;
    float _842 = _826;
    if (_814)
    {
        _840 = 1.0;
    }
    float _844 = _840;
    float _846 = _832 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _848 = _844;
    if (_814)
    {
        _842 = 1.0;
    }
    float _850 = _842;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _854 = _804 * _852;
    float _856 = _850;
    if (!_814)
    {
        float _858 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _860 = _858 * 0.15915493667125701904296875;
        float _862 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _864 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _866 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _864;
        float _868 = _860 * 6.283185482025146484375;
        float _870 = cos(_868);
        float _872 = _862 * 0.15915493667125701904296875;
        float _874 = _860 * 6.283185482025146484375;
        float _876 = sin(_874);
        float _878 = 1.0 / _870;
        float _880 = _872 * 6.283185482025146484375;
        float _882 = cos(_880);
        float _884 = _876 * _878;
        float _886 = _872 * 6.283185482025146484375;
        float _888 = sin(_886);
        float _890 = _882 * _884;
        float _892 = 1.0 / _866;
        float _894 = 1.0 / _890;
        float _896 = _888 * _894;
        float _898 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _900 = fma(_854, _896, _898);
        float _902 = _900 * _892;
        float _904 = precise::clamp(_902, 0.0, 1.0);
        _848 = _904;
    }
    float _906 = _848;
    if (!_814)
    {
        float _908 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _910 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _912 = _908 * 0.15915493667125701904296875;
        float _914 = _910 * 0.15915493667125701904296875;
        float _916 = _912 * 6.283185482025146484375;
        float _918 = cos(_916);
        float _920 = _912 * 6.283185482025146484375;
        float _922 = sin(_920);
        float _924 = 1.0 / _918;
        float _926 = _914 * 6.283185482025146484375;
        float _928 = cos(_926);
        float _930 = _922 * _924;
        float _932 = _914 * 6.283185482025146484375;
        float _934 = sin(_932);
        float _936 = _928 * _930;
        float _938 = 1.0 / _936;
        float _940 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _942 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _940;
        float _944 = 1.0 / _942;
        float _946 = _934 * _938;
        float _948 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _950 = fma(_854, _946, _948);
        float _952 = _950 * _944;
        float _954 = precise::clamp(_952, 0.0, 1.0);
        float _956 = -_954;
        float _958 = _956 + 1.0;
        _856 = _958;
    }
    float _960 = _856;
    float _962 = _846 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _964 = _834 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _968 = _846 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _970 = _846 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _972 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[6].x, _962);
    float _974 = _846 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _976 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[4].x, _968);
    float _978 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[5].x, _970);
    float _980 = _662 + 0.5;
    float _982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _984 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[7].x, _974);
    float _986 = _836 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _988 = _906 > 0.0;
    bool _990 = isnan(_906);
    bool _992 = _988 || _990;
    bool _994 = isnan(0.0);
    bool _996 = _992 || _994;
    float _998 = -_686;
    float _1000 = _998 + 0.5;
    float _1002 = _980 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1004 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[6].z, _972);
    float _1006 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[7].z, _984);
    float _1008 = _838 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1010 = _906 * _960;
    bool _1012 = _960 <= 0.0;
    bool _1014 = !_996;
    bool _1016 = _1012 || _1014;
    float _1018 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1020 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[4].z, _976);
    float _1022 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[5].z, _978);
    float _1024 = _638 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1026 = _1002 * _966;
    float _1028 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1004);
    float _1030 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1006);
    float _1032 = _1018 * _982;
    float _1034 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1020);
    float _1036 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1022);
    float _1038 = _564 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1040 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1042 = _646 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1044 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1046 = _1028 + _1030;
    float _1048 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1050 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1052 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1054 = _1044 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1056 = _1046 * 0.5;
    out.m_46.x = _1026;
    out.m_46.y = _1032;
    out.m_48.x = _1040;
    out.m_48.y = _1052;
    out.m_48.z = _1048;
    out.m_48.w = _1050;
    out.m_33.x = _1054;
    out.gl_Position.x = _1034;
    out.gl_Position.y = _1036;
    out.gl_Position.z = _1028;
    out.gl_Position.w = _1030;
    out.m_50.z = _1056;
    out.m_50.w = _1030;
    if (!_1016)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1058 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1058;
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
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _343 = false;
    bool _231 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1115 = as_type<float>(_85);
        out.gl_Position.z = _1115;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _89 = in.m_35.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_99)
    {
        float _105 = float(_69);
        _79 = _105;
    }
    float _107 = _79;
    bool _109 = _103 >= _107;
    bool _111 = !_99;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _87 = as_type<int>(_119);
    }
    int _121 = _87;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1184 = as_type<float>(_121);
        out.gl_Position.z = _1184;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_37.x;
    float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _127 = _103 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _131 = _129 != 0;
    int _133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _135 = _133 != 0;
    int _137 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _139 = _137 != 0;
    float _141 = _127 * _125;
    float _143 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[20].x, _141);
    float _145 = floor(_143);
    float _147 = _143 * 6.283185482025146484375;
    float _149 = _147 * 0.15915493667125701904296875;
    bool _151 = !_131;
    int _153 = _151 ? 0 : 1;
    int _155 = abs(_153);
    float _157 = _149 * 6.283185482025146484375;
    float _159 = cos(_157);
    float _161 = -_145;
    float _163 = _143 + _161;
    bool _165 = !_139;
    int _167 = _165 ? 0 : 1;
    bool _169 = !_135;
    int _171 = _169 ? 0 : 1;
    int _173 = abs(_167);
    int _175 = abs(_171);
    float _177 = -_163;
    float _179 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _181 = float(_155);
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = fma(_159, 0.5, 0.5);
    float _187 = abs(_179);
    float _189 = _181 * _187;
    bool _191 = _163 < 0.5;
    float _193 = float(_191);
    float _195 = -_185;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _199 = float(_173);
    float _201 = -_193;
    float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _205 = float(_175);
    float _207 = fma(_199, _197, _189);
    float _209 = abs(_203);
    float _211 = fma(_205, _209, _207);
    bool _213 = !_183;
    float _229;
    if (!_213)
    {
        float _215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _217 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _221 = _219 * _215;
        float _223 = floor(_221);
        float _225 = -_223;
        float _227 = _221 + _225;
        _229 = _227;
        _231 = true;
    }
    else
    {
        float _233 = float(_69);
        float _235 = 1.0 / _233;
        float _237 = _103 * _235;
        _229 = _237;
    }
    _231 = false;
    float _239 = _229;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _239 + _241;
    float _245 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _247 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _249 = isnan(_239);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = _245 * _123;
    float _265 = -_257;
    float _267 = _265 + 1.0;
    bool _269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _271 = 1.0 / _261;
    float _273 = trunc(_263);
    int _275 = int(_273);
    float _277 = _243 * _271;
    bool _279 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _281 = isnan(_239);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _295;
    float _299 = _289 * _267;
    float _301 = fma(_293, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _303 = fma(_297, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _305 = -_289;
    float _307 = _305 + 1.0;
    float _309 = _301 * _299;
    float _311 = _303 * _299;
    float _313 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _315 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].y, _311);
    float _317 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[144].x, _313);
    float _319 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[144].y, _315);
    int _321 = _275 << 4;
    int _323 = _321 + 1712;
    bool _325 = !_269;
    float _341;
    if (!_325)
    {
        float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _329 = _123 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _333 = _331 * _327;
        float _335 = floor(_333);
        float _337 = -_335;
        float _339 = _333 + _337;
        _341 = _339;
        _343 = true;
    }
    else
    {
        float _345 = float(_69);
        float _347 = 1.0 / _345;
        float _349 = _103 * _347;
        _341 = _349;
    }
    _343 = false;
    float _351 = _341;
    float _353 = as_type<float>(int(gl_VertexIndex));
    bool _355 = _123 > 0.5;
    float _357 = in.m_42.x;
    float _359 = in.m_42.y;
    bool _361 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _363 = isnan(_351);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = in.m_37.y;
    float _375 = in.m_30.x;
    float _377 = in.m_30.y;
    float _379 = in.m_30.z;
    int _381 = as_type<int>(_353) & 1;
    bool _383 = _381 != 0;
    int _385 = as_type<int>(_353) & 2;
    bool _387 = _385 != 0;
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _391 = _389 != 0;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _395 = _393 != 0;
    float _397 = _317 * _357;
    float _399 = _319 * _359;
    bool _401 = _373 > 0.5;
    float _403 = _211 * _397;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _409 = _377 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _411 = _377 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _413 = _377 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _415 = 1.0 / _407;
    float _417 = _211 * _399;
    float _419 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _409);
    float _421 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _413);
    bool _423 = !_387;
    float _425 = _423 ? (-0.5) : 0.5;
    float _427 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _429 = !_383;
    float _431 = _429 ? (-0.5) : 0.5;
    float _433 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _411);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _439 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _425);
    float _441 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _443 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _431);
    float _445 = _427 * _439;
    float _447 = 1.0 / _437;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _449;
    float _453 = _441 * _443;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _461 = _451 * _415;
    float _463 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _465 = _445 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _471 = _445 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _473 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _475 = _457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _477 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _479 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[26].x, _471);
    float _481 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _421);
    float _483 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[24].x, _465);
    float _485 = _469 * _447;
    float _487 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].z, _479);
    out.m_44.x = _473;
    out.m_44.y = _475;
    out.m_44.z = _477;
    float _489 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].z, _483);
    bool _491 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _493 = isnan(_351);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    bool _503 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _505 = isnan(0.5);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _511 = _507 || _509;
    float _513 = _489 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _515 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _419);
    float _517 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _433);
    float _519 = _481 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _521 = _487 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _523 = _515 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _525 = _517 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _529 = _351 + _527;
    float _531 = _519 + _521;
    float _533 = _523 + _513;
    float _535 = _525 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _537 = fma(_461, _529, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _539 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _541 = _531 + _539;
    float _543 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _545 = _533 + _543;
    float _547 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[11].x, _535);
    float _549 = -_501;
    float _551 = _549 + 1.0;
    float _553 = _541 * _541;
    int _555 = _323 + 8;
    uint _558 = uint(int(uint(_555) >> uint(2)));
    uint _560 = uint(int(uint(int(_558)) >> uint(2)));
    int _562 = int(_558) & 3;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[int(_560)][_562];
    float _566 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[11].z, _547);
    float _568 = _371 * _551;
    float _570 = fma(_545, _545, _553);
    bool _572 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _574 = isnan(_351);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -_371;
    float _586 = _584 + 1.0;
    float _588 = _525 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _590 = sqrt(_570);
    float _592 = _566 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _596 = _351 + _594;
    float _598 = _582 * _586;
    float _600 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[10].x, _588);
    float _602 = -_582;
    float _604 = _602 + 1.0;
    float _606 = fma(_485, _596, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _608 = _445 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _610 = 1.0 / _592;
    float _612 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[10].z, _600);
    float _614 = _537 * _598;
    float _616 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[25].x, _608);
    float _618 = -_431;
    int _620 = _355 ? as_type<int>(_618) : as_type<int>(_431);
    float _622 = _612 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _624 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[115].x, _614);
    float _626 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].z, _616);
    bool _628 = _590 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _630 = _622 + _592;
    uint _632 = uint(int(uint(_323) >> uint(2)));
    uint _634 = uint(int(uint(int(_632)) >> uint(2)));
    int _636 = int(_632) & 3;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[int(_634)][_636];
    int _640 = int(_632) + 1;
    uint _642 = uint(int(uint(_640) >> uint(2)));
    int _644 = _640 & 3;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[int(_642)][_644];
    float _648 = _626 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _650 = fma(_606, _568, _624);
    float _652 = _525 + _648;
    float _654 = _630 * _610;
    float _656 = _654 * 0.5;
    float _658 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[117].x, _650);
    bool _660 = !_391;
    float _662 = _660 ? _431 : as_type<float>(_620);
    float _664 = -_425;
    int _666 = _401 ? as_type<int>(_664) : as_type<int>(_425);
    float _668 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _670 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[30].w, _668);
    float _672 = _463;
    float _674 = _431;
    float _676 = _531;
    float _678 = _545;
    float _680 = _541;
    if (!_628)
    {
        _672 = _533;
    }
    float _682 = _672;
    bool _684 = !_395;
    float _686 = _684 ? _425 : as_type<float>(_666);
    float _688 = _682;
    if (!_628)
    {
        _674 = _652;
    }
    float _690 = _674;
    bool _692 = !_628;
    float _694 = _690;
    if (!_692)
    {
        float _696 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _698 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _700 = _590 + _698;
        float _702 = _652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _704 = rsqrt(_570);
        float _706 = _700 * _696;
        float _708 = _706 * 0.15915493667125701904296875;
        float _710 = _708 * 6.283185482025146484375;
        float _712 = sin(_710);
        float _714 = _708 * 6.283185482025146484375;
        float _716 = cos(_714);
        float _718 = fma(_712, _702, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _720 = _704 * _718;
        float _722 = _716 + (-1.0);
        float _724 = fma(_545, _720, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _726 = fma(_541, _720, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _728 = _722 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _730 = fma(_652, _716, _728);
        _688 = _724;
        _676 = _726;
        _694 = _730;
    }
    float _732 = _688;
    float _734 = _676;
    float _736 = _694;
    float _738 = _736;
    if (_511)
    {
        _678 = _732;
    }
    float _740 = _678;
    float _742 = _740;
    if (_511)
    {
        _680 = _734;
    }
    float _744 = _680;
    float _746 = _744;
    if (!_511)
    {
        float _748 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _750 = _525 + _748;
        float _752 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _754 = _523 + _752;
        float _756 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _758 = -_523;
        float _760 = _758 + _732;
        float _762 = _750 * _750;
        float _764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _766 = _519 + _764;
        float _768 = -_519;
        float _770 = _768 + _734;
        float _772 = fma(_754, _754, _762);
        float _774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _776 = fma(_766, _766, _772);
        float _778 = sqrt(_776);
        float _780 = _756 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _782 = precise::min(_778, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _784 = _782 * _774;
        float _786 = _780 * _784;
        float _788 = -_525;
        float _790 = _788 + _736;
        float _792 = fma(_760, _786, _523);
        float _794 = fma(_790, _786, _525);
        float _796 = fma(_770, _786, _519);
        _738 = _794;
        _742 = _792;
        _746 = _796;
    }
    float _798 = _738;
    float _800 = _742;
    float _802 = _746;
    float _804 = 1.0 / _670;
    bool _806 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _808 = isnan(0.5);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _814 = _810 || _812;
    float _816 = _798 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _818 = _798 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _820 = _798 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _822 = _798 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _824 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[1].x, _816);
    float _826 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[0].x, _818);
    float _828 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[2].x, _820);
    float _830 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[3].x, _822);
    float _832 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[1].z, _824);
    float _834 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[0].z, _826);
    float _836 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[2].z, _828);
    float _838 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[3].z, _830);
    float _840 = _802;
    float _842 = _826;
    if (_814)
    {
        _840 = 1.0;
    }
    float _844 = _840;
    float _846 = _832 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _848 = _844;
    if (_814)
    {
        _842 = 1.0;
    }
    float _850 = _842;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _854 = _804 * _852;
    float _856 = _850;
    if (!_814)
    {
        float _858 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _860 = _858 * 0.15915493667125701904296875;
        float _862 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _864 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _866 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _864;
        float _868 = _860 * 6.283185482025146484375;
        float _870 = cos(_868);
        float _872 = _862 * 0.15915493667125701904296875;
        float _874 = _860 * 6.283185482025146484375;
        float _876 = sin(_874);
        float _878 = 1.0 / _870;
        float _880 = _872 * 6.283185482025146484375;
        float _882 = cos(_880);
        float _884 = _876 * _878;
        float _886 = _872 * 6.283185482025146484375;
        float _888 = sin(_886);
        float _890 = _882 * _884;
        float _892 = 1.0 / _866;
        float _894 = 1.0 / _890;
        float _896 = _888 * _894;
        float _898 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _900 = fma(_854, _896, _898);
        float _902 = _900 * _892;
        float _904 = precise::clamp(_902, 0.0, 1.0);
        _848 = _904;
    }
    float _906 = _848;
    if (!_814)
    {
        float _908 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _910 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _912 = _908 * 0.15915493667125701904296875;
        float _914 = _910 * 0.15915493667125701904296875;
        float _916 = _912 * 6.283185482025146484375;
        float _918 = cos(_916);
        float _920 = _912 * 6.283185482025146484375;
        float _922 = sin(_920);
        float _924 = 1.0 / _918;
        float _926 = _914 * 6.283185482025146484375;
        float _928 = cos(_926);
        float _930 = _922 * _924;
        float _932 = _914 * 6.283185482025146484375;
        float _934 = sin(_932);
        float _936 = _928 * _930;
        float _938 = 1.0 / _936;
        float _940 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _942 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _940;
        float _944 = 1.0 / _942;
        float _946 = _934 * _938;
        float _948 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _950 = fma(_854, _946, _948);
        float _952 = _950 * _944;
        float _954 = precise::clamp(_952, 0.0, 1.0);
        float _956 = -_954;
        float _958 = _956 + 1.0;
        _856 = _958;
    }
    float _960 = _856;
    float _962 = _846 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _964 = _834 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _968 = _846 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _970 = _846 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _972 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[6].x, _962);
    float _974 = _846 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _976 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[4].x, _968);
    float _978 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[5].x, _970);
    float _980 = _662 + 0.5;
    float _982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _984 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[7].x, _974);
    float _986 = _836 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _988 = _906 > 0.0;
    bool _990 = isnan(_906);
    bool _992 = _988 || _990;
    bool _994 = isnan(0.0);
    bool _996 = _992 || _994;
    float _998 = -_686;
    float _1000 = _998 + 0.5;
    float _1002 = _980 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1004 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[6].z, _972);
    float _1006 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[7].z, _984);
    float _1008 = _838 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1010 = _906 * _960;
    bool _1012 = _960 <= 0.0;
    bool _1014 = !_996;
    bool _1016 = _1012 || _1014;
    float _1018 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1020 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[4].z, _976);
    float _1022 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[5].z, _978);
    float _1024 = _638 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1026 = _1002 * _966;
    float _1028 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1004);
    float _1030 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1006);
    float _1032 = _1018 * _982;
    float _1034 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1020);
    float _1036 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1022);
    float _1038 = _564 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1040 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1042 = _646 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1044 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1046 = _1028 + _1030;
    float _1048 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1050 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1052 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1054 = _1044 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1056 = _1046 * 0.5;
    out.m_46.x = _1026;
    out.m_46.y = _1032;
    out.m_48.x = _1040;
    out.m_48.y = _1052;
    out.m_48.z = _1048;
    out.m_48.w = _1050;
    out.m_33.x = _1054;
    out.gl_Position.x = _1034;
    out.gl_Position.y = _1036;
    out.gl_Position.z = _1028;
    out.gl_Position.w = _1030;
    out.m_50.z = _1056;
    out.m_50.w = _1030;
    if (!_1016)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1058 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1058;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

