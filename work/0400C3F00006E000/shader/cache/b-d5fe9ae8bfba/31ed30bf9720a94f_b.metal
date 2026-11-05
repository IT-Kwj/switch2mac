#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

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
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_56 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_58 [[user(locn7)]];
    float4 m_68 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _532 = false;
    bool _399 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2318 = as_type<float>(_103);
        out.gl_Position.z = _2318;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    if (_117)
    {
        float _125 = float(_87);
        _123 = _125;
    }
    float _127 = _123;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    if (_133)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _97;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2386 = as_type<float>(_139);
        out.gl_Position.z = _2386;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _145 * _143;
    float _161 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _163 = in.m_47.x;
    float _165 = in.m_47.y;
    float _167 = in.m_47.z;
    float _169 = _161 * 6.283185482025146484375;
    float _171 = floor(_161);
    int _173 = as_type<int>(_147) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_147) & 2;
    bool _179 = _177 != 0;
    float _181 = _169 * 0.15915493667125701904296875;
    float _183 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    bool _189 = !_175;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = _147;
    float _195 = _183;
    if (!_157)
    {
        float _197 = _183 * _183;
        float _199 = _197 * 0.5;
        _193 = _199;
    }
    float _201 = _193;
    float _203 = _181 * 6.283185482025146484375;
    float _205 = cos(_203);
    bool _207 = !_179;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = _201;
    if (!_157)
    {
        float _213 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _213;
    }
    float _215 = _211;
    float _217 = -_171;
    float _219 = _161 + _217;
    bool _221 = _219 < 0.5;
    float _223 = float(_221);
    bool _225 = !_157;
    float _227 = _215;
    if (!_225)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _183 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _183);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _257;
    }
    float _259 = _227;
    bool _261 = !_157;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _183 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _195 = _281;
    }
    float _283 = _195;
    float _285 = -_219;
    float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _289 = fma(_205, 0.5, 0.5);
    float _291 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _293 = -_223;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _299 = _297 != 0;
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _303 = _301 != 0;
    float _305 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _307 = -_289;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = in.m_54.w;
    float _313 = _291 * _141;
    bool _315 = !_299;
    int _317 = _315 ? 0 : 1;
    float _319 = fma(_283, _163, _305);
    float _321 = in.m_42.x;
    float _323 = in.m_42.y;
    float _325 = in.m_42.z;
    bool _327 = !_187;
    int _329 = _327 ? 0 : 1;
    int _331 = abs(_317);
    int _333 = abs(_329);
    float _335 = trunc(_313);
    int _337 = int(_335);
    float _339 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _341 = !_303;
    int _343 = _341 ? 0 : 1;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _347 = float(_331);
    int _349 = abs(_343);
    float _351 = fma(_283, _165, _339);
    float _353 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _355 = float(_333);
    float _357 = abs(_287);
    float _359 = _347 * _357;
    float _361 = float(_349);
    float _363 = fma(_283, _167, _353);
    int _365 = _337 << 4;
    int _367 = _365 + 1712;
    float _369 = fma(_355, _309, _359);
    float _371 = fma(_319, _311, _321);
    float _373 = fma(_351, _311, _323);
    float _375 = fma(_363, _311, _325);
    float _377 = abs(_295);
    float _379 = fma(_361, _377, _369);
    bool _381 = !_345;
    float _397;
    if (!_381)
    {
        float _383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _385 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _387 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _389 = _387 * _383;
        float _391 = floor(_389);
        float _393 = -_391;
        float _395 = _389 + _393;
        _397 = _395;
        _399 = true;
    }
    else
    {
        float _401 = float(_87);
        float _403 = 1.0 / _401;
        float _405 = _121 * _403;
        _397 = _405;
    }
    _399 = false;
    float _407 = _397;
    uint _410 = uint(int(uint(_367) >> uint(2)));
    uint _412 = uint(int(uint(int(_410)) >> uint(2)));
    int _414 = int(_410) & 3;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[int(_412)][_414];
    int _418 = int(_410) + 1;
    uint _420 = uint(int(uint(_418) >> uint(2)));
    int _422 = _418 & 3;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[int(_420)][_422];
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _428 = _407 + _426;
    bool _430 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _432 = isnan(_407);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _446 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _448 = isnan(_407);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    int _458 = _367 + 8;
    uint _460 = uint(int(uint(_458) >> uint(2)));
    uint _462 = uint(int(uint(int(_460)) >> uint(2)));
    int _464 = int(_460) & 3;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[int(_462)][_464];
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _468;
    float _472 = -_440;
    float _474 = _472 + 1.0;
    bool _476 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _478 = 1.0 / _444;
    float _480 = _470 * _478;
    float _482 = fma(_480, _428, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _484 = _456 * _474;
    float _486 = -_456;
    float _488 = _486 + 1.0;
    float _490 = _482 * _484;
    float _492 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[115].x, _490);
    float _494 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[116].x, _492);
    float _496 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _498 = _424 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _502 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _494 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _506 = _466 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _508 = _506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _510 = !_476;
    float _528;
    float _530;
    if (!_510)
    {
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _514 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _516 = float(_87);
        float _518 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _520 = _518 * _512;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _516;
        _530 = _526;
        _532 = true;
    }
    else
    {
        float _534 = float(_87);
        float _536 = 1.0 / _534;
        float _538 = _121 * _536;
        _528 = _534;
        _530 = _538;
    }
    _532 = false;
    float _540 = _528;
    float _542 = _530;
    float _544 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _546 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _548 = in.m_54.x;
    float _550 = in.m_54.y;
    float _552 = fma(_121, 0.02500000037252902984619140625, _141);
    float _554 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _544);
    float _556 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _558 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _546);
    float _560 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _562 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].z, _554);
    float _564 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].x, _556);
    float _566 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].z, _558);
    float _568 = floor(_552);
    float _570 = _562 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _572 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].z, _564);
    float _574 = _566 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _576 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _578 = _570 + _576;
    float _580 = _572 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _582 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _584 = _574 + _582;
    float _586 = _578 * _578;
    float _588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _590 = _580 + _588;
    float _592 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _594 = fma(_584, _584, _586);
    float _596 = fma(_590, _590, _594);
    float _598 = rsqrt(_596);
    float _600 = _578 * _598;
    float _602 = _584 * _598;
    float _604 = _590 * _598;
    float _606 = -_600;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _578);
    float _610 = -_602;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _584);
    float _614 = -_604;
    float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[18].w, _590);
    float _618 = _608 * _608;
    float _620 = fma(_612, _612, _618);
    float _622 = fma(_616, _616, _620);
    float _624 = _548 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _626 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _628 = _570 + _626;
    float _630 = sqrt(_622);
    float _632 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _634 = _628 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _636 = fma(_568, -0.1500000059604644775390625, 1.0);
    float _638 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _640 = _574 + _638;
    float _642 = _598 * _630;
    float _644 = _550 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[191].x * 0.100000001490116119384765625;
    float _648 = fma(_640, (*spvDescriptorSet0.vp_c10)._m0[8].x, _634);
    float _650 = _632 * _642;
    float _652 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _654 = _568 * _646;
    float _656 = precise::max(_636, 0.20000000298023223876953125);
    float _658 = _650 * _592;
    float _660 = _652 * _642;
    float _662 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _664 = _580 + _662;
    float _666 = _642 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _668 = _666 * 0.5;
    float _670 = _660 * _560;
    float _672 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[10].x, _648);
    float _674 = _670 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _676 = _670 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _678 = _672 * _654;
    float _680 = fma(_658, (*spvDescriptorSet0.vp_c10)._m0[10].x, _674);
    float _682 = precise::min(_656, 1.0);
    float _684 = fma(_658, (*spvDescriptorSet0.vp_c10)._m0[8].x, _676);
    float _686 = _670 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _688 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[10].z, _680);
    float _690 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[8].z, _684);
    float _692 = fma(_658, (*spvDescriptorSet0.vp_c10)._m0[9].x, _686);
    float _694 = fma(_688, _682, _580);
    float _696 = fma(_690, _682, _574);
    float _698 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[9].z, _692);
    float _700 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[10].x, _694);
    float _702 = -_602;
    float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _574);
    float _706 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[8].x, _696);
    float _708 = fma(_698, _682, _570);
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _712 = _700 + _710;
    float _714 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _716 = _706 + _714;
    float _718 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[9].x, _708);
    float _720 = _712 * _712;
    float _722 = fma(_716, _716, _720);
    float _724 = sqrt(_722);
    bool _726 = _724 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _734 = _732 != 0;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _738 = _736 != 0;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _742 = _740 != 0;
    bool _744 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _746 = isnan(0.5);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _752 = _748 || _750;
    bool _754 = !_734;
    int _756 = _754 ? 0 : 1;
    bool _758 = !_730;
    int _760 = _758 ? 0 : 1;
    bool _762 = !_738;
    int _764 = _762 ? 0 : 1;
    bool _766 = !_742;
    int _768 = _766 ? 0 : 1;
    float _770 = _686;
    float _772 = _708;
    float _774 = _720;
    float _776 = _580;
    float _778 = _642;
    float _780 = _712;
    if (!_726)
    {
        _770 = _706;
    }
    float _782 = _770;
    float _784 = _782;
    if (!_726)
    {
        _772 = _700;
    }
    float _786 = _772;
    float _788 = _786;
    if (!_726)
    {
        _774 = _718;
    }
    float _790 = _774;
    bool _792 = !_726;
    float _794 = _790;
    if (!_792)
    {
        float _796 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _798 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _800 = _724 + _798;
        float _802 = _718 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _804 = rsqrt(_722);
        float _806 = _800 * _796;
        float _808 = _806 * 0.15915493667125701904296875;
        float _810 = _808 * 6.283185482025146484375;
        float _812 = cos(_810);
        float _814 = _808 * 6.283185482025146484375;
        float _816 = sin(_814);
        float _818 = _812 + (-1.0);
        float _820 = _818 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _822 = fma(_816, _802, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _824 = fma(_718, _812, _820);
        float _826 = _804 * _822;
        float _828 = fma(_716, _826, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _830 = fma(_712, _826, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _784 = _828;
        _794 = _824;
        _788 = _830;
    }
    float _832 = _784;
    float _834 = _794;
    float _836 = _788;
    float _838 = -_602;
    float _840 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[18].w, _832);
    float _842 = -_600;
    float _844 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _834);
    float _846 = -_604;
    float _848 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[18].w, _836);
    float _850 = -_600;
    float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[18].w, _570);
    float _854 = -_604;
    float _856 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[18].w, _580);
    float _858 = _844;
    float _860 = _840;
    float _862 = _848;
    float _864 = _832;
    float _866 = _834;
    if (!_752)
    {
        float _868 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _870 = _852 + _868;
        float _872 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _874 = _704 + _872;
        float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
        float _878 = -_574;
        float _880 = _878 + _832;
        float _882 = _870 * _870;
        float _884 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _886 = _856 + _884;
        float _888 = -_570;
        float _890 = _888 + _834;
        float _892 = -_580;
        float _894 = _892 + _836;
        float _896 = fma(_874, _874, _882);
        float _898 = 1.0 / _642;
        float _900 = fma(_886, _886, _896);
        float _902 = sqrt(_900);
        float _904 = precise::max(_902, (*spvDescriptorSet0.vp_c9)._m0[199].y);
        float _906 = _904 * _876;
        float _908 = _906 * _898;
        float _910 = fma(_880, _908, _704);
        float _912 = fma(_890, _908, _852);
        float _914 = fma(_894, _908, _856);
        _858 = _912;
        _860 = _910;
        _862 = _914;
        _776 = _894;
        _778 = _898;
    }
    float _916 = _858;
    float _918 = _860;
    float _920 = _862;
    float _922 = _776;
    float _924 = _778;
    float _926 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _928 = _916 + _926;
    float _930 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _932 = _918 + _930;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _936 = _920 + _934;
    float _938 = _928 * _928;
    float _940 = fma(_932, _932, _938);
    float _942 = fma(_936, _936, _940);
    float _944 = rsqrt(_942);
    float _946 = sqrt(_942);
    float _948 = _932 * _944;
    float _950 = _936 * _944;
    float _952 = _928 * _944;
    float _954 = _948 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _956 = _950 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _958 = _954 * _954;
    float _960 = _956 * _956;
    float _962 = _958 + _960;
    float _964 = sqrt(_962);
    bool _966 = _964 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _968 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _970 = _964 + _968;
    float _972 = _922;
    float _974 = _962;
    float _976 = _970;
    if (_966)
    {
        float _978 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _972 = _978;
    }
    float _980 = _972;
    if (_966)
    {
        float _982 = rsqrt(_962);
        _974 = _982;
    }
    float _984 = _974;
    if (_966)
    {
        float _986 = _970 * _980;
        _976 = _986;
    }
    float _988 = _976;
    if (_966)
    {
        float _990 = _988 * 0.15915493667125701904296875;
        _864 = _990;
    }
    float _992 = _864;
    float _994 = _980;
    if (_966)
    {
        float _996 = _992 * 6.283185482025146484375;
        float _998 = sin(_996);
        _994 = _998;
    }
    float _1000 = _994;
    float _1002 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1004 = precise::max(0.0, _1002);
    float _1006 = _924;
    float _1008 = _1002;
    if (_966)
    {
        float _1010 = _992 * 6.283185482025146484375;
        float _1012 = cos(_1010);
        _1006 = _1012;
    }
    float _1014 = _1006;
    float _1016 = -_952;
    float _1018 = -_1004;
    float _1020 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1018);
    float _1022 = _1020;
    if (_966)
    {
        float _1024 = _1020 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1008 = _1024;
    }
    float _1026 = _1008;
    float _1028 = _916 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1030 = _1000;
    float _1032 = _1026;
    if (_966)
    {
        float _1034 = fma(_1000, _1026, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _866 = _1034;
    }
    float _1036 = _866;
    float _1038 = _1036;
    if (!_966)
    {
        _1030 = _954;
    }
    float _1040 = _1030;
    float _1042 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1028);
    float _1044 = _1040;
    float _1046 = _1014;
    if (_966)
    {
        float _1048 = _1014 + (-1.0);
        _1032 = _1048;
    }
    float _1050 = _1032;
    float _1052 = _1050;
    if (_966)
    {
        float _1054 = _984 * _1036;
        _780 = _1054;
    }
    float _1056 = _780;
    float _1058 = _916 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1060 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1042);
    if (_966)
    {
        float _1062 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1038 = _1062;
    }
    float _1064 = _1038;
    float _1066 = _1064;
    if (_966)
    {
        float _1068 = _954 * _1056;
        _1044 = _1068;
    }
    float _1070 = _1044;
    if (!_966)
    {
        _1052 = _956;
    }
    float _1072 = _1052;
    float _1074 = _1072;
    if (_966)
    {
        float _1076 = _956 * _1056;
        _1074 = _1076;
    }
    float _1078 = _1074;
    if (_966)
    {
        float _1080 = fma(_1020, _1014, _1064);
        _1022 = _1080;
    }
    float _1082 = _1022;
    if (!_966)
    {
        _1066 = _958;
    }
    float _1084 = _1066;
    float _1086 = _1084;
    if (_966)
    {
        float _1088 = _1070 * _1070;
        _1086 = _1088;
    }
    float _1090 = _1086;
    float _1092 = _916 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1094 = _916 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (!_966)
    {
        _1046 = _960;
    }
    float _1096 = _1046;
    float _1098 = _1096;
    if (_966)
    {
        float _1100 = _1078 * _1078;
        _1098 = _1100;
    }
    float _1102 = _1098;
    float _1104 = fma(_1082, _1082, _1090);
    float _1106 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1058);
    float _1108 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1092);
    float _1110 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1094);
    float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1114 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1112);
    float _1116 = precise::clamp(_1114, 0.0, 1.0);
    float _1118 = _1104 + _1102;
    float _1120 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1106);
    float _1122 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1124 = -_1116;
    float _1126 = _1124 + 1.0;
    float _1128 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1108);
    float _1130 = rsqrt(_1118);
    float _1132 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1134 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1136 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1138 = _1128 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1140 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1110);
    float _1142 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1134);
    float _1144 = abs(_1126);
    float _1146 = log2(_1144);
    float _1148 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1150 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1142);
    float _1152 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1154 = -_1148;
    float _1156 = fma(_1154, _1136, 1.0);
    float _1158 = _1130 * _1070;
    float _1160 = _1130 * _1082;
    float _1162 = _1130 * _1078;
    float _1164 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1150);
    float _1166 = _1158 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1168 = log2(_1156);
    float _1170 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1172 = _1160 + 1.0;
    float _1174 = -_1166;
    float _1176 = fma(_1160, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1174);
    float _1178 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1180 = -_1162;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1176);
    float _1184 = 1.0 / _1164;
    float _1186 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1188 = fma(_1182, -0.5, 0.5);
    float _1190 = fma(_1182, 0.5, 0.5);
    float _1192 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1186);
    float _1194 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1170);
    float _1196 = exp2(_1178);
    float _1198 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1192);
    float _1200 = fma(_1190, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1202 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1194);
    float _1204 = _1168 * 0.693147182464599609375;
    float _1206 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1198);
    float _1208 = fma(_1190, _1200, -0.212114393711090087890625);
    float _1210 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1202);
    float _1212 = sqrt(_1188);
    float _1214 = _1206 * _1184;
    float _1216 = fma(_1190, _1208, 1.570728778839111328125);
    float _1218 = _1210 * _1184;
    float _1220 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1222 = fma(_1214, 0.5, 0.5);
    float _1224 = fma(_1218, -0.5, 0.5);
    float _1226 = -_1160;
    float _1228 = fma(_1196, _1172, _1226);
    float _1230 = fma(_1228, 0.5, 0.5);
    float _1232 = _1212 * 0.636619746685028076171875;
    float _1234 = -_1216;
    float _1236 = fma(_1232, _1234, 1.0);
    float3 _4127 = float3(_1222, _1224, _1220);
    float _1238 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4127, float3(0.0), isnan(_4127)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4127, float3(0.0), isnan(_4127)), level(0.0)).x;
    float3 _4138 = float3(_1222, _1224, _1220);
    float4 _1241 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4138, float3(0.0), isnan(_4138)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4138, float3(0.0), isnan(_4138)), level(0.0)).xyzw;
    float _1243 = _1241.x;
    float _1245 = _1241.y;
    float _1247 = _1241.z;
    float _1249 = _1241.w;
    float2 _4155 = float2(_1236, _1230);
    float3 _1253 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4155, float2(0.0), isnan(_4155)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4155, float2(0.0), isnan(_4155)), level(0.0)).xyz;
    float _1255 = _1253.x;
    float _1257 = _1253.y;
    float _1259 = _1253.z;
    float _1261 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1263 = int(_1261);
    int _1265 = abs(_756);
    out.m_56.x = _500;
    out.m_56.y = _502;
    out.m_56.z = _508;
    out.m_56.w = _504;
    bool _1267 = _141 > 0.5;
    float _1269 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_58.y = _916;
    float _1271 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1273 = int(_1271);
    float _1275 = in.m_49.y;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1281 = float(_1263);
    float _1283 = 1.0 / _540;
    float _1285 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1289 = _1287 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1291 = float(uint(_1273));
    float _1293 = 1.0 / _1281;
    int _1295 = ~_1273;
    int _1297 = _1295 + 1;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1301 = ~_1273;
    int _1303 = _1301 + 1;
    bool _1305 = _1273 == 0;
    float _1307 = 1.0 / _1291;
    bool _1309 = _1275 > 0.5;
    float _1311 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1299);
    float _1313 = _121 * _1293;
    float _1315 = 1.0 / _1289;
    int _1317 = as_type<int>(_1307) + (-2);
    float _1319 = trunc(_1313);
    int _1321 = int(_1319);
    float _1323 = exp2(_1269);
    float _1325 = float(uint(_1321));
    float _1327 = as_type<float>(_1317) * _1325;
    float _1329 = trunc(_1327);
    float _1331 = precise::max(_1329, 0.0);
    uint _1333 = uint(_1331);
    int _1335 = _1297 * int(_1333);
    int _1337 = _1335 + _1321;
    float _1339 = float(uint(_1337));
    float _1341 = as_type<float>(_1317) * _1339;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1345 = _1343 != 0;
    float _1347 = float(_1273);
    float _1349 = trunc(_1341);
    float _1351 = precise::max(_1349, 0.0);
    uint _1353 = uint(_1351);
    bool _1355 = !_1345;
    float _1357 = _1355 ? 1.2345600128173828125 : 1.0;
    bool _1359 = !_1345;
    float _1361 = _1359 ? _1275 : _141;
    float _1363 = _1357 * _1361;
    float _1365 = float(_1321);
    float _1367 = floor(_1363);
    bool _1369 = _1365 >= _1347;
    bool _1371 = isnan(_1365);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan(_1347);
    bool _1377 = _1373 || _1375;
    float _1379 = float(_1377);
    int _1381 = int(_1333) + int(_1353);
    float _1383 = trunc(_1379);
    int _1385 = int(_1383);
    int _1387 = _1303 * _1381;
    int _1389 = _1387 + _1321;
    float _1391 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1393 = uint(_1389) >= uint(_1273);
    float _1395 = -_1367;
    float _1397 = _1363 + _1395;
    bool _1399 = !_1393;
    int _1401 = _1399 ? 0 : (-1);
    float _1403 = _1397 * _1347;
    float _1405 = _121 * _1347;
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1409 = _1407 != 0;
    int _1411 = ~_1381;
    int _1413 = _1411 + _1401;
    int _1415 = _1413 + 1;
    float _1417 = _1405 * _1283;
    float _1419 = trunc(_1403);
    int _1421 = int(_1419);
    int _1423 = ~_1385;
    int _1425 = _1423 + 1;
    int _1427 = _1425 + 1;
    int _1429 = _1273 * _1415;
    int _1431 = _1429 + _1321;
    int _1433 = _1273 + (-1);
    int _1435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1437 = _1435 != 0;
    bool _1439 = !_1305;
    int _1441 = _1439 ? _1431 : (-1);
    float _1443 = trunc(_1417);
    int _1445 = int(_1443);
    bool _1447 = !_1409;
    int _1449 = _1447 ? 0 : 1;
    bool _1451 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1453 = isnan(0.5);
    bool _1455 = _1451 || _1453;
    bool _1457 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1459 = _1455 || _1457;
    int _1461 = _1441 * _1427;
    int _1463 = abs(_1449);
    float _1465 = -_191;
    int _1467 = _1267 ? as_type<int>(_1465) : as_type<int>(_191);
    int _1469 = _1385 * _1433;
    int _1471 = _1469 + _1461;
    int _1473 = abs(_760);
    int _1475 = _1471 * _1265;
    int _1477 = abs(_764);
    int _1479 = _1421 * _1463;
    int _1481 = _1479 + _1321;
    int _1483 = abs(_768);
    int _1485 = _1445 * _1473;
    int _1487 = _1485 + _1475;
    float _1489 = in.m_49.w;
    int _1491 = ~_1273;
    int _1493 = _1491 + 1;
    float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1497 = _1495 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1501 = _1499 != 0;
    int _1503 = _1481 * _1477;
    int _1505 = _1503 + _1487;
    float _1507 = in.m_49.z;
    int _1509 = _1421 * _1483;
    int _1511 = _1509 + _1505;
    int _1513 = ~_1273;
    int _1515 = _1513 + 1;
    float _1517 = 1.0 / _1497;
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1521 = _1519 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1523 = float(uint(_1481));
    float _1525 = float(uint(_1511));
    float _1527 = as_type<float>(_1317) * _1523;
    float _1529 = 1.0 / _1521;
    float _1531 = as_type<float>(_1317) * _1525;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1535 = trunc(_1531);
    float _1537 = precise::max(_1535, 0.0);
    uint _1539 = uint(_1537);
    int _1541 = _1515 * int(_1539);
    int _1543 = _1541 + _1511;
    float _1545 = float(uint(_1543));
    float _1547 = as_type<float>(_1317) * _1545;
    float _1549 = trunc(_1547);
    float _1551 = precise::max(_1549, 0.0);
    uint _1553 = uint(_1551);
    float _1555 = _1547;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_1345)
    {
        _1555 = _1275;
    }
    float _1559 = _1555;
    float _1561 = _1559;
    if (_1345)
    {
        _1561 = _141;
    }
    float _1563 = _1561;
    float _1565 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1277);
    bool _1567 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1569 = isnan(_542);
    bool _1571 = _1567 || _1569;
    bool _1573 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1575 = _1571 || _1573;
    float _1577 = float(_1575);
    int _1579 = int(_1539) + int(_1553);
    float _1581 = -_209;
    int _1583 = _1309 ? as_type<int>(_1581) : as_type<int>(_209);
    int _1585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1587 = _1585 != 0;
    int _1589 = _1493 * _1579;
    int _1591 = _1589 + _1511;
    bool _1593 = uint(_1591) >= uint(_1273);
    bool _1595 = !_1437;
    float _1597 = _1595 ? _191 : as_type<float>(_1467);
    int _1599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1601 = _1599 != 0;
    bool _1603 = !_1601;
    float _1605 = _1603 ? _209 : as_type<float>(_1583);
    float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1607;
    bool _1611 = !_1593;
    int _1613 = _1611 ? 0 : (-1);
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1617 = _1615 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1621 = _1619 != 0;
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1625 = _1507 > 0.5;
    float _1627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1629 = _1507;
    if (!_1345)
    {
        _1557 = _1507;
    }
    float _1631 = _1557;
    float _1633 = -_1623;
    float _1635 = fma(_1285, 2.0, _1633);
    float _1637 = _1631;
    if (_1345)
    {
        _1637 = _1275;
    }
    float _1639 = _1637;
    float _1641 = _1609 * _1315;
    if (_1345)
    {
        _1629 = _1275;
    }
    float _1643 = _1629;
    float _1645 = _1617 * _1529;
    bool _1647 = _1489 > 0.5;
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1651 = _542 + _1649;
    float _1653 = -_121;
    float _1655 = fma(_1653, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1635);
    bool _1657 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1659 = isnan(_542);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1665 = _1661 || _1663;
    float _1667 = float(_1665);
    float _1669 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1533);
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1673 = ~_1273;
    int _1675 = _1673 + 1;
    float _1677 = -_1667;
    float _1679 = _1677 + 1.0;
    float _1681 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1683 = fma(_1391, -2.0, _1671);
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1685;
    bool _1689 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1691 = isnan(_542);
    bool _1693 = _1689 || _1691;
    bool _1695 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1697 = _1693 || _1695;
    float _1699 = float(_1697);
    float _1701 = _1577 * _1679;
    float _1703 = -_1577;
    float _1705 = _1703 + 1.0;
    float _1707 = _1687 * _1517;
    float _1709 = fma(_1641, _1651, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1711 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1713 = isnan(_542);
    bool _1715 = _1711 || _1713;
    bool _1717 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1719 = _1715 || _1717;
    float _1721 = float(_1719);
    float _1723 = _1699 * _1705;
    float _1725 = -_1699;
    float _1727 = _1725 + 1.0;
    float _1729 = _1597 + 0.5;
    float _1731 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1733 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1669);
    float _1735 = _1721 * _1727;
    float _1737 = fma(_1681, _1729, _1655);
    float _1739 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1741 = _542 + _1739;
    float _1743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1745 = _1709 * _1735;
    float _1747 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1749 = _542 + _1747;
    float _1751 = -_1721;
    float _1753 = _1751 + 1.0;
    float _1755 = fma(_1645, _1741, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1757 = -_1733;
    float _1759 = _1757 + 1.0;
    float _1761 = fma(_1707, _1749, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1763 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1745);
    float _1765 = trunc(_1527);
    float _1767 = precise::max(_1765, 0.0);
    uint _1769 = uint(_1767);
    float _1771 = _1563 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1773 = fma(_1755, _1723, _1763);
    int _1775 = ~_1579;
    int _1777 = _1775 + _1613;
    int _1779 = _1777 + 1;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1783 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1565);
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1787 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1683);
    float _1789 = fma(_1731, -2.0, _1781);
    float _1791 = -_191;
    int _1793 = _1625 ? as_type<int>(_1791) : as_type<int>(_191);
    float _1795 = fma(_1563, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1279);
    float _1797 = -_1785;
    float _1799 = fma(_1771, 2.0, _1797);
    float _1801 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1311);
    float _1803 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1789);
    int _1805 = _1675 * int(_1769);
    int _1807 = _1805 + _1481;
    float _1809 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1795);
    float _1811 = -_121;
    float _1813 = fma(_1811, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1799);
    int _1815 = _1273 * _1779;
    int _1817 = _1815 + _1511;
    float _1819 = fma(_1761, _1701, _1773);
    float _1821 = float(uint(_1807));
    float _1823 = -_1783;
    float _1825 = _1823 + 1.0;
    float _1827 = -_1809;
    float _1829 = _1827 + 1.0;
    float _1831 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1819);
    float _1833 = -_209;
    int _1835 = _1647 ? as_type<int>(_1833) : as_type<int>(_209);
    float _1837 = as_type<float>(_1317) * _1821;
    bool _1839 = !_1587;
    float _1841 = _1839 ? _191 : as_type<float>(_1793);
    float _1843 = -_1825;
    float _1845 = fma(_1597, _1843, _1737);
    float _1847 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1849 = trunc(_1837);
    float _1851 = precise::max(_1849, 0.0);
    uint _1853 = uint(_1851);
    float _1855 = _1605 + (-0.5);
    float _1857 = _1841 + 0.5;
    bool _1859 = !_1621;
    float _1861 = _1859 ? _209 : as_type<float>(_1835);
    float _1863 = -_1801;
    float _1865 = _1863 + 1.0;
    float _1867 = -_1847;
    float _1869 = -_1787;
    float _1871 = fma(_1867, _1855, _1869);
    float _1873 = fma(_1857, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1813);
    bool _1875 = !_1305;
    int _1877 = _1875 ? _1817 : (-1);
    float _1879 = _1861 + (-0.5);
    float _1881 = fma(_1605, _1865, _1871);
    float _1883 = -_1829;
    float _1885 = fma(_1841, _1883, _1873);
    int _1887 = _1877 >> 31;
    float _1889 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1891 = ~_1273;
    int _1893 = _1891 + 1;
    float _1895 = -_1879;
    float _1897 = -_1803;
    float _1899 = fma(_1895, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1897);
    int _1901 = _1887 & 3;
    float _1903 = _1889 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _1905 = int(_1769) + int(_1853);
    float _1907 = fma(_1861, _1759, _1899);
    int _1909 = _1877 + _1901;
    float _1911 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1913 = _1889 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1915 = _1893 * _1905;
    int _1917 = _1915 + _1481;
    int _1919 = _1909 >> 2;
    float _1921 = _1889 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1923 = fma(_1911, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1903);
    float _1925 = _1831 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1927 = _1919 << 4;
    int _1929 = _1927 + 512;
    float _1931 = fma(_1911, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1913);
    bool _1933 = uint(_1917) >= uint(_1273);
    float _1935 = fma(_1911, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1921);
    uint _1937 = uint(int(uint(_1929) >> uint(2)));
    uint _1939 = uint(int(uint(int(_1937)) >> uint(2)));
    int _1941 = int(_1937) & 3;
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[int(_1939)][_1941];
    int _1945 = int(_1937) + 1;
    uint _1947 = uint(int(uint(_1945) >> uint(2)));
    int _1949 = _1945 & 3;
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[int(_1947)][_1949];
    float _1953 = _852 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1955 = _852 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1957 = _1877 & 3;
    bool _1959 = _1957 != 0;
    out.m_60.x = _1845;
    out.m_60.y = _1881;
    out.m_60.z = _1885;
    out.m_60.w = _1907;
    bool _1961 = !_1933;
    int _1963 = _1961 ? 0 : (-1);
    float _1965 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1953);
    bool _1967 = uint(_1957) > 1u;
    float _1969 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1955);
    int _1971 = ~_1905;
    int _1973 = _1971 + _1963;
    int _1975 = _1973 + 1;
    float _1977 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1965);
    float _1979 = _1931 + (*spvDescriptorSet0.vp_c10)._m0[9].z;
    int _1981 = _1877 & 3;
    bool _1983 = _1981 != 0;
    int _1985 = _1273 * _1975;
    int _1987 = _1985 + _1481;
    float _1989 = _1923 + (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _1991;
    float _1995 = _1979 * _952;
    int _1997 = _1929 + 8;
    uint _1999 = uint(int(uint(_1997) >> uint(2)));
    uint _2001 = uint(int(uint(int(_1999)) >> uint(2)));
    int _2003 = int(_1999) & 3;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[int(_2001)][_2003];
    int _2007 = int(_1999) + 1;
    uint _2009 = uint(int(uint(_2007) >> uint(2)));
    int _2011 = _2007 & 3;
    float _2013 = (*spvDescriptorSet0.vp_c9)._m0[int(_2009)][_2011];
    int _2015 = _1983 ? 0 : 1;
    float _2017 = 1.0 / _1993;
    bool _2019 = _1957 != 3;
    float _2021 = fma(_1989, _948, _1995);
    int _2023 = ~_2015;
    int _2025 = _2023 + 1;
    int _2027 = _2025 + 1;
    float _2029 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1969);
    int _2031 = _2027;
    if (!_1967)
    {
        int _2033 = ~_2015;
        int _2035 = _2033 + 1;
        _2031 = _2035;
    }
    int _2037 = _2031;
    float _2039 = _1935 + (*spvDescriptorSet0.vp_c10)._m0[10].z;
    bool _2041 = uint(_1957) >= 2u;
    float _2043 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2045 = abs(_2037);
    float _2047 = fma(_2039, _950, _2021);
    bool _2049 = !_1959;
    int _2051 = _2049 ? 0 : 1;
    float _2053 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2043);
    int _2055 = _2041 ? 0 : 1;
    float _2057 = abs(_2047);
    float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2061 = _2057 + _2059;
    int _2063 = abs(_2051);
    out.m_62.w = _1925;
    bool _2065 = _1957 != 3;
    float _2067 = _2061 * _2017;
    float _2069 = precise::clamp(_2067, 0.0, 1.0);
    int _2071 = ~_2055;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    float _2077 = _2029 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _2079 = _2075;
    if (_2019)
    {
        int _2081 = ~_2055;
        int _2083 = _2081 + 1;
        _2079 = _2083;
    }
    int _2085 = _2079;
    float _2087 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2053);
    float _2089 = _1977 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2091 = ~_2045;
    int _2093 = _2091 + 1;
    int _2095 = _2093 + 1;
    float _2097 = 1.0 / _2077;
    int _2099 = abs(_2085);
    float _2101 = _2089 + _2077;
    bool _2103 = !_2065;
    int _2105 = _2103 ? 0 : (-1);
    int _2107 = _2095 * as_type<int>(_1951);
    int _2109 = ~_2063;
    int _2111 = _2109 + 1;
    int _2113 = _2111 + 1;
    float _2115 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2087);
    bool _2117 = !_1501;
    int _2119 = _2117 ? 0 : 1;
    int _2121 = abs(_2105);
    int _2123 = _2113 * as_type<int>(_1943);
    int _2125 = _2123 + _2107;
    int _2127 = abs(_2119);
    int _2129 = ~_2099;
    int _2131 = _2129 + 1;
    int _2133 = _2131 + 1;
    int _2135 = _2133 * as_type<int>(_2005);
    int _2137 = _2135 + _2125;
    int _2139 = ~_2121;
    int _2141 = _2139 + 1;
    int _2143 = _2141 + 1;
    float _2145 = fma(_2069, -2.0, 3.0);
    int _2147 = ~_2127;
    int _2149 = _2147 + 1;
    int _2151 = _2149 + 1;
    float _2153 = _2069 * _2069;
    bool _2155 = !_1305;
    int _2157 = _2155 ? _1987 : (-1);
    int _2159 = _2143 * as_type<int>(_2013);
    int _2161 = _2159 + _2137;
    float _2163 = _2101 * _2097;
    float _2165 = _2163 * 0.5;
    float _2167 = _2153 * _2145;
    float _2169 = as_type<float>(_2137);
    if (_1459)
    {
        _2169 = 1.0;
    }
    float _2171 = _2169;
    int _2173 = _2161 * _2151;
    float _2175 = _2171;
    if (!_1459)
    {
        float _2177 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2179 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2177);
        float _2181 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2183 = _2181 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        float _2185 = 1.0 / _2179;
        float _2187 = 1.0 / _2183;
        float _2189 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2191 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2193 = fma(_2185, _2189, _2191);
        float _2195 = _2193 * _2187;
        float _2197 = precise::clamp(_2195, 0.0, 1.0);
        float _2199 = -_2197;
        float _2201 = _2199 + 1.0;
        _2175 = _2201;
    }
    float _2203 = _2175;
    float _2205 = _2167 * _2203;
    float _2207 = -_1323;
    float _2209 = _2207 + 1.0;
    float _2211 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2213 = _2115 + _2211;
    bool _2215 = _2203 > 0.0;
    bool _2217 = isnan(_2203);
    bool _2219 = _2215 || _2217;
    bool _2221 = isnan(0.0);
    bool _2223 = _2219 || _2221;
    float _2225 = _2205 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2227 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2229 = _2157 * _2127;
    int _2231 = _2229 + _2173;
    float _2233 = _1164 + _2213;
    float _2235 = _379 * _2225;
    float _2237 = _2227 * _1238;
    float _2239 = -_2227;
    float _2241 = _2239 + 1.0;
    float _2243 = _2233 * 0.5;
    float _2245 = _2235 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2247 = _1249 * _2237;
    float _2249 = _1259 * _2237;
    out.gl_Position.x = _1206;
    out.gl_Position.y = _1210;
    out.gl_Position.z = _2213;
    out.gl_Position.w = _1164;
    float _2251 = fma(_1255, _2247, _1243);
    float _2253 = fma(_1257, _2247, _1245);
    float _2255 = float(_2231);
    float _2257 = _1249 * _2241;
    float _2259 = fma(_1249, _2249, _1247);
    out.m_64.z = _2243;
    out.m_64.w = _1164;
    out.m_66.y = _2255;
    out.m_45.x = _2245;
    out.m_68.x = _2251;
    out.m_68.y = _2253;
    out.m_68.z = _2259;
    out.m_68.w = _2257;
    if (_2223)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2261 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2261;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _532 = false;
    bool _399 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2318 = as_type<float>(_103);
        out.gl_Position.z = _2318;
    }
    if (!_91)
    {
        return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    if (_117)
    {
        float _125 = float(_87);
        _123 = _125;
    }
    float _127 = _123;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    if (_133)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _97;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2386 = as_type<float>(_139);
        out.gl_Position.z = _2386;
    }
    if (_133)
    {
        return out;
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _145 * _143;
    float _161 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _163 = in.m_47.x;
    float _165 = in.m_47.y;
    float _167 = in.m_47.z;
    float _169 = _161 * 6.283185482025146484375;
    float _171 = floor(_161);
    int _173 = as_type<int>(_147) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_147) & 2;
    bool _179 = _177 != 0;
    float _181 = _169 * 0.15915493667125701904296875;
    float _183 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    bool _189 = !_175;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = _147;
    float _195 = _183;
    if (!_157)
    {
        float _197 = _183 * _183;
        float _199 = _197 * 0.5;
        _193 = _199;
    }
    float _201 = _193;
    float _203 = _181 * 6.283185482025146484375;
    float _205 = cos(_203);
    bool _207 = !_179;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = _201;
    if (!_157)
    {
        float _213 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _213;
    }
    float _215 = _211;
    float _217 = -_171;
    float _219 = _161 + _217;
    bool _221 = _219 < 0.5;
    float _223 = float(_221);
    bool _225 = !_157;
    float _227 = _215;
    if (!_225)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _183 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _183);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _257;
    }
    float _259 = _227;
    bool _261 = !_157;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _183 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _195 = _281;
    }
    float _283 = _195;
    float _285 = -_219;
    float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _289 = fma(_205, 0.5, 0.5);
    float _291 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _293 = -_223;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _299 = _297 != 0;
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _303 = _301 != 0;
    float _305 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _307 = -_289;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = in.m_54.w;
    float _313 = _291 * _141;
    bool _315 = !_299;
    int _317 = _315 ? 0 : 1;
    float _319 = fma(_283, _163, _305);
    float _321 = in.m_42.x;
    float _323 = in.m_42.y;
    float _325 = in.m_42.z;
    bool _327 = !_187;
    int _329 = _327 ? 0 : 1;
    int _331 = abs(_317);
    int _333 = abs(_329);
    float _335 = trunc(_313);
    int _337 = int(_335);
    float _339 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _341 = !_303;
    int _343 = _341 ? 0 : 1;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _347 = float(_331);
    int _349 = abs(_343);
    float _351 = fma(_283, _165, _339);
    float _353 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _355 = float(_333);
    float _357 = abs(_287);
    float _359 = _347 * _357;
    float _361 = float(_349);
    float _363 = fma(_283, _167, _353);
    int _365 = _337 << 4;
    int _367 = _365 + 1712;
    float _369 = fma(_355, _309, _359);
    float _371 = fma(_319, _311, _321);
    float _373 = fma(_351, _311, _323);
    float _375 = fma(_363, _311, _325);
    float _377 = abs(_295);
    float _379 = fma(_361, _377, _369);
    bool _381 = !_345;
    float _397;
    if (!_381)
    {
        float _383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _385 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _387 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _389 = _387 * _383;
        float _391 = floor(_389);
        float _393 = -_391;
        float _395 = _389 + _393;
        _397 = _395;
        _399 = true;
    }
    else
    {
        float _401 = float(_87);
        float _403 = 1.0 / _401;
        float _405 = _121 * _403;
        _397 = _405;
    }
    _399 = false;
    float _407 = _397;
    uint _410 = uint(int(uint(_367) >> uint(2)));
    uint _412 = uint(int(uint(int(_410)) >> uint(2)));
    int _414 = int(_410) & 3;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[int(_412)][_414];
    int _418 = int(_410) + 1;
    uint _420 = uint(int(uint(_418) >> uint(2)));
    int _422 = _418 & 3;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[int(_420)][_422];
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _428 = _407 + _426;
    bool _430 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _432 = isnan(_407);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _446 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _448 = isnan(_407);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    int _458 = _367 + 8;
    uint _460 = uint(int(uint(_458) >> uint(2)));
    uint _462 = uint(int(uint(int(_460)) >> uint(2)));
    int _464 = int(_460) & 3;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[int(_462)][_464];
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _468;
    float _472 = -_440;
    float _474 = _472 + 1.0;
    bool _476 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _478 = 1.0 / _444;
    float _480 = _470 * _478;
    float _482 = fma(_480, _428, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _484 = _456 * _474;
    float _486 = -_456;
    float _488 = _486 + 1.0;
    float _490 = _482 * _484;
    float _492 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[115].x, _490);
    float _494 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[116].x, _492);
    float _496 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _498 = _424 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _502 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _494 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _506 = _466 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _508 = _506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _510 = !_476;
    float _528;
    float _530;
    if (!_510)
    {
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _514 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _516 = float(_87);
        float _518 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _520 = _518 * _512;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _516;
        _530 = _526;
        _532 = true;
    }
    else
    {
        float _534 = float(_87);
        float _536 = 1.0 / _534;
        float _538 = _121 * _536;
        _528 = _534;
        _530 = _538;
    }
    _532 = false;
    float _540 = _528;
    float _542 = _530;
    float _544 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _546 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _548 = in.m_54.x;
    float _550 = in.m_54.y;
    float _552 = fma(_121, 0.02500000037252902984619140625, _141);
    float _554 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _544);
    float _556 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _558 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _546);
    float _560 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _562 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].z, _554);
    float _564 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].x, _556);
    float _566 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].z, _558);
    float _568 = floor(_552);
    float _570 = _562 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _572 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].z, _564);
    float _574 = _566 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _576 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _578 = _570 + _576;
    float _580 = _572 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _582 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _584 = _574 + _582;
    float _586 = _578 * _578;
    float _588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _590 = _580 + _588;
    float _592 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _594 = fma(_584, _584, _586);
    float _596 = fma(_590, _590, _594);
    float _598 = rsqrt(_596);
    float _600 = _578 * _598;
    float _602 = _584 * _598;
    float _604 = _590 * _598;
    float _606 = -_600;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _578);
    float _610 = -_602;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _584);
    float _614 = -_604;
    float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[18].w, _590);
    float _618 = _608 * _608;
    float _620 = fma(_612, _612, _618);
    float _622 = fma(_616, _616, _620);
    float _624 = _548 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _626 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _628 = _570 + _626;
    float _630 = sqrt(_622);
    float _632 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _634 = _628 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _636 = fma(_568, -0.1500000059604644775390625, 1.0);
    float _638 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _640 = _574 + _638;
    float _642 = _598 * _630;
    float _644 = _550 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[191].x * 0.100000001490116119384765625;
    float _648 = fma(_640, (*spvDescriptorSet0.vp_c10)._m0[8].x, _634);
    float _650 = _632 * _642;
    float _652 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _654 = _568 * _646;
    float _656 = precise::max(_636, 0.20000000298023223876953125);
    float _658 = _650 * _592;
    float _660 = _652 * _642;
    float _662 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _664 = _580 + _662;
    float _666 = _642 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _668 = _666 * 0.5;
    float _670 = _660 * _560;
    float _672 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[10].x, _648);
    float _674 = _670 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _676 = _670 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _678 = _672 * _654;
    float _680 = fma(_658, (*spvDescriptorSet0.vp_c10)._m0[10].x, _674);
    float _682 = precise::min(_656, 1.0);
    float _684 = fma(_658, (*spvDescriptorSet0.vp_c10)._m0[8].x, _676);
    float _686 = _670 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _688 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[10].z, _680);
    float _690 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[8].z, _684);
    float _692 = fma(_658, (*spvDescriptorSet0.vp_c10)._m0[9].x, _686);
    float _694 = fma(_688, _682, _580);
    float _696 = fma(_690, _682, _574);
    float _698 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[9].z, _692);
    float _700 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[10].x, _694);
    float _702 = -_602;
    float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _574);
    float _706 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[8].x, _696);
    float _708 = fma(_698, _682, _570);
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _712 = _700 + _710;
    float _714 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _716 = _706 + _714;
    float _718 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[9].x, _708);
    float _720 = _712 * _712;
    float _722 = fma(_716, _716, _720);
    float _724 = sqrt(_722);
    bool _726 = _724 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _734 = _732 != 0;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _738 = _736 != 0;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _742 = _740 != 0;
    bool _744 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _746 = isnan(0.5);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _752 = _748 || _750;
    bool _754 = !_734;
    int _756 = _754 ? 0 : 1;
    bool _758 = !_730;
    int _760 = _758 ? 0 : 1;
    bool _762 = !_738;
    int _764 = _762 ? 0 : 1;
    bool _766 = !_742;
    int _768 = _766 ? 0 : 1;
    float _770 = _686;
    float _772 = _708;
    float _774 = _720;
    float _776 = _580;
    float _778 = _642;
    float _780 = _712;
    if (!_726)
    {
        _770 = _706;
    }
    float _782 = _770;
    float _784 = _782;
    if (!_726)
    {
        _772 = _700;
    }
    float _786 = _772;
    float _788 = _786;
    if (!_726)
    {
        _774 = _718;
    }
    float _790 = _774;
    bool _792 = !_726;
    float _794 = _790;
    if (!_792)
    {
        float _796 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _798 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _800 = _724 + _798;
        float _802 = _718 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _804 = rsqrt(_722);
        float _806 = _800 * _796;
        float _808 = _806 * 0.15915493667125701904296875;
        float _810 = _808 * 6.283185482025146484375;
        float _812 = cos(_810);
        float _814 = _808 * 6.283185482025146484375;
        float _816 = sin(_814);
        float _818 = _812 + (-1.0);
        float _820 = _818 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _822 = fma(_816, _802, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _824 = fma(_718, _812, _820);
        float _826 = _804 * _822;
        float _828 = fma(_716, _826, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _830 = fma(_712, _826, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _784 = _828;
        _794 = _824;
        _788 = _830;
    }
    float _832 = _784;
    float _834 = _794;
    float _836 = _788;
    float _838 = -_602;
    float _840 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[18].w, _832);
    float _842 = -_600;
    float _844 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _834);
    float _846 = -_604;
    float _848 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[18].w, _836);
    float _850 = -_600;
    float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[18].w, _570);
    float _854 = -_604;
    float _856 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[18].w, _580);
    float _858 = _844;
    float _860 = _840;
    float _862 = _848;
    float _864 = _832;
    float _866 = _834;
    if (!_752)
    {
        float _868 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _870 = _852 + _868;
        float _872 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _874 = _704 + _872;
        float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
        float _878 = -_574;
        float _880 = _878 + _832;
        float _882 = _870 * _870;
        float _884 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _886 = _856 + _884;
        float _888 = -_570;
        float _890 = _888 + _834;
        float _892 = -_580;
        float _894 = _892 + _836;
        float _896 = fma(_874, _874, _882);
        float _898 = 1.0 / _642;
        float _900 = fma(_886, _886, _896);
        float _902 = sqrt(_900);
        float _904 = precise::max(_902, (*spvDescriptorSet0.vp_c9)._m0[199].y);
        float _906 = _904 * _876;
        float _908 = _906 * _898;
        float _910 = fma(_880, _908, _704);
        float _912 = fma(_890, _908, _852);
        float _914 = fma(_894, _908, _856);
        _858 = _912;
        _860 = _910;
        _862 = _914;
        _776 = _894;
        _778 = _898;
    }
    float _916 = _858;
    float _918 = _860;
    float _920 = _862;
    float _922 = _776;
    float _924 = _778;
    float _926 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _928 = _916 + _926;
    float _930 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _932 = _918 + _930;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _936 = _920 + _934;
    float _938 = _928 * _928;
    float _940 = fma(_932, _932, _938);
    float _942 = fma(_936, _936, _940);
    float _944 = rsqrt(_942);
    float _946 = sqrt(_942);
    float _948 = _932 * _944;
    float _950 = _936 * _944;
    float _952 = _928 * _944;
    float _954 = _948 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _956 = _950 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _958 = _954 * _954;
    float _960 = _956 * _956;
    float _962 = _958 + _960;
    float _964 = sqrt(_962);
    bool _966 = _964 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _968 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _970 = _964 + _968;
    float _972 = _922;
    float _974 = _962;
    float _976 = _970;
    if (_966)
    {
        float _978 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _972 = _978;
    }
    float _980 = _972;
    if (_966)
    {
        float _982 = rsqrt(_962);
        _974 = _982;
    }
    float _984 = _974;
    if (_966)
    {
        float _986 = _970 * _980;
        _976 = _986;
    }
    float _988 = _976;
    if (_966)
    {
        float _990 = _988 * 0.15915493667125701904296875;
        _864 = _990;
    }
    float _992 = _864;
    float _994 = _980;
    if (_966)
    {
        float _996 = _992 * 6.283185482025146484375;
        float _998 = sin(_996);
        _994 = _998;
    }
    float _1000 = _994;
    float _1002 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1004 = precise::max(0.0, _1002);
    float _1006 = _924;
    float _1008 = _1002;
    if (_966)
    {
        float _1010 = _992 * 6.283185482025146484375;
        float _1012 = cos(_1010);
        _1006 = _1012;
    }
    float _1014 = _1006;
    float _1016 = -_952;
    float _1018 = -_1004;
    float _1020 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1018);
    float _1022 = _1020;
    if (_966)
    {
        float _1024 = _1020 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1008 = _1024;
    }
    float _1026 = _1008;
    float _1028 = _916 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1030 = _1000;
    float _1032 = _1026;
    if (_966)
    {
        float _1034 = fma(_1000, _1026, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _866 = _1034;
    }
    float _1036 = _866;
    float _1038 = _1036;
    if (!_966)
    {
        _1030 = _954;
    }
    float _1040 = _1030;
    float _1042 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1028);
    float _1044 = _1040;
    float _1046 = _1014;
    if (_966)
    {
        float _1048 = _1014 + (-1.0);
        _1032 = _1048;
    }
    float _1050 = _1032;
    float _1052 = _1050;
    if (_966)
    {
        float _1054 = _984 * _1036;
        _780 = _1054;
    }
    float _1056 = _780;
    float _1058 = _916 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1060 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1042);
    if (_966)
    {
        float _1062 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1038 = _1062;
    }
    float _1064 = _1038;
    float _1066 = _1064;
    if (_966)
    {
        float _1068 = _954 * _1056;
        _1044 = _1068;
    }
    float _1070 = _1044;
    if (!_966)
    {
        _1052 = _956;
    }
    float _1072 = _1052;
    float _1074 = _1072;
    if (_966)
    {
        float _1076 = _956 * _1056;
        _1074 = _1076;
    }
    float _1078 = _1074;
    if (_966)
    {
        float _1080 = fma(_1020, _1014, _1064);
        _1022 = _1080;
    }
    float _1082 = _1022;
    if (!_966)
    {
        _1066 = _958;
    }
    float _1084 = _1066;
    float _1086 = _1084;
    if (_966)
    {
        float _1088 = _1070 * _1070;
        _1086 = _1088;
    }
    float _1090 = _1086;
    float _1092 = _916 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1094 = _916 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (!_966)
    {
        _1046 = _960;
    }
    float _1096 = _1046;
    float _1098 = _1096;
    if (_966)
    {
        float _1100 = _1078 * _1078;
        _1098 = _1100;
    }
    float _1102 = _1098;
    float _1104 = fma(_1082, _1082, _1090);
    float _1106 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1058);
    float _1108 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1092);
    float _1110 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1094);
    float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1114 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1112);
    float _1116 = precise::clamp(_1114, 0.0, 1.0);
    float _1118 = _1104 + _1102;
    float _1120 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1106);
    float _1122 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1124 = -_1116;
    float _1126 = _1124 + 1.0;
    float _1128 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1108);
    float _1130 = rsqrt(_1118);
    float _1132 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1134 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1136 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1138 = _1128 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1140 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1110);
    float _1142 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1134);
    float _1144 = abs(_1126);
    float _1146 = log2(_1144);
    float _1148 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1150 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1142);
    float _1152 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1154 = -_1148;
    float _1156 = fma(_1154, _1136, 1.0);
    float _1158 = _1130 * _1070;
    float _1160 = _1130 * _1082;
    float _1162 = _1130 * _1078;
    float _1164 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1150);
    float _1166 = _1158 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1168 = log2(_1156);
    float _1170 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1172 = _1160 + 1.0;
    float _1174 = -_1166;
    float _1176 = fma(_1160, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1174);
    float _1178 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1180 = -_1162;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1176);
    float _1184 = 1.0 / _1164;
    float _1186 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1188 = fma(_1182, -0.5, 0.5);
    float _1190 = fma(_1182, 0.5, 0.5);
    float _1192 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1186);
    float _1194 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1170);
    float _1196 = exp2(_1178);
    float _1198 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1192);
    float _1200 = fma(_1190, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1202 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1194);
    float _1204 = _1168 * 0.693147182464599609375;
    float _1206 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1198);
    float _1208 = fma(_1190, _1200, -0.212114393711090087890625);
    float _1210 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1202);
    float _1212 = sqrt(_1188);
    float _1214 = _1206 * _1184;
    float _1216 = fma(_1190, _1208, 1.570728778839111328125);
    float _1218 = _1210 * _1184;
    float _1220 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1222 = fma(_1214, 0.5, 0.5);
    float _1224 = fma(_1218, -0.5, 0.5);
    float _1226 = -_1160;
    float _1228 = fma(_1196, _1172, _1226);
    float _1230 = fma(_1228, 0.5, 0.5);
    float _1232 = _1212 * 0.636619746685028076171875;
    float _1234 = -_1216;
    float _1236 = fma(_1232, _1234, 1.0);
    float3 _4127 = float3(_1222, _1224, _1220);
    float _1238 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4127, float3(0.0), isnan(_4127)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4127, float3(0.0), isnan(_4127)), level(0.0)).x;
    float3 _4138 = float3(_1222, _1224, _1220);
    float4 _1241 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4138, float3(0.0), isnan(_4138)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4138, float3(0.0), isnan(_4138)), level(0.0)).xyzw;
    float _1243 = _1241.x;
    float _1245 = _1241.y;
    float _1247 = _1241.z;
    float _1249 = _1241.w;
    float2 _4155 = float2(_1236, _1230);
    float3 _1253 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4155, float2(0.0), isnan(_4155)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4155, float2(0.0), isnan(_4155)), level(0.0)).xyz;
    float _1255 = _1253.x;
    float _1257 = _1253.y;
    float _1259 = _1253.z;
    float _1261 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1263 = int(_1261);
    int _1265 = abs(_756);
    out.m_56.x = _500;
    out.m_56.y = _502;
    out.m_56.z = _508;
    out.m_56.w = _504;
    bool _1267 = _141 > 0.5;
    float _1269 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_58.y = _916;
    float _1271 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1273 = int(_1271);
    float _1275 = in.m_49.y;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1281 = float(_1263);
    float _1283 = 1.0 / _540;
    float _1285 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1289 = _1287 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1291 = float(uint(_1273));
    float _1293 = 1.0 / _1281;
    int _1295 = ~_1273;
    int _1297 = _1295 + 1;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1301 = ~_1273;
    int _1303 = _1301 + 1;
    bool _1305 = _1273 == 0;
    float _1307 = 1.0 / _1291;
    bool _1309 = _1275 > 0.5;
    float _1311 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1299);
    float _1313 = _121 * _1293;
    float _1315 = 1.0 / _1289;
    int _1317 = as_type<int>(_1307) + (-2);
    float _1319 = trunc(_1313);
    int _1321 = int(_1319);
    float _1323 = exp2(_1269);
    float _1325 = float(uint(_1321));
    float _1327 = as_type<float>(_1317) * _1325;
    float _1329 = trunc(_1327);
    float _1331 = precise::max(_1329, 0.0);
    uint _1333 = uint(_1331);
    int _1335 = _1297 * int(_1333);
    int _1337 = _1335 + _1321;
    float _1339 = float(uint(_1337));
    float _1341 = as_type<float>(_1317) * _1339;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1345 = _1343 != 0;
    float _1347 = float(_1273);
    float _1349 = trunc(_1341);
    float _1351 = precise::max(_1349, 0.0);
    uint _1353 = uint(_1351);
    bool _1355 = !_1345;
    float _1357 = _1355 ? 1.2345600128173828125 : 1.0;
    bool _1359 = !_1345;
    float _1361 = _1359 ? _1275 : _141;
    float _1363 = _1357 * _1361;
    float _1365 = float(_1321);
    float _1367 = floor(_1363);
    bool _1369 = _1365 >= _1347;
    bool _1371 = isnan(_1365);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan(_1347);
    bool _1377 = _1373 || _1375;
    float _1379 = float(_1377);
    int _1381 = int(_1333) + int(_1353);
    float _1383 = trunc(_1379);
    int _1385 = int(_1383);
    int _1387 = _1303 * _1381;
    int _1389 = _1387 + _1321;
    float _1391 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1393 = uint(_1389) >= uint(_1273);
    float _1395 = -_1367;
    float _1397 = _1363 + _1395;
    bool _1399 = !_1393;
    int _1401 = _1399 ? 0 : (-1);
    float _1403 = _1397 * _1347;
    float _1405 = _121 * _1347;
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1409 = _1407 != 0;
    int _1411 = ~_1381;
    int _1413 = _1411 + _1401;
    int _1415 = _1413 + 1;
    float _1417 = _1405 * _1283;
    float _1419 = trunc(_1403);
    int _1421 = int(_1419);
    int _1423 = ~_1385;
    int _1425 = _1423 + 1;
    int _1427 = _1425 + 1;
    int _1429 = _1273 * _1415;
    int _1431 = _1429 + _1321;
    int _1433 = _1273 + (-1);
    int _1435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1437 = _1435 != 0;
    bool _1439 = !_1305;
    int _1441 = _1439 ? _1431 : (-1);
    float _1443 = trunc(_1417);
    int _1445 = int(_1443);
    bool _1447 = !_1409;
    int _1449 = _1447 ? 0 : 1;
    bool _1451 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1453 = isnan(0.5);
    bool _1455 = _1451 || _1453;
    bool _1457 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1459 = _1455 || _1457;
    int _1461 = _1441 * _1427;
    int _1463 = abs(_1449);
    float _1465 = -_191;
    int _1467 = _1267 ? as_type<int>(_1465) : as_type<int>(_191);
    int _1469 = _1385 * _1433;
    int _1471 = _1469 + _1461;
    int _1473 = abs(_760);
    int _1475 = _1471 * _1265;
    int _1477 = abs(_764);
    int _1479 = _1421 * _1463;
    int _1481 = _1479 + _1321;
    int _1483 = abs(_768);
    int _1485 = _1445 * _1473;
    int _1487 = _1485 + _1475;
    float _1489 = in.m_49.w;
    int _1491 = ~_1273;
    int _1493 = _1491 + 1;
    float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1497 = _1495 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1501 = _1499 != 0;
    int _1503 = _1481 * _1477;
    int _1505 = _1503 + _1487;
    float _1507 = in.m_49.z;
    int _1509 = _1421 * _1483;
    int _1511 = _1509 + _1505;
    int _1513 = ~_1273;
    int _1515 = _1513 + 1;
    float _1517 = 1.0 / _1497;
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1521 = _1519 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1523 = float(uint(_1481));
    float _1525 = float(uint(_1511));
    float _1527 = as_type<float>(_1317) * _1523;
    float _1529 = 1.0 / _1521;
    float _1531 = as_type<float>(_1317) * _1525;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1535 = trunc(_1531);
    float _1537 = precise::max(_1535, 0.0);
    uint _1539 = uint(_1537);
    int _1541 = _1515 * int(_1539);
    int _1543 = _1541 + _1511;
    float _1545 = float(uint(_1543));
    float _1547 = as_type<float>(_1317) * _1545;
    float _1549 = trunc(_1547);
    float _1551 = precise::max(_1549, 0.0);
    uint _1553 = uint(_1551);
    float _1555 = _1547;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_1345)
    {
        _1555 = _1275;
    }
    float _1559 = _1555;
    float _1561 = _1559;
    if (_1345)
    {
        _1561 = _141;
    }
    float _1563 = _1561;
    float _1565 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1277);
    bool _1567 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1569 = isnan(_542);
    bool _1571 = _1567 || _1569;
    bool _1573 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1575 = _1571 || _1573;
    float _1577 = float(_1575);
    int _1579 = int(_1539) + int(_1553);
    float _1581 = -_209;
    int _1583 = _1309 ? as_type<int>(_1581) : as_type<int>(_209);
    int _1585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1587 = _1585 != 0;
    int _1589 = _1493 * _1579;
    int _1591 = _1589 + _1511;
    bool _1593 = uint(_1591) >= uint(_1273);
    bool _1595 = !_1437;
    float _1597 = _1595 ? _191 : as_type<float>(_1467);
    int _1599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1601 = _1599 != 0;
    bool _1603 = !_1601;
    float _1605 = _1603 ? _209 : as_type<float>(_1583);
    float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1607;
    bool _1611 = !_1593;
    int _1613 = _1611 ? 0 : (-1);
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1617 = _1615 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1621 = _1619 != 0;
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1625 = _1507 > 0.5;
    float _1627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1629 = _1507;
    if (!_1345)
    {
        _1557 = _1507;
    }
    float _1631 = _1557;
    float _1633 = -_1623;
    float _1635 = fma(_1285, 2.0, _1633);
    float _1637 = _1631;
    if (_1345)
    {
        _1637 = _1275;
    }
    float _1639 = _1637;
    float _1641 = _1609 * _1315;
    if (_1345)
    {
        _1629 = _1275;
    }
    float _1643 = _1629;
    float _1645 = _1617 * _1529;
    bool _1647 = _1489 > 0.5;
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1651 = _542 + _1649;
    float _1653 = -_121;
    float _1655 = fma(_1653, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1635);
    bool _1657 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1659 = isnan(_542);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1665 = _1661 || _1663;
    float _1667 = float(_1665);
    float _1669 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1533);
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1673 = ~_1273;
    int _1675 = _1673 + 1;
    float _1677 = -_1667;
    float _1679 = _1677 + 1.0;
    float _1681 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1683 = fma(_1391, -2.0, _1671);
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1685;
    bool _1689 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1691 = isnan(_542);
    bool _1693 = _1689 || _1691;
    bool _1695 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1697 = _1693 || _1695;
    float _1699 = float(_1697);
    float _1701 = _1577 * _1679;
    float _1703 = -_1577;
    float _1705 = _1703 + 1.0;
    float _1707 = _1687 * _1517;
    float _1709 = fma(_1641, _1651, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1711 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1713 = isnan(_542);
    bool _1715 = _1711 || _1713;
    bool _1717 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1719 = _1715 || _1717;
    float _1721 = float(_1719);
    float _1723 = _1699 * _1705;
    float _1725 = -_1699;
    float _1727 = _1725 + 1.0;
    float _1729 = _1597 + 0.5;
    float _1731 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1733 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1669);
    float _1735 = _1721 * _1727;
    float _1737 = fma(_1681, _1729, _1655);
    float _1739 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1741 = _542 + _1739;
    float _1743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1745 = _1709 * _1735;
    float _1747 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1749 = _542 + _1747;
    float _1751 = -_1721;
    float _1753 = _1751 + 1.0;
    float _1755 = fma(_1645, _1741, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1757 = -_1733;
    float _1759 = _1757 + 1.0;
    float _1761 = fma(_1707, _1749, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1763 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1745);
    float _1765 = trunc(_1527);
    float _1767 = precise::max(_1765, 0.0);
    uint _1769 = uint(_1767);
    float _1771 = _1563 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1773 = fma(_1755, _1723, _1763);
    int _1775 = ~_1579;
    int _1777 = _1775 + _1613;
    int _1779 = _1777 + 1;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1783 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1565);
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1787 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1683);
    float _1789 = fma(_1731, -2.0, _1781);
    float _1791 = -_191;
    int _1793 = _1625 ? as_type<int>(_1791) : as_type<int>(_191);
    float _1795 = fma(_1563, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1279);
    float _1797 = -_1785;
    float _1799 = fma(_1771, 2.0, _1797);
    float _1801 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1311);
    float _1803 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1789);
    int _1805 = _1675 * int(_1769);
    int _1807 = _1805 + _1481;
    float _1809 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1795);
    float _1811 = -_121;
    float _1813 = fma(_1811, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1799);
    int _1815 = _1273 * _1779;
    int _1817 = _1815 + _1511;
    float _1819 = fma(_1761, _1701, _1773);
    float _1821 = float(uint(_1807));
    float _1823 = -_1783;
    float _1825 = _1823 + 1.0;
    float _1827 = -_1809;
    float _1829 = _1827 + 1.0;
    float _1831 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1819);
    float _1833 = -_209;
    int _1835 = _1647 ? as_type<int>(_1833) : as_type<int>(_209);
    float _1837 = as_type<float>(_1317) * _1821;
    bool _1839 = !_1587;
    float _1841 = _1839 ? _191 : as_type<float>(_1793);
    float _1843 = -_1825;
    float _1845 = fma(_1597, _1843, _1737);
    float _1847 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1849 = trunc(_1837);
    float _1851 = precise::max(_1849, 0.0);
    uint _1853 = uint(_1851);
    float _1855 = _1605 + (-0.5);
    float _1857 = _1841 + 0.5;
    bool _1859 = !_1621;
    float _1861 = _1859 ? _209 : as_type<float>(_1835);
    float _1863 = -_1801;
    float _1865 = _1863 + 1.0;
    float _1867 = -_1847;
    float _1869 = -_1787;
    float _1871 = fma(_1867, _1855, _1869);
    float _1873 = fma(_1857, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1813);
    bool _1875 = !_1305;
    int _1877 = _1875 ? _1817 : (-1);
    float _1879 = _1861 + (-0.5);
    float _1881 = fma(_1605, _1865, _1871);
    float _1883 = -_1829;
    float _1885 = fma(_1841, _1883, _1873);
    int _1887 = _1877 >> 31;
    float _1889 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1891 = ~_1273;
    int _1893 = _1891 + 1;
    float _1895 = -_1879;
    float _1897 = -_1803;
    float _1899 = fma(_1895, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1897);
    int _1901 = _1887 & 3;
    float _1903 = _1889 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _1905 = int(_1769) + int(_1853);
    float _1907 = fma(_1861, _1759, _1899);
    int _1909 = _1877 + _1901;
    float _1911 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1913 = _1889 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1915 = _1893 * _1905;
    int _1917 = _1915 + _1481;
    int _1919 = _1909 >> 2;
    float _1921 = _1889 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1923 = fma(_1911, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1903);
    float _1925 = _1831 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1927 = _1919 << 4;
    int _1929 = _1927 + 512;
    float _1931 = fma(_1911, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1913);
    bool _1933 = uint(_1917) >= uint(_1273);
    float _1935 = fma(_1911, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1921);
    uint _1937 = uint(int(uint(_1929) >> uint(2)));
    uint _1939 = uint(int(uint(int(_1937)) >> uint(2)));
    int _1941 = int(_1937) & 3;
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[int(_1939)][_1941];
    int _1945 = int(_1937) + 1;
    uint _1947 = uint(int(uint(_1945) >> uint(2)));
    int _1949 = _1945 & 3;
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[int(_1947)][_1949];
    float _1953 = _852 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1955 = _852 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1957 = _1877 & 3;
    bool _1959 = _1957 != 0;
    out.m_60.x = _1845;
    out.m_60.y = _1881;
    out.m_60.z = _1885;
    out.m_60.w = _1907;
    bool _1961 = !_1933;
    int _1963 = _1961 ? 0 : (-1);
    float _1965 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1953);
    bool _1967 = uint(_1957) > 1u;
    float _1969 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1955);
    int _1971 = ~_1905;
    int _1973 = _1971 + _1963;
    int _1975 = _1973 + 1;
    float _1977 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1965);
    float _1979 = _1931 + (*spvDescriptorSet0.vp_c10)._m0[9].z;
    int _1981 = _1877 & 3;
    bool _1983 = _1981 != 0;
    int _1985 = _1273 * _1975;
    int _1987 = _1985 + _1481;
    float _1989 = _1923 + (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _1991;
    float _1995 = _1979 * _952;
    int _1997 = _1929 + 8;
    uint _1999 = uint(int(uint(_1997) >> uint(2)));
    uint _2001 = uint(int(uint(int(_1999)) >> uint(2)));
    int _2003 = int(_1999) & 3;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[int(_2001)][_2003];
    int _2007 = int(_1999) + 1;
    uint _2009 = uint(int(uint(_2007) >> uint(2)));
    int _2011 = _2007 & 3;
    float _2013 = (*spvDescriptorSet0.vp_c9)._m0[int(_2009)][_2011];
    int _2015 = _1983 ? 0 : 1;
    float _2017 = 1.0 / _1993;
    bool _2019 = _1957 != 3;
    float _2021 = fma(_1989, _948, _1995);
    int _2023 = ~_2015;
    int _2025 = _2023 + 1;
    int _2027 = _2025 + 1;
    float _2029 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1969);
    int _2031 = _2027;
    if (!_1967)
    {
        int _2033 = ~_2015;
        int _2035 = _2033 + 1;
        _2031 = _2035;
    }
    int _2037 = _2031;
    float _2039 = _1935 + (*spvDescriptorSet0.vp_c10)._m0[10].z;
    bool _2041 = uint(_1957) >= 2u;
    float _2043 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2045 = abs(_2037);
    float _2047 = fma(_2039, _950, _2021);
    bool _2049 = !_1959;
    int _2051 = _2049 ? 0 : 1;
    float _2053 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2043);
    int _2055 = _2041 ? 0 : 1;
    float _2057 = abs(_2047);
    float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2061 = _2057 + _2059;
    int _2063 = abs(_2051);
    out.m_62.w = _1925;
    bool _2065 = _1957 != 3;
    float _2067 = _2061 * _2017;
    float _2069 = precise::clamp(_2067, 0.0, 1.0);
    int _2071 = ~_2055;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    float _2077 = _2029 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _2079 = _2075;
    if (_2019)
    {
        int _2081 = ~_2055;
        int _2083 = _2081 + 1;
        _2079 = _2083;
    }
    int _2085 = _2079;
    float _2087 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2053);
    float _2089 = _1977 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2091 = ~_2045;
    int _2093 = _2091 + 1;
    int _2095 = _2093 + 1;
    float _2097 = 1.0 / _2077;
    int _2099 = abs(_2085);
    float _2101 = _2089 + _2077;
    bool _2103 = !_2065;
    int _2105 = _2103 ? 0 : (-1);
    int _2107 = _2095 * as_type<int>(_1951);
    int _2109 = ~_2063;
    int _2111 = _2109 + 1;
    int _2113 = _2111 + 1;
    float _2115 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2087);
    bool _2117 = !_1501;
    int _2119 = _2117 ? 0 : 1;
    int _2121 = abs(_2105);
    int _2123 = _2113 * as_type<int>(_1943);
    int _2125 = _2123 + _2107;
    int _2127 = abs(_2119);
    int _2129 = ~_2099;
    int _2131 = _2129 + 1;
    int _2133 = _2131 + 1;
    int _2135 = _2133 * as_type<int>(_2005);
    int _2137 = _2135 + _2125;
    int _2139 = ~_2121;
    int _2141 = _2139 + 1;
    int _2143 = _2141 + 1;
    float _2145 = fma(_2069, -2.0, 3.0);
    int _2147 = ~_2127;
    int _2149 = _2147 + 1;
    int _2151 = _2149 + 1;
    float _2153 = _2069 * _2069;
    bool _2155 = !_1305;
    int _2157 = _2155 ? _1987 : (-1);
    int _2159 = _2143 * as_type<int>(_2013);
    int _2161 = _2159 + _2137;
    float _2163 = _2101 * _2097;
    float _2165 = _2163 * 0.5;
    float _2167 = _2153 * _2145;
    float _2169 = as_type<float>(_2137);
    if (_1459)
    {
        _2169 = 1.0;
    }
    float _2171 = _2169;
    int _2173 = _2161 * _2151;
    float _2175 = _2171;
    if (!_1459)
    {
        float _2177 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2179 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2177);
        float _2181 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2183 = _2181 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        float _2185 = 1.0 / _2179;
        float _2187 = 1.0 / _2183;
        float _2189 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2191 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2193 = fma(_2185, _2189, _2191);
        float _2195 = _2193 * _2187;
        float _2197 = precise::clamp(_2195, 0.0, 1.0);
        float _2199 = -_2197;
        float _2201 = _2199 + 1.0;
        _2175 = _2201;
    }
    float _2203 = _2175;
    float _2205 = _2167 * _2203;
    float _2207 = -_1323;
    float _2209 = _2207 + 1.0;
    float _2211 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2213 = _2115 + _2211;
    bool _2215 = _2203 > 0.0;
    bool _2217 = isnan(_2203);
    bool _2219 = _2215 || _2217;
    bool _2221 = isnan(0.0);
    bool _2223 = _2219 || _2221;
    float _2225 = _2205 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2227 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2229 = _2157 * _2127;
    int _2231 = _2229 + _2173;
    float _2233 = _1164 + _2213;
    float _2235 = _379 * _2225;
    float _2237 = _2227 * _1238;
    float _2239 = -_2227;
    float _2241 = _2239 + 1.0;
    float _2243 = _2233 * 0.5;
    float _2245 = _2235 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2247 = _1249 * _2237;
    float _2249 = _1259 * _2237;
    out.gl_Position.x = _1206;
    out.gl_Position.y = _1210;
    out.gl_Position.z = _2213;
    out.gl_Position.w = _1164;
    float _2251 = fma(_1255, _2247, _1243);
    float _2253 = fma(_1257, _2247, _1245);
    float _2255 = float(_2231);
    float _2257 = _1249 * _2241;
    float _2259 = fma(_1249, _2249, _1247);
    out.m_64.z = _2243;
    out.m_64.w = _1164;
    out.m_66.y = _2255;
    out.m_45.x = _2245;
    out.m_68.x = _2251;
    out.m_68.y = _2253;
    out.m_68.z = _2259;
    out.m_68.w = _2257;
    if (_2223)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2261 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2261;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _532 = false;
    bool _399 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2318 = as_type<float>(_103);
        out.gl_Position.z = _2318;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    if (_117)
    {
        float _125 = float(_87);
        _123 = _125;
    }
    float _127 = _123;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    if (_133)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _97;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2386 = as_type<float>(_139);
        out.gl_Position.z = _2386;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _145 * _143;
    float _161 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _163 = in.m_47.x;
    float _165 = in.m_47.y;
    float _167 = in.m_47.z;
    float _169 = _161 * 6.283185482025146484375;
    float _171 = floor(_161);
    int _173 = as_type<int>(_147) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_147) & 2;
    bool _179 = _177 != 0;
    float _181 = _169 * 0.15915493667125701904296875;
    float _183 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    bool _189 = !_175;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = _147;
    float _195 = _183;
    if (!_157)
    {
        float _197 = _183 * _183;
        float _199 = _197 * 0.5;
        _193 = _199;
    }
    float _201 = _193;
    float _203 = _181 * 6.283185482025146484375;
    float _205 = cos(_203);
    bool _207 = !_179;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = _201;
    if (!_157)
    {
        float _213 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _213;
    }
    float _215 = _211;
    float _217 = -_171;
    float _219 = _161 + _217;
    bool _221 = _219 < 0.5;
    float _223 = float(_221);
    bool _225 = !_157;
    float _227 = _215;
    if (!_225)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _183 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _183);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _257;
    }
    float _259 = _227;
    bool _261 = !_157;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _183 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _195 = _281;
    }
    float _283 = _195;
    float _285 = -_219;
    float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _289 = fma(_205, 0.5, 0.5);
    float _291 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _293 = -_223;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _299 = _297 != 0;
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _303 = _301 != 0;
    float _305 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _307 = -_289;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = in.m_54.w;
    float _313 = _291 * _141;
    bool _315 = !_299;
    int _317 = _315 ? 0 : 1;
    float _319 = fma(_283, _163, _305);
    float _321 = in.m_42.x;
    float _323 = in.m_42.y;
    float _325 = in.m_42.z;
    bool _327 = !_187;
    int _329 = _327 ? 0 : 1;
    int _331 = abs(_317);
    int _333 = abs(_329);
    float _335 = trunc(_313);
    int _337 = int(_335);
    float _339 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _341 = !_303;
    int _343 = _341 ? 0 : 1;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _347 = float(_331);
    int _349 = abs(_343);
    float _351 = fma(_283, _165, _339);
    float _353 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _355 = float(_333);
    float _357 = abs(_287);
    float _359 = _347 * _357;
    float _361 = float(_349);
    float _363 = fma(_283, _167, _353);
    int _365 = _337 << 4;
    int _367 = _365 + 1712;
    float _369 = fma(_355, _309, _359);
    float _371 = fma(_319, _311, _321);
    float _373 = fma(_351, _311, _323);
    float _375 = fma(_363, _311, _325);
    float _377 = abs(_295);
    float _379 = fma(_361, _377, _369);
    bool _381 = !_345;
    float _397;
    if (!_381)
    {
        float _383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _385 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _387 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _389 = _387 * _383;
        float _391 = floor(_389);
        float _393 = -_391;
        float _395 = _389 + _393;
        _397 = _395;
        _399 = true;
    }
    else
    {
        float _401 = float(_87);
        float _403 = 1.0 / _401;
        float _405 = _121 * _403;
        _397 = _405;
    }
    _399 = false;
    float _407 = _397;
    uint _410 = uint(int(uint(_367) >> uint(2)));
    uint _412 = uint(int(uint(int(_410)) >> uint(2)));
    int _414 = int(_410) & 3;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[int(_412)][_414];
    int _418 = int(_410) + 1;
    uint _420 = uint(int(uint(_418) >> uint(2)));
    int _422 = _418 & 3;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[int(_420)][_422];
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _428 = _407 + _426;
    bool _430 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _432 = isnan(_407);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _446 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _448 = isnan(_407);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    int _458 = _367 + 8;
    uint _460 = uint(int(uint(_458) >> uint(2)));
    uint _462 = uint(int(uint(int(_460)) >> uint(2)));
    int _464 = int(_460) & 3;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[int(_462)][_464];
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _468;
    float _472 = -_440;
    float _474 = _472 + 1.0;
    bool _476 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _478 = 1.0 / _444;
    float _480 = _470 * _478;
    float _482 = fma(_480, _428, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _484 = _456 * _474;
    float _486 = -_456;
    float _488 = _486 + 1.0;
    float _490 = _482 * _484;
    float _492 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[115].x, _490);
    float _494 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[116].x, _492);
    float _496 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _498 = _424 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _502 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _494 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _506 = _466 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _508 = _506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _510 = !_476;
    float _528;
    float _530;
    if (!_510)
    {
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _514 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _516 = float(_87);
        float _518 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _520 = _518 * _512;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _516;
        _530 = _526;
        _532 = true;
    }
    else
    {
        float _534 = float(_87);
        float _536 = 1.0 / _534;
        float _538 = _121 * _536;
        _528 = _534;
        _530 = _538;
    }
    _532 = false;
    float _540 = _528;
    float _542 = _530;
    float _544 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _546 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _548 = in.m_54.x;
    float _550 = in.m_54.y;
    float _552 = fma(_121, 0.02500000037252902984619140625, _141);
    float _554 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _544);
    float _556 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _558 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _546);
    float _560 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _562 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].z, _554);
    float _564 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].x, _556);
    float _566 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].z, _558);
    float _568 = floor(_552);
    float _570 = _562 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _572 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].z, _564);
    float _574 = _566 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _576 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _578 = _570 + _576;
    float _580 = _572 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _582 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _584 = _574 + _582;
    float _586 = _578 * _578;
    float _588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _590 = _580 + _588;
    float _592 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _594 = fma(_584, _584, _586);
    float _596 = fma(_590, _590, _594);
    float _598 = rsqrt(_596);
    float _600 = _578 * _598;
    float _602 = _584 * _598;
    float _604 = _590 * _598;
    float _606 = -_600;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _578);
    float _610 = -_602;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _584);
    float _614 = -_604;
    float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[18].w, _590);
    float _618 = _608 * _608;
    float _620 = fma(_612, _612, _618);
    float _622 = fma(_616, _616, _620);
    float _624 = _548 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _626 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _628 = _570 + _626;
    float _630 = sqrt(_622);
    float _632 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _634 = _628 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _636 = fma(_568, -0.1500000059604644775390625, 1.0);
    float _638 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _640 = _574 + _638;
    float _642 = _598 * _630;
    float _644 = _550 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[191].x * 0.100000001490116119384765625;
    float _648 = fma(_640, (*spvDescriptorSet0.vp_c10)._m0[8].x, _634);
    float _650 = _632 * _642;
    float _652 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _654 = _568 * _646;
    float _656 = precise::max(_636, 0.20000000298023223876953125);
    float _658 = _650 * _592;
    float _660 = _652 * _642;
    float _662 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _664 = _580 + _662;
    float _666 = _642 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _668 = _666 * 0.5;
    float _670 = _660 * _560;
    float _672 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[10].x, _648);
    float _674 = _670 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _676 = _670 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _678 = _672 * _654;
    float _680 = fma(_658, (*spvDescriptorSet0.vp_c10)._m0[10].x, _674);
    float _682 = precise::min(_656, 1.0);
    float _684 = fma(_658, (*spvDescriptorSet0.vp_c10)._m0[8].x, _676);
    float _686 = _670 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _688 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[10].z, _680);
    float _690 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[8].z, _684);
    float _692 = fma(_658, (*spvDescriptorSet0.vp_c10)._m0[9].x, _686);
    float _694 = fma(_688, _682, _580);
    float _696 = fma(_690, _682, _574);
    float _698 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[9].z, _692);
    float _700 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[10].x, _694);
    float _702 = -_602;
    float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _574);
    float _706 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[8].x, _696);
    float _708 = fma(_698, _682, _570);
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _712 = _700 + _710;
    float _714 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _716 = _706 + _714;
    float _718 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[9].x, _708);
    float _720 = _712 * _712;
    float _722 = fma(_716, _716, _720);
    float _724 = sqrt(_722);
    bool _726 = _724 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _734 = _732 != 0;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _738 = _736 != 0;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _742 = _740 != 0;
    bool _744 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _746 = isnan(0.5);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _752 = _748 || _750;
    bool _754 = !_734;
    int _756 = _754 ? 0 : 1;
    bool _758 = !_730;
    int _760 = _758 ? 0 : 1;
    bool _762 = !_738;
    int _764 = _762 ? 0 : 1;
    bool _766 = !_742;
    int _768 = _766 ? 0 : 1;
    float _770 = _686;
    float _772 = _708;
    float _774 = _720;
    float _776 = _580;
    float _778 = _642;
    float _780 = _712;
    if (!_726)
    {
        _770 = _706;
    }
    float _782 = _770;
    float _784 = _782;
    if (!_726)
    {
        _772 = _700;
    }
    float _786 = _772;
    float _788 = _786;
    if (!_726)
    {
        _774 = _718;
    }
    float _790 = _774;
    bool _792 = !_726;
    float _794 = _790;
    if (!_792)
    {
        float _796 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _798 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _800 = _724 + _798;
        float _802 = _718 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _804 = rsqrt(_722);
        float _806 = _800 * _796;
        float _808 = _806 * 0.15915493667125701904296875;
        float _810 = _808 * 6.283185482025146484375;
        float _812 = cos(_810);
        float _814 = _808 * 6.283185482025146484375;
        float _816 = sin(_814);
        float _818 = _812 + (-1.0);
        float _820 = _818 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _822 = fma(_816, _802, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _824 = fma(_718, _812, _820);
        float _826 = _804 * _822;
        float _828 = fma(_716, _826, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _830 = fma(_712, _826, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _784 = _828;
        _794 = _824;
        _788 = _830;
    }
    float _832 = _784;
    float _834 = _794;
    float _836 = _788;
    float _838 = -_602;
    float _840 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[18].w, _832);
    float _842 = -_600;
    float _844 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _834);
    float _846 = -_604;
    float _848 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[18].w, _836);
    float _850 = -_600;
    float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[18].w, _570);
    float _854 = -_604;
    float _856 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[18].w, _580);
    float _858 = _844;
    float _860 = _840;
    float _862 = _848;
    float _864 = _832;
    float _866 = _834;
    if (!_752)
    {
        float _868 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _870 = _852 + _868;
        float _872 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _874 = _704 + _872;
        float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
        float _878 = -_574;
        float _880 = _878 + _832;
        float _882 = _870 * _870;
        float _884 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _886 = _856 + _884;
        float _888 = -_570;
        float _890 = _888 + _834;
        float _892 = -_580;
        float _894 = _892 + _836;
        float _896 = fma(_874, _874, _882);
        float _898 = 1.0 / _642;
        float _900 = fma(_886, _886, _896);
        float _902 = sqrt(_900);
        float _904 = precise::max(_902, (*spvDescriptorSet0.vp_c9)._m0[199].y);
        float _906 = _904 * _876;
        float _908 = _906 * _898;
        float _910 = fma(_880, _908, _704);
        float _912 = fma(_890, _908, _852);
        float _914 = fma(_894, _908, _856);
        _858 = _912;
        _860 = _910;
        _862 = _914;
        _776 = _894;
        _778 = _898;
    }
    float _916 = _858;
    float _918 = _860;
    float _920 = _862;
    float _922 = _776;
    float _924 = _778;
    float _926 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _928 = _916 + _926;
    float _930 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _932 = _918 + _930;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _936 = _920 + _934;
    float _938 = _928 * _928;
    float _940 = fma(_932, _932, _938);
    float _942 = fma(_936, _936, _940);
    float _944 = rsqrt(_942);
    float _946 = sqrt(_942);
    float _948 = _932 * _944;
    float _950 = _936 * _944;
    float _952 = _928 * _944;
    float _954 = _948 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _956 = _950 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _958 = _954 * _954;
    float _960 = _956 * _956;
    float _962 = _958 + _960;
    float _964 = sqrt(_962);
    bool _966 = _964 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _968 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _970 = _964 + _968;
    float _972 = _922;
    float _974 = _962;
    float _976 = _970;
    if (_966)
    {
        float _978 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _972 = _978;
    }
    float _980 = _972;
    if (_966)
    {
        float _982 = rsqrt(_962);
        _974 = _982;
    }
    float _984 = _974;
    if (_966)
    {
        float _986 = _970 * _980;
        _976 = _986;
    }
    float _988 = _976;
    if (_966)
    {
        float _990 = _988 * 0.15915493667125701904296875;
        _864 = _990;
    }
    float _992 = _864;
    float _994 = _980;
    if (_966)
    {
        float _996 = _992 * 6.283185482025146484375;
        float _998 = sin(_996);
        _994 = _998;
    }
    float _1000 = _994;
    float _1002 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1004 = precise::max(0.0, _1002);
    float _1006 = _924;
    float _1008 = _1002;
    if (_966)
    {
        float _1010 = _992 * 6.283185482025146484375;
        float _1012 = cos(_1010);
        _1006 = _1012;
    }
    float _1014 = _1006;
    float _1016 = -_952;
    float _1018 = -_1004;
    float _1020 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1018);
    float _1022 = _1020;
    if (_966)
    {
        float _1024 = _1020 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1008 = _1024;
    }
    float _1026 = _1008;
    float _1028 = _916 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1030 = _1000;
    float _1032 = _1026;
    if (_966)
    {
        float _1034 = fma(_1000, _1026, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _866 = _1034;
    }
    float _1036 = _866;
    float _1038 = _1036;
    if (!_966)
    {
        _1030 = _954;
    }
    float _1040 = _1030;
    float _1042 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1028);
    float _1044 = _1040;
    float _1046 = _1014;
    if (_966)
    {
        float _1048 = _1014 + (-1.0);
        _1032 = _1048;
    }
    float _1050 = _1032;
    float _1052 = _1050;
    if (_966)
    {
        float _1054 = _984 * _1036;
        _780 = _1054;
    }
    float _1056 = _780;
    float _1058 = _916 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1060 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1042);
    if (_966)
    {
        float _1062 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1038 = _1062;
    }
    float _1064 = _1038;
    float _1066 = _1064;
    if (_966)
    {
        float _1068 = _954 * _1056;
        _1044 = _1068;
    }
    float _1070 = _1044;
    if (!_966)
    {
        _1052 = _956;
    }
    float _1072 = _1052;
    float _1074 = _1072;
    if (_966)
    {
        float _1076 = _956 * _1056;
        _1074 = _1076;
    }
    float _1078 = _1074;
    if (_966)
    {
        float _1080 = fma(_1020, _1014, _1064);
        _1022 = _1080;
    }
    float _1082 = _1022;
    if (!_966)
    {
        _1066 = _958;
    }
    float _1084 = _1066;
    float _1086 = _1084;
    if (_966)
    {
        float _1088 = _1070 * _1070;
        _1086 = _1088;
    }
    float _1090 = _1086;
    float _1092 = _916 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1094 = _916 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (!_966)
    {
        _1046 = _960;
    }
    float _1096 = _1046;
    float _1098 = _1096;
    if (_966)
    {
        float _1100 = _1078 * _1078;
        _1098 = _1100;
    }
    float _1102 = _1098;
    float _1104 = fma(_1082, _1082, _1090);
    float _1106 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1058);
    float _1108 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1092);
    float _1110 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1094);
    float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1114 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1112);
    float _1116 = precise::clamp(_1114, 0.0, 1.0);
    float _1118 = _1104 + _1102;
    float _1120 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1106);
    float _1122 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1124 = -_1116;
    float _1126 = _1124 + 1.0;
    float _1128 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1108);
    float _1130 = rsqrt(_1118);
    float _1132 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1134 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1136 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1138 = _1128 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1140 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1110);
    float _1142 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1134);
    float _1144 = abs(_1126);
    float _1146 = log2(_1144);
    float _1148 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1150 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1142);
    float _1152 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1154 = -_1148;
    float _1156 = fma(_1154, _1136, 1.0);
    float _1158 = _1130 * _1070;
    float _1160 = _1130 * _1082;
    float _1162 = _1130 * _1078;
    float _1164 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1150);
    float _1166 = _1158 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1168 = log2(_1156);
    float _1170 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1172 = _1160 + 1.0;
    float _1174 = -_1166;
    float _1176 = fma(_1160, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1174);
    float _1178 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1180 = -_1162;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1176);
    float _1184 = 1.0 / _1164;
    float _1186 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1188 = fma(_1182, -0.5, 0.5);
    float _1190 = fma(_1182, 0.5, 0.5);
    float _1192 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1186);
    float _1194 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1170);
    float _1196 = exp2(_1178);
    float _1198 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1192);
    float _1200 = fma(_1190, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1202 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1194);
    float _1204 = _1168 * 0.693147182464599609375;
    float _1206 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1198);
    float _1208 = fma(_1190, _1200, -0.212114393711090087890625);
    float _1210 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1202);
    float _1212 = sqrt(_1188);
    float _1214 = _1206 * _1184;
    float _1216 = fma(_1190, _1208, 1.570728778839111328125);
    float _1218 = _1210 * _1184;
    float _1220 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1222 = fma(_1214, 0.5, 0.5);
    float _1224 = fma(_1218, -0.5, 0.5);
    float _1226 = -_1160;
    float _1228 = fma(_1196, _1172, _1226);
    float _1230 = fma(_1228, 0.5, 0.5);
    float _1232 = _1212 * 0.636619746685028076171875;
    float _1234 = -_1216;
    float _1236 = fma(_1232, _1234, 1.0);
    float3 _4127 = float3(_1222, _1224, _1220);
    float _1238 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4127, float3(0.0), isnan(_4127)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4127, float3(0.0), isnan(_4127)), level(0.0)).x;
    float3 _4138 = float3(_1222, _1224, _1220);
    float4 _1241 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4138, float3(0.0), isnan(_4138)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4138, float3(0.0), isnan(_4138)), level(0.0)).xyzw;
    float _1243 = _1241.x;
    float _1245 = _1241.y;
    float _1247 = _1241.z;
    float _1249 = _1241.w;
    float2 _4155 = float2(_1236, _1230);
    float3 _1253 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4155, float2(0.0), isnan(_4155)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4155, float2(0.0), isnan(_4155)), level(0.0)).xyz;
    float _1255 = _1253.x;
    float _1257 = _1253.y;
    float _1259 = _1253.z;
    float _1261 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1263 = int(_1261);
    int _1265 = abs(_756);
    out.m_56.x = _500;
    out.m_56.y = _502;
    out.m_56.z = _508;
    out.m_56.w = _504;
    bool _1267 = _141 > 0.5;
    float _1269 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_58.y = _916;
    float _1271 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1273 = int(_1271);
    float _1275 = in.m_49.y;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1281 = float(_1263);
    float _1283 = 1.0 / _540;
    float _1285 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1289 = _1287 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1291 = float(uint(_1273));
    float _1293 = 1.0 / _1281;
    int _1295 = ~_1273;
    int _1297 = _1295 + 1;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1301 = ~_1273;
    int _1303 = _1301 + 1;
    bool _1305 = _1273 == 0;
    float _1307 = 1.0 / _1291;
    bool _1309 = _1275 > 0.5;
    float _1311 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1299);
    float _1313 = _121 * _1293;
    float _1315 = 1.0 / _1289;
    int _1317 = as_type<int>(_1307) + (-2);
    float _1319 = trunc(_1313);
    int _1321 = int(_1319);
    float _1323 = exp2(_1269);
    float _1325 = float(uint(_1321));
    float _1327 = as_type<float>(_1317) * _1325;
    float _1329 = trunc(_1327);
    float _1331 = precise::max(_1329, 0.0);
    uint _1333 = uint(_1331);
    int _1335 = _1297 * int(_1333);
    int _1337 = _1335 + _1321;
    float _1339 = float(uint(_1337));
    float _1341 = as_type<float>(_1317) * _1339;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1345 = _1343 != 0;
    float _1347 = float(_1273);
    float _1349 = trunc(_1341);
    float _1351 = precise::max(_1349, 0.0);
    uint _1353 = uint(_1351);
    bool _1355 = !_1345;
    float _1357 = _1355 ? 1.2345600128173828125 : 1.0;
    bool _1359 = !_1345;
    float _1361 = _1359 ? _1275 : _141;
    float _1363 = _1357 * _1361;
    float _1365 = float(_1321);
    float _1367 = floor(_1363);
    bool _1369 = _1365 >= _1347;
    bool _1371 = isnan(_1365);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan(_1347);
    bool _1377 = _1373 || _1375;
    float _1379 = float(_1377);
    int _1381 = int(_1333) + int(_1353);
    float _1383 = trunc(_1379);
    int _1385 = int(_1383);
    int _1387 = _1303 * _1381;
    int _1389 = _1387 + _1321;
    float _1391 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1393 = uint(_1389) >= uint(_1273);
    float _1395 = -_1367;
    float _1397 = _1363 + _1395;
    bool _1399 = !_1393;
    int _1401 = _1399 ? 0 : (-1);
    float _1403 = _1397 * _1347;
    float _1405 = _121 * _1347;
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1409 = _1407 != 0;
    int _1411 = ~_1381;
    int _1413 = _1411 + _1401;
    int _1415 = _1413 + 1;
    float _1417 = _1405 * _1283;
    float _1419 = trunc(_1403);
    int _1421 = int(_1419);
    int _1423 = ~_1385;
    int _1425 = _1423 + 1;
    int _1427 = _1425 + 1;
    int _1429 = _1273 * _1415;
    int _1431 = _1429 + _1321;
    int _1433 = _1273 + (-1);
    int _1435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1437 = _1435 != 0;
    bool _1439 = !_1305;
    int _1441 = _1439 ? _1431 : (-1);
    float _1443 = trunc(_1417);
    int _1445 = int(_1443);
    bool _1447 = !_1409;
    int _1449 = _1447 ? 0 : 1;
    bool _1451 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1453 = isnan(0.5);
    bool _1455 = _1451 || _1453;
    bool _1457 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1459 = _1455 || _1457;
    int _1461 = _1441 * _1427;
    int _1463 = abs(_1449);
    float _1465 = -_191;
    int _1467 = _1267 ? as_type<int>(_1465) : as_type<int>(_191);
    int _1469 = _1385 * _1433;
    int _1471 = _1469 + _1461;
    int _1473 = abs(_760);
    int _1475 = _1471 * _1265;
    int _1477 = abs(_764);
    int _1479 = _1421 * _1463;
    int _1481 = _1479 + _1321;
    int _1483 = abs(_768);
    int _1485 = _1445 * _1473;
    int _1487 = _1485 + _1475;
    float _1489 = in.m_49.w;
    int _1491 = ~_1273;
    int _1493 = _1491 + 1;
    float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1497 = _1495 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1501 = _1499 != 0;
    int _1503 = _1481 * _1477;
    int _1505 = _1503 + _1487;
    float _1507 = in.m_49.z;
    int _1509 = _1421 * _1483;
    int _1511 = _1509 + _1505;
    int _1513 = ~_1273;
    int _1515 = _1513 + 1;
    float _1517 = 1.0 / _1497;
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1521 = _1519 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1523 = float(uint(_1481));
    float _1525 = float(uint(_1511));
    float _1527 = as_type<float>(_1317) * _1523;
    float _1529 = 1.0 / _1521;
    float _1531 = as_type<float>(_1317) * _1525;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1535 = trunc(_1531);
    float _1537 = precise::max(_1535, 0.0);
    uint _1539 = uint(_1537);
    int _1541 = _1515 * int(_1539);
    int _1543 = _1541 + _1511;
    float _1545 = float(uint(_1543));
    float _1547 = as_type<float>(_1317) * _1545;
    float _1549 = trunc(_1547);
    float _1551 = precise::max(_1549, 0.0);
    uint _1553 = uint(_1551);
    float _1555 = _1547;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_1345)
    {
        _1555 = _1275;
    }
    float _1559 = _1555;
    float _1561 = _1559;
    if (_1345)
    {
        _1561 = _141;
    }
    float _1563 = _1561;
    float _1565 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1277);
    bool _1567 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1569 = isnan(_542);
    bool _1571 = _1567 || _1569;
    bool _1573 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1575 = _1571 || _1573;
    float _1577 = float(_1575);
    int _1579 = int(_1539) + int(_1553);
    float _1581 = -_209;
    int _1583 = _1309 ? as_type<int>(_1581) : as_type<int>(_209);
    int _1585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1587 = _1585 != 0;
    int _1589 = _1493 * _1579;
    int _1591 = _1589 + _1511;
    bool _1593 = uint(_1591) >= uint(_1273);
    bool _1595 = !_1437;
    float _1597 = _1595 ? _191 : as_type<float>(_1467);
    int _1599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1601 = _1599 != 0;
    bool _1603 = !_1601;
    float _1605 = _1603 ? _209 : as_type<float>(_1583);
    float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1607;
    bool _1611 = !_1593;
    int _1613 = _1611 ? 0 : (-1);
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1617 = _1615 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1621 = _1619 != 0;
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1625 = _1507 > 0.5;
    float _1627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1629 = _1507;
    if (!_1345)
    {
        _1557 = _1507;
    }
    float _1631 = _1557;
    float _1633 = -_1623;
    float _1635 = fma(_1285, 2.0, _1633);
    float _1637 = _1631;
    if (_1345)
    {
        _1637 = _1275;
    }
    float _1639 = _1637;
    float _1641 = _1609 * _1315;
    if (_1345)
    {
        _1629 = _1275;
    }
    float _1643 = _1629;
    float _1645 = _1617 * _1529;
    bool _1647 = _1489 > 0.5;
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1651 = _542 + _1649;
    float _1653 = -_121;
    float _1655 = fma(_1653, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1635);
    bool _1657 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1659 = isnan(_542);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1665 = _1661 || _1663;
    float _1667 = float(_1665);
    float _1669 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1533);
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1673 = ~_1273;
    int _1675 = _1673 + 1;
    float _1677 = -_1667;
    float _1679 = _1677 + 1.0;
    float _1681 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1683 = fma(_1391, -2.0, _1671);
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1685;
    bool _1689 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1691 = isnan(_542);
    bool _1693 = _1689 || _1691;
    bool _1695 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1697 = _1693 || _1695;
    float _1699 = float(_1697);
    float _1701 = _1577 * _1679;
    float _1703 = -_1577;
    float _1705 = _1703 + 1.0;
    float _1707 = _1687 * _1517;
    float _1709 = fma(_1641, _1651, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1711 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1713 = isnan(_542);
    bool _1715 = _1711 || _1713;
    bool _1717 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1719 = _1715 || _1717;
    float _1721 = float(_1719);
    float _1723 = _1699 * _1705;
    float _1725 = -_1699;
    float _1727 = _1725 + 1.0;
    float _1729 = _1597 + 0.5;
    float _1731 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1733 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1669);
    float _1735 = _1721 * _1727;
    float _1737 = fma(_1681, _1729, _1655);
    float _1739 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1741 = _542 + _1739;
    float _1743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1745 = _1709 * _1735;
    float _1747 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1749 = _542 + _1747;
    float _1751 = -_1721;
    float _1753 = _1751 + 1.0;
    float _1755 = fma(_1645, _1741, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1757 = -_1733;
    float _1759 = _1757 + 1.0;
    float _1761 = fma(_1707, _1749, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1763 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1745);
    float _1765 = trunc(_1527);
    float _1767 = precise::max(_1765, 0.0);
    uint _1769 = uint(_1767);
    float _1771 = _1563 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1773 = fma(_1755, _1723, _1763);
    int _1775 = ~_1579;
    int _1777 = _1775 + _1613;
    int _1779 = _1777 + 1;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1783 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1565);
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1787 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1683);
    float _1789 = fma(_1731, -2.0, _1781);
    float _1791 = -_191;
    int _1793 = _1625 ? as_type<int>(_1791) : as_type<int>(_191);
    float _1795 = fma(_1563, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1279);
    float _1797 = -_1785;
    float _1799 = fma(_1771, 2.0, _1797);
    float _1801 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1311);
    float _1803 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1789);
    int _1805 = _1675 * int(_1769);
    int _1807 = _1805 + _1481;
    float _1809 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1795);
    float _1811 = -_121;
    float _1813 = fma(_1811, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1799);
    int _1815 = _1273 * _1779;
    int _1817 = _1815 + _1511;
    float _1819 = fma(_1761, _1701, _1773);
    float _1821 = float(uint(_1807));
    float _1823 = -_1783;
    float _1825 = _1823 + 1.0;
    float _1827 = -_1809;
    float _1829 = _1827 + 1.0;
    float _1831 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1819);
    float _1833 = -_209;
    int _1835 = _1647 ? as_type<int>(_1833) : as_type<int>(_209);
    float _1837 = as_type<float>(_1317) * _1821;
    bool _1839 = !_1587;
    float _1841 = _1839 ? _191 : as_type<float>(_1793);
    float _1843 = -_1825;
    float _1845 = fma(_1597, _1843, _1737);
    float _1847 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1849 = trunc(_1837);
    float _1851 = precise::max(_1849, 0.0);
    uint _1853 = uint(_1851);
    float _1855 = _1605 + (-0.5);
    float _1857 = _1841 + 0.5;
    bool _1859 = !_1621;
    float _1861 = _1859 ? _209 : as_type<float>(_1835);
    float _1863 = -_1801;
    float _1865 = _1863 + 1.0;
    float _1867 = -_1847;
    float _1869 = -_1787;
    float _1871 = fma(_1867, _1855, _1869);
    float _1873 = fma(_1857, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1813);
    bool _1875 = !_1305;
    int _1877 = _1875 ? _1817 : (-1);
    float _1879 = _1861 + (-0.5);
    float _1881 = fma(_1605, _1865, _1871);
    float _1883 = -_1829;
    float _1885 = fma(_1841, _1883, _1873);
    int _1887 = _1877 >> 31;
    float _1889 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1891 = ~_1273;
    int _1893 = _1891 + 1;
    float _1895 = -_1879;
    float _1897 = -_1803;
    float _1899 = fma(_1895, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1897);
    int _1901 = _1887 & 3;
    float _1903 = _1889 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _1905 = int(_1769) + int(_1853);
    float _1907 = fma(_1861, _1759, _1899);
    int _1909 = _1877 + _1901;
    float _1911 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1913 = _1889 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1915 = _1893 * _1905;
    int _1917 = _1915 + _1481;
    int _1919 = _1909 >> 2;
    float _1921 = _1889 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1923 = fma(_1911, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1903);
    float _1925 = _1831 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1927 = _1919 << 4;
    int _1929 = _1927 + 512;
    float _1931 = fma(_1911, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1913);
    bool _1933 = uint(_1917) >= uint(_1273);
    float _1935 = fma(_1911, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1921);
    uint _1937 = uint(int(uint(_1929) >> uint(2)));
    uint _1939 = uint(int(uint(int(_1937)) >> uint(2)));
    int _1941 = int(_1937) & 3;
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[int(_1939)][_1941];
    int _1945 = int(_1937) + 1;
    uint _1947 = uint(int(uint(_1945) >> uint(2)));
    int _1949 = _1945 & 3;
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[int(_1947)][_1949];
    float _1953 = _852 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1955 = _852 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1957 = _1877 & 3;
    bool _1959 = _1957 != 0;
    out.m_60.x = _1845;
    out.m_60.y = _1881;
    out.m_60.z = _1885;
    out.m_60.w = _1907;
    bool _1961 = !_1933;
    int _1963 = _1961 ? 0 : (-1);
    float _1965 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1953);
    bool _1967 = uint(_1957) > 1u;
    float _1969 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1955);
    int _1971 = ~_1905;
    int _1973 = _1971 + _1963;
    int _1975 = _1973 + 1;
    float _1977 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1965);
    float _1979 = _1931 + (*spvDescriptorSet0.vp_c10)._m0[9].z;
    int _1981 = _1877 & 3;
    bool _1983 = _1981 != 0;
    int _1985 = _1273 * _1975;
    int _1987 = _1985 + _1481;
    float _1989 = _1923 + (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _1991;
    float _1995 = _1979 * _952;
    int _1997 = _1929 + 8;
    uint _1999 = uint(int(uint(_1997) >> uint(2)));
    uint _2001 = uint(int(uint(int(_1999)) >> uint(2)));
    int _2003 = int(_1999) & 3;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[int(_2001)][_2003];
    int _2007 = int(_1999) + 1;
    uint _2009 = uint(int(uint(_2007) >> uint(2)));
    int _2011 = _2007 & 3;
    float _2013 = (*spvDescriptorSet0.vp_c9)._m0[int(_2009)][_2011];
    int _2015 = _1983 ? 0 : 1;
    float _2017 = 1.0 / _1993;
    bool _2019 = _1957 != 3;
    float _2021 = fma(_1989, _948, _1995);
    int _2023 = ~_2015;
    int _2025 = _2023 + 1;
    int _2027 = _2025 + 1;
    float _2029 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1969);
    int _2031 = _2027;
    if (!_1967)
    {
        int _2033 = ~_2015;
        int _2035 = _2033 + 1;
        _2031 = _2035;
    }
    int _2037 = _2031;
    float _2039 = _1935 + (*spvDescriptorSet0.vp_c10)._m0[10].z;
    bool _2041 = uint(_1957) >= 2u;
    float _2043 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2045 = abs(_2037);
    float _2047 = fma(_2039, _950, _2021);
    bool _2049 = !_1959;
    int _2051 = _2049 ? 0 : 1;
    float _2053 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2043);
    int _2055 = _2041 ? 0 : 1;
    float _2057 = abs(_2047);
    float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2061 = _2057 + _2059;
    int _2063 = abs(_2051);
    out.m_62.w = _1925;
    bool _2065 = _1957 != 3;
    float _2067 = _2061 * _2017;
    float _2069 = precise::clamp(_2067, 0.0, 1.0);
    int _2071 = ~_2055;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    float _2077 = _2029 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _2079 = _2075;
    if (_2019)
    {
        int _2081 = ~_2055;
        int _2083 = _2081 + 1;
        _2079 = _2083;
    }
    int _2085 = _2079;
    float _2087 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2053);
    float _2089 = _1977 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2091 = ~_2045;
    int _2093 = _2091 + 1;
    int _2095 = _2093 + 1;
    float _2097 = 1.0 / _2077;
    int _2099 = abs(_2085);
    float _2101 = _2089 + _2077;
    bool _2103 = !_2065;
    int _2105 = _2103 ? 0 : (-1);
    int _2107 = _2095 * as_type<int>(_1951);
    int _2109 = ~_2063;
    int _2111 = _2109 + 1;
    int _2113 = _2111 + 1;
    float _2115 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2087);
    bool _2117 = !_1501;
    int _2119 = _2117 ? 0 : 1;
    int _2121 = abs(_2105);
    int _2123 = _2113 * as_type<int>(_1943);
    int _2125 = _2123 + _2107;
    int _2127 = abs(_2119);
    int _2129 = ~_2099;
    int _2131 = _2129 + 1;
    int _2133 = _2131 + 1;
    int _2135 = _2133 * as_type<int>(_2005);
    int _2137 = _2135 + _2125;
    int _2139 = ~_2121;
    int _2141 = _2139 + 1;
    int _2143 = _2141 + 1;
    float _2145 = fma(_2069, -2.0, 3.0);
    int _2147 = ~_2127;
    int _2149 = _2147 + 1;
    int _2151 = _2149 + 1;
    float _2153 = _2069 * _2069;
    bool _2155 = !_1305;
    int _2157 = _2155 ? _1987 : (-1);
    int _2159 = _2143 * as_type<int>(_2013);
    int _2161 = _2159 + _2137;
    float _2163 = _2101 * _2097;
    float _2165 = _2163 * 0.5;
    float _2167 = _2153 * _2145;
    float _2169 = as_type<float>(_2137);
    if (_1459)
    {
        _2169 = 1.0;
    }
    float _2171 = _2169;
    int _2173 = _2161 * _2151;
    float _2175 = _2171;
    if (!_1459)
    {
        float _2177 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2179 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2177);
        float _2181 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2183 = _2181 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        float _2185 = 1.0 / _2179;
        float _2187 = 1.0 / _2183;
        float _2189 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2191 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2193 = fma(_2185, _2189, _2191);
        float _2195 = _2193 * _2187;
        float _2197 = precise::clamp(_2195, 0.0, 1.0);
        float _2199 = -_2197;
        float _2201 = _2199 + 1.0;
        _2175 = _2201;
    }
    float _2203 = _2175;
    float _2205 = _2167 * _2203;
    float _2207 = -_1323;
    float _2209 = _2207 + 1.0;
    float _2211 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2213 = _2115 + _2211;
    bool _2215 = _2203 > 0.0;
    bool _2217 = isnan(_2203);
    bool _2219 = _2215 || _2217;
    bool _2221 = isnan(0.0);
    bool _2223 = _2219 || _2221;
    float _2225 = _2205 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2227 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2229 = _2157 * _2127;
    int _2231 = _2229 + _2173;
    float _2233 = _1164 + _2213;
    float _2235 = _379 * _2225;
    float _2237 = _2227 * _1238;
    float _2239 = -_2227;
    float _2241 = _2239 + 1.0;
    float _2243 = _2233 * 0.5;
    float _2245 = _2235 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2247 = _1249 * _2237;
    float _2249 = _1259 * _2237;
    out.gl_Position.x = _1206;
    out.gl_Position.y = _1210;
    out.gl_Position.z = _2213;
    out.gl_Position.w = _1164;
    float _2251 = fma(_1255, _2247, _1243);
    float _2253 = fma(_1257, _2247, _1245);
    float _2255 = float(_2231);
    float _2257 = _1249 * _2241;
    float _2259 = fma(_1249, _2249, _1247);
    out.m_64.z = _2243;
    out.m_64.w = _1164;
    out.m_66.y = _2255;
    out.m_45.x = _2245;
    out.m_68.x = _2251;
    out.m_68.y = _2253;
    out.m_68.z = _2259;
    out.m_68.w = _2257;
    if (_2223)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2261 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2261;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

