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
    float4 m_39 [[attribute(5)]];
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
        float _1047 = as_type<float>(_85);
        out.gl_Position.z = _1047;
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
        float _1116 = as_type<float>(_121);
        out.gl_Position.z = _1116;
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
    float _145 = _143 * 6.283185482025146484375;
    float _147 = floor(_143);
    float _149 = _145 * 0.15915493667125701904296875;
    bool _151 = !_131;
    int _153 = _151 ? 0 : 1;
    int _155 = abs(_153);
    float _157 = _149 * 6.283185482025146484375;
    float _159 = cos(_157);
    float _161 = -_147;
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
    float _183 = fma(_159, 0.5, 0.5);
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _187 = _163 < 0.5;
    float _189 = float(_187);
    float _191 = abs(_179);
    float _193 = _181 * _191;
    float _195 = -_183;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _199 = float(_173);
    float _201 = -_189;
    float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _205 = float(_175);
    float _207 = fma(_199, _197, _193);
    float _209 = abs(_203);
    float _211 = fma(_205, _209, _207);
    bool _213 = !_185;
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
    int _309 = _275 << 4;
    int _311 = _309 + 1712;
    float _313 = _301 * _299;
    float _315 = _303 * _299;
    float _317 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].x, _313);
    float _319 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].y, _315);
    float _321 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[144].x, _317);
    float _323 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[144].y, _319);
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
    float _353 = in.m_39.x;
    float _355 = in.m_39.y;
    bool _357 = _123 > 0.5;
    bool _359 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _361 = isnan(_351);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = as_type<float>(int(gl_VertexIndex));
    float _373 = in.m_30.x;
    float _375 = in.m_30.y;
    float _377 = in.m_30.z;
    float _379 = in.m_37.y;
    float _381 = _321 * _353;
    float _383 = _323 * _355;
    float _385 = _211 * _381;
    int _387 = as_type<int>(_371) & 1;
    bool _389 = _387 != 0;
    int _391 = as_type<int>(_371) & 2;
    bool _393 = _391 != 0;
    float _395 = _211 * _383;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _399 = _397 != 0;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _403 = _401 != 0;
    float _405 = _375 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _407 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _409 = _379 > 0.5;
    float _411 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].x, _405);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _417 = _375 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _419 = _375 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _421 = _385 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _423 = 1.0 / _415;
    float _425 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].x, _417);
    float _427 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].x, _419);
    bool _429 = !_393;
    float _431 = _429 ? (-0.5) : 0.5;
    float _433 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].z, _411);
    bool _435 = !_389;
    float _437 = _435 ? (-0.5) : 0.5;
    float _439 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].z, _425);
    float _441 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].z, _427);
    float _443 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _431);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _445;
    float _449 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _437);
    float _451 = _407 * _443;
    float _453 = _421 * _449;
    float _455 = _447 * _423;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _351 + _457;
    float _461 = _451 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _463 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _467 = fma(_455, _459, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _469 = _451 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _471 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[26].x, _461);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _477 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[24].x, _469);
    float _479 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].z, _471);
    float _481 = _465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _483 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _485 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _487 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].z, _477);
    float _489 = _441 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _491 = _479 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _493 = _439 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    out.m_44.x = _481;
    out.m_44.y = _483;
    out.m_44.z = _485;
    float _495 = _489 + _491;
    bool _497 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _499 = isnan(_351);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = _451 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _511 = _311 + 8;
    uint _514 = uint(int(uint(_511) >> uint(2)));
    uint _516 = uint(int(uint(int(_514)) >> uint(2)));
    int _518 = int(_514) & 3;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[int(_516)][_518];
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _528 = isnan(0.5);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _534 = _530 || _532;
    float _536 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[25].x, _509);
    float _538 = 1.0 / _524;
    float _540 = _487 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _542 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _544 = isnan(_351);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = _433 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = _351 + _556;
    float _560 = _493 + _540;
    float _562 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _564 = _495 + _562;
    float _566 = -_552;
    float _568 = _566 + 1.0;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _574 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _576 = _560 + _574;
    float _578 = _564 * _564;
    float _580 = _554 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _582 = _369 * _568;
    float _584 = -_369;
    float _586 = _584 + 1.0;
    float _588 = fma(_576, _576, _578);
    float _590 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[11].x, _580);
    float _592 = _572 * _538;
    float _594 = _507 * _586;
    float _596 = sqrt(_588);
    float _598 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[11].z, _590);
    float _600 = -_507;
    float _602 = _600 + 1.0;
    float _604 = _467 * _594;
    float _606 = _554 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _608 = _598 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _610 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].z, _536);
    float _612 = fma(_592, _558, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _614 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[10].x, _606);
    float _616 = 1.0 / _608;
    float _618 = -_437;
    int _620 = _357 ? as_type<int>(_618) : as_type<int>(_437);
    uint _622 = uint(int(uint(_311) >> uint(2)));
    uint _624 = uint(int(uint(int(_622)) >> uint(2)));
    int _626 = int(_622) & 3;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[int(_624)][_626];
    int _630 = int(_622) + 1;
    uint _632 = uint(int(uint(_630) >> uint(2)));
    int _634 = _630 & 3;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[int(_632)][_634];
    float _638 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[10].z, _614);
    float _640 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[115].x, _604);
    bool _642 = !_399;
    float _644 = _642 ? _437 : as_type<float>(_620);
    bool _646 = _596 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _648 = _638 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _650 = -_431;
    int _652 = _409 ? as_type<int>(_650) : as_type<int>(_431);
    float _654 = _610 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _656 = fma(_612, _582, _640);
    float _658 = _648 + _608;
    bool _660 = !_403;
    float _662 = _660 ? _431 : as_type<float>(_652);
    float _664 = _554 + _654;
    float _666 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[117].x, _656);
    bool _668 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _670 = isnan(0.5);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _676 = _672 || _674;
    float _678 = _658 * _616;
    float _680 = _678 * 0.5;
    float _682 = _463;
    float _684 = _654;
    float _686 = _495;
    float _688 = _576;
    float _690 = _564;
    float _692 = _489;
    if (!_646)
    {
        _682 = _560;
    }
    float _694 = _682;
    float _696 = _694;
    if (!_646)
    {
        _684 = _664;
    }
    float _698 = _684;
    bool _700 = !_646;
    float _702 = _698;
    if (!_700)
    {
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _706 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _708 = _596 + _706;
        float _710 = _664 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _712 = rsqrt(_588);
        float _714 = _708 * _704;
        float _716 = _714 * 0.15915493667125701904296875;
        float _718 = _716 * 6.283185482025146484375;
        float _720 = cos(_718);
        float _722 = _716 * 6.283185482025146484375;
        float _724 = sin(_722);
        float _726 = _720 + (-1.0);
        float _728 = fma(_724, _710, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _730 = _726 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _732 = _712 * _728;
        float _734 = fma(_664, _720, _730);
        float _736 = fma(_576, _732, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _738 = fma(_564, _732, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _696 = _736;
        _686 = _738;
        _702 = _734;
    }
    float _740 = _696;
    float _742 = _686;
    float _744 = _702;
    float _746 = _744;
    if (_534)
    {
        _688 = _740;
    }
    float _748 = _688;
    float _750 = _748;
    if (_534)
    {
        _690 = _742;
    }
    float _752 = _690;
    float _754 = _752;
    if (!_534)
    {
        float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _758 = _554 + _756;
        float _760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _762 = _493 + _760;
        float _764 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _766 = -_493;
        float _768 = _766 + _740;
        float _770 = _758 * _758;
        float _772 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _774 = _489 + _772;
        float _776 = -_554;
        float _778 = _776 + _744;
        float _780 = fma(_762, _762, _770);
        float _782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _784 = fma(_774, _774, _780);
        float _786 = sqrt(_784);
        float _788 = _764 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _790 = precise::min(_786, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _792 = _790 * _782;
        float _794 = _788 * _792;
        float _796 = -_489;
        float _798 = _796 + _742;
        float _800 = fma(_768, _794, _493);
        float _802 = fma(_778, _794, _554);
        float _804 = fma(_798, _794, _489);
        _746 = _802;
        _750 = _800;
        _754 = _804;
    }
    float _806 = _746;
    float _808 = _750;
    float _810 = _754;
    if (_676)
    {
        _692 = 1.0;
    }
    float _812 = _692;
    float _814 = _812;
    if (!_676)
    {
        float _816 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _818 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _820 = _816 * 0.15915493667125701904296875;
        float _822 = _818 * 0.15915493667125701904296875;
        float _824 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _826 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[30].w, _824);
        float _828 = _820 * 6.283185482025146484375;
        float _830 = cos(_828);
        float _832 = _820 * 6.283185482025146484375;
        float _834 = sin(_832);
        float _836 = 1.0 / _830;
        float _838 = _822 * 6.283185482025146484375;
        float _840 = cos(_838);
        float _842 = _834 * _836;
        float _844 = _822 * 6.283185482025146484375;
        float _846 = sin(_844);
        float _848 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _850 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _848;
        float _852 = _840 * _842;
        float _854 = 1.0 / _826;
        float _856 = 1.0 / _852;
        float _858 = 1.0 / _850;
        float _860 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _862 = _854 * _860;
        float _864 = _846 * _856;
        float _866 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _868 = fma(_864, _862, _866);
        float _870 = _868 * _858;
        float _872 = precise::clamp(_870, 0.0, 1.0);
        _814 = _872;
    }
    float _874 = _814;
    float _876 = _806 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _878 = _806 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _880 = _806 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _882 = _806 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _884 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[1].x, _876);
    float _886 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[0].x, _878);
    float _888 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[2].x, _880);
    float _890 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[3].x, _882);
    float _892 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[1].z, _884);
    float _894 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[0].z, _886);
    float _896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _898 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[2].z, _888);
    float _900 = _892 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _902 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[3].z, _890);
    float _904 = _894 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _906 = _898 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _908 = _900 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _910 = _900 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _912 = _900 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _914 = _900 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _918 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[4].x, _908);
    float _920 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[5].x, _910);
    float _922 = _644 + 0.5;
    float _924 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[6].x, _912);
    float _926 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[7].x, _914);
    float _928 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[4].z, _918);
    float _930 = _902 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _932 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[5].z, _920);
    float _934 = _922 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _936 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[6].z, _924);
    float _938 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[7].z, _926);
    float _940 = -_662;
    float _942 = _940 + 0.5;
    float _944 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[4].w, _928);
    float _946 = _934 * _896;
    float _948 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[5].w, _932);
    float _950 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[6].w, _936);
    float _952 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[7].w, _938);
    bool _954 = _874 > 0.0;
    bool _956 = isnan(_874);
    bool _958 = _954 || _956;
    bool _960 = isnan(0.0);
    bool _962 = _958 || _960;
    float _964 = _942 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _966 = _520 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _968 = _628 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _970 = _636 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _972 = _874 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _974 = _950 + _952;
    float _976 = _964 * _916;
    float _978 = _966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _984 = _666 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _986 = _972 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _988 = _974 * 0.5;
    out.m_46.x = _946;
    out.m_46.y = _976;
    out.m_48.x = _980;
    out.m_48.y = _982;
    out.m_48.z = _978;
    out.m_48.w = _984;
    out.m_33.x = _986;
    out.gl_Position.x = _944;
    out.gl_Position.y = _948;
    out.gl_Position.z = _950;
    out.gl_Position.w = _952;
    out.m_50.z = _988;
    out.m_50.w = _952;
    if (_962)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _990 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _990;
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
        float _1047 = as_type<float>(_85);
        out.gl_Position.z = _1047;
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
        float _1116 = as_type<float>(_121);
        out.gl_Position.z = _1116;
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
    float _145 = _143 * 6.283185482025146484375;
    float _147 = floor(_143);
    float _149 = _145 * 0.15915493667125701904296875;
    bool _151 = !_131;
    int _153 = _151 ? 0 : 1;
    int _155 = abs(_153);
    float _157 = _149 * 6.283185482025146484375;
    float _159 = cos(_157);
    float _161 = -_147;
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
    float _183 = fma(_159, 0.5, 0.5);
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _187 = _163 < 0.5;
    float _189 = float(_187);
    float _191 = abs(_179);
    float _193 = _181 * _191;
    float _195 = -_183;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _199 = float(_173);
    float _201 = -_189;
    float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _205 = float(_175);
    float _207 = fma(_199, _197, _193);
    float _209 = abs(_203);
    float _211 = fma(_205, _209, _207);
    bool _213 = !_185;
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
    int _309 = _275 << 4;
    int _311 = _309 + 1712;
    float _313 = _301 * _299;
    float _315 = _303 * _299;
    float _317 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].x, _313);
    float _319 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].y, _315);
    float _321 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[144].x, _317);
    float _323 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[144].y, _319);
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
    float _353 = in.m_39.x;
    float _355 = in.m_39.y;
    bool _357 = _123 > 0.5;
    bool _359 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _361 = isnan(_351);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = as_type<float>(int(gl_VertexIndex));
    float _373 = in.m_30.x;
    float _375 = in.m_30.y;
    float _377 = in.m_30.z;
    float _379 = in.m_37.y;
    float _381 = _321 * _353;
    float _383 = _323 * _355;
    float _385 = _211 * _381;
    int _387 = as_type<int>(_371) & 1;
    bool _389 = _387 != 0;
    int _391 = as_type<int>(_371) & 2;
    bool _393 = _391 != 0;
    float _395 = _211 * _383;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _399 = _397 != 0;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _403 = _401 != 0;
    float _405 = _375 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _407 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _409 = _379 > 0.5;
    float _411 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].x, _405);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _417 = _375 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _419 = _375 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _421 = _385 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _423 = 1.0 / _415;
    float _425 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].x, _417);
    float _427 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].x, _419);
    bool _429 = !_393;
    float _431 = _429 ? (-0.5) : 0.5;
    float _433 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].z, _411);
    bool _435 = !_389;
    float _437 = _435 ? (-0.5) : 0.5;
    float _439 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].z, _425);
    float _441 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].z, _427);
    float _443 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _431);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _445;
    float _449 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _437);
    float _451 = _407 * _443;
    float _453 = _421 * _449;
    float _455 = _447 * _423;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _351 + _457;
    float _461 = _451 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _463 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _467 = fma(_455, _459, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _469 = _451 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _471 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[26].x, _461);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _477 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[24].x, _469);
    float _479 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].z, _471);
    float _481 = _465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _483 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _485 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _487 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].z, _477);
    float _489 = _441 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _491 = _479 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _493 = _439 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    out.m_44.x = _481;
    out.m_44.y = _483;
    out.m_44.z = _485;
    float _495 = _489 + _491;
    bool _497 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _499 = isnan(_351);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = _451 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _511 = _311 + 8;
    uint _514 = uint(int(uint(_511) >> uint(2)));
    uint _516 = uint(int(uint(int(_514)) >> uint(2)));
    int _518 = int(_514) & 3;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[int(_516)][_518];
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _528 = isnan(0.5);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _534 = _530 || _532;
    float _536 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[25].x, _509);
    float _538 = 1.0 / _524;
    float _540 = _487 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _542 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _544 = isnan(_351);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = _433 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = _351 + _556;
    float _560 = _493 + _540;
    float _562 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _564 = _495 + _562;
    float _566 = -_552;
    float _568 = _566 + 1.0;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _574 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _576 = _560 + _574;
    float _578 = _564 * _564;
    float _580 = _554 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _582 = _369 * _568;
    float _584 = -_369;
    float _586 = _584 + 1.0;
    float _588 = fma(_576, _576, _578);
    float _590 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[11].x, _580);
    float _592 = _572 * _538;
    float _594 = _507 * _586;
    float _596 = sqrt(_588);
    float _598 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[11].z, _590);
    float _600 = -_507;
    float _602 = _600 + 1.0;
    float _604 = _467 * _594;
    float _606 = _554 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _608 = _598 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _610 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].z, _536);
    float _612 = fma(_592, _558, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _614 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[10].x, _606);
    float _616 = 1.0 / _608;
    float _618 = -_437;
    int _620 = _357 ? as_type<int>(_618) : as_type<int>(_437);
    uint _622 = uint(int(uint(_311) >> uint(2)));
    uint _624 = uint(int(uint(int(_622)) >> uint(2)));
    int _626 = int(_622) & 3;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[int(_624)][_626];
    int _630 = int(_622) + 1;
    uint _632 = uint(int(uint(_630) >> uint(2)));
    int _634 = _630 & 3;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[int(_632)][_634];
    float _638 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[10].z, _614);
    float _640 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[115].x, _604);
    bool _642 = !_399;
    float _644 = _642 ? _437 : as_type<float>(_620);
    bool _646 = _596 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _648 = _638 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _650 = -_431;
    int _652 = _409 ? as_type<int>(_650) : as_type<int>(_431);
    float _654 = _610 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _656 = fma(_612, _582, _640);
    float _658 = _648 + _608;
    bool _660 = !_403;
    float _662 = _660 ? _431 : as_type<float>(_652);
    float _664 = _554 + _654;
    float _666 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[117].x, _656);
    bool _668 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _670 = isnan(0.5);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _676 = _672 || _674;
    float _678 = _658 * _616;
    float _680 = _678 * 0.5;
    float _682 = _463;
    float _684 = _654;
    float _686 = _495;
    float _688 = _576;
    float _690 = _564;
    float _692 = _489;
    if (!_646)
    {
        _682 = _560;
    }
    float _694 = _682;
    float _696 = _694;
    if (!_646)
    {
        _684 = _664;
    }
    float _698 = _684;
    bool _700 = !_646;
    float _702 = _698;
    if (!_700)
    {
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _706 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _708 = _596 + _706;
        float _710 = _664 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _712 = rsqrt(_588);
        float _714 = _708 * _704;
        float _716 = _714 * 0.15915493667125701904296875;
        float _718 = _716 * 6.283185482025146484375;
        float _720 = cos(_718);
        float _722 = _716 * 6.283185482025146484375;
        float _724 = sin(_722);
        float _726 = _720 + (-1.0);
        float _728 = fma(_724, _710, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _730 = _726 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _732 = _712 * _728;
        float _734 = fma(_664, _720, _730);
        float _736 = fma(_576, _732, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _738 = fma(_564, _732, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _696 = _736;
        _686 = _738;
        _702 = _734;
    }
    float _740 = _696;
    float _742 = _686;
    float _744 = _702;
    float _746 = _744;
    if (_534)
    {
        _688 = _740;
    }
    float _748 = _688;
    float _750 = _748;
    if (_534)
    {
        _690 = _742;
    }
    float _752 = _690;
    float _754 = _752;
    if (!_534)
    {
        float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _758 = _554 + _756;
        float _760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _762 = _493 + _760;
        float _764 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _766 = -_493;
        float _768 = _766 + _740;
        float _770 = _758 * _758;
        float _772 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _774 = _489 + _772;
        float _776 = -_554;
        float _778 = _776 + _744;
        float _780 = fma(_762, _762, _770);
        float _782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _784 = fma(_774, _774, _780);
        float _786 = sqrt(_784);
        float _788 = _764 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _790 = precise::min(_786, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _792 = _790 * _782;
        float _794 = _788 * _792;
        float _796 = -_489;
        float _798 = _796 + _742;
        float _800 = fma(_768, _794, _493);
        float _802 = fma(_778, _794, _554);
        float _804 = fma(_798, _794, _489);
        _746 = _802;
        _750 = _800;
        _754 = _804;
    }
    float _806 = _746;
    float _808 = _750;
    float _810 = _754;
    if (_676)
    {
        _692 = 1.0;
    }
    float _812 = _692;
    float _814 = _812;
    if (!_676)
    {
        float _816 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _818 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _820 = _816 * 0.15915493667125701904296875;
        float _822 = _818 * 0.15915493667125701904296875;
        float _824 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _826 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[30].w, _824);
        float _828 = _820 * 6.283185482025146484375;
        float _830 = cos(_828);
        float _832 = _820 * 6.283185482025146484375;
        float _834 = sin(_832);
        float _836 = 1.0 / _830;
        float _838 = _822 * 6.283185482025146484375;
        float _840 = cos(_838);
        float _842 = _834 * _836;
        float _844 = _822 * 6.283185482025146484375;
        float _846 = sin(_844);
        float _848 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _850 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _848;
        float _852 = _840 * _842;
        float _854 = 1.0 / _826;
        float _856 = 1.0 / _852;
        float _858 = 1.0 / _850;
        float _860 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _862 = _854 * _860;
        float _864 = _846 * _856;
        float _866 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _868 = fma(_864, _862, _866);
        float _870 = _868 * _858;
        float _872 = precise::clamp(_870, 0.0, 1.0);
        _814 = _872;
    }
    float _874 = _814;
    float _876 = _806 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _878 = _806 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _880 = _806 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _882 = _806 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _884 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[1].x, _876);
    float _886 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[0].x, _878);
    float _888 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[2].x, _880);
    float _890 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[3].x, _882);
    float _892 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[1].z, _884);
    float _894 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[0].z, _886);
    float _896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _898 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[2].z, _888);
    float _900 = _892 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _902 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[3].z, _890);
    float _904 = _894 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _906 = _898 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _908 = _900 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _910 = _900 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _912 = _900 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _914 = _900 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _918 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[4].x, _908);
    float _920 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[5].x, _910);
    float _922 = _644 + 0.5;
    float _924 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[6].x, _912);
    float _926 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[7].x, _914);
    float _928 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[4].z, _918);
    float _930 = _902 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _932 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[5].z, _920);
    float _934 = _922 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _936 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[6].z, _924);
    float _938 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[7].z, _926);
    float _940 = -_662;
    float _942 = _940 + 0.5;
    float _944 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[4].w, _928);
    float _946 = _934 * _896;
    float _948 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[5].w, _932);
    float _950 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[6].w, _936);
    float _952 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[7].w, _938);
    bool _954 = _874 > 0.0;
    bool _956 = isnan(_874);
    bool _958 = _954 || _956;
    bool _960 = isnan(0.0);
    bool _962 = _958 || _960;
    float _964 = _942 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _966 = _520 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _968 = _628 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _970 = _636 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _972 = _874 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _974 = _950 + _952;
    float _976 = _964 * _916;
    float _978 = _966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _984 = _666 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _986 = _972 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _988 = _974 * 0.5;
    out.m_46.x = _946;
    out.m_46.y = _976;
    out.m_48.x = _980;
    out.m_48.y = _982;
    out.m_48.z = _978;
    out.m_48.w = _984;
    out.m_33.x = _986;
    out.gl_Position.x = _944;
    out.gl_Position.y = _948;
    out.gl_Position.z = _950;
    out.gl_Position.w = _952;
    out.m_50.z = _988;
    out.m_50.w = _952;
    if (_962)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _990 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _990;
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
        float _1047 = as_type<float>(_85);
        out.gl_Position.z = _1047;
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
        float _1116 = as_type<float>(_121);
        out.gl_Position.z = _1116;
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
    float _145 = _143 * 6.283185482025146484375;
    float _147 = floor(_143);
    float _149 = _145 * 0.15915493667125701904296875;
    bool _151 = !_131;
    int _153 = _151 ? 0 : 1;
    int _155 = abs(_153);
    float _157 = _149 * 6.283185482025146484375;
    float _159 = cos(_157);
    float _161 = -_147;
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
    float _183 = fma(_159, 0.5, 0.5);
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _187 = _163 < 0.5;
    float _189 = float(_187);
    float _191 = abs(_179);
    float _193 = _181 * _191;
    float _195 = -_183;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _199 = float(_173);
    float _201 = -_189;
    float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _205 = float(_175);
    float _207 = fma(_199, _197, _193);
    float _209 = abs(_203);
    float _211 = fma(_205, _209, _207);
    bool _213 = !_185;
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
    int _309 = _275 << 4;
    int _311 = _309 + 1712;
    float _313 = _301 * _299;
    float _315 = _303 * _299;
    float _317 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].x, _313);
    float _319 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].y, _315);
    float _321 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[144].x, _317);
    float _323 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[144].y, _319);
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
    float _353 = in.m_39.x;
    float _355 = in.m_39.y;
    bool _357 = _123 > 0.5;
    bool _359 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _361 = isnan(_351);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = as_type<float>(int(gl_VertexIndex));
    float _373 = in.m_30.x;
    float _375 = in.m_30.y;
    float _377 = in.m_30.z;
    float _379 = in.m_37.y;
    float _381 = _321 * _353;
    float _383 = _323 * _355;
    float _385 = _211 * _381;
    int _387 = as_type<int>(_371) & 1;
    bool _389 = _387 != 0;
    int _391 = as_type<int>(_371) & 2;
    bool _393 = _391 != 0;
    float _395 = _211 * _383;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _399 = _397 != 0;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _403 = _401 != 0;
    float _405 = _375 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _407 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _409 = _379 > 0.5;
    float _411 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].x, _405);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _417 = _375 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _419 = _375 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _421 = _385 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _423 = 1.0 / _415;
    float _425 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].x, _417);
    float _427 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].x, _419);
    bool _429 = !_393;
    float _431 = _429 ? (-0.5) : 0.5;
    float _433 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].z, _411);
    bool _435 = !_389;
    float _437 = _435 ? (-0.5) : 0.5;
    float _439 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].z, _425);
    float _441 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].z, _427);
    float _443 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _431);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _445;
    float _449 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _437);
    float _451 = _407 * _443;
    float _453 = _421 * _449;
    float _455 = _447 * _423;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _351 + _457;
    float _461 = _451 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _463 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _467 = fma(_455, _459, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _469 = _451 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _471 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[26].x, _461);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _477 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[24].x, _469);
    float _479 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].z, _471);
    float _481 = _465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _483 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _485 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _487 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].z, _477);
    float _489 = _441 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _491 = _479 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _493 = _439 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    out.m_44.x = _481;
    out.m_44.y = _483;
    out.m_44.z = _485;
    float _495 = _489 + _491;
    bool _497 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _499 = isnan(_351);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = _451 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _511 = _311 + 8;
    uint _514 = uint(int(uint(_511) >> uint(2)));
    uint _516 = uint(int(uint(int(_514)) >> uint(2)));
    int _518 = int(_514) & 3;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[int(_516)][_518];
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _528 = isnan(0.5);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _534 = _530 || _532;
    float _536 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[25].x, _509);
    float _538 = 1.0 / _524;
    float _540 = _487 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _542 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _544 = isnan(_351);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = _433 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = _351 + _556;
    float _560 = _493 + _540;
    float _562 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _564 = _495 + _562;
    float _566 = -_552;
    float _568 = _566 + 1.0;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _574 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _576 = _560 + _574;
    float _578 = _564 * _564;
    float _580 = _554 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _582 = _369 * _568;
    float _584 = -_369;
    float _586 = _584 + 1.0;
    float _588 = fma(_576, _576, _578);
    float _590 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[11].x, _580);
    float _592 = _572 * _538;
    float _594 = _507 * _586;
    float _596 = sqrt(_588);
    float _598 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[11].z, _590);
    float _600 = -_507;
    float _602 = _600 + 1.0;
    float _604 = _467 * _594;
    float _606 = _554 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _608 = _598 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _610 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].z, _536);
    float _612 = fma(_592, _558, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _614 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[10].x, _606);
    float _616 = 1.0 / _608;
    float _618 = -_437;
    int _620 = _357 ? as_type<int>(_618) : as_type<int>(_437);
    uint _622 = uint(int(uint(_311) >> uint(2)));
    uint _624 = uint(int(uint(int(_622)) >> uint(2)));
    int _626 = int(_622) & 3;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[int(_624)][_626];
    int _630 = int(_622) + 1;
    uint _632 = uint(int(uint(_630) >> uint(2)));
    int _634 = _630 & 3;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[int(_632)][_634];
    float _638 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[10].z, _614);
    float _640 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[115].x, _604);
    bool _642 = !_399;
    float _644 = _642 ? _437 : as_type<float>(_620);
    bool _646 = _596 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _648 = _638 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _650 = -_431;
    int _652 = _409 ? as_type<int>(_650) : as_type<int>(_431);
    float _654 = _610 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _656 = fma(_612, _582, _640);
    float _658 = _648 + _608;
    bool _660 = !_403;
    float _662 = _660 ? _431 : as_type<float>(_652);
    float _664 = _554 + _654;
    float _666 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[117].x, _656);
    bool _668 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _670 = isnan(0.5);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _676 = _672 || _674;
    float _678 = _658 * _616;
    float _680 = _678 * 0.5;
    float _682 = _463;
    float _684 = _654;
    float _686 = _495;
    float _688 = _576;
    float _690 = _564;
    float _692 = _489;
    if (!_646)
    {
        _682 = _560;
    }
    float _694 = _682;
    float _696 = _694;
    if (!_646)
    {
        _684 = _664;
    }
    float _698 = _684;
    bool _700 = !_646;
    float _702 = _698;
    if (!_700)
    {
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _706 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _708 = _596 + _706;
        float _710 = _664 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _712 = rsqrt(_588);
        float _714 = _708 * _704;
        float _716 = _714 * 0.15915493667125701904296875;
        float _718 = _716 * 6.283185482025146484375;
        float _720 = cos(_718);
        float _722 = _716 * 6.283185482025146484375;
        float _724 = sin(_722);
        float _726 = _720 + (-1.0);
        float _728 = fma(_724, _710, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _730 = _726 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _732 = _712 * _728;
        float _734 = fma(_664, _720, _730);
        float _736 = fma(_576, _732, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _738 = fma(_564, _732, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _696 = _736;
        _686 = _738;
        _702 = _734;
    }
    float _740 = _696;
    float _742 = _686;
    float _744 = _702;
    float _746 = _744;
    if (_534)
    {
        _688 = _740;
    }
    float _748 = _688;
    float _750 = _748;
    if (_534)
    {
        _690 = _742;
    }
    float _752 = _690;
    float _754 = _752;
    if (!_534)
    {
        float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _758 = _554 + _756;
        float _760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _762 = _493 + _760;
        float _764 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _766 = -_493;
        float _768 = _766 + _740;
        float _770 = _758 * _758;
        float _772 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _774 = _489 + _772;
        float _776 = -_554;
        float _778 = _776 + _744;
        float _780 = fma(_762, _762, _770);
        float _782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _784 = fma(_774, _774, _780);
        float _786 = sqrt(_784);
        float _788 = _764 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _790 = precise::min(_786, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _792 = _790 * _782;
        float _794 = _788 * _792;
        float _796 = -_489;
        float _798 = _796 + _742;
        float _800 = fma(_768, _794, _493);
        float _802 = fma(_778, _794, _554);
        float _804 = fma(_798, _794, _489);
        _746 = _802;
        _750 = _800;
        _754 = _804;
    }
    float _806 = _746;
    float _808 = _750;
    float _810 = _754;
    if (_676)
    {
        _692 = 1.0;
    }
    float _812 = _692;
    float _814 = _812;
    if (!_676)
    {
        float _816 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _818 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _820 = _816 * 0.15915493667125701904296875;
        float _822 = _818 * 0.15915493667125701904296875;
        float _824 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _826 = fma(_680, (*spvDescriptorSet0.vp_c8)._m0[30].w, _824);
        float _828 = _820 * 6.283185482025146484375;
        float _830 = cos(_828);
        float _832 = _820 * 6.283185482025146484375;
        float _834 = sin(_832);
        float _836 = 1.0 / _830;
        float _838 = _822 * 6.283185482025146484375;
        float _840 = cos(_838);
        float _842 = _834 * _836;
        float _844 = _822 * 6.283185482025146484375;
        float _846 = sin(_844);
        float _848 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _850 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _848;
        float _852 = _840 * _842;
        float _854 = 1.0 / _826;
        float _856 = 1.0 / _852;
        float _858 = 1.0 / _850;
        float _860 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _862 = _854 * _860;
        float _864 = _846 * _856;
        float _866 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _868 = fma(_864, _862, _866);
        float _870 = _868 * _858;
        float _872 = precise::clamp(_870, 0.0, 1.0);
        _814 = _872;
    }
    float _874 = _814;
    float _876 = _806 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _878 = _806 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _880 = _806 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _882 = _806 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _884 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[1].x, _876);
    float _886 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[0].x, _878);
    float _888 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[2].x, _880);
    float _890 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[3].x, _882);
    float _892 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[1].z, _884);
    float _894 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[0].z, _886);
    float _896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _898 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[2].z, _888);
    float _900 = _892 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _902 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[3].z, _890);
    float _904 = _894 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _906 = _898 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _908 = _900 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _910 = _900 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _912 = _900 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _914 = _900 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _918 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[4].x, _908);
    float _920 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[5].x, _910);
    float _922 = _644 + 0.5;
    float _924 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[6].x, _912);
    float _926 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[7].x, _914);
    float _928 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[4].z, _918);
    float _930 = _902 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _932 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[5].z, _920);
    float _934 = _922 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _936 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[6].z, _924);
    float _938 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[7].z, _926);
    float _940 = -_662;
    float _942 = _940 + 0.5;
    float _944 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[4].w, _928);
    float _946 = _934 * _896;
    float _948 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[5].w, _932);
    float _950 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[6].w, _936);
    float _952 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[7].w, _938);
    bool _954 = _874 > 0.0;
    bool _956 = isnan(_874);
    bool _958 = _954 || _956;
    bool _960 = isnan(0.0);
    bool _962 = _958 || _960;
    float _964 = _942 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _966 = _520 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _968 = _628 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _970 = _636 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _972 = _874 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _974 = _950 + _952;
    float _976 = _964 * _916;
    float _978 = _966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _984 = _666 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _986 = _972 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _988 = _974 * 0.5;
    out.m_46.x = _946;
    out.m_46.y = _976;
    out.m_48.x = _980;
    out.m_48.y = _982;
    out.m_48.z = _978;
    out.m_48.w = _984;
    out.m_33.x = _986;
    out.gl_Position.x = _944;
    out.gl_Position.y = _948;
    out.gl_Position.z = _950;
    out.gl_Position.w = _952;
    out.m_50.z = _988;
    out.m_50.w = _952;
    if (_962)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _990 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _990;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

