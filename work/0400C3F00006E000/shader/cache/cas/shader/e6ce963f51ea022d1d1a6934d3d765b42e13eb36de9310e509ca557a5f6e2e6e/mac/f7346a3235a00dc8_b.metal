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
    float4 m_41 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
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
    float4 m_39 [[attribute(4)]];
    float4 m_37 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _638 = false;
    bool _425 = false;
    bool _265 = false;
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
        float _1151 = as_type<float>(_85);
        out.gl_Position.z = _1151;
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
        float _1220 = as_type<float>(_121);
        out.gl_Position.z = _1220;
    }
    if (_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_37.w;
    float _125 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _127 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _129 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _131 = _127 || _129;
    bool _133 = isnan(1.0);
    bool _135 = _131 || _133;
    float _137 = in.m_35.x;
    float _139 = in.m_35.y;
    float _141 = in.m_35.z;
    float _143 = in.m_30.x;
    float _145 = in.m_30.y;
    float _147 = in.m_30.z;
    float _149 = 0.0;
    float _151 = _125;
    if (!_135)
    {
        float _153 = _125 * _125;
        float _155 = _153 * 0.5;
        _149 = _155;
    }
    float _157 = _149;
    float _159 = _157;
    if (!_135)
    {
        float _161 = _157 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _161;
    }
    float _163 = _159;
    bool _165 = !_135;
    float _167 = _163;
    if (!_165)
    {
        float _169 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _171 = log2(_169);
        float _173 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _175 = _173 + 1.0;
        float _177 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _179 = _125 * _171;
        float _181 = 1.0 / _175;
        float _183 = _177 * 0.693147182464599609375;
        float _185 = exp2(_179);
        float _187 = 1.0 / _183;
        float _189 = _185 + (-1.0);
        float _191 = -_189;
        float _193 = fma(_191, _187, _125);
        float _195 = _193 * _181;
        float _197 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _197;
    }
    float _199 = _167;
    bool _201 = !_135;
    if (!_201)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = 1.0 / _209;
        float _213 = _125 * _205;
        float _215 = exp2(_213);
        float _217 = -_215;
        float _219 = _217 + 1.0;
        float _221 = _219 * _211;
        _151 = _221;
    }
    float _223 = _151;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _227 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _229 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _231 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _233 = fma(_223, _137, _227);
    float _235 = fma(_223, _139, _229);
    float _237 = fma(_223, _141, _231);
    float _239 = fma(_233, _123, _143);
    float _241 = fma(_235, _123, _145);
    float _243 = fma(_237, _123, _147);
    bool _245 = !_225;
    float _263;
    if (!_245)
    {
        float _247 = in.m_39.x;
        float _249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _251 = _247 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _255 = _253 * _249;
        float _257 = floor(_255);
        float _259 = -_257;
        float _261 = _255 + _259;
        _263 = _261;
        _265 = true;
    }
    else
    {
        float _267 = float(_69);
        float _269 = 1.0 / _267;
        float _271 = _103 * _269;
        _263 = _271;
    }
    _265 = false;
    float _273 = _263;
    float _275 = in.m_39.x;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = _273 + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _273 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = 1.0 / _287;
    float _295 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = 1.0 / _291;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _301;
    float _305 = _279 * _293;
    bool _307 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_273);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    bool _319 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _321 = isnan(_273);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = fma(_303, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _333 = _283 * _299;
    bool _335 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_273);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _347;
    float _351 = -_317;
    float _353 = _351 + 1.0;
    float _355 = fma(_349, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = _329 * _353;
    float _359 = _295 * _275;
    float _361 = -_329;
    float _363 = _361 + 1.0;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = _345 * _363;
    float _371 = trunc(_359);
    int _373 = int(_371);
    float _375 = -_345;
    float _377 = _375 + 1.0;
    float _379 = fma(_367, _333, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _381 = _355 * _369;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = _331 * _369;
    float _389 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].x, _381);
    float _391 = fma(_385, _333, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].y, _387);
    float _395 = fma(_379, _357, _389);
    float _397 = fma(_391, _357, _393);
    float _399 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[145].x, _395);
    int _401 = _373 << 4;
    int _403 = _401 + 1712;
    float _405 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[145].y, _397);
    bool _407 = !_297;
    float _423;
    if (!_407)
    {
        float _409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _411 = _275 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _415 = _413 * _409;
        float _417 = floor(_415);
        float _419 = -_417;
        float _421 = _415 + _419;
        _423 = _421;
        _425 = true;
    }
    else
    {
        float _427 = float(_69);
        float _429 = 1.0 / _427;
        float _431 = _103 * _429;
        _423 = _431;
    }
    _425 = false;
    float _433 = _423;
    uint _436 = uint(int(uint(_403) >> uint(2)));
    uint _438 = uint(int(uint(int(_436)) >> uint(2)));
    int _440 = int(_436) & 3;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[int(_438)][_440];
    int _444 = int(_436) + 1;
    uint _446 = uint(int(uint(_444) >> uint(2)));
    int _448 = _444 & 3;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[int(_446)][_448];
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _460 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _462 = isnan(_433);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    int _472 = _403 + 8;
    uint _474 = uint(int(uint(_472) >> uint(2)));
    uint _476 = uint(int(uint(int(_474)) >> uint(2)));
    int _478 = int(_474) & 3;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[int(_476)][_478];
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _486 = 1.0 / _454;
    bool _488 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _490 = isnan(_433);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _500;
    float _504 = -_470;
    float _506 = _504 + 1.0;
    bool _508 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _510 = isnan(_433);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _524 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _526 = isnan(_433);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = _498 * _506;
    float _538 = 1.0 / _458;
    float _540 = -_498;
    float _542 = _540 + 1.0;
    bool _544 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _546 = _518 * _542;
    float _548 = -_518;
    float _550 = _548 + 1.0;
    float _552 = 1.0 / _484;
    float _554 = _502 * _486;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _558 = _433 + _556;
    float _560 = fma(_554, _558, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = _433 + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _566;
    float _570 = _522 * _538;
    float _572 = _560 * _546;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _576 = _433 + _574;
    float _578 = fma(_570, _564, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _580 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[115].x, _572);
    float _582 = _568 * _552;
    float _584 = -_534;
    float _586 = _584 + 1.0;
    float _588 = fma(_578, _536, _580);
    float _590 = fma(_582, _576, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _592 = _470 * _586;
    float _594 = _442 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _596 = _450 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _598 = in.m_37.x;
    float _600 = in.m_37.y;
    float _602 = fma(_590, _592, _588);
    float _604 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[118].x, _602);
    float _610 = _480 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _612 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_41.x = _604;
    out.m_41.y = _606;
    out.m_41.z = _614;
    out.m_41.w = _612;
    float _616 = _405 * _600;
    float _618 = _399 * _598;
    bool _620 = !_544;
    float _636;
    if (!_620)
    {
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _624 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[11].w, _103);
        float _628 = _626 * _622;
        float _630 = floor(_628);
        float _632 = -_630;
        float _634 = _628 + _632;
        _636 = _634;
        _638 = true;
    }
    else
    {
        float _640 = float(_69);
        float _642 = 1.0 / _640;
        float _644 = _103 * _642;
        _636 = _644;
    }
    _638 = false;
    float _646 = _636;
    float _648 = as_type<float>(int(gl_VertexIndex));
    float _650 = _241 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _652 = _241 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _654 = _241 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _656 = in.m_39.y;
    float _658 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[4].x, _650);
    bool _660 = _275 > 0.5;
    float _662 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[5].x, _652);
    float _664 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[6].x, _654);
    float _666 = _616 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _672 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[6].z, _664);
    float _674 = 1.0 / _670;
    float _676 = _672 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _678 = as_type<int>(_648) & 1;
    bool _680 = _678 != 0;
    int _682 = as_type<int>(_648) & 2;
    bool _684 = _682 != 0;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _688 = _686 != 0;
    float _690 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[5].z, _662);
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _694 = _692 != 0;
    bool _696 = !_684;
    float _698 = _696 ? (-0.5) : 0.5;
    bool _700 = !_680;
    float _702 = _700 ? (-0.5) : 0.5;
    float _704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _698);
    bool _706 = _656 > 0.5;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _712 = _618 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _714 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _702);
    float _716 = _666 * _704;
    float _718 = 1.0 / _710;
    float _720 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[4].z, _658);
    float _722 = _712 * _714;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _724;
    float _728 = _716 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _730 = _716 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _732 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _734 = _726 * _674;
    float _736 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[26].x, _728);
    float _738 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[24].x, _730);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _744 = _720 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _746 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[26].z, _736);
    float _748 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[24].z, _738);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _752 = _646 + _750;
    float _754 = _742 * _718;
    float _756 = _746 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _758 = _748 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _760 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _762 = isnan(_646);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = fma(_734, _752, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _774 = _676 + _756;
    bool _776 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _778 = isnan(_646);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = _744 + _758;
    float _790 = -_770;
    float _792 = _790 + 1.0;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _798 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _800 = isnan(_646);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _806 = _802 || _804;
    float _808 = float(_806);
    float _810 = -_786;
    float _812 = _810 + 1.0;
    float _814 = _786 * _792;
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _818 = _774 + _816;
    bool _820 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _822 = isnan(_646);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = _808 * _812;
    float _834 = 1.0 / _796;
    float _836 = -_808;
    float _838 = _836 + 1.0;
    float _840 = _818 * _818;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _844 = _646 + _842;
    float _846 = _830 * _838;
    bool _848 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _850 = isnan(_646);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _862 = _860 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _864 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _866 = _788 + _864;
    float _868 = fma(_754, _844, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _870 = _716 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _872 = 1.0 / _862;
    float _874 = fma(_866, _866, _840);
    float _876 = -_830;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _884 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[25].x, _870);
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _888 = _646 + _886;
    float _890 = sqrt(_874);
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _892;
    float _896 = _858 * _878;
    float _898 = -_858;
    float _900 = _898 + 1.0;
    float _902 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[25].z, _884);
    float _904 = _894 * _834;
    float _906 = _772 * _896;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _910 = _646 + _908;
    float _912 = _882 * _872;
    float _914 = _690 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _916 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[131].x, _906);
    float _918 = fma(_904, _910, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _920 = _902 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _922 = fma(_912, _888, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _924 = fma(_868, _846, _916);
    float _926 = -_698;
    int _928 = _706 ? as_type<int>(_926) : as_type<int>(_698);
    bool _930 = _890 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _932 = fma(_918, _832, _924);
    float _934 = _914 + _920;
    float _936 = -_702;
    int _938 = _660 ? as_type<int>(_936) : as_type<int>(_702);
    float _940 = fma(_922, _814, _932);
    bool _942 = !_694;
    float _944 = _942 ? _698 : as_type<float>(_928);
    bool _946 = !_688;
    float _948 = _946 ? _702 : as_type<float>(_938);
    float _950 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[135].x, _940);
    float _952 = _698;
    float _954 = _788;
    float _956 = _774;
    if (!_930)
    {
        _952 = _934;
    }
    float _958 = _952;
    bool _960 = !_930;
    float _962 = _958;
    if (!_960)
    {
        float _964 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _966 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _968 = _890 + _966;
        float _970 = _934 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _972 = rsqrt(_874);
        float _974 = _968 * _964;
        float _976 = _974 * 0.15915493667125701904296875;
        float _978 = _976 * 6.283185482025146484375;
        float _980 = cos(_978);
        float _982 = _976 * 6.283185482025146484375;
        float _984 = sin(_982);
        float _986 = _980 + (-1.0);
        float _988 = _986 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _990 = fma(_984, _970, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _992 = fma(_934, _980, _988);
        float _994 = _972 * _990;
        float _996 = fma(_866, _994, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _998 = fma(_818, _994, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _962 = _992;
        _954 = _996;
        _956 = _998;
    }
    float _1000 = _962;
    float _1002 = _954;
    float _1004 = _956;
    float _1006 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1008 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1010 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1012 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1014 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1006);
    float _1016 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1008);
    float _1018 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1010);
    float _1020 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1012);
    float _1022 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1014);
    float _1024 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1016);
    float _1026 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1018);
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1030 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1034 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1020);
    float _1036 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1038 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1040 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1042 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1044 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1046 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1038);
    float _1048 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1040);
    float _1050 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1052 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1042);
    float _1054 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1046);
    float _1056 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1048);
    float _1058 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1060 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1050);
    float _1062 = _948 + 0.5;
    float _1064 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1052);
    float _1066 = -_944;
    float _1068 = _1066 + 0.5;
    float _1070 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1054);
    float _1072 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1056);
    float _1074 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1076 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1060);
    float _1078 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1064);
    float _1080 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1082 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1084 = _1070 + _1072;
    float _1086 = _1074 * _1028;
    float _1088 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1076);
    float _1090 = _1082 * _1044;
    float _1092 = _950 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1094 = _1084 * 0.5;
    out.m_33.x = _1080;
    out.m_46.x = _1086;
    out.m_46.y = _1090;
    out.m_48.w = _1092;
    out.gl_Position.x = _1078;
    out.gl_Position.y = _1088;
    out.gl_Position.z = _1070;
    out.gl_Position.w = _1072;
    out.m_50.z = _1094;
    out.m_50.w = _1072;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _638 = false;
    bool _425 = false;
    bool _265 = false;
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
        float _1151 = as_type<float>(_85);
        out.gl_Position.z = _1151;
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
        float _1220 = as_type<float>(_121);
        out.gl_Position.z = _1220;
    }
    if (_113)
    {
        return out;
    }
    float _123 = in.m_37.w;
    float _125 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _127 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _129 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _131 = _127 || _129;
    bool _133 = isnan(1.0);
    bool _135 = _131 || _133;
    float _137 = in.m_35.x;
    float _139 = in.m_35.y;
    float _141 = in.m_35.z;
    float _143 = in.m_30.x;
    float _145 = in.m_30.y;
    float _147 = in.m_30.z;
    float _149 = 0.0;
    float _151 = _125;
    if (!_135)
    {
        float _153 = _125 * _125;
        float _155 = _153 * 0.5;
        _149 = _155;
    }
    float _157 = _149;
    float _159 = _157;
    if (!_135)
    {
        float _161 = _157 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _161;
    }
    float _163 = _159;
    bool _165 = !_135;
    float _167 = _163;
    if (!_165)
    {
        float _169 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _171 = log2(_169);
        float _173 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _175 = _173 + 1.0;
        float _177 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _179 = _125 * _171;
        float _181 = 1.0 / _175;
        float _183 = _177 * 0.693147182464599609375;
        float _185 = exp2(_179);
        float _187 = 1.0 / _183;
        float _189 = _185 + (-1.0);
        float _191 = -_189;
        float _193 = fma(_191, _187, _125);
        float _195 = _193 * _181;
        float _197 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _197;
    }
    float _199 = _167;
    bool _201 = !_135;
    if (!_201)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = 1.0 / _209;
        float _213 = _125 * _205;
        float _215 = exp2(_213);
        float _217 = -_215;
        float _219 = _217 + 1.0;
        float _221 = _219 * _211;
        _151 = _221;
    }
    float _223 = _151;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _227 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _229 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _231 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _233 = fma(_223, _137, _227);
    float _235 = fma(_223, _139, _229);
    float _237 = fma(_223, _141, _231);
    float _239 = fma(_233, _123, _143);
    float _241 = fma(_235, _123, _145);
    float _243 = fma(_237, _123, _147);
    bool _245 = !_225;
    float _263;
    if (!_245)
    {
        float _247 = in.m_39.x;
        float _249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _251 = _247 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _255 = _253 * _249;
        float _257 = floor(_255);
        float _259 = -_257;
        float _261 = _255 + _259;
        _263 = _261;
        _265 = true;
    }
    else
    {
        float _267 = float(_69);
        float _269 = 1.0 / _267;
        float _271 = _103 * _269;
        _263 = _271;
    }
    _265 = false;
    float _273 = _263;
    float _275 = in.m_39.x;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = _273 + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _273 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = 1.0 / _287;
    float _295 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = 1.0 / _291;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _301;
    float _305 = _279 * _293;
    bool _307 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_273);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    bool _319 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _321 = isnan(_273);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = fma(_303, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _333 = _283 * _299;
    bool _335 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_273);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _347;
    float _351 = -_317;
    float _353 = _351 + 1.0;
    float _355 = fma(_349, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = _329 * _353;
    float _359 = _295 * _275;
    float _361 = -_329;
    float _363 = _361 + 1.0;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = _345 * _363;
    float _371 = trunc(_359);
    int _373 = int(_371);
    float _375 = -_345;
    float _377 = _375 + 1.0;
    float _379 = fma(_367, _333, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _381 = _355 * _369;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = _331 * _369;
    float _389 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].x, _381);
    float _391 = fma(_385, _333, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].y, _387);
    float _395 = fma(_379, _357, _389);
    float _397 = fma(_391, _357, _393);
    float _399 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[145].x, _395);
    int _401 = _373 << 4;
    int _403 = _401 + 1712;
    float _405 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[145].y, _397);
    bool _407 = !_297;
    float _423;
    if (!_407)
    {
        float _409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _411 = _275 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _415 = _413 * _409;
        float _417 = floor(_415);
        float _419 = -_417;
        float _421 = _415 + _419;
        _423 = _421;
        _425 = true;
    }
    else
    {
        float _427 = float(_69);
        float _429 = 1.0 / _427;
        float _431 = _103 * _429;
        _423 = _431;
    }
    _425 = false;
    float _433 = _423;
    uint _436 = uint(int(uint(_403) >> uint(2)));
    uint _438 = uint(int(uint(int(_436)) >> uint(2)));
    int _440 = int(_436) & 3;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[int(_438)][_440];
    int _444 = int(_436) + 1;
    uint _446 = uint(int(uint(_444) >> uint(2)));
    int _448 = _444 & 3;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[int(_446)][_448];
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _460 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _462 = isnan(_433);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    int _472 = _403 + 8;
    uint _474 = uint(int(uint(_472) >> uint(2)));
    uint _476 = uint(int(uint(int(_474)) >> uint(2)));
    int _478 = int(_474) & 3;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[int(_476)][_478];
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _486 = 1.0 / _454;
    bool _488 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _490 = isnan(_433);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _500;
    float _504 = -_470;
    float _506 = _504 + 1.0;
    bool _508 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _510 = isnan(_433);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _524 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _526 = isnan(_433);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = _498 * _506;
    float _538 = 1.0 / _458;
    float _540 = -_498;
    float _542 = _540 + 1.0;
    bool _544 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _546 = _518 * _542;
    float _548 = -_518;
    float _550 = _548 + 1.0;
    float _552 = 1.0 / _484;
    float _554 = _502 * _486;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _558 = _433 + _556;
    float _560 = fma(_554, _558, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = _433 + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _566;
    float _570 = _522 * _538;
    float _572 = _560 * _546;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _576 = _433 + _574;
    float _578 = fma(_570, _564, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _580 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[115].x, _572);
    float _582 = _568 * _552;
    float _584 = -_534;
    float _586 = _584 + 1.0;
    float _588 = fma(_578, _536, _580);
    float _590 = fma(_582, _576, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _592 = _470 * _586;
    float _594 = _442 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _596 = _450 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _598 = in.m_37.x;
    float _600 = in.m_37.y;
    float _602 = fma(_590, _592, _588);
    float _604 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[118].x, _602);
    float _610 = _480 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _612 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_41.x = _604;
    out.m_41.y = _606;
    out.m_41.z = _614;
    out.m_41.w = _612;
    float _616 = _405 * _600;
    float _618 = _399 * _598;
    bool _620 = !_544;
    float _636;
    if (!_620)
    {
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _624 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[11].w, _103);
        float _628 = _626 * _622;
        float _630 = floor(_628);
        float _632 = -_630;
        float _634 = _628 + _632;
        _636 = _634;
        _638 = true;
    }
    else
    {
        float _640 = float(_69);
        float _642 = 1.0 / _640;
        float _644 = _103 * _642;
        _636 = _644;
    }
    _638 = false;
    float _646 = _636;
    float _648 = as_type<float>(int(gl_VertexIndex));
    float _650 = _241 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _652 = _241 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _654 = _241 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _656 = in.m_39.y;
    float _658 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[4].x, _650);
    bool _660 = _275 > 0.5;
    float _662 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[5].x, _652);
    float _664 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[6].x, _654);
    float _666 = _616 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _672 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[6].z, _664);
    float _674 = 1.0 / _670;
    float _676 = _672 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _678 = as_type<int>(_648) & 1;
    bool _680 = _678 != 0;
    int _682 = as_type<int>(_648) & 2;
    bool _684 = _682 != 0;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _688 = _686 != 0;
    float _690 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[5].z, _662);
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _694 = _692 != 0;
    bool _696 = !_684;
    float _698 = _696 ? (-0.5) : 0.5;
    bool _700 = !_680;
    float _702 = _700 ? (-0.5) : 0.5;
    float _704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _698);
    bool _706 = _656 > 0.5;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _712 = _618 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _714 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _702);
    float _716 = _666 * _704;
    float _718 = 1.0 / _710;
    float _720 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[4].z, _658);
    float _722 = _712 * _714;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _724;
    float _728 = _716 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _730 = _716 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _732 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _734 = _726 * _674;
    float _736 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[26].x, _728);
    float _738 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[24].x, _730);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _744 = _720 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _746 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[26].z, _736);
    float _748 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[24].z, _738);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _752 = _646 + _750;
    float _754 = _742 * _718;
    float _756 = _746 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _758 = _748 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _760 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _762 = isnan(_646);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = fma(_734, _752, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _774 = _676 + _756;
    bool _776 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _778 = isnan(_646);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = _744 + _758;
    float _790 = -_770;
    float _792 = _790 + 1.0;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _798 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _800 = isnan(_646);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _806 = _802 || _804;
    float _808 = float(_806);
    float _810 = -_786;
    float _812 = _810 + 1.0;
    float _814 = _786 * _792;
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _818 = _774 + _816;
    bool _820 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _822 = isnan(_646);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = _808 * _812;
    float _834 = 1.0 / _796;
    float _836 = -_808;
    float _838 = _836 + 1.0;
    float _840 = _818 * _818;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _844 = _646 + _842;
    float _846 = _830 * _838;
    bool _848 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _850 = isnan(_646);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _862 = _860 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _864 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _866 = _788 + _864;
    float _868 = fma(_754, _844, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _870 = _716 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _872 = 1.0 / _862;
    float _874 = fma(_866, _866, _840);
    float _876 = -_830;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _884 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[25].x, _870);
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _888 = _646 + _886;
    float _890 = sqrt(_874);
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _892;
    float _896 = _858 * _878;
    float _898 = -_858;
    float _900 = _898 + 1.0;
    float _902 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[25].z, _884);
    float _904 = _894 * _834;
    float _906 = _772 * _896;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _910 = _646 + _908;
    float _912 = _882 * _872;
    float _914 = _690 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _916 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[131].x, _906);
    float _918 = fma(_904, _910, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _920 = _902 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _922 = fma(_912, _888, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _924 = fma(_868, _846, _916);
    float _926 = -_698;
    int _928 = _706 ? as_type<int>(_926) : as_type<int>(_698);
    bool _930 = _890 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _932 = fma(_918, _832, _924);
    float _934 = _914 + _920;
    float _936 = -_702;
    int _938 = _660 ? as_type<int>(_936) : as_type<int>(_702);
    float _940 = fma(_922, _814, _932);
    bool _942 = !_694;
    float _944 = _942 ? _698 : as_type<float>(_928);
    bool _946 = !_688;
    float _948 = _946 ? _702 : as_type<float>(_938);
    float _950 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[135].x, _940);
    float _952 = _698;
    float _954 = _788;
    float _956 = _774;
    if (!_930)
    {
        _952 = _934;
    }
    float _958 = _952;
    bool _960 = !_930;
    float _962 = _958;
    if (!_960)
    {
        float _964 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _966 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _968 = _890 + _966;
        float _970 = _934 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _972 = rsqrt(_874);
        float _974 = _968 * _964;
        float _976 = _974 * 0.15915493667125701904296875;
        float _978 = _976 * 6.283185482025146484375;
        float _980 = cos(_978);
        float _982 = _976 * 6.283185482025146484375;
        float _984 = sin(_982);
        float _986 = _980 + (-1.0);
        float _988 = _986 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _990 = fma(_984, _970, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _992 = fma(_934, _980, _988);
        float _994 = _972 * _990;
        float _996 = fma(_866, _994, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _998 = fma(_818, _994, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _962 = _992;
        _954 = _996;
        _956 = _998;
    }
    float _1000 = _962;
    float _1002 = _954;
    float _1004 = _956;
    float _1006 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1008 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1010 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1012 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1014 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1006);
    float _1016 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1008);
    float _1018 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1010);
    float _1020 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1012);
    float _1022 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1014);
    float _1024 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1016);
    float _1026 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1018);
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1030 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1034 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1020);
    float _1036 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1038 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1040 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1042 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1044 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1046 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1038);
    float _1048 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1040);
    float _1050 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1052 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1042);
    float _1054 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1046);
    float _1056 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1048);
    float _1058 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1060 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1050);
    float _1062 = _948 + 0.5;
    float _1064 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1052);
    float _1066 = -_944;
    float _1068 = _1066 + 0.5;
    float _1070 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1054);
    float _1072 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1056);
    float _1074 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1076 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1060);
    float _1078 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1064);
    float _1080 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1082 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1084 = _1070 + _1072;
    float _1086 = _1074 * _1028;
    float _1088 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1076);
    float _1090 = _1082 * _1044;
    float _1092 = _950 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1094 = _1084 * 0.5;
    out.m_33.x = _1080;
    out.m_46.x = _1086;
    out.m_46.y = _1090;
    out.m_48.w = _1092;
    out.gl_Position.x = _1078;
    out.gl_Position.y = _1088;
    out.gl_Position.z = _1070;
    out.gl_Position.w = _1072;
    out.m_50.z = _1094;
    out.m_50.w = _1072;
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
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _638 = false;
    bool _425 = false;
    bool _265 = false;
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
        float _1151 = as_type<float>(_85);
        out.gl_Position.z = _1151;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1220 = as_type<float>(_121);
        out.gl_Position.z = _1220;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_37.w;
    float _125 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _127 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _129 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _131 = _127 || _129;
    bool _133 = isnan(1.0);
    bool _135 = _131 || _133;
    float _137 = in.m_35.x;
    float _139 = in.m_35.y;
    float _141 = in.m_35.z;
    float _143 = in.m_30.x;
    float _145 = in.m_30.y;
    float _147 = in.m_30.z;
    float _149 = 0.0;
    float _151 = _125;
    if (!_135)
    {
        float _153 = _125 * _125;
        float _155 = _153 * 0.5;
        _149 = _155;
    }
    float _157 = _149;
    float _159 = _157;
    if (!_135)
    {
        float _161 = _157 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _161;
    }
    float _163 = _159;
    bool _165 = !_135;
    float _167 = _163;
    if (!_165)
    {
        float _169 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _171 = log2(_169);
        float _173 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _175 = _173 + 1.0;
        float _177 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _179 = _125 * _171;
        float _181 = 1.0 / _175;
        float _183 = _177 * 0.693147182464599609375;
        float _185 = exp2(_179);
        float _187 = 1.0 / _183;
        float _189 = _185 + (-1.0);
        float _191 = -_189;
        float _193 = fma(_191, _187, _125);
        float _195 = _193 * _181;
        float _197 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _197;
    }
    float _199 = _167;
    bool _201 = !_135;
    if (!_201)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = 1.0 / _209;
        float _213 = _125 * _205;
        float _215 = exp2(_213);
        float _217 = -_215;
        float _219 = _217 + 1.0;
        float _221 = _219 * _211;
        _151 = _221;
    }
    float _223 = _151;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _227 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _229 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _231 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _233 = fma(_223, _137, _227);
    float _235 = fma(_223, _139, _229);
    float _237 = fma(_223, _141, _231);
    float _239 = fma(_233, _123, _143);
    float _241 = fma(_235, _123, _145);
    float _243 = fma(_237, _123, _147);
    bool _245 = !_225;
    float _263;
    if (!_245)
    {
        float _247 = in.m_39.x;
        float _249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _251 = _247 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _255 = _253 * _249;
        float _257 = floor(_255);
        float _259 = -_257;
        float _261 = _255 + _259;
        _263 = _261;
        _265 = true;
    }
    else
    {
        float _267 = float(_69);
        float _269 = 1.0 / _267;
        float _271 = _103 * _269;
        _263 = _271;
    }
    _265 = false;
    float _273 = _263;
    float _275 = in.m_39.x;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = _273 + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _273 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = 1.0 / _287;
    float _295 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = 1.0 / _291;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _301;
    float _305 = _279 * _293;
    bool _307 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _309 = isnan(_273);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    bool _319 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _321 = isnan(_273);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = fma(_303, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _333 = _283 * _299;
    bool _335 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_273);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _347;
    float _351 = -_317;
    float _353 = _351 + 1.0;
    float _355 = fma(_349, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = _329 * _353;
    float _359 = _295 * _275;
    float _361 = -_329;
    float _363 = _361 + 1.0;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = _345 * _363;
    float _371 = trunc(_359);
    int _373 = int(_371);
    float _375 = -_345;
    float _377 = _375 + 1.0;
    float _379 = fma(_367, _333, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _381 = _355 * _369;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = _331 * _369;
    float _389 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].x, _381);
    float _391 = fma(_385, _333, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].y, _387);
    float _395 = fma(_379, _357, _389);
    float _397 = fma(_391, _357, _393);
    float _399 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[145].x, _395);
    int _401 = _373 << 4;
    int _403 = _401 + 1712;
    float _405 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[145].y, _397);
    bool _407 = !_297;
    float _423;
    if (!_407)
    {
        float _409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _411 = _275 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _415 = _413 * _409;
        float _417 = floor(_415);
        float _419 = -_417;
        float _421 = _415 + _419;
        _423 = _421;
        _425 = true;
    }
    else
    {
        float _427 = float(_69);
        float _429 = 1.0 / _427;
        float _431 = _103 * _429;
        _423 = _431;
    }
    _425 = false;
    float _433 = _423;
    uint _436 = uint(int(uint(_403) >> uint(2)));
    uint _438 = uint(int(uint(int(_436)) >> uint(2)));
    int _440 = int(_436) & 3;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[int(_438)][_440];
    int _444 = int(_436) + 1;
    uint _446 = uint(int(uint(_444) >> uint(2)));
    int _448 = _444 & 3;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[int(_446)][_448];
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _460 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _462 = isnan(_433);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    int _472 = _403 + 8;
    uint _474 = uint(int(uint(_472) >> uint(2)));
    uint _476 = uint(int(uint(int(_474)) >> uint(2)));
    int _478 = int(_474) & 3;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[int(_476)][_478];
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _486 = 1.0 / _454;
    bool _488 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _490 = isnan(_433);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _500;
    float _504 = -_470;
    float _506 = _504 + 1.0;
    bool _508 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _510 = isnan(_433);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _524 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _526 = isnan(_433);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = _498 * _506;
    float _538 = 1.0 / _458;
    float _540 = -_498;
    float _542 = _540 + 1.0;
    bool _544 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _546 = _518 * _542;
    float _548 = -_518;
    float _550 = _548 + 1.0;
    float _552 = 1.0 / _484;
    float _554 = _502 * _486;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _558 = _433 + _556;
    float _560 = fma(_554, _558, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = _433 + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _566;
    float _570 = _522 * _538;
    float _572 = _560 * _546;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _576 = _433 + _574;
    float _578 = fma(_570, _564, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _580 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[115].x, _572);
    float _582 = _568 * _552;
    float _584 = -_534;
    float _586 = _584 + 1.0;
    float _588 = fma(_578, _536, _580);
    float _590 = fma(_582, _576, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _592 = _470 * _586;
    float _594 = _442 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _596 = _450 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _598 = in.m_37.x;
    float _600 = in.m_37.y;
    float _602 = fma(_590, _592, _588);
    float _604 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[118].x, _602);
    float _610 = _480 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _612 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_41.x = _604;
    out.m_41.y = _606;
    out.m_41.z = _614;
    out.m_41.w = _612;
    float _616 = _405 * _600;
    float _618 = _399 * _598;
    bool _620 = !_544;
    float _636;
    if (!_620)
    {
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _624 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[11].w, _103);
        float _628 = _626 * _622;
        float _630 = floor(_628);
        float _632 = -_630;
        float _634 = _628 + _632;
        _636 = _634;
        _638 = true;
    }
    else
    {
        float _640 = float(_69);
        float _642 = 1.0 / _640;
        float _644 = _103 * _642;
        _636 = _644;
    }
    _638 = false;
    float _646 = _636;
    float _648 = as_type<float>(int(gl_VertexIndex));
    float _650 = _241 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _652 = _241 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _654 = _241 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _656 = in.m_39.y;
    float _658 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[4].x, _650);
    bool _660 = _275 > 0.5;
    float _662 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[5].x, _652);
    float _664 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[6].x, _654);
    float _666 = _616 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _672 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[6].z, _664);
    float _674 = 1.0 / _670;
    float _676 = _672 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _678 = as_type<int>(_648) & 1;
    bool _680 = _678 != 0;
    int _682 = as_type<int>(_648) & 2;
    bool _684 = _682 != 0;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _688 = _686 != 0;
    float _690 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[5].z, _662);
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _694 = _692 != 0;
    bool _696 = !_684;
    float _698 = _696 ? (-0.5) : 0.5;
    bool _700 = !_680;
    float _702 = _700 ? (-0.5) : 0.5;
    float _704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _698);
    bool _706 = _656 > 0.5;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _712 = _618 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _714 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _702);
    float _716 = _666 * _704;
    float _718 = 1.0 / _710;
    float _720 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[4].z, _658);
    float _722 = _712 * _714;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _724;
    float _728 = _716 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _730 = _716 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _732 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _734 = _726 * _674;
    float _736 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[26].x, _728);
    float _738 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[24].x, _730);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _744 = _720 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _746 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[26].z, _736);
    float _748 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[24].z, _738);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _752 = _646 + _750;
    float _754 = _742 * _718;
    float _756 = _746 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _758 = _748 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _760 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _762 = isnan(_646);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = fma(_734, _752, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _774 = _676 + _756;
    bool _776 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _778 = isnan(_646);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = _744 + _758;
    float _790 = -_770;
    float _792 = _790 + 1.0;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _798 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _800 = isnan(_646);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _806 = _802 || _804;
    float _808 = float(_806);
    float _810 = -_786;
    float _812 = _810 + 1.0;
    float _814 = _786 * _792;
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _818 = _774 + _816;
    bool _820 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _822 = isnan(_646);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = _808 * _812;
    float _834 = 1.0 / _796;
    float _836 = -_808;
    float _838 = _836 + 1.0;
    float _840 = _818 * _818;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _844 = _646 + _842;
    float _846 = _830 * _838;
    bool _848 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _850 = isnan(_646);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _862 = _860 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _864 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _866 = _788 + _864;
    float _868 = fma(_754, _844, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _870 = _716 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _872 = 1.0 / _862;
    float _874 = fma(_866, _866, _840);
    float _876 = -_830;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _884 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[25].x, _870);
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _888 = _646 + _886;
    float _890 = sqrt(_874);
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _892;
    float _896 = _858 * _878;
    float _898 = -_858;
    float _900 = _898 + 1.0;
    float _902 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[25].z, _884);
    float _904 = _894 * _834;
    float _906 = _772 * _896;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _910 = _646 + _908;
    float _912 = _882 * _872;
    float _914 = _690 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _916 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[131].x, _906);
    float _918 = fma(_904, _910, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _920 = _902 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _922 = fma(_912, _888, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _924 = fma(_868, _846, _916);
    float _926 = -_698;
    int _928 = _706 ? as_type<int>(_926) : as_type<int>(_698);
    bool _930 = _890 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _932 = fma(_918, _832, _924);
    float _934 = _914 + _920;
    float _936 = -_702;
    int _938 = _660 ? as_type<int>(_936) : as_type<int>(_702);
    float _940 = fma(_922, _814, _932);
    bool _942 = !_694;
    float _944 = _942 ? _698 : as_type<float>(_928);
    bool _946 = !_688;
    float _948 = _946 ? _702 : as_type<float>(_938);
    float _950 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[135].x, _940);
    float _952 = _698;
    float _954 = _788;
    float _956 = _774;
    if (!_930)
    {
        _952 = _934;
    }
    float _958 = _952;
    bool _960 = !_930;
    float _962 = _958;
    if (!_960)
    {
        float _964 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _966 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _968 = _890 + _966;
        float _970 = _934 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _972 = rsqrt(_874);
        float _974 = _968 * _964;
        float _976 = _974 * 0.15915493667125701904296875;
        float _978 = _976 * 6.283185482025146484375;
        float _980 = cos(_978);
        float _982 = _976 * 6.283185482025146484375;
        float _984 = sin(_982);
        float _986 = _980 + (-1.0);
        float _988 = _986 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _990 = fma(_984, _970, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _992 = fma(_934, _980, _988);
        float _994 = _972 * _990;
        float _996 = fma(_866, _994, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _998 = fma(_818, _994, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _962 = _992;
        _954 = _996;
        _956 = _998;
    }
    float _1000 = _962;
    float _1002 = _954;
    float _1004 = _956;
    float _1006 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1008 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1010 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1012 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1014 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1006);
    float _1016 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1008);
    float _1018 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1010);
    float _1020 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1012);
    float _1022 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1014);
    float _1024 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1016);
    float _1026 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1018);
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1030 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1034 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1020);
    float _1036 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1038 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1040 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1042 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1044 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1046 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1038);
    float _1048 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1040);
    float _1050 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1052 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1042);
    float _1054 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1046);
    float _1056 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1048);
    float _1058 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1060 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1050);
    float _1062 = _948 + 0.5;
    float _1064 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1052);
    float _1066 = -_944;
    float _1068 = _1066 + 0.5;
    float _1070 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1054);
    float _1072 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1056);
    float _1074 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1076 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1060);
    float _1078 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1064);
    float _1080 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1082 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1084 = _1070 + _1072;
    float _1086 = _1074 * _1028;
    float _1088 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1076);
    float _1090 = _1082 * _1044;
    float _1092 = _950 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1094 = _1084 * 0.5;
    out.m_33.x = _1080;
    out.m_46.x = _1086;
    out.m_46.y = _1090;
    out.m_48.w = _1092;
    out.gl_Position.x = _1078;
    out.gl_Position.y = _1088;
    out.gl_Position.z = _1070;
    out.gl_Position.w = _1072;
    out.m_50.z = _1094;
    out.m_50.w = _1072;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

