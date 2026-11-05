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
    float4 m_44 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _77 = as_type<float>(_69);
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _75;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _79 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _967 = as_type<float>(_85);
        out.gl_Position.z = _967;
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
        _77 = _105;
    }
    float _107 = _77;
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
        float _1036 = as_type<float>(_121);
        out.gl_Position.z = _1036;
    }
    if (_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_37.x;
    float _125 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _127 = as_type<float>(int(gl_VertexIndex));
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_42.w;
    float _141 = in.m_37.y;
    float _143 = in.m_30.x;
    float _145 = in.m_30.y;
    float _147 = in.m_30.z;
    float _149 = _125 * _123;
    float _151 = in.m_35.x;
    float _153 = in.m_35.y;
    float _155 = in.m_35.z;
    int _157 = as_type<int>(_127) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_127) & 2;
    bool _163 = _161 != 0;
    float _165 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = trunc(_149);
    int _169 = int(_167);
    float _171 = 0.0;
    float _173 = _165;
    if (!_137)
    {
        float _175 = _165 * _165;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    bool _181 = !_159;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_163;
    float _187 = _185 ? (-0.5) : 0.5;
    float _189 = _179;
    if (!_137)
    {
        float _191 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _191;
    }
    float _193 = _189;
    int _195 = _169 << 4;
    int _197 = _195 + 1968;
    bool _199 = !_137;
    float _201 = _193;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _165 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _165);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    bool _235 = !_137;
    if (!_235)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _165 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _173 = _255;
    }
    float _257 = _173;
    float _259 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _261 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    uint _264 = uint(int(uint(_197) >> uint(2)));
    uint _266 = uint(int(uint(int(_264)) >> uint(2)));
    int _268 = int(_264) & 3;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[int(_266)][_268];
    int _272 = int(_264) + 1;
    uint _274 = uint(int(uint(_272) >> uint(2)));
    int _276 = _272 & 3;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[int(_274)][_276];
    bool _280 = _123 > 0.5;
    float _282 = fma(_257, _153, _259);
    float _284 = fma(_257, _151, _261);
    float _286 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _288 = fma(_282, _139, _145);
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _292 = _290 != 0;
    int _294 = _197 + 8;
    uint _296 = uint(int(uint(_294) >> uint(2)));
    uint _298 = uint(int(uint(int(_296)) >> uint(2)));
    int _300 = int(_296) & 3;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[int(_298)][_300];
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _306 = _304 != 0;
    float _308 = fma(_257, _155, _286);
    float _310 = fma(_284, _139, _143);
    float _312 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _314 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _316 = fma(_308, _139, _147);
    float _318 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _320 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[5].x, _312);
    float _322 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[4].x, _314);
    float _324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _326 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[6].x, _318);
    float _328 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[5].z, _320);
    float _330 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[4].z, _322);
    bool _332 = _141 > 0.5;
    float _334 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[6].z, _326);
    float _336 = _328 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _338 = _330 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _340 = -_183;
    int _342 = _280 ? as_type<int>(_340) : as_type<int>(_183);
    float _344 = in.m_42.x;
    float _346 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _348 = _336 + _346;
    float _350 = _334 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _352 = !_292;
    float _354 = _352 ? _183 : as_type<float>(_342);
    float _356 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _358 = _338 + _356;
    float _360 = _348 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _362 = -_187;
    int _364 = _332 ? as_type<int>(_362) : as_type<int>(_187);
    float _366 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _368 = _350 + _366;
    float _370 = _354 + 0.5;
    float _372 = fma(_358, (*spvDescriptorSet0.vp_c8)._m0[28].x, _360);
    float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _376 = _348 * _348;
    float _378 = _370 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _380 = !_306;
    float _382 = _380 ? _187 : as_type<float>(_364);
    float _384 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[28].z, _372);
    float _386 = _378 * _324;
    float _388 = fma(_358, _358, _376);
    float _390 = -_382;
    float _392 = _390 + 0.5;
    bool _394 = _384 >= 0.0;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _398 = fma(_368, _368, _388);
    float _400 = _392 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _402 = _344 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = rsqrt(_398);
    float _406 = _400 * _374;
    float _408 = _270 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _410 = _278 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _414 = _374;
    if (_394)
    {
        _414 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _416 = _414;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _420 = _402 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _422 = _302 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _426 = _396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _428 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _430 = _412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _436 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _438 = _420 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _440 = as_type<int>(_416);
    if (_394)
    {
        float _442 = _416 * 5.0;
        _440 = as_type<int>(_442);
    }
    int _444 = _440;
    out.m_44.x = _426;
    out.m_44.y = _428;
    out.m_44.z = _430;
    out.m_44.w = _424;
    float _446 = _438 * _404;
    out.m_46.x = _432;
    out.m_46.y = _434;
    out.m_46.z = _436;
    float _448 = _358 * _446;
    float _450 = _348 * _446;
    out.m_48.x = _386;
    out.m_48.y = _406;
    if (_394)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1608 = as_type<float>(_444);
        out.gl_Position.z = _1608;
    }
    if (_394)
    {
        out.m_33.x = 0.0;
    }
    if (_394)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _452 = -_450;
    float _454 = _336 + _452;
    float _456 = _368 * _446;
    float _458 = -_448;
    float _460 = _338 + _458;
    float _462 = -_450;
    float _464 = _348 + _462;
    float _466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _468 = _454 + _466;
    float _470 = -_456;
    float _472 = _350 + _470;
    float _474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _476 = _460 + _474;
    float _478 = -_448;
    float _480 = _358 + _478;
    float _482 = _468 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _484 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _486 = _472 + _484;
    float _488 = _464 * _464;
    float _490 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[28].x, _482);
    float _492 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[28].z, _490);
    bool _494 = _492 >= 0.0;
    float _496 = _486;
    if (_494)
    {
        _496 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _498 = _496;
    int _500 = as_type<int>(_498);
    if (_494)
    {
        out.m_33.x = 0.0;
    }
    if (_494)
    {
        float _502 = _498 * 5.0;
        _500 = as_type<int>(_502);
    }
    int _504 = _500;
    if (_494)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1709 = as_type<float>(_504);
        out.gl_Position.z = _1709;
    }
    if (_494)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _506 = in.m_42.y;
    float _508 = -_456;
    float _510 = _368 + _508;
    float _512 = fma(_480, _480, _488);
    float _514 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _516 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _518 = fma(_510, _510, _512);
    bool _520 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _522 = isnan(0.5);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _528 = _524 || _526;
    float _530 = sqrt(_518);
    float _532 = _454 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _534 = _454 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _536 = _506 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _538 = _404 * _530;
    float _540 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _542 = _420 * _538;
    float _544 = _538 * _540;
    float _546 = _538 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _548 = _546 * 0.5;
    float _550 = _516 * _542;
    float _552 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[11].x, _532);
    float _554 = _514 * _544;
    float _556 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[11].z, _552);
    float _558 = _554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _560 = _554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _562 = _554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _564 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[26].x, _558);
    float _566 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[24].x, _560);
    float _568 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[25].x, _562);
    float _570 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[26].z, _564);
    float _572 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[24].z, _566);
    float _574 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[25].z, _568);
    float _576 = _570 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _578 = _572 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _580 = _556 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _582 = _574 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _584 = _350 + _576;
    float _586 = _338 + _578;
    float _588 = 1.0 / _580;
    float _590 = _336 + _582;
    float _592 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _594 = _584 + _592;
    float _596 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _598 = _586 + _596;
    float _600 = _594 * _594;
    float _602 = fma(_598, _598, _600);
    float _604 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[10].x, _534);
    float _606 = sqrt(_602);
    float _608 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[10].z, _604);
    float _610 = _608 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _612 = _610 + _580;
    float _614 = _612 * _588;
    float _616 = _614 * 0.5;
    bool _618 = _606 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _622 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[30].w, _620);
    float _624 = 1.0 / _622;
    float _626 = _534;
    float _628 = _574;
    float _630 = _616;
    if (!_618)
    {
        _626 = _586;
    }
    float _632 = _626;
    float _634 = _632;
    if (!_618)
    {
        _628 = _584;
    }
    float _636 = _628;
    float _638 = _636;
    if (!_618)
    {
        _630 = _590;
    }
    float _640 = _630;
    bool _642 = !_618;
    float _644 = _640;
    if (!_642)
    {
        float _646 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _648 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _650 = _606 + _648;
        float _652 = _590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _654 = rsqrt(_602);
        float _656 = _650 * _646;
        float _658 = _656 * 0.15915493667125701904296875;
        float _660 = _658 * 6.283185482025146484375;
        float _662 = cos(_660);
        float _664 = _658 * 6.283185482025146484375;
        float _666 = sin(_664);
        float _668 = _662 + (-1.0);
        float _670 = _668 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _672 = fma(_666, _652, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _674 = fma(_590, _662, _670);
        float _676 = _654 * _672;
        float _678 = fma(_598, _676, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _680 = fma(_594, _676, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _644 = _674;
        _634 = _678;
        _638 = _680;
    }
    float _682 = _644;
    float _684 = _634;
    float _686 = _638;
    float _688 = -_450;
    float _690 = _688 + _682;
    float _692 = -_448;
    float _694 = _692 + _684;
    float _696 = -_456;
    float _698 = _696 + _686;
    float _700 = _686;
    if (_528)
    {
        _700 = 1.0;
    }
    float _702 = _700;
    float _704 = _690 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _706 = _690 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _708 = _690 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _710 = _690 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _712 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[0].x, _704);
    float _714 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[1].x, _706);
    float _716 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[2].x, _708);
    float _718 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[3].x, _710);
    float _720 = _704;
    float _722 = _702;
    if (_528)
    {
        _720 = 1.0;
    }
    float _724 = _720;
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _728 = _624 * _726;
    float _730 = _724;
    if (!_528)
    {
        float _732 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _734 = _732 * 0.15915493667125701904296875;
        float _736 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _738 = _734 * 6.283185482025146484375;
        float _740 = cos(_738);
        float _742 = _736 * 0.15915493667125701904296875;
        float _744 = _734 * 6.283185482025146484375;
        float _746 = sin(_744);
        float _748 = 1.0 / _740;
        float _750 = _742 * 6.283185482025146484375;
        float _752 = cos(_750);
        float _754 = _746 * _748;
        float _756 = _742 * 6.283185482025146484375;
        float _758 = sin(_756);
        float _760 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _762 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _760;
        float _764 = _752 * _754;
        float _766 = 1.0 / _762;
        float _768 = 1.0 / _764;
        float _770 = _758 * _768;
        float _772 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _774 = fma(_728, _770, _772);
        float _776 = _774 * _766;
        float _778 = precise::clamp(_776, 0.0, 1.0);
        _730 = _778;
    }
    float _780 = _730;
    if (!_528)
    {
        float _782 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _784 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _786 = _782 * 0.15915493667125701904296875;
        float _788 = _784 * 0.15915493667125701904296875;
        float _790 = _786 * 6.283185482025146484375;
        float _792 = cos(_790);
        float _794 = _786 * 6.283185482025146484375;
        float _796 = sin(_794);
        float _798 = 1.0 / _792;
        float _800 = _788 * 6.283185482025146484375;
        float _802 = cos(_800);
        float _804 = _796 * _798;
        float _806 = _788 * 6.283185482025146484375;
        float _808 = sin(_806);
        float _810 = _802 * _804;
        float _812 = 1.0 / _810;
        float _814 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _816 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _814;
        float _818 = 1.0 / _816;
        float _820 = _808 * _812;
        float _822 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _824 = fma(_728, _820, _822);
        float _826 = _824 * _818;
        float _828 = precise::clamp(_826, 0.0, 1.0);
        float _830 = -_828;
        float _832 = _830 + 1.0;
        _722 = _832;
    }
    float _834 = _722;
    float _836 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[1].z, _714);
    float _838 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[0].z, _712);
    float _840 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[2].z, _716);
    bool _842 = _780 > 0.0;
    bool _844 = isnan(_780);
    bool _846 = _842 || _844;
    bool _848 = isnan(0.0);
    bool _850 = _846 || _848;
    float _852 = _836 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _854 = _838 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _856 = _780 * _834;
    float _858 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[3].z, _718);
    float _860 = _852 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _862 = _852 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _864 = _852 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _866 = _852 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _868 = _840 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _870 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[6].x, _860);
    float _872 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[7].x, _862);
    float _874 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[4].x, _864);
    float _876 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[5].x, _866);
    float _878 = _858 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _880 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[6].z, _870);
    float _882 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[7].z, _872);
    float _884 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[4].z, _874);
    float _886 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[5].z, _876);
    float _888 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[6].w, _880);
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[7].w, _882);
    bool _892 = _834 <= 0.0;
    bool _894 = !_850;
    bool _896 = _892 || _894;
    float _898 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[4].w, _884);
    float _900 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _902 = _888 + _890;
    float _904 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[5].w, _886);
    float _906 = _900 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _908 = _902 * 0.5;
    out.m_33.x = _906;
    out.gl_Position.x = _898;
    out.gl_Position.y = _904;
    out.gl_Position.z = _888;
    out.gl_Position.w = _890;
    out.m_50.z = _908;
    out.m_50.w = _890;
    if (!_896)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _910 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _910;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _77 = as_type<float>(_69);
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _75;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _79 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _967 = as_type<float>(_85);
        out.gl_Position.z = _967;
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
        _77 = _105;
    }
    float _107 = _77;
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
        float _1036 = as_type<float>(_121);
        out.gl_Position.z = _1036;
    }
    if (_113)
    {
        return out;
    }
    float _123 = in.m_37.x;
    float _125 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _127 = as_type<float>(int(gl_VertexIndex));
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_42.w;
    float _141 = in.m_37.y;
    float _143 = in.m_30.x;
    float _145 = in.m_30.y;
    float _147 = in.m_30.z;
    float _149 = _125 * _123;
    float _151 = in.m_35.x;
    float _153 = in.m_35.y;
    float _155 = in.m_35.z;
    int _157 = as_type<int>(_127) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_127) & 2;
    bool _163 = _161 != 0;
    float _165 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = trunc(_149);
    int _169 = int(_167);
    float _171 = 0.0;
    float _173 = _165;
    if (!_137)
    {
        float _175 = _165 * _165;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    bool _181 = !_159;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_163;
    float _187 = _185 ? (-0.5) : 0.5;
    float _189 = _179;
    if (!_137)
    {
        float _191 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _191;
    }
    float _193 = _189;
    int _195 = _169 << 4;
    int _197 = _195 + 1968;
    bool _199 = !_137;
    float _201 = _193;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _165 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _165);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    bool _235 = !_137;
    if (!_235)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _165 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _173 = _255;
    }
    float _257 = _173;
    float _259 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _261 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    uint _264 = uint(int(uint(_197) >> uint(2)));
    uint _266 = uint(int(uint(int(_264)) >> uint(2)));
    int _268 = int(_264) & 3;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[int(_266)][_268];
    int _272 = int(_264) + 1;
    uint _274 = uint(int(uint(_272) >> uint(2)));
    int _276 = _272 & 3;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[int(_274)][_276];
    bool _280 = _123 > 0.5;
    float _282 = fma(_257, _153, _259);
    float _284 = fma(_257, _151, _261);
    float _286 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _288 = fma(_282, _139, _145);
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _292 = _290 != 0;
    int _294 = _197 + 8;
    uint _296 = uint(int(uint(_294) >> uint(2)));
    uint _298 = uint(int(uint(int(_296)) >> uint(2)));
    int _300 = int(_296) & 3;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[int(_298)][_300];
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _306 = _304 != 0;
    float _308 = fma(_257, _155, _286);
    float _310 = fma(_284, _139, _143);
    float _312 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _314 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _316 = fma(_308, _139, _147);
    float _318 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _320 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[5].x, _312);
    float _322 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[4].x, _314);
    float _324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _326 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[6].x, _318);
    float _328 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[5].z, _320);
    float _330 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[4].z, _322);
    bool _332 = _141 > 0.5;
    float _334 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[6].z, _326);
    float _336 = _328 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _338 = _330 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _340 = -_183;
    int _342 = _280 ? as_type<int>(_340) : as_type<int>(_183);
    float _344 = in.m_42.x;
    float _346 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _348 = _336 + _346;
    float _350 = _334 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _352 = !_292;
    float _354 = _352 ? _183 : as_type<float>(_342);
    float _356 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _358 = _338 + _356;
    float _360 = _348 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _362 = -_187;
    int _364 = _332 ? as_type<int>(_362) : as_type<int>(_187);
    float _366 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _368 = _350 + _366;
    float _370 = _354 + 0.5;
    float _372 = fma(_358, (*spvDescriptorSet0.vp_c8)._m0[28].x, _360);
    float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _376 = _348 * _348;
    float _378 = _370 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _380 = !_306;
    float _382 = _380 ? _187 : as_type<float>(_364);
    float _384 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[28].z, _372);
    float _386 = _378 * _324;
    float _388 = fma(_358, _358, _376);
    float _390 = -_382;
    float _392 = _390 + 0.5;
    bool _394 = _384 >= 0.0;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _398 = fma(_368, _368, _388);
    float _400 = _392 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _402 = _344 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = rsqrt(_398);
    float _406 = _400 * _374;
    float _408 = _270 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _410 = _278 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _414 = _374;
    if (_394)
    {
        _414 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _416 = _414;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _420 = _402 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _422 = _302 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _426 = _396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _428 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _430 = _412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _436 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _438 = _420 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _440 = as_type<int>(_416);
    if (_394)
    {
        float _442 = _416 * 5.0;
        _440 = as_type<int>(_442);
    }
    int _444 = _440;
    out.m_44.x = _426;
    out.m_44.y = _428;
    out.m_44.z = _430;
    out.m_44.w = _424;
    float _446 = _438 * _404;
    out.m_46.x = _432;
    out.m_46.y = _434;
    out.m_46.z = _436;
    float _448 = _358 * _446;
    float _450 = _348 * _446;
    out.m_48.x = _386;
    out.m_48.y = _406;
    if (_394)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1608 = as_type<float>(_444);
        out.gl_Position.z = _1608;
    }
    if (_394)
    {
        out.m_33.x = 0.0;
    }
    if (_394)
    {
        return out;
    }
    float _452 = -_450;
    float _454 = _336 + _452;
    float _456 = _368 * _446;
    float _458 = -_448;
    float _460 = _338 + _458;
    float _462 = -_450;
    float _464 = _348 + _462;
    float _466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _468 = _454 + _466;
    float _470 = -_456;
    float _472 = _350 + _470;
    float _474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _476 = _460 + _474;
    float _478 = -_448;
    float _480 = _358 + _478;
    float _482 = _468 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _484 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _486 = _472 + _484;
    float _488 = _464 * _464;
    float _490 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[28].x, _482);
    float _492 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[28].z, _490);
    bool _494 = _492 >= 0.0;
    float _496 = _486;
    if (_494)
    {
        _496 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _498 = _496;
    int _500 = as_type<int>(_498);
    if (_494)
    {
        out.m_33.x = 0.0;
    }
    if (_494)
    {
        float _502 = _498 * 5.0;
        _500 = as_type<int>(_502);
    }
    int _504 = _500;
    if (_494)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1709 = as_type<float>(_504);
        out.gl_Position.z = _1709;
    }
    if (_494)
    {
        return out;
    }
    float _506 = in.m_42.y;
    float _508 = -_456;
    float _510 = _368 + _508;
    float _512 = fma(_480, _480, _488);
    float _514 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _516 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _518 = fma(_510, _510, _512);
    bool _520 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _522 = isnan(0.5);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _528 = _524 || _526;
    float _530 = sqrt(_518);
    float _532 = _454 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _534 = _454 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _536 = _506 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _538 = _404 * _530;
    float _540 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _542 = _420 * _538;
    float _544 = _538 * _540;
    float _546 = _538 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _548 = _546 * 0.5;
    float _550 = _516 * _542;
    float _552 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[11].x, _532);
    float _554 = _514 * _544;
    float _556 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[11].z, _552);
    float _558 = _554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _560 = _554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _562 = _554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _564 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[26].x, _558);
    float _566 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[24].x, _560);
    float _568 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[25].x, _562);
    float _570 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[26].z, _564);
    float _572 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[24].z, _566);
    float _574 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[25].z, _568);
    float _576 = _570 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _578 = _572 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _580 = _556 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _582 = _574 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _584 = _350 + _576;
    float _586 = _338 + _578;
    float _588 = 1.0 / _580;
    float _590 = _336 + _582;
    float _592 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _594 = _584 + _592;
    float _596 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _598 = _586 + _596;
    float _600 = _594 * _594;
    float _602 = fma(_598, _598, _600);
    float _604 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[10].x, _534);
    float _606 = sqrt(_602);
    float _608 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[10].z, _604);
    float _610 = _608 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _612 = _610 + _580;
    float _614 = _612 * _588;
    float _616 = _614 * 0.5;
    bool _618 = _606 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _622 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[30].w, _620);
    float _624 = 1.0 / _622;
    float _626 = _534;
    float _628 = _574;
    float _630 = _616;
    if (!_618)
    {
        _626 = _586;
    }
    float _632 = _626;
    float _634 = _632;
    if (!_618)
    {
        _628 = _584;
    }
    float _636 = _628;
    float _638 = _636;
    if (!_618)
    {
        _630 = _590;
    }
    float _640 = _630;
    bool _642 = !_618;
    float _644 = _640;
    if (!_642)
    {
        float _646 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _648 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _650 = _606 + _648;
        float _652 = _590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _654 = rsqrt(_602);
        float _656 = _650 * _646;
        float _658 = _656 * 0.15915493667125701904296875;
        float _660 = _658 * 6.283185482025146484375;
        float _662 = cos(_660);
        float _664 = _658 * 6.283185482025146484375;
        float _666 = sin(_664);
        float _668 = _662 + (-1.0);
        float _670 = _668 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _672 = fma(_666, _652, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _674 = fma(_590, _662, _670);
        float _676 = _654 * _672;
        float _678 = fma(_598, _676, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _680 = fma(_594, _676, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _644 = _674;
        _634 = _678;
        _638 = _680;
    }
    float _682 = _644;
    float _684 = _634;
    float _686 = _638;
    float _688 = -_450;
    float _690 = _688 + _682;
    float _692 = -_448;
    float _694 = _692 + _684;
    float _696 = -_456;
    float _698 = _696 + _686;
    float _700 = _686;
    if (_528)
    {
        _700 = 1.0;
    }
    float _702 = _700;
    float _704 = _690 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _706 = _690 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _708 = _690 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _710 = _690 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _712 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[0].x, _704);
    float _714 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[1].x, _706);
    float _716 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[2].x, _708);
    float _718 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[3].x, _710);
    float _720 = _704;
    float _722 = _702;
    if (_528)
    {
        _720 = 1.0;
    }
    float _724 = _720;
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _728 = _624 * _726;
    float _730 = _724;
    if (!_528)
    {
        float _732 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _734 = _732 * 0.15915493667125701904296875;
        float _736 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _738 = _734 * 6.283185482025146484375;
        float _740 = cos(_738);
        float _742 = _736 * 0.15915493667125701904296875;
        float _744 = _734 * 6.283185482025146484375;
        float _746 = sin(_744);
        float _748 = 1.0 / _740;
        float _750 = _742 * 6.283185482025146484375;
        float _752 = cos(_750);
        float _754 = _746 * _748;
        float _756 = _742 * 6.283185482025146484375;
        float _758 = sin(_756);
        float _760 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _762 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _760;
        float _764 = _752 * _754;
        float _766 = 1.0 / _762;
        float _768 = 1.0 / _764;
        float _770 = _758 * _768;
        float _772 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _774 = fma(_728, _770, _772);
        float _776 = _774 * _766;
        float _778 = precise::clamp(_776, 0.0, 1.0);
        _730 = _778;
    }
    float _780 = _730;
    if (!_528)
    {
        float _782 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _784 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _786 = _782 * 0.15915493667125701904296875;
        float _788 = _784 * 0.15915493667125701904296875;
        float _790 = _786 * 6.283185482025146484375;
        float _792 = cos(_790);
        float _794 = _786 * 6.283185482025146484375;
        float _796 = sin(_794);
        float _798 = 1.0 / _792;
        float _800 = _788 * 6.283185482025146484375;
        float _802 = cos(_800);
        float _804 = _796 * _798;
        float _806 = _788 * 6.283185482025146484375;
        float _808 = sin(_806);
        float _810 = _802 * _804;
        float _812 = 1.0 / _810;
        float _814 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _816 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _814;
        float _818 = 1.0 / _816;
        float _820 = _808 * _812;
        float _822 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _824 = fma(_728, _820, _822);
        float _826 = _824 * _818;
        float _828 = precise::clamp(_826, 0.0, 1.0);
        float _830 = -_828;
        float _832 = _830 + 1.0;
        _722 = _832;
    }
    float _834 = _722;
    float _836 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[1].z, _714);
    float _838 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[0].z, _712);
    float _840 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[2].z, _716);
    bool _842 = _780 > 0.0;
    bool _844 = isnan(_780);
    bool _846 = _842 || _844;
    bool _848 = isnan(0.0);
    bool _850 = _846 || _848;
    float _852 = _836 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _854 = _838 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _856 = _780 * _834;
    float _858 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[3].z, _718);
    float _860 = _852 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _862 = _852 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _864 = _852 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _866 = _852 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _868 = _840 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _870 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[6].x, _860);
    float _872 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[7].x, _862);
    float _874 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[4].x, _864);
    float _876 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[5].x, _866);
    float _878 = _858 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _880 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[6].z, _870);
    float _882 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[7].z, _872);
    float _884 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[4].z, _874);
    float _886 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[5].z, _876);
    float _888 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[6].w, _880);
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[7].w, _882);
    bool _892 = _834 <= 0.0;
    bool _894 = !_850;
    bool _896 = _892 || _894;
    float _898 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[4].w, _884);
    float _900 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _902 = _888 + _890;
    float _904 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[5].w, _886);
    float _906 = _900 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _908 = _902 * 0.5;
    out.m_33.x = _906;
    out.gl_Position.x = _898;
    out.gl_Position.y = _904;
    out.gl_Position.z = _888;
    out.gl_Position.w = _890;
    out.m_50.z = _908;
    out.m_50.w = _890;
    if (!_896)
    {
        return out;
    }
    float _910 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _910;
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _77 = as_type<float>(_69);
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _75;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _79 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _967 = as_type<float>(_85);
        out.gl_Position.z = _967;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        _77 = _105;
    }
    float _107 = _77;
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
        float _1036 = as_type<float>(_121);
        out.gl_Position.z = _1036;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_37.x;
    float _125 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _127 = as_type<float>(int(gl_VertexIndex));
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_42.w;
    float _141 = in.m_37.y;
    float _143 = in.m_30.x;
    float _145 = in.m_30.y;
    float _147 = in.m_30.z;
    float _149 = _125 * _123;
    float _151 = in.m_35.x;
    float _153 = in.m_35.y;
    float _155 = in.m_35.z;
    int _157 = as_type<int>(_127) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_127) & 2;
    bool _163 = _161 != 0;
    float _165 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = trunc(_149);
    int _169 = int(_167);
    float _171 = 0.0;
    float _173 = _165;
    if (!_137)
    {
        float _175 = _165 * _165;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    bool _181 = !_159;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_163;
    float _187 = _185 ? (-0.5) : 0.5;
    float _189 = _179;
    if (!_137)
    {
        float _191 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _191;
    }
    float _193 = _189;
    int _195 = _169 << 4;
    int _197 = _195 + 1968;
    bool _199 = !_137;
    float _201 = _193;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _165 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _165);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    bool _235 = !_137;
    if (!_235)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _165 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _173 = _255;
    }
    float _257 = _173;
    float _259 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _261 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    uint _264 = uint(int(uint(_197) >> uint(2)));
    uint _266 = uint(int(uint(int(_264)) >> uint(2)));
    int _268 = int(_264) & 3;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[int(_266)][_268];
    int _272 = int(_264) + 1;
    uint _274 = uint(int(uint(_272) >> uint(2)));
    int _276 = _272 & 3;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[int(_274)][_276];
    bool _280 = _123 > 0.5;
    float _282 = fma(_257, _153, _259);
    float _284 = fma(_257, _151, _261);
    float _286 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _288 = fma(_282, _139, _145);
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _292 = _290 != 0;
    int _294 = _197 + 8;
    uint _296 = uint(int(uint(_294) >> uint(2)));
    uint _298 = uint(int(uint(int(_296)) >> uint(2)));
    int _300 = int(_296) & 3;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[int(_298)][_300];
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _306 = _304 != 0;
    float _308 = fma(_257, _155, _286);
    float _310 = fma(_284, _139, _143);
    float _312 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _314 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _316 = fma(_308, _139, _147);
    float _318 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _320 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[5].x, _312);
    float _322 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[4].x, _314);
    float _324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _326 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[6].x, _318);
    float _328 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[5].z, _320);
    float _330 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[4].z, _322);
    bool _332 = _141 > 0.5;
    float _334 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[6].z, _326);
    float _336 = _328 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _338 = _330 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _340 = -_183;
    int _342 = _280 ? as_type<int>(_340) : as_type<int>(_183);
    float _344 = in.m_42.x;
    float _346 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _348 = _336 + _346;
    float _350 = _334 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _352 = !_292;
    float _354 = _352 ? _183 : as_type<float>(_342);
    float _356 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _358 = _338 + _356;
    float _360 = _348 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _362 = -_187;
    int _364 = _332 ? as_type<int>(_362) : as_type<int>(_187);
    float _366 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _368 = _350 + _366;
    float _370 = _354 + 0.5;
    float _372 = fma(_358, (*spvDescriptorSet0.vp_c8)._m0[28].x, _360);
    float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _376 = _348 * _348;
    float _378 = _370 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _380 = !_306;
    float _382 = _380 ? _187 : as_type<float>(_364);
    float _384 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[28].z, _372);
    float _386 = _378 * _324;
    float _388 = fma(_358, _358, _376);
    float _390 = -_382;
    float _392 = _390 + 0.5;
    bool _394 = _384 >= 0.0;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _398 = fma(_368, _368, _388);
    float _400 = _392 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _402 = _344 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = rsqrt(_398);
    float _406 = _400 * _374;
    float _408 = _270 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _410 = _278 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _414 = _374;
    if (_394)
    {
        _414 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _416 = _414;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _420 = _402 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _422 = _302 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _426 = _396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _428 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _430 = _412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _436 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _438 = _420 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _440 = as_type<int>(_416);
    if (_394)
    {
        float _442 = _416 * 5.0;
        _440 = as_type<int>(_442);
    }
    int _444 = _440;
    out.m_44.x = _426;
    out.m_44.y = _428;
    out.m_44.z = _430;
    out.m_44.w = _424;
    float _446 = _438 * _404;
    out.m_46.x = _432;
    out.m_46.y = _434;
    out.m_46.z = _436;
    float _448 = _358 * _446;
    float _450 = _348 * _446;
    out.m_48.x = _386;
    out.m_48.y = _406;
    if (_394)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1608 = as_type<float>(_444);
        out.gl_Position.z = _1608;
    }
    if (_394)
    {
        out.m_33.x = 0.0;
    }
    if (_394)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _452 = -_450;
    float _454 = _336 + _452;
    float _456 = _368 * _446;
    float _458 = -_448;
    float _460 = _338 + _458;
    float _462 = -_450;
    float _464 = _348 + _462;
    float _466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _468 = _454 + _466;
    float _470 = -_456;
    float _472 = _350 + _470;
    float _474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _476 = _460 + _474;
    float _478 = -_448;
    float _480 = _358 + _478;
    float _482 = _468 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _484 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _486 = _472 + _484;
    float _488 = _464 * _464;
    float _490 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[28].x, _482);
    float _492 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[28].z, _490);
    bool _494 = _492 >= 0.0;
    float _496 = _486;
    if (_494)
    {
        _496 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _498 = _496;
    int _500 = as_type<int>(_498);
    if (_494)
    {
        out.m_33.x = 0.0;
    }
    if (_494)
    {
        float _502 = _498 * 5.0;
        _500 = as_type<int>(_502);
    }
    int _504 = _500;
    if (_494)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1709 = as_type<float>(_504);
        out.gl_Position.z = _1709;
    }
    if (_494)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _506 = in.m_42.y;
    float _508 = -_456;
    float _510 = _368 + _508;
    float _512 = fma(_480, _480, _488);
    float _514 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _516 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _518 = fma(_510, _510, _512);
    bool _520 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _522 = isnan(0.5);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _528 = _524 || _526;
    float _530 = sqrt(_518);
    float _532 = _454 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _534 = _454 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _536 = _506 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _538 = _404 * _530;
    float _540 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _542 = _420 * _538;
    float _544 = _538 * _540;
    float _546 = _538 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _548 = _546 * 0.5;
    float _550 = _516 * _542;
    float _552 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[11].x, _532);
    float _554 = _514 * _544;
    float _556 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[11].z, _552);
    float _558 = _554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _560 = _554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _562 = _554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _564 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[26].x, _558);
    float _566 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[24].x, _560);
    float _568 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[25].x, _562);
    float _570 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[26].z, _564);
    float _572 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[24].z, _566);
    float _574 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[25].z, _568);
    float _576 = _570 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _578 = _572 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _580 = _556 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _582 = _574 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _584 = _350 + _576;
    float _586 = _338 + _578;
    float _588 = 1.0 / _580;
    float _590 = _336 + _582;
    float _592 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _594 = _584 + _592;
    float _596 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _598 = _586 + _596;
    float _600 = _594 * _594;
    float _602 = fma(_598, _598, _600);
    float _604 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[10].x, _534);
    float _606 = sqrt(_602);
    float _608 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[10].z, _604);
    float _610 = _608 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _612 = _610 + _580;
    float _614 = _612 * _588;
    float _616 = _614 * 0.5;
    bool _618 = _606 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _622 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[30].w, _620);
    float _624 = 1.0 / _622;
    float _626 = _534;
    float _628 = _574;
    float _630 = _616;
    if (!_618)
    {
        _626 = _586;
    }
    float _632 = _626;
    float _634 = _632;
    if (!_618)
    {
        _628 = _584;
    }
    float _636 = _628;
    float _638 = _636;
    if (!_618)
    {
        _630 = _590;
    }
    float _640 = _630;
    bool _642 = !_618;
    float _644 = _640;
    if (!_642)
    {
        float _646 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _648 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _650 = _606 + _648;
        float _652 = _590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _654 = rsqrt(_602);
        float _656 = _650 * _646;
        float _658 = _656 * 0.15915493667125701904296875;
        float _660 = _658 * 6.283185482025146484375;
        float _662 = cos(_660);
        float _664 = _658 * 6.283185482025146484375;
        float _666 = sin(_664);
        float _668 = _662 + (-1.0);
        float _670 = _668 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _672 = fma(_666, _652, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _674 = fma(_590, _662, _670);
        float _676 = _654 * _672;
        float _678 = fma(_598, _676, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _680 = fma(_594, _676, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _644 = _674;
        _634 = _678;
        _638 = _680;
    }
    float _682 = _644;
    float _684 = _634;
    float _686 = _638;
    float _688 = -_450;
    float _690 = _688 + _682;
    float _692 = -_448;
    float _694 = _692 + _684;
    float _696 = -_456;
    float _698 = _696 + _686;
    float _700 = _686;
    if (_528)
    {
        _700 = 1.0;
    }
    float _702 = _700;
    float _704 = _690 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _706 = _690 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _708 = _690 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _710 = _690 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _712 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[0].x, _704);
    float _714 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[1].x, _706);
    float _716 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[2].x, _708);
    float _718 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[3].x, _710);
    float _720 = _704;
    float _722 = _702;
    if (_528)
    {
        _720 = 1.0;
    }
    float _724 = _720;
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _728 = _624 * _726;
    float _730 = _724;
    if (!_528)
    {
        float _732 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _734 = _732 * 0.15915493667125701904296875;
        float _736 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _738 = _734 * 6.283185482025146484375;
        float _740 = cos(_738);
        float _742 = _736 * 0.15915493667125701904296875;
        float _744 = _734 * 6.283185482025146484375;
        float _746 = sin(_744);
        float _748 = 1.0 / _740;
        float _750 = _742 * 6.283185482025146484375;
        float _752 = cos(_750);
        float _754 = _746 * _748;
        float _756 = _742 * 6.283185482025146484375;
        float _758 = sin(_756);
        float _760 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _762 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _760;
        float _764 = _752 * _754;
        float _766 = 1.0 / _762;
        float _768 = 1.0 / _764;
        float _770 = _758 * _768;
        float _772 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _774 = fma(_728, _770, _772);
        float _776 = _774 * _766;
        float _778 = precise::clamp(_776, 0.0, 1.0);
        _730 = _778;
    }
    float _780 = _730;
    if (!_528)
    {
        float _782 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _784 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _786 = _782 * 0.15915493667125701904296875;
        float _788 = _784 * 0.15915493667125701904296875;
        float _790 = _786 * 6.283185482025146484375;
        float _792 = cos(_790);
        float _794 = _786 * 6.283185482025146484375;
        float _796 = sin(_794);
        float _798 = 1.0 / _792;
        float _800 = _788 * 6.283185482025146484375;
        float _802 = cos(_800);
        float _804 = _796 * _798;
        float _806 = _788 * 6.283185482025146484375;
        float _808 = sin(_806);
        float _810 = _802 * _804;
        float _812 = 1.0 / _810;
        float _814 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _816 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _814;
        float _818 = 1.0 / _816;
        float _820 = _808 * _812;
        float _822 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _824 = fma(_728, _820, _822);
        float _826 = _824 * _818;
        float _828 = precise::clamp(_826, 0.0, 1.0);
        float _830 = -_828;
        float _832 = _830 + 1.0;
        _722 = _832;
    }
    float _834 = _722;
    float _836 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[1].z, _714);
    float _838 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[0].z, _712);
    float _840 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[2].z, _716);
    bool _842 = _780 > 0.0;
    bool _844 = isnan(_780);
    bool _846 = _842 || _844;
    bool _848 = isnan(0.0);
    bool _850 = _846 || _848;
    float _852 = _836 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _854 = _838 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _856 = _780 * _834;
    float _858 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[3].z, _718);
    float _860 = _852 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _862 = _852 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _864 = _852 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _866 = _852 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _868 = _840 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _870 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[6].x, _860);
    float _872 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[7].x, _862);
    float _874 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[4].x, _864);
    float _876 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[5].x, _866);
    float _878 = _858 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _880 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[6].z, _870);
    float _882 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[7].z, _872);
    float _884 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[4].z, _874);
    float _886 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[5].z, _876);
    float _888 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[6].w, _880);
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[7].w, _882);
    bool _892 = _834 <= 0.0;
    bool _894 = !_850;
    bool _896 = _892 || _894;
    float _898 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[4].w, _884);
    float _900 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _902 = _888 + _890;
    float _904 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[5].w, _886);
    float _906 = _900 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _908 = _902 * 0.5;
    out.m_33.x = _906;
    out.gl_Position.x = _898;
    out.gl_Position.y = _904;
    out.gl_Position.z = _888;
    out.gl_Position.w = _890;
    out.m_50.z = _908;
    out.m_50.w = _890;
    if (!_896)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _910 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _910;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

